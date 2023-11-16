// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {
    struct Info {
        int ammount;
        string message;
        bool flag;
    }

    mapping(address => Info) public infoMap;
    event logSet(address indexed _address, string message);
    event logRemove(address indexed _address);

    function set(address _addr, int _ammount, string memory _message, bool _flag) public {
        infoMap[_addr] = Info(_ammount, _message, _flag);
        emit logSet(msg.sender, _message);
    }

    function remove(address _addr) public {
        delete infoMap[_addr];
        emit logRemove(msg.sender);
    }


    uint256 number;

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}