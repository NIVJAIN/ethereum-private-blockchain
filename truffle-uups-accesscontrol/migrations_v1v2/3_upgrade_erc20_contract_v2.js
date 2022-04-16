const { upgradeProxy } = require("@openzeppelin/truffle-upgrades");
const DLTSCBTokenV1 = artifacts.require(
  "DLTSCBTokenV1"
);
const DLTSCBTokenV2 = artifacts.require(
  "DLTSCBTokenV2"
);

module.exports = async (deployer) => {
  const existing = await DLTSCBTokenV1.deployed();
  const instance = await upgradeProxy(
    existing.address,
    DLTSCBTokenV2,
    {
      deployer,
      kind: "uups",
    }
  );
  console.log("Deployed", instance.address);
};