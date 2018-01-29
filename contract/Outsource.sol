pragma solidity ^0.4.18;

contract UserStorage {
    
    mapping(address => bool) addressSet;

    function getAddressSet(address _address) public view returns(bool) {
        return addressSet[_address];
    }
    
    function setAddressSet(address _address, bool _bool) public {
        addressSet[_address] = _bool;
    }
    
}

contract UserContract {
    
    UserStorage userStorage;
    
    function UserContract(address _userStorageAddress) public {
        userStorage = UserStorage(_userStorageAddress);
    }
    
    function isMyUserNameRegistered() public view returns(bool) {
        return userStorage.getAddressSet(msg.sender);
    }
    
    function registerMe() public {
        userStorage.setAddressSet(msg.sender, true);
    }
}
