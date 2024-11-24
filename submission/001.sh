# What is the hash of block 654,321?
hash=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_056 -rpcpassword=NHgyJIWK6osB getblockhash 654321 | tr -d '\r\n\t' | cut -c1-64)
block=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_056 -rpcpassword=NHgyJIWK6osB getblock $hash)
echo $block | jq .nTx
