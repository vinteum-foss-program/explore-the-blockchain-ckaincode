# Which tx in block 257,343 spends the coinbase output of block 256,128?
# Pegar tx do 256128 -> Comparar com as Txs do 257343
#!/bin/bash
cbblockhs=$(bitcoin-cli getblockhash 256128)
block=$(bitcoin-cli getblock $cbblockhs)
cbtx=$(echo $block | jq -r '.tx[0]')
target=$(bitcoin-cli getblockhash 257343)
btarget=$(bitcoin-cli getblock $target)
txiterator=$(echo $btarget | jq -r '.nTx')
for ((i = 1; i < txiterator; i++))# No need to check coinbase
do
	currtx=$(echo $btarget | jq -r --argjson index1 "$i" '.tx[$index1]')
	rawcurrtx=$(bitcoin-cli getrawtransaction $currtx)
	decodedcurrtx=$(bitcoin-cli decoderawtransaction $rawcurrtx)
	ninputs=$(echo $decodedcurrtx | jq -r '.vin | length')
	for ((j = 0; j < ninputs; j++))
	do
		input_tx=$(echo $decodedcurrtx | jq -r --argjson index2 "$j" '.vin[$index2].txid')
		if [ "$input_tx" == "$cbtx" ] 
		then
			echo $currtx
			exit 0
		fi
	done
done
	
	
