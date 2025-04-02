RPC_ENDPOINTS=(
"https://eth1.lava.build/lava-referer-02b48265-a9ce-4f3e-876c-4f3c3929732b/"
"https://mainnet.infura.io/v3/5a0206154a0144dfa89af2f4aab02588"
"https://eth-mainnet.g.alchemy.com/v2/PrRkgnycJ5lcJyjvp1iXq65Nbeq0-Z2Y"
)

while true; do
    for rpc_endpoint in "${RPC_ENDPOINTS[@]}"; do
        response=$(curl -s -X POST $rpc_endpoint -H "Content-Type: application/json" -d '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}')

        block_number=$(echo $response | jq -r '.result')
        echo "Block number for $rpc_endpoint: $block_number"
    done

    sleep 5
done
