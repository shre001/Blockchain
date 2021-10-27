// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

contract SimpleStorage {
    
    uint256  favoriteNumber;
    uint256  favorite;
   // bool favoriteBool=true;
   // string favoriteString="String";
    //int256 favoriteInt= -5;
    //address favoriteAddress= 0x00D7667205067c8B3d48ba124A981C7550Addc6d;
    //bytes32 favoriteBytes ="cat";
    
    struct People {
        uint256 favoriteNumber;
        string name;
       // bool favoriteBool;
    }
    
    People[] public people;
    People public person = People({favoriteNumber:5, name: "Shreyas"});
    mapping(string => uint256) public getFavNum;
    
    function store(uint256 _favoriteNumber) public {
        favoriteNumber=_favoriteNumber;
        
    }
    
    //view,pure
    //internal, external,public,private
     function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    function retrieve1(uint256 favoriteNumber) public pure {
         favoriteNumber+favoriteNumber;
    }
    
    function sum(uint256 _favoriteNumber) public view returns(uint256){
        return favoriteNumber+_favoriteNumber;
    }
    
    function sumPure(uint256 favorite,uint favoriteNumber) public pure returns(uint256) {
        return favoriteNumber+favorite;
    }
    
    //memory-:only during func
    //storage: persist even after function
    
    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People({favoriteNumber:_favoriteNumber,name:_name}));
        getFavNum[_name]=_favoriteNumber;
        
    }
}