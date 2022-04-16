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
     --miner.gasprice '1' \
     --allow-insecure-unlock \
     --unlock "0xC5a13BC74AE6344618e41E1d4b2921aA6A6ce54F" \
     --networkid 81397860 \
     --password password.txt &
echo "Geth started on node 3" 