#!/usr/bin/python3
from brownie import *
import pytest

def test_deploy_and_settle(Token, IndivisibleAsset, OneTimeEscrow):

    asset = accounts[0].deploy(IndivisibleAsset, "5322 Endo", "m^2", 300)
    token = accounts[0].deploy(Token, "Test Token", "TEST", 18, "1000 ether")

    token.transfer(accounts[1], 300, {'from': accounts[0]})

    escrow = accounts[0].deploy(OneTimeEscrow, token, accounts[1],
            asset, accounts[0], 300)

    token.transfer(escrow, 300, {'from': accounts[1]})
    asset.transfer(escrow, {'from': accounts[0]})

    assert token.balanceOf(accounts[0]) == 999999999999999999700
    assert token.balanceOf(accounts[1]) == 0
    assert token.balanceOf(escrow) == 300
    assert asset.getOwner() == escrow

    escrow.settle({'from': accounts[0]})

    assert token.balanceOf(accounts[0]) == 1000000000000000000000
    assert token.balanceOf(accounts[1]) == 0
    assert token.balanceOf(escrow) == 0
    assert asset.getOwner() == accounts[1]


# end of test_one_time_escrow.py
