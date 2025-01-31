# What is the hash of block 654,321?
#!/bin/bash
hash=$(bitcoin-cli getblockhash 654321)
echo $hash
