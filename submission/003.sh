# How many new outputs were created by block 123,456?
#!/bin/bash
blockst=$(bitcoin-cli getblockstats 123456)
echo $blockst | jq .outs
