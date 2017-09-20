#!/bin/bash
CHAIN_DATA=$1
KEYS=$CHAIN_DATA/keys/PoA
HOST=$2
LOGS=$3
PARITY=$4
IDX=$5
cd `dirname ${BASH_SOURCE-$0}`

# remove chain data
rm -rf $CHAIN_DATA
mkdir -p $KEYS
mkdir -p $LOGS
# copy keys
cp keys/key* $KEYS/

nohup ${PARITY} --config config.toml.$IDX --rpcport 8545 --gasprice 0 --reseal-min-period 0 --num-verifiers 8 --jsonrpc-threads 8 --fast-unlock --fast-and-loose --rpcaddr $HOST > $LOGS/log 2>&1 & 
