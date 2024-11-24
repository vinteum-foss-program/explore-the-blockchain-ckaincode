#!/bin/bash
hash=$(bitcoin-cli getblockhash 654321 | tr -d "'" | cut -c1-64)
block=$(bitcoin-cli getblock $hash)
echo $block | jq .nTx
