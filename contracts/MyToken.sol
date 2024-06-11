// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(address initialOwner) Ownable(initialOwner) ERC20('IRONIC', 'IRC') {}

    /**
     * @dev Function to mint tokens
     * @param to The address that will receive the minted tokens.
     * @param amount The amount of tokens to mint.
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    /**
     * @dev Function to burn tokens
     * @param amount The amount of tokens to burn.
     */
    function burn(uint256 amount) public {
        _burn(_msgSender(), amount);
    }

    /**
     * @dev Function to transfer tokens
     * @param recipient The address that will receive the tokens.
     * @param amount The amount of tokens to transfer.
     * @return A boolean that indicates if the operation was successful.
     */
    function transferTokens(address recipient, uint256 amount) public returns (bool) {
        return transfer(recipient, amount);
    }
}
