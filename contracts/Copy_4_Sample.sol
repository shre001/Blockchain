pragma solidity ^0.5.1;


uint256 count;

contract myContract{
    string value;
    enum Shreyas {Shambho,Sherpa,Bhava}
    Shreyas public state;
    


    Person[] public people; 

    struct Person{
        string first_name;
        string last_name;
        
    }
    
    
    constructor() public{
        value="Shrey";
        state=Shreyas.Shambho;
    }
    
    function addPeople(string memory first_name,string memory last_name) public{
        people.push(Person(first_name,last_name));
        count++;
    }
    
    function get() public view returns(string memory){
        return value;
    }
    
     function getAlias() public view returns(Shreyas){
        return state;
    }

    function set(string memory _value) public{
        value=_value;
    }
}    