# Test with Smart Contract
> This guide is dedicated for the technical challenge from SemanticLayer

## Description
The `statefulPrecompile` is deployed to the following addresses for the hardforks.
| hardfork | address |
| :------: | :-----: |
| Prague   | 0x14    |
| Cancun   | 0x0b    |
| Berlin   | 0x0a    |

The smart contract on the `StatefulPrecompile.sol` file is written for the `Prague` hardfork and it uses `0x14` to direct the `statefulPrecompie` contract.
To test this smart contract on chain, we need to follow these steps.
- Build the go-ethereum project
- Run execution node with the new geth binary
- Deploy and test the contract by using tools like Remix
Let's see one by one.

### Build the go-ethereum project
At the root directory of the project run the following command to build.
```bash
make geth
```
This will build the code and generate a `geth` binary on `./build/bin`.

### Run execution node with the new geth binary
Before deploy the smart contract, we need to start the custom ethereum network. To make remix communicate with this node, we should allow the remix's url.
We need to initialize the network state by using `genesis.json` file.
```bash
./build/bin/geth init --datadir ./data genesis.json
```
Then, use the following command to run the execution node.
```bash
./build/bin/geth --dev --networkid 3151908 --http --http.addr "0.0.0.0" --http.port "8545" --http.api "eth,web3,personal,net,miner,debug" --nodiscover --mine --allow-insecure-unlock --http.corsdomain https://remix.ethereum.org --dev console --vmdebug
```
This will both run the node and open the geth console for the further inspect.

### Deploy and test the contract by using tools like Remix
We can use [Remix](https://remix.ethereum.org) to deploy and test the smart contract.
On the `Deploy & Run Transactions` tab, choose the `Custom - External Http Provider` under the `Environment` dropdown. This will connects Remix to the custom node which we started before.
Then create a new `sol` file move the content of the `StatefulPrecompile.sol` file in it.
After that, we can compile and deploy the contract.
The `callPrecompile` method receives an address of another contract as an input parameter to inject a counter inside it. We should provide a valid contract address when running this method.

## Additional notes


