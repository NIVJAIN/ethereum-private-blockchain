// const instanceMigrate = require('./migrations/3_upgrade_erc20_contract_v2');
// const { upgradeProxy, artifacts } = require("@openzeppelin/truffle-upgrades");
const { deployProxy, upgradeProxy, artifacts} = require('@openzeppelin/truffle-upgrades');
const DLTSCBTokenV1 = artifacts.require('./build/contracts/DLTSCBTokenV1.json');



const deploy = async function() {
    const existing = await DLTSCBTokenV1.deployed();
//    let deploytheSmartcontract = await  instanceMigrate.instance();
   console.log("dfasdfsdf",existing.address)
}

deploy()

