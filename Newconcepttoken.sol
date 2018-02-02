pragma solidity ^0.4.0;
import "./ERC20.sol";

contract newconcept //is ERC20
{
    string standard="Token 1.0";
    string name;
    string symbols;
   uint256 public totalsupply;
   uint256  initialallowed;

    mapping(address=>uint) public balanceOf;
    mapping(address=>mapping(address=>uint256))public allowed;

function newconcept()public{
    totalsupply=10000;
    balanceOf[msg.sender]=totalsupply;
    symbols="NT";
    initialallowed=5000;
   }
   function totalSupply()public view returns(uint256)
   {
       return totalsupply;
   }
   function transfer(address to, uint256 value)public returns(bool) {
    require(value <= balanceOf[msg.sender]);
    require(value <= allowed[msg.sender][to]);

    balanceOf[msg.sender]=balanceOf[msg.sender]-(value);
    balanceOf[to] =balanceOf[to]+(value);
    //allowed[msg.sender][to] = allowed[msg.sender][to]-(value);
    return true;
  }
  
  
function allowance(address owner, address to) public returns (uint256)
{
    allowed[owner][to]=initialallowed;
    return allowed[owner][to];
}
    function balanceOf(address _owner)public view returns(uint256)
{
    return balanceOf[_owner];
}
function approve(address spender, uint256 value) public returns (bool)
{
    allowed[msg.sender][spender]=value;
    return true;
    }
function transferFrom (address from, address to, uint256 value)public returns (bool)
{
    allowed[msg.sender][from]=initialallowed;
    return true;
}
}
