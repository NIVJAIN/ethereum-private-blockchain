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
    INFO [04-16|09:25:57.617] Maximum peer count                       ETH=50 LES=0 total=50
    Your new account is locked with a password. Please give a password. Do not forget this password.
    Password:
    Repeat password:
    Your new key was generated
    Public address of the key:   0x1061755ec5ba90eE23FD293781E1Eac601627823
    Path of the secret key file: 1-node/keystore/UTC--2022-04-16T01-26-21.524049000Z--1061755ec5ba90ee23fd293781e1eac601627823
    - You can share your public address with anyone. Others need it to interact with you.
    - You must NEVER share the secret key with anyone! The key controls access to your funds!
    - You must BACKUP your key file! Without the key, it's impossible to access account funds!
    - You must REMEMBER your password! Without the password, it's impossible to decrypt the key!

geth --datadir 2-node/ account new
    INFO [04-16|09:28:06.774] Maximum peer count                       ETH=50 LES=0 total=50
    Your new account is locked with a password. Please give a password. Do not forget this password.
    Password:
    Repeat password:

    Your new key was generated

    Public address of the key:   0x6958D88CC31E1Ee6B72f2FBf1f00d93D89104667
    Path of the secret key file: 2-node/keystore/UTC--2022-04-16T01-28-18.708470000Z--6958d88cc31e1ee6b72f2fbf1f00d93d89104667

    - You can share your public address with anyone. Others need it to interact with you.
    - You must NEVER share the secret key with anyone! The key controls access to your funds!
    - You must BACKUP your key file! Without the key, it's impossible to access account funds!
    - You must REMEMBER your password! Without the password, it's impossible to decrypt the key!

geth --datadir 3-node/ account new
    INFO [04-16|09:28:46.108] Maximum peer count                       ETH=50 LES=0 total=50
    Your new account is locked with a password. Please give a password. Do not forget this password.
    Password:
    Repeat password:

    Your new key was generated

    Public address of the key:   0xC5a13BC74AE6344618e41E1d4b2921aA6A6ce54F
    Path of the secret key file: 3-node/keystore/UTC--2022-04-16T01-28-55.817740000Z--c5a13bc74ae6344618e41e1d4b2921aa6a6ce54f

    - You can share your public address with anyone. Others need it to interact with you.
    - You must NEVER share the secret key with anyone! The key controls access to your funds!
    - You must BACKUP your key file! Without the key, it's impossible to access account funds!
    - You must REMEMBER your password! Without the password, it's impossible to decrypt the key!
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
+-----------------------------------------------------------+
| Welcome to puppeth, your Ethereum private network manager |
|                                                           |
| This tool lets you create a new Ethereum network down to  |
| the genesis block, bootnodes, miners and ethstats servers |
| without the hassle that it would normally entail.         |
|                                                           |
| Puppeth uses SSH to dial in to remote servers, and builds |
| its network components out of Docker containers using the |
| docker-compose toolset.                                   |
+-----------------------------------------------------------+

Please specify a network name to administer (no spaces, hyphens or capital letters please)
> privatenetwork

Sweet, you can set this via --network=privatenetwork next time!

INFO [04-16|10:20:02.743] Administering Ethereum network           name=privatenetwork
WARN [04-16|10:20:02.743] No previous configurations found         path=/Users/pinkyjain/.puppeth/privatenetwork

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
> 0x0x6958D88CC31E1Ee6B72f2FBf1f00d93D89104667
ERROR[04-16|10:20:52.940] Invalid address length, please retry
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
INFO [04-16|10:25:15.014] Saved native genesis chain spec          path=privatenetwork.json
INFO [04-16|10:25:15.016] Saved genesis chain spec                 client=aleth path=privatenetwork-aleth.json
INFO [04-16|10:25:15.017] Saved genesis chain spec                 client=parity path=privatenetwork-parity.json
INFO [04-16|10:25:15.017] Saved genesis chain spec                 client=harmony path=privatenetwork-harmony.json

What would you like to do? (default = stats)
 1. Show network stats
 2. Manage existing genesis
 3. Track new remote server
 4. Deploy network components
>
INFO [04-16|10:25:23.153] No remote machines to gather stats from

What would you like to do? (default = stats)
 1. Show network stats
 2. Manage existing genesis
 3. Track new remote server
 4. Deploy network components
> ^C
> ^C
> exit
ERROR[04-16|10:25:27.201] That's not something I can do

What would you like to do? (default = stats)
 1. Show network stats
 2. Manage existing genesis
 3. Track new remote server
 4. Deploy network components
> Ctrl c
ERROR[04-16|10:25:28.739] That's not something I can do

