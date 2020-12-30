/*
    Copyright 2020 Zero Collateral Devs, standing on the shoulders of the Empty Set Squad <zaifinance@protonmail.com>

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

pragma solidity ^0.5.17;
pragma experimental ABIEncoderV2;

import "./external/Decimal.sol";

library Constants {
    /* Chain */
    uint256 private constant CHAIN_ID = 1; // Mainnet

    /* Bootstrapping */
    uint256 private constant BOOTSTRAPPING_PERIOD = 672; // 14 cycles
    uint256 private constant BOOTSTRAPPING_PRICE = 11e17; // 1.10 DAI

    /* Oracle */
    address private constant USDC = address(
        0x6B175474E89094C44Da98b954EedeAC495271d0F
    ); // Anywhere the term USDC is refernenced, consider that as "peg", really
    uint256 private constant ORACLE_RESERVE_MINIMUM = 1e22; // 10,000 DAI

    /* Bonding */
    uint256 private constant INITIAL_STAKE_MULTIPLE = 1e6; // 100 ZAI -> 100M ZAIS

    /* Epoch */
    struct EpochStrategy {
        uint256 offset;
        uint256 start;
        uint256 period;
    }

    uint256 private constant CURRENT_EPOCH_OFFSET = 0;
    uint256 private constant CURRENT_EPOCH_START = 1608422400;
    uint256 private constant CURRENT_EPOCH_PERIOD = 1800;

    /* Governance */
    uint256 private constant GOVERNANCE_PERIOD = 144; // 3 cycles
    uint256 private constant GOVERNANCE_EXPIRATION = 48;
    uint256 private constant GOVERNANCE_QUORUM = 20e16; // 20%
    uint256 private constant GOVERNANCE_PROPOSAL_THRESHOLD = 5e15; // 0.5%
    uint256 private constant GOVERNANCE_SUPER_MAJORITY = 66e16; // 66%
    uint256 private constant GOVERNANCE_EMERGENCY_DELAY = 96; // 2 cycles

    /* DAO */
    uint256 private constant ADVANCE_INCENTIVE = 1e20; // 100 ZAI
    uint256 private constant DAO_EXIT_LOCKUP_EPOCHS = 240; // 5 cycles fluid

    /* Pool */
    uint256 private constant POOL_EXIT_LOCKUP_EPOCHS = 144; // 3 cycles fluid

    /* Market */
    uint256 private constant COUPON_EXPIRATION = 17520; // 365 cycles
    uint256 private constant DEBT_RATIO_CAP = 20e16; // 20%

    /* Regulator */
    uint256 private constant SUPPLY_CHANGE_LIMIT = 1e16; // 1%
    uint256 private constant COUPON_SUPPLY_CHANGE_LIMIT = 2e16; // 2%
    uint256 private constant ORACLE_POOL_RATIO = 50; // 50%
    uint256 private constant TREASURY_RATIO = 0; // 0%

    /* Deployed */
    address private constant TREASURY_ADDRESS = address(
        0x0000000000000000000000000000000000000000
    );

    /**
     * Getters
     */

    function getUsdcAddress() internal pure returns (address) {
        return USDC;
    }

    function getOracleReserveMinimum() internal pure returns (uint256) {
        return ORACLE_RESERVE_MINIMUM;
    }

    function getCurrentEpochStrategy()
        internal
        pure
        returns (EpochStrategy memory)
    {
        return
            EpochStrategy({
                offset: CURRENT_EPOCH_OFFSET,
                start: CURRENT_EPOCH_START,
                period: CURRENT_EPOCH_PERIOD
            });
    }

    function getInitialStakeMultiple() internal pure returns (uint256) {
        return INITIAL_STAKE_MULTIPLE;
    }

    function getBootstrappingPeriod() internal pure returns (uint256) {
        return BOOTSTRAPPING_PERIOD;
    }

    function getBootstrappingPrice()
        internal
        pure
        returns (Decimal.D256 memory)
    {
        return Decimal.D256({value: BOOTSTRAPPING_PRICE});
    }

    function getGovernancePeriod() internal pure returns (uint256) {
        return GOVERNANCE_PERIOD;
    }

    function getGovernanceExpiration() internal pure returns (uint256) {
        return GOVERNANCE_EXPIRATION;
    }

    function getGovernanceQuorum() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: GOVERNANCE_QUORUM});
    }

    function getGovernanceProposalThreshold()
        internal
        pure
        returns (Decimal.D256 memory)
    {
        return Decimal.D256({value: GOVERNANCE_PROPOSAL_THRESHOLD});
    }

    function getGovernanceSuperMajority()
        internal
        pure
        returns (Decimal.D256 memory)
    {
        return Decimal.D256({value: GOVERNANCE_SUPER_MAJORITY});
    }

    function getGovernanceEmergencyDelay() internal pure returns (uint256) {
        return GOVERNANCE_EMERGENCY_DELAY;
    }

    function getAdvanceIncentive() internal pure returns (uint256) {
        return ADVANCE_INCENTIVE;
    }

    function getDAOExitLockupEpochs() internal pure returns (uint256) {
        return DAO_EXIT_LOCKUP_EPOCHS;
    }

    function getPoolExitLockupEpochs() internal pure returns (uint256) {
        return POOL_EXIT_LOCKUP_EPOCHS;
    }

    function getCouponExpiration() internal pure returns (uint256) {
        return COUPON_EXPIRATION;
    }

    function getDebtRatioCap() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: DEBT_RATIO_CAP});
    }

    function getSupplyChangeLimit()
        internal
        pure
        returns (Decimal.D256 memory)
    {
        return Decimal.D256({value: SUPPLY_CHANGE_LIMIT});
    }

    function getCouponSupplyChangeLimit()
        internal
        pure
        returns (Decimal.D256 memory)
    {
        return Decimal.D256({value: COUPON_SUPPLY_CHANGE_LIMIT});
    }

    function getOraclePoolRatio() internal pure returns (uint256) {
        return ORACLE_POOL_RATIO;
    }

    function getTreasuryRatio() internal pure returns (uint256) {
        return TREASURY_RATIO;
    }

    function getChainId() internal pure returns (uint256) {
        return CHAIN_ID;
    }

    function getTreasuryAddress() internal pure returns (address) {
        return TREASURY_ADDRESS;
    }
}
