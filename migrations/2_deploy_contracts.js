const TangibleItems = artifacts.require("TangibleItems");

module.exports = function(deployer) {
  deployer.deploy(TangibleItems);
};
