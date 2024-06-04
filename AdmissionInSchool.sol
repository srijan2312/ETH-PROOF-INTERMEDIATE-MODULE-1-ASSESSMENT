// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract AdmissionInSchool{
    address internal SchoolOwner;
    uint internal TotalNumberOfStudent;
    uint public MaximumStudents;

    struct StudentInfo{
        uint UniqueId;
        string Name;
        uint Marks;
    }

    mapping (uint => StudentInfo) public StudentInformation;

    constructor(uint _MaximumStudents){
        SchoolOwner = msg.sender;
        MaximumStudents = _MaximumStudents;

        // Used Assert keyword to ensure that the contract owner (School Owner) is not the zero address
        assert(SchoolOwner != address(0));
    }

    // Function to take admission
    function AdmissionOfStudents(string memory _Name, uint _Marks) public  {

        // Used require keyword to ensure only the School Owner can take admission of students
        require(msg.sender == SchoolOwner, "Only School Owner can take admission of students");

        if (_Marks < 60){
            // Used revert keyword to ensure student meets the marks requirement
            revert("Marks of student must be above 60 to be eligible for admission.");
        }
        
        // Used require keyword to ensure that the maximum number of students is not exceeded
        require(TotalNumberOfStudent < MaximumStudents, "Can't take more admissions.");

        TotalNumberOfStudent++;
        StudentInformation[TotalNumberOfStudent] = StudentInfo(TotalNumberOfStudent, _Name, _Marks);
    }

    // Function to update new maximum number of students for admission
    function UpdateMaximumNumberOfStudents(uint _newMaximumStudents) public {
        if(_newMaximumStudents < TotalNumberOfStudent){
            // Used revert keyword to ensure that the new maximum is greater than to the current number of students
            revert("Maximum number of students must be greater than total number of students.");
        }
        MaximumStudents = _newMaximumStudents;
    }
}
