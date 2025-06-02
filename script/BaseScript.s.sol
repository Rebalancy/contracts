// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.28;

import {console2} from "forge-std/console2.sol";
import {Script} from "forge-std/Script.sol";
import {Vm} from "forge-std/Vm.sol";

import {Configuration} from "@config/Configuration.sol";
import {DeployerUtils} from "@utils/DeployerUtils.sol";

contract BaseScript is Script {
    using DeployerUtils for Vm;

    Configuration.ConfigValues internal config;
    address internal deployer;

    constructor() {
        console2.log("Loading Network Configuration");
        string memory networkId = vm.envString("NETWORK_ID");

        config = Configuration.load(networkId);
        console2.log("Network Configuration Loaded Correctly");

        deployer = vm.loadDeployerAddress();

        console2.log("Deployer Address: %s", deployer);
    }
}
