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
echo "Geth started on node 1" 