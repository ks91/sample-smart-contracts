#!/usr/bin/python3

from brownie import *

def main():
    accounts[0].deploy(IndivisibleAsset, "5322 Endo, Fujisawa", "m^2", 300)

# end of indivisible_asset.py
