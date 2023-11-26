pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {MyToken} from "../src/Example.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployContract is Script {
    address public abc;

    function run() external {
        address proxy = deployContract();
        abc = proxy;
    }

    function deployContract() internal returns (address) {
        address implementation = address(new MyToken());
        address value = address(0xBE4494DaB28095e1465aB151a21e9D529752998A);

        bytes memory data = abi.encodeCall(MyToken.initialize, value);
        address proxy = address(new ERC1967Proxy(implementation, data));

        MyToken testUUPS = MyToken(proxy);
        return address(testUUPS);
    }
}
