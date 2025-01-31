# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`
#!/bin/bash
raw=$(bitcoin-cli getrawtransaction e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163)
decoded=$(bitcoin-cli decoderawtransaction $raw)
pk=$(echo $decoded | jq -r '.vin[0] | .txinwitness[2]' | cut -c5-70)
echo $pk
