#!/usr/bin/python3
from brownie import *
import pytest

def test_owner_and_transfer(IndivisibleAsset):

    asset = accounts[0].deploy(IndivisibleAsset, "5322 Endo", "m^2", 300)

    assert asset.getOwner() == accounts[0]

    asset.transfer(accounts[1], {'from': accounts[0]})

    assert asset.getOwner() == accounts[1]

    try:
        asset.transfer(accounts[0], {'from': accounts[0]})
        done = 1
    except:
        done = 0

    assert done == 0


# end of test_indivisible_asset.py
