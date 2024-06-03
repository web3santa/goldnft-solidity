include .env

clean:
	forge clean
build:
	forge build

deploy:
	forge script script/DeployNFT.s.sol:DeployNFT \
	--rpc-url ${APIKEY} \
	--private-key ${PRIVATE_KEY} \
	--broadcast

withdraw:
	forge script script/Interaction.s.sol:Interaction \
	--rpc-url ${APIKEY} \
	--private-key ${PRIVATE_KEY} \
	--broadcast

