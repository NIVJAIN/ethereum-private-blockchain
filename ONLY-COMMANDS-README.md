https://www.c-sharpcorner.com/article/setup-your-private-ethereum-network-with-geth2/
https://medium.com/edureka/ethereum-private-network-tutorial-22ef4119e4c3

###
```
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository -y ppa:ethereum/ethereum
$ sudo apt-get update
$ sudo apt-get install ethereum

```

### Project structure
```
tree -L 3 -I 'truffle-uups-accesscontrol'
.
├── 1-node
│   ├── geth
│   │   ├── LOCK
│   │   ├── chaindata
│   │   ├── lightchaindata
│   │   ├── nodekey
│   │   ├── nodes
│   │   └── transactions.rlp
│   ├── geth.ipc
│   ├── keystore
│   │   ├── UTC--2022-04-16T01-26-21.524049000Z--1061755ec5ba90ee23fd293781e1eac601627823
│   │   └── UTC--2022-04-16T04-03-22.603347000Z--c136997c76e1c3b6b3d17de1ba6c80c2e72dad16
│   ├── node1.sh
│   ├── nohup.out
│   ├── password.txt
│   └── static-nodes.json
├── 2-node
│   ├── geth
│   │   ├── LOCK
│   │   ├── chaindata
│   │   ├── ethash
│   │   ├── lightchaindata
│   │   ├── nodekey
│   │   ├── nodes
│   │   └── transactions.rlp
│   ├── geth.ipc
│   ├── keystore
│   │   └── UTC--2022-04-16T01-28-18.708470000Z--6958d88cc31e1ee6b72f2fbf1f00d93d89104667
│   ├── node2.sh
│   ├── nohup.out
│   ├── password.txt
│   └── static-nodes.json
├── 3-node
│   ├── geth
│   │   ├── LOCK
│   │   ├── chaindata
│   │   ├── ethash
│   │   ├── lightchaindata
│   │   ├── nodekey
│   │   ├── nodes
│   │   └── transactions.rlp
│   ├── geth.ipc
│   ├── keystore
│   │   └── UTC--2022-04-16T01-28-55.817740000Z--c5a13bc74ae6344618e41e1d4b2921aa6a6ce54f
│   ├── node3.sh
│   ├── nohup.out
│   ├── password.txt
│   └── static-nodes.json
├── README.md
├── accounts.txt
├── privatenetwork-aleth.json
├── privatenetwork-harmony.json
├── privatenetwork-parity.json
└── privatenetwork.json

20 directories, 34 files
```

### Installation
```
mkdir ethereum-private-blockchain
cd ethereum-private-blockchain/
mkdir 1-node 2-node 3-node

```
### Create accounts
```
geth --datadir 1-node/ account new
geth --datadir 2-node/ account new
geth --datadir 3-node/ account new
```

### save the accounts in text file
```
echo 0x1061755ec5ba90eE23FD293781E1Eac601627823 >> accounts.txt
echo 0x6958D88CC31E1Ee6B72f2FBf1f00d93D89104667 >> accounts.txt
echo 0xC5a13BC74AE6344618e41E1d4b2921aA6A6ce54F >> accounts.txt
echo pwd@node1 > 1-node/password.txt
echo pwd@node2 > 2-node/password.txt
echo pwd@node3 > 3-node/password.txt
```

### Puppeth command 
```
puppeth
Please specify a network name to administer (no spaces, hyphens or capital letters please)
> privatenetwork
What would you like to do? (default = stats)
 1. Show network stats
 2. Configure new genesis
 3. Track new remote server
 4. Deploy network components
> 2
What would you like to do? (default = create)
 1. Create new genesis from scratch
 2. Import already existing genesis
> 1

Which consensus engine to use? (default = clique)
 1. Ethash - proof-of-work
 2. Clique - proof-of-authority
> 1

Which accounts should be pre-funded? (advisable at least one)
> 0x1061755ec5ba90eE23FD293781E1Eac601627823
> 0x6958D88CC31E1Ee6B72f2FBf1f00d93D89104667
> 0xC5a13BC74AE6344618e41E1d4b2921aA6A6ce54F
> 0x

Should the precompile-addresses (0x1 .. 0xff) be pre-funded with 1 wei? (advisable yes)
> yes

Specify your chain/network ID if you want an explicit one (default = random)
> 81397860
INFO [04-16|10:22:50.913] Configured new genesis block

What would you like to do? (default = stats)
 1. Show network stats
 2. Manage existing genesis
 3. Track new remote server
 4. Deploy network components
> 2

 1. Modify existing configurations
 2. Export genesis configurations
 3. Remove genesis configuration
> 2

Which folder to save the genesis specs into? (default = current)
  Will create privatenetwork.json, privatenetwork-aleth.json, privatenetwork-harmony.json, privatenetwork-parity.json
>

What would you like to do? (default = stats)
 1. Show network stats
 2. Manage existing genesis
 3. Track new remote server
 4. Deploy network components
>

What would you like to do? (default = stats)
 1. Show network stats
 2. Manage existing genesis
 3. Track new remote server
 4. Deploy network components
> ^C
> exit
```

