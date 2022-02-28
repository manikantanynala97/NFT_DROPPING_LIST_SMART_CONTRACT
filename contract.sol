// SPDX-License-Identifier: GPL-3.0

pragma solidity^ 0.8.0;

contract NFT_DROP_LISTING 
{

   // Define a NFT drop object

   struct Drop {
     string imageUri;
     string name ;
     string description;
     string social_1;
     string social_2;
     string websiteUri;
     string price;
     uint256 supply;
     uint256 presale;
     uint256 sale;
     uint8 chain;
     bool approved;
   }

  // This owner is the owner of this smart contract or basically the website which we create so we need to pass as owner = msg.sender in the constructor
   address public owner ; 

   // Create a list of some sort to hold all objects basically an array of structures 

   Drop[] public drops;
   
   //Owner of the particular NFT Dropping List

   mapping(uint256=>address) public users;




  // Constructor is used during deployment and it can be only used once;

    constructor() 
    {
        owner = msg.sender ;// owner is basically the one who deployed this contract
    }
    
  // Modifier usage is done here 

   modifier OnlyOwner{
       require(msg.sender == owner,"Only the contract owner can approve the following NFT Dropping");
       _;
   }


   // Add to the NFT drop objects list

   function addDrop(string memory _imageUri,
     string memory _name ,
     string memory _description,
     string memory _social_1,
     string memory _social_2,
     string memory _websiteUri,
     string memory _price,
     uint256  _supply,
     uint256  _presale,
     uint256 _sale,
     uint8 _chain
     ) public 
   {

     drops.push(Drop(_imageUri,
        _name ,
      _description,
      _social_1,
      _social_2,
      _websiteUri,
      _price,
     _supply,
      _presale,
      _sale,
      _chain,
      false));

      uint id = drops.length -1 ; 
      users[id] = msg.sender;

   }


   // Get NFT Drop Objects List

   function getDrop() public view returns(Drop[] memory)
   {
       return drops;
   }

  // Update NFT Drop Objects 

  function updateDrop(uint256 _index,
     string memory _imageUri,
     string memory _name ,
     string memory _description,
     string memory _social_1,
     string memory _social_2,
     string memory _websiteUri,
     string memory _price,
     uint256  _supply,
     uint256  _presale,
     uint256 _sale,
     uint8 _chain) public
  {
    require(msg.sender == users[_index] , "Only the owner of this particular NFT collection can Update the Drop");
    drops[_index] = Drop(_imageUri,
       _name,
      _description,
      _social_1,
      _social_2,
      _websiteUri,
      _price,
     _supply,
      _presale,
      _sale,
      _chain,
      false
    );
  }

  // Approving an NFT Drop for approval of displaying to the public 

  function approveDrop(uint256 _index) public OnlyOwner
  {
     Drop storage drop = drops[_index];
     drop.approved = true;
  }




 


















}