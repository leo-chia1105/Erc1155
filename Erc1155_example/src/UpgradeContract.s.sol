pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MyToken} from "../src/ExampleV1.sol";
import {MyTokenV2} from "../src/ExampleV2.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";

contract UpgradeContract is Script {
    address public newImplementationAddress;

    function run() public {
        MyTokenV2 newImplementationContract = new MyTokenV2();
        newImplementationAddress = address(newImplementationContract);
        upgrade(newImplementationAddress);
    }

    function upgrade(address newImplementationAddress) internal {
        MyToken implementation = new MyToken();
        bytes memory data = abi.encodeCall(
            MyToken.initialize,
            address(0xBE4494DaB28095e1465aB151a21e9D529752998A)
        );
        ERC1967Proxy proxy = new ERC1967Proxy(address(implementation), data);
        address uupsProxy = Upgrades.deployUUPSProxy("ExampleV1.sol", "");
        // Upgrades.upgradeProxy(address(proxy), "ExampleV2.sol:MyTokenV2", "");
        Upgrades.upgradeProxy(uupsProxy, "ExampleV2.sol", "");
    }
}
