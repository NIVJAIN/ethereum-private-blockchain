const { upgradeProxy } = require("@openzeppelin/truffle-upgrades");
const ERC20CustomUpgradeableV1 = artifacts.require(
  "ERC20CustomUpgradeableV1"
);
const ERC20CustomUpgradeableV2 = artifacts.require(
  "ERC20CustomUpgradeableV2"
);

module.exports = async (deployer) => {
  const existing = await ERC20CustomUpgradeableV1.deployed();
  const instance = await upgradeProxy(
    existing.address,
    ERC20CustomUpgradeableV2,
    {
      deployer,
      kind: "uups",
    }
  );
  console.log("Deployed", instance.address);
};