```

### Initialziation
```
command
geth --datadir 1-node/ init privatenetwork.json
geth --datadir 2-node/ init privatenetwork.json
geth --datadir 3-node/ init privatenetwork.json

geth --datadir 1-node/ init privatenetwork.json
INFO [04-16|10:28:46.017] Maximum peer count                       ETH=50 LES=0 total=50
INFO [04-16|10:28:46.018] Set global gas cap                       cap=50,000,000
INFO [04-16|10:28:46.018] Allocated cache and file handles         database=/Users/pinkyjain/Downloads/BLOCKCHAIN/ethereum-private-blockchain/1-node/geth/chaindata cache=16.00MiB handles=16
INFO [04-16|10:28:46.099] Writing custom genesis block
INFO [04-16|10:28:46.102] Persisted trie from memory database      nodes=357 size=50.82KiB time="794.917µs" gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [04-16|10:28:46.102] Successfully wrote genesis state         database=chaindata hash=45f8f1..978eab
INFO [04-16|10:28:46.102] Allocated cache and file handles         database=/Users/pinkyjain/Downloads/BLOCKCHAIN/ethereum-private-blockchain/1-node/geth/lightchaindata cache=16.00MiB handles=16
INFO [04-16|10:28:46.178] Writing custom genesis block
INFO [04-16|10:28:46.181] Persisted trie from memory database      nodes=357 size=50.82KiB time="669.5µs"   gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [04-16|10:28:46.181] Successfully wrote genesis state         database=lightchaindata hash=45f8f1..978eab


geth --datadir 2-node/ init privatenetwork.json
INFO [04-16|10:28:53.533] Maximum peer count                       ETH=50 LES=0 total=50
INFO [04-16|10:28:53.534] Set global gas cap                       cap=50,000,000
INFO [04-16|10:28:53.534] Allocated cache and file handles         database=/Users/pinkyjain/Downloads/BLOCKCHAIN/ethereum-private-blockchain/2-node/geth/chaindata cache=16.00MiB handles=16
INFO [04-16|10:28:53.615] Writing custom genesis block
INFO [04-16|10:28:53.618] Persisted trie from memory database      nodes=357 size=50.82KiB time="822.792µs" gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [04-16|10:28:53.618] Successfully wrote genesis state         database=chaindata hash=45f8f1..978eab
INFO [04-16|10:28:53.618] Allocated cache and file handles         database=/Users/pinkyjain/Downloads/BLOCKCHAIN/ethereum-private-blockchain/2-node/geth/lightchaindata cache=16.00MiB handles=16
INFO [04-16|10:28:53.697] Writing custom genesis block
INFO [04-16|10:28:53.704] Persisted trie from memory database      nodes=357 size=50.82KiB time=1.114708ms  gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [04-16|10:28:53.704] Successfully wrote genesis state         database=lightchaindata hash=45f8f1..978eab

geth --datadir 3-node/ init privatenetwork.json
INFO [04-16|10:28:59.001] Maximum peer count                       ETH=50 LES=0 total=50
INFO [04-16|10:28:59.002] Set global gas cap                       cap=50,000,000
INFO [04-16|10:28:59.002] Allocated cache and file handles         database=/Users/pinkyjain/Downloads/BLOCKCHAIN/ethereum-private-blockchain/3-node/geth/chaindata cache=16.00MiB handles=16
INFO [04-16|10:28:59.121] Writing custom genesis block
INFO [04-16|10:28:59.124] Persisted trie from memory database      nodes=357 size=50.82KiB time="841.458µs" gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [04-16|10:28:59.124] Successfully wrote genesis state         database=chaindata hash=45f8f1..978eab
INFO [04-16|10:28:59.124] Allocated cache and file handles         database=/Users/pinkyjain/Downloads/BLOCKCHAIN/ethereum-private-blockchain/3-node/geth/lightchaindata cache=16.00MiB handles=16
INFO [04-16|10:28:59.207] Writing custom genesis block
INFO [04-16|10:28:59.212] Persisted trie from memory database      nodes=357 size=50.82KiB time="710.5µs"   gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [04-16|10:28:59.212] Successfully wrote genesis state         database=lightchaindata hash=45f8f1..978eab
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
Welcome to the Geth JavaScript console!

instance: Geth/v1.10.16-stable/darwin-arm64/go1.17.6
coinbase: 0x1061755ec5ba90ee23fd293781e1eac601627823
at block: 0 (Sat Apr 16 2022 10:20:14 GMT+0800 (+08))
 datadir: /Users/pinkyjain/Downloads/BLOCKCHAIN/ethereum-private-blockchain/1-node
 modules: admin:1.0 debug:1.0 eth:1.0 ethash:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

