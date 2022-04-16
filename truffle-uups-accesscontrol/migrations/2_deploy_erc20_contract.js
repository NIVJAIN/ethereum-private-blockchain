// migrations/NN_deploy_upgradeable_box.js
const { deployProxy } = require("@openzeppelin/truffle-upgrades");
const DLTSCBTokenV1 = artifacts.require(
  "DLTSCBTokenV1"
);

module.exports = async (deployer) => {
  const instance = await deployProxy(DLTSCBTokenV1, [], {
    deployer,
    kind: "uups",
  });
  console.log("Deployed", instance.address);
};




// var HelloWorld = artifacts.require("ERC20Coin");
// console.log("helloworld", HelloWorld._json.contractName)
// const fs = require('fs')
// var fse = require('fs-extra');
// const path = require('path')
// const moment = require('moment')


// // var fpath = path.join(__dirname, `../middlewares/blockchain/ganache/metadata.js`);
// //  networkName can be ganache or ropsten or kovan or rinkbey, as of now its enable only for ganache and ropsten.
// const network_backup = function(networkName){
//   // Backup the old metadata.js file
//   return new Promise((resolve,reject)=>{
//     const filepath = path.join(__dirname, `../middlewares/blockchain/${networkName}/metadata.js`);
//     var filelocation = `../middlewares/blockchain/${networkName}`;
//     if (fs.existsSync(filepath)) {
//       fse.copySync(path.resolve(__dirname ,`../middlewares/blockchain/${networkName}/metadata.js`), path.resolve(__dirname, `${filelocation}/${moment().format("DD-MMM-YYYY-HHmmss")}-metada.js`));
//       resolve(`successfully backup the metadata to ${filepath}`)
//     } else {
//       reject(`file not exist ${filepath}`)
//     }
//   })
// }

// const build_backup = function(fileName, backupFileName){
//   // Backup the old metadata.js file
//   return new Promise((resolve,reject)=>{
//     const buildFpath = path.join(__dirname, `../build/contracts/${fileName}`);
//     const smartContractJSONFileName = HelloWorld._json.contractName 
//     var filelocation = `../build/contracts`;
//     if (fs.existsSync(buildFpath)) {
//       fse.copySync(path.resolve(__dirname ,`../build/contracts/${fileName}`), path.resolve(__dirname, `${filelocation}/${moment().format("DD-MMM-YYYY-HHmmss")}-${backupFileName}-${smartContractJSONFileName}.json`));
//       resolve(`successfully backup the metadata to ${buildFpath}`)
//     } else {
//       reject(`file not exist ${buildFpath}`)
//     }
//   })
// }


// module.exports = async function(deployer, network, accounts) {
//     deployer.deploy(HelloWorld).then(async() =>{
//       let copy = "";
//       let filepath = "";
//       let backup = "";
//       try {
//         if (network == "ganache") {
//           fpath = path.join(__dirname, `../middlewares/blockchain/${network}/metadata.js`);
//            copy = await network_backup(network)
//            backup = await build_backup("ERC20Coin.json", "ganache" )
//         } else if (network == "ropsten") {
//           fpath = path.join(__dirname, `../middlewares/blockchain/${network}/metadata.js`);
//           copy = await network_backup(network)
//           backup = await build_backup("ERC20Coin.json", "ropsten" )
  
//         } else {
//           fpath = path.join(__dirname, `../middlewares/blockchain/ganache/metadata.js`);
//           copy = await network_backup("ganache")
//           backup = await build_backup("ERC20Coin.json", "ganache" )
//         }
//       } catch (error) {
//         console.log("Error in backing up files", error)
//       }



//     var metadataInfo = 
// `const ADDRESS = "${HelloWorld.address}";
// const ABI = ${JSON.stringify(HelloWorld.abi)};
// const NETWORK = "${deployer.network}";
// module.exports = { ADDRESS, ABI, NETWORK };`

//       fs.writeFile(fpath, metadataInfo,
//         (err) => {
//           if (err) {
//             console.log(err)
//           } else {
//             console.log("File written successfully\n");
//             console.log("The written has the following contents:");
//             // console.log(fs.readFileSync(fpath, "utf8"));
//           }
//         },
//       )
//     }).catch(function(err){
//       console.log("2_deploy_contract.js ", err)
//     })
//     // Additional contracts can be deployed here
// };