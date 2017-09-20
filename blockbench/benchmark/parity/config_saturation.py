NS=[8]
NODES=['10.0.0.{}'.format(x) for x in range(3,7)]
CLIENTS=['10.0.0.{}'.format(x) for x in range(85,89)]

PORT='8545'
#THREADS=[2,4,8,16,32]
#RATES=[1,2,4,8,12,16]
THREADS=[32]
RATES=[10]

HOME_DIR='/home/dinhtta/blockbench/benchmark/parity'
CHAIN_DATA='/data/dinhtta/chain-data'
LOG_DIR='/data/logs/'
PARITY_EXE='/usr/bin/parity'

PARITY_EXE='/users/dinhtta/.cargo/bin/parity'
CLIENT_LOG='logs_saturations'
CLIENT_DRIVER='start_ycsb_client.sh'

enode_command = 'curl --data \'{{"jsonrpc": "2.0", "method": "parity_enode", "params":[], "id": 0}}\' -H "Content-Type: application/json" -X POST {}:{}'
add_peer = 'curl --data \'{{"jsonrpc": "2.0", "method": "parity_addReservedPeer", "params":["{}"], "id": 0}}\' -H "Content-Type: application/json" -X POST {}:{}'
kill_command = 'ssh -o StrictHostKeyChecking=no dinhtta@{} "killall -KILL {}"'
ssh_command = 'ssh -o StrictHostKeyChecking=no dinhtta@{} {}'

partition_cmd = './partition.sh {} {} {} &'
TIMEOUT=150
