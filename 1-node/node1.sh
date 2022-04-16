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

# nohup geth --nousb --datadir=$pwd --syncmode 'full' --port 30310 --miner.gasprice 0 --miner.gastarget 470000000000 --http --http.addr 'localhost' --http.port 8545 --http.api admin,eth,miner,net,txpool,personal,web3 --mine --allow-insecure-unlock --unlock "0x6d1cf417e8C12F1221C187B29f34e6108F37A0Dc" --password password.txt &    

echo "Geth started on node 1" 

# 0x1061755ec5ba90eE23FD293781E1Eac601627823
# 0x6958D88CC31E1Ee6B72f2FBf1f00d93D89104667
# 0xC5a13BC74AE6344618e41E1d4b2921aA6A6ce54F
