# Only one single output remains unspent from block 123,321. What address was it sent to?
#!/bin/bash
hash=$(bitcoin-cli getblockhash 123321)
block=$(bitcoin-cli getblock $hash)
ntx=$(echo $block | jq -r '.nTx')
for((i = 0; i < ntx; i++))
do
	currtx=$(echo $block | jq -r --argjson id1 "$i" '.tx[$id1]')
	txraw=$(bitcoin-cli getrawtransaction $currtx)
	txdcd=$(bitcoin-cli decoderawtransaction $txraw)
	iterator=$(echo $txdcd | jq -r '.vout | length')
	for((j = 0; j < iterator; j++))
	do
		utxo=$(bitcoin-cli gettxout "$currtx" "$j")
		if [[ -n "$utxo" ]]
		then
			ans=$(echo $utxo | jq -r '.scriptPubKey | .address')
			echo $ans
			exit 0
		fi
	done
done
		
