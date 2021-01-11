const SimpleStorage = artifacts.require("SimpleStorage");
const TangibleItems = artifacts.require("TangibleItems");

module.exports = function(deployer) {
  deployer.deploy(SimpleStorage);
  deployer.deploy(TangibleItems);
};
