pragma solidity ^0.4.2;

import "./MetaCoinStorage.sol";

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract MetaCoin {
	MetaCoinStorage metaCoinStorage;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	function MetaCoin(address metaCoinStorageAddress) {
		metaCoinStorage = MetaCoinStorage(metaCoinStorageAddress);
	}

	function sendCoin(address receiver, uint amount) returns(bool sufficient) {
		if (metaCoinStorage.getBalance(msg.sender) < amount) return false;
		metaCoinStorage.setBalance(msg.sender, metaCoinStorage.getBalance(msg.sender) - amount);
		metaCoinStorage.setBalance(receiver, metaCoinStorage.getBalance(receiver) + amount);
		Transfer(msg.sender, receiver, amount);
		return true;
	}

	function getBalanceInEth(address addr) returns(uint){
		return ConvertLib.convert(getBalance(addr),2);
	}

	function getBalance(address addr) returns(uint) {
		return metaCoinStorage.getBalance(addr);
	}
}