### Initialziation
```
command
geth --datadir 1-node/ init privatenetwork.json
geth --datadir 2-node/ init privatenetwork.json
geth --datadir 3-node/ init privatenetwork.json
```

### Shell script to run nodes
```
cd 1-node
vi node1.sh and paste below command, change the address of your node1 account at --unlock
nohup geth --nousb \
     --datadir=$pwd \
     --syncmode 'full' \
     --port 30310 \
     --miner.gasprice 0 \
     --miner.gastarget 470000000000 \
     --http \
     --http.addr 'localhost' \
     --http.port 8545 \
     --http.api admin,eth,miner,net,txpool,personal,web3 \
     --mine \
     --allow-insecure-unlock \
     --unlock "0x1061755ec5ba90eE23FD293781E1Eac601627823" \
     --networkid 81397860 \
     --password password.txt &
echo "Geth started on node 1" 

cd 2-node 
vi node2.sh and paste below command, change the address of your node1 account at --unlock
nohup geth --nousb \
     --datadir=$pwd \
     --syncmode 'full' \
     --port 30311 \
     --miner.gasprice 0 \
     --miner.gastarget 470000000000 \
     --http \
     --http.addr 'localhost' \
     --http.port 8546 \
     --http.api admin,eth,miner,net,txpool,personal,web3 \
     --mine \
     --allow-insecure-unlock \
     --unlock "0x6958D88CC31E1Ee6B72f2FBf1f00d93D89104667" \
     --networkid 81397860 \
     --password password.txt &
echo "Geth started on node 2" 

cd 3-node 
vi node3.sh and paste below command, change the address of your node1 account at --unlock
nohup geth --nousb \
     --datadir=$pwd \
     --syncmode 'full' \
     --port 30312 \
     --miner.gasprice 0 \
     --miner.gastarget 470000000000 \
     --http \
     --http.addr 'localhost' \
     --http.port 8547 \
     --http.api admin,eth,miner,net,txpool,personal,web3 \
     --mine \
     --allow-insecure-unlock \
     --unlock "0xC5a13BC74AE6344618e41E1d4b2921aA6A6ce54F" \
     --networkid 81397860 \
     --password password.txt &
echo "Geth started on node 3" 
```
### Enode -> static-nodes.json
```
cd 1-node/
touch statis-nodes.json
sh node1.sh
geth attach geth.ipc
> admin.nodeInfo.enode
"enode://414382844caca6e92476a7041b7e5bf11a7288948687dad099f10f8854a5989f7ecd62ada5bb3196555888a8148837ce13dc62d9a0d49a5128f57f19aca68554@116.86.144.27:30310"
>

cd 2-node/
sh node2.sh
geth attach geth.ipc
> admin.nodeInfo.enode
"enode://99fcdd3c32efff46ab7c8dc563a555042754df2c241af56b9f91697afb7d59d697db99b320c32592433fcc2a212dd5576f8b47d269e742b86512c69a17052f1e@116.86.144.27:30311"
>

cd 3-node
sh node3.sh
geth attach geth.ipc
> admin.nodeInfo.enode
"enode://f3ee7d5544df2fec2f3a36187b842d26dfeb7e25884c51b5a788d3f17bb8b4b3773806b83121c6141fd39568764332833a55ebebdf73d10c195ef56b05d68074@116.86.144.27:30312"
>

copy to all nodes
cd 1-node
cp static-nodes.json ../2-node
cp static-nodes.json ../3-node

```

### Restart
```
ps aux | grep geth
kill all the 3 geth processes and then start again.

start all the nodes
cd 1-node
sh node1.sh
cd 2-node
sh node2.sh
cd 3-node
sh node3.sh

check balance
cd 1-node
geth attach geth.ipc
> web3.eth.accounts
["0x1061755ec5ba90ee23fd293781e1eac601627823"]
> web3.eth.getBalance(web3.eth.accounts[0])
9.04625697166532776746648320380374280103671755200316906558262375061821325312e+74
>
```

