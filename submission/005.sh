# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`
#!/bin/bash
rawtx=$(bitcoin-cli getrawtransaction 37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517)
raw=$(bitcoin-cli decoderawtransaction $rawtx)
pub1=$(echo $raw | jq -r '.vin[0] | .txinwitness[1]')
pub2=$(echo $raw | jq -r '.vin[1] | .txinwitness[1]')
pub3=$(echo $raw | jq -r '.vin[2] | .txinwitness[1]')
pub4=$(echo $raw | jq -r '.vin[3] | .txinwitness[1]')
multi=$(bitcoin-cli createmultisig 1 "[\"$pub1\",\"$pub2\",\"$pub3\",\"$pub4\"]")
echo $multi | jq -r .address