To exit, press ctrl-d or type exit
> admin.nodeInfo.enode
"enode://414382844caca6e92476a7041b7e5bf11a7288948687dad099f10f8854a5989f7ecd62ada5bb3196555888a8148837ce13dc62d9a0d49a5128f57f19aca68554@116.86.144.27:30310"
>

cd 2-node/
sh node2.sh
geth attach geth.ipc
Welcome to the Geth JavaScript console!

instance: Geth/v1.10.16-stable/darwin-arm64/go1.17.6
coinbase: 0x6958d88cc31e1ee6b72f2fbf1f00d93d89104667
at block: 0 (Sat Apr 16 2022 10:20:14 GMT+0800 (+08))
 datadir: /Users/pinkyjain/Downloads/BLOCKCHAIN/ethereum-private-blockchain/2-node
 modules: admin:1.0 debug:1.0 eth:1.0 ethash:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

To exit, press ctrl-d or type exit
> admin.nodeInfo.enode
"enode://99fcdd3c32efff46ab7c8dc563a555042754df2c241af56b9f91697afb7d59d697db99b320c32592433fcc2a212dd5576f8b47d269e742b86512c69a17052f1e@116.86.144.27:30311"
>

cd 3-node
sh node3.sh
geth attach geth.ipc
Welcome to the Geth JavaScript console!

instance: Geth/v1.10.16-stable/darwin-arm64/go1.17.6
coinbase: 0xc5a13bc74ae6344618e41e1d4b2921aa6a6ce54f
at block: 0 (Sat Apr 16 2022 10:20:14 GMT+0800 (+08))
 datadir: /Users/pinkyjain/Downloads/BLOCKCHAIN/ethereum-private-blockchain/3-node
 modules: admin:1.0 debug:1.0 eth:1.0 ethash:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

To exit, press ctrl-d or type exit
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
kill all the 3 geth processes.
ps aux | grep geth
pinkyjain        52979   5.5  0.6 410701136 376240 s013  S    11:31AM   0:04.40 geth --nousb --datadir= --syncmode full --port 30311 --miner.gasprice 0 --miner.gastarget 470000000000 --http --http.addr localhost --http.port 8546 --http.api admin,eth,miner,net,txpool,personal,web3 --mine --allow-insecure-unlock --unlock 0x6958D88CC31E1Ee6B72f2FBf1f00d93D89104667 --password password.txt
pinkyjain        52641   2.2  0.6 410569808 371968 s013  S    10:42AM   1:00.34 geth --nousb --datadir= --syncmode full --port 30310 --miner.gasprice 0 --miner.gastarget 470000000000 --http --http.addr localhost --http.port 8545 --http.api admin,eth,miner,net,txpool,personal,web3 --mine --allow-insecure-unlock --unlock 0x1061755ec5ba90eE23FD293781E1Eac601627823 --password password.txt
pinkyjain        53189   0.0  0.0 408637584   1728 s013  S+   11:34AM   0:00.00 grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --exclude-dir=.idea --exclude-dir=.tox geth

ps aux | grep geth
pinkyjain        53313   1.3  0.9 410575600 600960 s013  S    11:34AM   0:05.73 geth --nousb --datadir= --syncmode full --port 30312 --miner.gasprice 0 --miner.gastarget 470000000000 --http --http.addr localhost --http.port 8547 --http.api admin,eth,miner,net,txpool,personal,web3 --mine --allow-insecure-unlock --unlock 0xC5a13BC74AE6344618e41E1d4b2921aA6A6ce54F --password password.txt
pinkyjain        53491   0.0  0.0 408628368   1584 s013  S+   11:37AM   0:00.00 grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --exclude-dir=.idea --exclude-dir=.tox geth
kill -9 53313

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
Welcome to the Geth JavaScript console!
instance: Geth/v1.10.16-stable/darwin-arm64/go1.17.6
coinbase: 0x1061755ec5ba90ee23fd293781e1eac601627823
at block: 0 (Sat Apr 16 2022 10:20:14 GMT+0800 (+08))
 datadir: /Users/pinkyjain/Downloads/BLOCKCHAIN/ethereum-private-blockchain/1-node
 modules: admin:1.0 debug:1.0 eth:1.0 ethash:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

To exit, press ctrl-d or type exit
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
Welcome to the Geth JavaScript console!

instance: Geth/v1.10.16-stable/darwin-arm64/go1.17.6
coinbase: 0x1061755ec5ba90ee23fd293781e1eac601627823
at block: 0 (Sat Apr 16 2022 10:20:14 GMT+0800 (+08))
 datadir: /Users/pinkyjain/Downloads/BLOCKCHAIN/ethereum-private-blockchain/1-node
 modules: admin:1.0 debug:1.0 eth:1.0 ethash:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

To exit, press ctrl-d or type exit
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

```