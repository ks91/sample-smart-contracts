sample-smart-contracts
===
This is a set of sample programs for lectures on smart contract programming. It demonstrates an automated escrow service for purchasing a real-estate property (represented as a digital asset) with digital coins.

Currently, it consists of Ethereum smart contract programs (**IndivisibleAsset** for the digital representation of a real-estate property and **OneTimeEscrow** for the escrow service for purchasing the property) written in Solidity and their test programs written in Python. Brownie (eth-brownie) environment is assumed for compiling and testing the smart contracts. Using Python virtual environment is recommended.

See below for installation and other information on Brownie.
* [Brownie Documentation](https://eth-brownie.readthedocs.io/en/stable/)

## Dependencies
* eth-brownie >= 1.2.0 (pip-installed)

## How to use
After installing Brownie,

1. Set up a sample token project
```
$ brownie bake token
```
2. Copy the content of **contracts**, **scripts** and **tests** directories of this project into the corresponding directories of the token project

3. Compile
```
$ brownie compile
```

4. Test
```
$ pytest tests
```
"test_one_time_escrow.py" shows how to use the smart contracts to safely exchange between a property right and payment.

