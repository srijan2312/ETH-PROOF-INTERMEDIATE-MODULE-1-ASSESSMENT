# Admission In School Contract

This project is a simple smart contract, build in `Solidity programming language` which allows to manage admissions of students, to find maximum number of students and to update maximum number of students. This program also handles errors while taking admissions using ```require(), assert() and revert()``` keywords.

## Description

The `Admission In School` project is designed to handle works like taking admissions, finding maximum number of students and updating maximum number of students. It uses `require` to check inputs, `assert` to ensure the contract works correctly, and `revert` to cancel actions when needed. This contract is great for learning basic smart contract development.

## Getting Started

### Installing

To run this program, you must have the Solidity compiler installed in your system. Or you can use Remix, an online Solidity IDE. Remix website:- https://remix.ethereum.org/.

### Executing program

On reaching Remix website, you have to create a new file by "+" sign in the left-hand sidebar and save the file with .sol extension. Now, copy and paste the code into file: 

```solidity
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
```

To compile the code, you have to click on the "Solidity Compiler" tab in the left-hand sidebar. Before clicking on compile button, check if the compiler version is set to same as pragma in the code and then click on "SchoolAdmission.sol" icon.

When the code will compile, you will have to deploy the contract by putting a value in "_MAXIMUMSTUDENTS", just beside "value" and then, clicking on "Deploy" tab in the left-hand sidebar.

Select the "ADMISSIONINSCHOOL" contract from the dropdown menu.

<ol>
<li>At first, you can check the eligibility of student by entering marks in "AdmissionInSchool" function.
<li>You can see the maximum number of students that can take admissions by calling "MaximumStudent" function.
<li>You can update the number of maximum students that can take admission.
<li>At last, you can see the student information by calling "StudentInformation" function.</li>
</ol>

## Help

For any issues or common problems related to this contract, refer Solidity documentation on internet.

## Authors

Srijan Kumar <br> [@srijankumar](srijankumar11627@gmail.com)

## License

This project is licensed under the MIT License.
