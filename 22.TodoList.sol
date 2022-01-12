//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
*/
contract ToDoList {    
    struct ToDo {
        string text;
        bool completed;
    } 

    ToDo[] public todos;

    function create(string calldata _text) external {
        todos.push(ToDo({
            text: _text,
            completed: false
        }));
    }

    function update(uint _index, string calldata _text) external {
        // 1 way to update - this is cheaper gas for single field update
        todos[_index].text = _text;

        // 2 way to update - this is cheaper gas for multiple field update
        ToDo storage todo = todos[_index];
        todo.text = _text;

    }

    function get(uint _index) external view returns (ToDo memory) {
        return todos[_index];
    }

    function completed(uint _index) external {
        todos[_index].completed = true;
    }
}