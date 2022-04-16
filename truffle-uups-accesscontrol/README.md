### Software Versions
```
1. Truffle v5.4.33
2. Solidity - ^0.8.12 (solc-js)
3. Node v14.19.0
4. Web3.js v1.5.3
5. Mac M1 Max Pro (macOS Monterey)
6. MongoDB 4.0
```


### PRE-REQUISITE
```
1. nodejs & npm
2. truffle installation
3. gance-cli 
```


### Installation Steps
```
1. brew install nodejs [node -v & npm -v]
2. npm install -g truffle
3. npm install -g ganache-cli
```

### Ganache Deployment (Local Ganche)
```
1. git clone 
2. cd <repo> && npm install --save
3. truffle compile
4. truffle migrate --network ganache 0r truffle migrate --network ganache --reset
4. npm run ganache
```

### Smart Contract V1 functions
```
1. increment() //onlyRole(USER_ROLE) accounts[5] && accounts[0]
2. getCount()  //public any user
3. setText()   //public any user
 ```
### Smart Contract V2 functions (UUPS Proxy Pattern upgradable smart contract)
```
1. increment() //onlyRole(USER_ROLE) accounts[5] && accounts[0]
2. getCount()  //onlyRole(USER_ROLE) accounts[5] && accounts[0]
3. setText()   //public any user
4. decrement() //onlyRole(USER_ROLE) accounts[5] && accounts[0]
5. getText()  //public any user
6. mint()     //onlyRole(MINTER_ROLE) accounts[2] && accounts[0]
```

### Deploy V1
```
1. cp -rf migrations_v1 to migrations
1. cp -rf contracts_v1 to contracts
2. truffle compile --all && truffle migrate --network ganache
2. truffle console --network ganache
2. v1 = await DLTSCBTokenV1.deployed()
2. v1.address (note down the address) 0x7165F7cfF6A1Ca50BA7518d38023ff289D9D2AB1
3. Adding user to USER_ROLE to access the methods (add accounts[5])
4. (await v1.addUserRole(accounts[5],{from: accounts[0]})) 
5. Check if the USER_ROLE is added to Blockchain
6. (await v1.isUserRole(accounts[5]))
7.Test other non USER_ROLE and check if it return false
8. (await v1.isUserRole(accounts[6]))
9 (await v1.getCount())
10. Increment with non USER_ROLE accounts[6]
11.(await v1.increment({from: accounts[6]})) 
12. Increment with USER_ROLE accounts[5]
13. (await v1.increment({from: accounts[5]}))
14. (await v1.getCount())
15 note down the total count as we will deploy V2 Version
```
### Deploy V2
```
1. cp -rf migrations_v1v2/* migrations
2. cp -rf contracts_v1v2/* contracts
3. v1 = await DLTSCBTokenV2.deployed()
4. v1.address (address deployed in v1 should be same as address deployed in v2) 0x7165F7cfF6A1Ca50BA7518d38023ff289D9D2AB1
5. v1.getCount()
```

### TRUFFLE CONSOLE COMMANDS TESTING access control
```
npx truffle console --network ganache
v1 = await DLTSCBTokenV1.deployed()
v1.address
(await v1.getCount())

Non Admin users shouldnt able to access the increment method
(await v1.getCount2({from: accounts[1]}))
(await v1.increment({from: accounts[2]}))
(await v1.increment({from: accounts[3]}))
(await v1.increment({from: accounts[4]}))
(await v1.increment({from: accounts[5]}))

Adding user to USER_ROLE to access the methods
(await v1.addUserRole(accounts[5],{from: accounts[0]}))
(await v1.addUserRole(accounts[2],{from: accounts[0]}))

Newly added user should able to access below methods
(await v1.increment({from: accounts[5]}))
(await v1.getCount2({from: accounts[5]}))
(await v1.increment({from: accounts[5]}))
(await v1.increment({from: accounts[5]}))

revokeUserRole
(await v1.revokeUserRole(accounts[4],{from: accounts[0]}))
(await v1.increment({from: accounts[4]}))
(await v1.decrement2({from: accounts[4]}))

npx truffle console --network ganache
v2 = await ERC20CustomUpgradeableV2.deployed()
v2.address
(await v2.getCount())
(await v2.increment()) x 5
```

###
```
{
    makerlist: ["1638809", "1630029", "1630025"],
    checkerlist: ["1638810", "1630030", "1630026"],
    adminlist: ["1630025"]
}
```

### Asset
```
create asset by maker
assetName: SG-BONDS-WM
assetTotalSupply: 10000
makerId : 5
bondNominalValue: 1000
TokenNominalValue:10000
createAssetTimeByMaker: date

approve asset by maker

```


