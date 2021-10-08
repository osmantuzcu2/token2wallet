function addToken(addr, sym, dec, img) {
    web3.currentProvider.sendAsync({
        method: 'wallet_watchAsset',
        params: {
            type: 'ERC20',
            "options": {
                address: addr,
                symbol: sym,
                decimals: dec,
                image: img,
            }
        },
    });
}