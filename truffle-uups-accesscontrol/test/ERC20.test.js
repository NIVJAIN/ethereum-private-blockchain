const { expect } = require("chai");
const ERC20CustomUpgradeableV1 = artifacts.require(
  "ERC20CustomUpgradeableV1"
);

// Start test block
contract("ERC20CustomUpgradeableV1", (accounts) => {
  beforeEach(async () => {
    // Deploy a new Box contract for each test
    this.ERC20Instance = await ERC20CustomUpgradeableV1.new({
      from: accounts[0],
    });
    await this.ERC20Instance.initialize();
  });

  it("should mint the correct base URI", async () => {
    expect((await this.ERC20Instance.uri(0)).toString()).to.equal(
      "https://ipfs.moralis.io:2053/ipfs/QmRsFtxBbdm88dGmp2abYVukiT4Qdoi1G3q31KYBoWD9Lr/metadata/{id}.json"
    );
  });

  it("should mint 1 NFT with tokenId 0", async () => {
    await this.ERC20Instance.mint(accounts[1], 0, 1);
    expect(
      (await this.ERC20Instance.balanceOf(accounts[1], 0)).toString()
    ).to.equal("1");
  });
});