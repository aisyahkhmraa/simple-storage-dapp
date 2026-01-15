// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    // owner contract
    address public owner;

    // state utama
    uint256 private storedValue;
    string private message;

    // events
    event OwnerSet(address indexed oldOwner, address indexed newOwner);
    event ValueUpdated(uint256 newValue);
    event MessageUpdated(string newMessage);

    // constructor dijalankan saat deploy
    constructor() {
        owner = msg.sender;
        emit OwnerSet(address(0), owner);
    }

    // modifier akses kontrol
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // simpan nilai ke blockchain (write)
    function setValue(uint256 _value) public onlyOwner {
        storedValue = _value;
        emit ValueUpdated(_value);
    }

    // baca nilai terakhir (read)
    function getValue() public view returns (uint256) {
        return storedValue;
    }

    // simpan pesan
    function setMessage(string memory _message) public onlyOwner {
        message = _message;
        emit MessageUpdated(_message);
    }

    // baca pesan
    function getMessage() public view returns (string memory) {
        return message;
    }
}
