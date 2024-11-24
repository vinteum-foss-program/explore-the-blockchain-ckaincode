# What is the hash of block 654,321?
hash=$(bitcoin-cli getblockhash 654321 | tr -d '\r\n\t' | cut -c1-64)
block=$(bitcoin-cli getblock $hash)
echo $block | jq .nTx
