// SPDX-License-Identifier: GPL-3.0
 pragma solidity >=0.7.0 <0.9.0;

 contract FondearProjecto {
    string isFundable;
    uint goal;
    uint totalFunded;
    address owner;
    uint requireFunds;

    constructor(){
        isFundable= "Open";
        goal = 0;
        totalFunded = 0;
        owner = msg.sender;

    }

    modifier onlyOwner(){
        require(
            msg.sender == owner,
            "Only owner can change the state"

        );
        _;

    }

    modifier sendWeiOwner(){
        require(
            msg.sender != owner,
            "you can not send funds to your project, DAMM IT :v"
            );
            _;
    }


    function setGoal(uint Goal) public{
        goal = Goal;
    }
    function totalFunds() public view returns(uint){
        uint remainingfunds = goal - totalFunded;
        return remainingfunds;
    }
    function sendEther() public sendWeiOwner  payable  {
        totalFunded += msg.value;
    }

    function changeProjectState(string calldata newState) public onlyOwner{
        isFundable = newState;

    }

    function projectState(string memory state) public view returns(string memory) {
        state = isFundable;
        return state;
    }
    function viewGoal () public view returns(uint){
        uint Goal = goal;
        return Goal;
    }

 }