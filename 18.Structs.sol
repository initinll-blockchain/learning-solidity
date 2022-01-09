//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    
*/
contract Structs {
    
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        // Initialization

        // option 1
        Car memory toyota = Car("Toyota", 2000, msg.sender);

        // option 2
        Car memory lambo = Car({
            model: "Lamborgini",
            year: 2014,
            owner: msg.sender
        });

        // option 3
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2018;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        // Update

        Car storage _car = cars[0];
        _car.year = 2020;
        delete _car.owner; // 0

        delete cars[1];
    }
}