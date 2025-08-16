// SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0;
contract FallonToken{
    string public name= "FallonToken"; //name of the token
    string public symbol= "FLT"; //symbol of the token 
    uint public totalSupply; // total supply of the tokens in market

    // uint public decimals; -- it's present in ERC-20 token standards and tells upto how many deciaml places token can split

    address public owner;  //address of the owner 

    event Mint(uint _amount, address _mintedOn ); // Mint event that can be emitted whenever new tokens minted
    event TransferTokens(uint _amountToTransfer, address _sender, address _receiver); //Transfer tokens event that can be emitted whenever tokens are transferred b/w users


    mapping(address=>uint) public balances; //mapping that stores balance of user that how much amount of tokens the address has 

    constructor(){
        owner=msg.sender;  //during deployment of contract owner must be one who's deploying the contract so later, owner can only mint
    }

    // function to mint tokens only by owner

    function mint(uint _amountToMint, address _address) public{
        require(_amountToMint>0,"Tokens to mint must be greater than 0"); //tokens amount to mint must be greater than 0
        require(_address != address(0), "Mint to zero address is not allowed"); //checking tokens should not be minted to address 0x00...
        require(msg.sender==owner,"Not called by owner"); // checking that only owner can call the mint function 
        balances[_address]+=_amountToMint; // whichever address owner passes in parameter tokens minted to that address 
        totalSupply+=_amountToMint; //in total supply amount of minted tokens should be added
        emit Mint(_amountToMint, _address); // emitting the event Mint 
    }

    // transferring tokens from one user to another function

    function transferTokens(address _receiver, uint _amountToTransfer) public{
        require(_receiver!=msg.sender,"Transferring tokens to yourself is not allowed");// checking that user will not transferring tokens to it's own address
        require(_receiver != address(0), "Transferring tokens to zero address is not allowed"); //checking tokens shouldn't be transferred to zero address
        require(balances[msg.sender]>=_amountToTransfer,"Not sufficient balance to transfer"); //checking that user has sufficient balance to transfer or not
        require(_amountToTransfer>0,"Tokens amount should be greater than 0"); //balance to transfer must be greater than 0
        balances[msg.sender]-=_amountToTransfer; //subtracting tokens from sender's balance
        balances[_receiver]+=_amountToTransfer;// adding tokens to receiver's balance
        emit TransferTokens(_amountToTransfer, msg.sender, _receiver); // emitting TransferTokens event
    }

}