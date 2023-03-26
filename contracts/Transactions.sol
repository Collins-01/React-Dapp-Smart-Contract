// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
import "hardhat/console.sol";

contract Transactions {
    uint256 transactionCount;

    event Transfer(
        address from,
        address receiver,
        uint amount,
        string message,
        uint256 timestamp,
        string keyword
    );

    struct TransferStruct {
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TransferStruct[] transactions;

    function addToBlockchain(
        address receiver,
        uint256 amount,
        string memory message,
        string memory keyword
    ) public {
        require(address(msg.sender).balance >= amount, "Insufficient balance");
        require(amount > 0, "Amount must be greater than zero");
        require(receiver != address(0), "Invalid recipient address");

        (bool sent, ) = receiver.call{value: amount}("");
        if (sent) {
            transactionCount += 1;
            transactions.push(
                TransferStruct(
                    msg.sender,
                    receiver,
                    amount,
                    message,
                    block.timestamp,
                    keyword
                )
            );

            emit Transfer(
                msg.sender,
                receiver,
                amount,
                message,
                block.timestamp,
                keyword
            );
        }
    }

    function getAllTransactions()
        public
        view
        returns (TransferStruct[] memory)
    {
        return transactions;
    }

    // function getAllMySentTransactions()
    //     public
    //     view
    //     returns (TransferStruct[] memory)
    // {
    //     uint count = 0;
    //     for (uint256 i = 0; i < transactions.length; i++) {
    //         if (transactions[i].sender == msg.sender) {
    //             count++;
    //         }
    //     }
    //     TransferStruct[] memory tempList = new TransferStruct[](count);

    //     for (uint256 index = 0; index < transactions.length; index++) {
    //         if (transactions[index].sender == msg.sender) {
    //             tempList[count - 1] = transactions[index];
    //             count--;
    //         }
    //     }
    //     return tempList;
    // }

    // function getAllMyReceivedTransactions()
    //     public
    //     view
    //     returns (TransferStruct[] memory)
    // {
    //     uint count = 0;
    //     for (uint256 i = 0; i < transactions.length; i++) {
    //         if (transactions[i].receiver == msg.sender) {
    //             count++;
    //         }
    //     }

    //     TransferStruct[] memory tempList = new TransferStruct[](count);
    //     for (uint256 index = 0; index < transactions.length; index++) {
    //         if (transactions[index].receiver == msg.sender) {
    //             tempList[count - 1] = transactions[index];
    //             count--;
    //         }
    //     }
    //     return tempList;
    // }

    function getTransactionCount() public view returns (uint256) {
        return transactionCount;
    }
}
