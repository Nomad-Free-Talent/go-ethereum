// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract TestPrecompile {
    address constant PRECOMPILE_ADDRESS = address(0x14);

    function callPrecompile(bytes memory input) public returns (uint256) {
        // Call the precompile
        (bool success, bytes memory output) = PRECOMPILE_ADDRESS.call(input);
        console.log("Success?", success);
        console.log("Output length:", output.length);
        require(success, "Precompile call failed!!!!");
        console.logBytes32(bytes32(output));
        require(output.length >= 32, "Data too short");

        // Decode the output (counter value)
        uint256 counter = abi.decode(output, (uint256));
        return counter;
    }
}