### Create new account and fund that account and set it at as coinbase account
```
• Now set up the coinbase or etherbase account.
• A new account should be shaped firstly.
• Use the new account method of the personal object to create a new account.
• Provide a passphrase during creating a new account.
• That turns into a password for the account.
• Account ID should be tagged as a coinbase or etherbase account.
• The Geth supplier has to change the coinbase address. miner object with the setEtherBase function.
• This way will change the present coinbase to the provided account.

cd 1-node
geth attach geth.ipc or geth attach http://localhost:8545
geth attach geth.ipc
> web3.eth.accounts
["0x1061755ec5ba90ee23fd293781e1eac601627823"]
> web3.eth.getBalance(web3.eth.accounts[0])
9.04625697166532776746648320380374280103671755200316906558262375061821325312e+74
> net.peerCount
2
> net.peerCount
2
> web3.eth.accounts
["0x1061755ec5ba90ee23fd293781e1eac601627823"]
> personal.newAccount()
Passphrase:
Repeat passphrase:
"0xc136997c76e1c3b6b3d17de1ba6c80c2e72dad16"
> web3.eth.accounts
["0x1061755ec5ba90ee23fd293781e1eac601627823", "0xc136997c76e1c3b6b3d17de1ba6c80c2e72dad16"]
> eth.coinbase
"0x1061755ec5ba90ee23fd293781e1eac601627823"
> web3.eth.getBalance(web3.eth.accounts[1])
0
> miner.setEtherbase("0xc136997c76e1c3b6b3d17de1ba6c80c2e72dad16")
true
> eth.coinbase
"0xc136997c76e1c3b6b3d17de1ba6c80c2e72dad16"
> web3.eth.getBalance(web3.eth.accounts[1])
0
> miner.start()
null
> web3.eth.getBalance(web3.eth.accounts[1])
0
> web3.eth.getBalance(web3.eth.accounts[1])
0
> web3.eth.getBalance(web3.eth.accounts[1])
8000000000000000000
> web3.eth.getBalance(web3.eth.accounts[1])
10000000000000000000
> web3.eth.getBalance(web3.eth.accounts[1])
12000000000000000000
>
miner.stop()

```

### sample truffle deployment
```
cd truffle-uups-accesscontrol
rm -rf contracts
rm -rf migrations
cp -rf contracts_v1 contracts
cp -rf migrations_v1 migrations
truffle compile --all
truffle migrate --network ganache  (check the truffle-config.js it should reflect 1-node port number i.e. 8545)
truffle migrate --network ganache --reset

Compiling your contracts...
===========================
✔ Fetching solc version list from solc-bin. Attempt #1
✔ Fetching solc version list from solc-bin. Attempt #1
> Everything is up to date, there is nothing to compile.



Starting migrations...
======================
> Network name:    'ganache'
> Network id:      81397860
> Block gas limit: 5478114 (0x5396e2)


1_initial_migration.js
======================

   Replacing 'Migrations'
   ----------------------
   ⠋ Blocks: 0            Seconds: 0   > transaction hash:    0xb9d868253ebbc02e6f092e1a4cacfed7c6a095d4c86c160f51bf89c91f264ce4
   > Blocks: 0            Seconds: 0
   > contract address:    0xECBa1cc6AA4bB8c25fcb3473eb7Cd0E1A711646B
   > block number:        159
   > block timestamp:     1650102634
   > account:             0x1061755ec5ba90eE23FD293781E1Eac601627823
   > balance:             904625697166532776746648320380374280103671755200316906876.262375061821325312
   > gas used:            248854 (0x3cc16)
   > gas price:           0.000000001 gwei
   > value sent:          0 ETH
   > total cost:          0.000000000000248854 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:     0.000000000000248854 ETH


2_deploy_erc20_contract.js
==========================

   Deploying 'ERC1967Proxy'
   ------------------------
   ⠋ Blocks: 0            Seconds: 0   > transaction hash:    0x50d79717bbd757ac0a5bdf797f0bbb3a4624f8a92c3b15ad7ae0561a21a18576
   > Blocks: 0            Seconds: 0
   > contract address:    0x176A62613f13A706d789BD1CcecFA24423900719
   > block number:        164
   > block timestamp:     1650102639
   > account:             0x1061755ec5ba90eE23FD293781E1Eac601627823
   > balance:             904625697166532776746648320380374280103671755200316906886.262375061821325312
   > gas used:            483446 (0x76076)
   > gas price:           0.000000001 gwei
   > value sent:          0 ETH
   > total cost:          0.000000000000483446 ETH

Deployed 0x176A62613f13A706d789BD1CcecFA24423900719

   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:     0.000000000000483446 ETH

Summary
=======
> Total deployments:   2
> Final cost:          0.0000000000007323 ETH

```