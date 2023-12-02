pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MyToken} from "../src/ExampleV1.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployContract is Script {
    address public proxyAddress;
    address public implementationAddress;

    function run() public returns (address) {
        MyToken implementationContract = new MyToken();
        implementationAddress = address(implementationContract);
        proxyAddress = deploy(implementationAddress);
        return proxyAddress;
    }

    function deploy(address implementationAddress) internal returns (address) {
        bytes memory data = abi.encodeCall(
            MyToken.initialize,
            address(0xBE4494DaB28095e1465aB151a21e9D529752998A)
        );
        ERC1967Proxy proxy = new ERC1967Proxy(implementationAddress, data);
        address proxyAddress = address(proxy);

        MyToken testUUPS = MyToken(proxyAddress);
        return address(testUUPS);
    }
}
