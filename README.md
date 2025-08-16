# Fallon-Token-Smart-Contract
Fallon Token is a smart contract in which an owner can mint Fallon Tokens (FLT) and users can transfer tokens to each other.

## Features 
**Minting**: Only the contract owner can mint new tokens to a particular address.

**Transfer**: Users can transfer tokens between their accounts.

## Contract Details 
- **State Variables**:
  - `string public name` -> Name of the token (Fallon Token).  
  - `string public symbol` -> Symbol of the token (FLT).  
  - `uint public totalSupply` -> Total supply of tokens.  
  - `address public owner` -> Address of the contract owner.  

- **Mapping**:
  - `mapping(address => uint) public balances` -> Stores token balances of each address.
    
- **Functions**:
  - `mint(uint _amountToMint, address _address)` -> Owner mints new tokens to `_address`.  
  - `transferTokens(address _receiver, uint _amountToTransfer)` -> User sends tokens to `_receiver`.  

- **Events**:
  - `Mint(uint _amount, address _mintedOn )` -> Triggered when tokens are minted.  
  - `TransferTokens(uint _amountToTransfer, address _sender, address _receiver)` -> Triggered when tokens are transferred.
 
  
