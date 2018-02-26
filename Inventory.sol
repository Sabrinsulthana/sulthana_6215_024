 pragma solidity ^0.4.0;

import "./Newtoken.sol";

 contract inventory is ERC20
 {
     address owner;
     uint256 count=0;
     uint256 token;
     
     function inventory(){
         owner=msg.sender;
     }
     
     
     struct admin{
             uint pid;
             uint updateproducts;
             string msgalert;
                }
     
      struct products
      {
          string productname;
          uint productid;
          uint available;
          uint amount;
      }
      
       modifier onlyowner()
   {
    require(msg.sender==owner);
    _;
   }
      
      struct customer{
          uint baln;
          uint totalproducts;
          uint totalprice; 
      }
     mapping(uint=>admin) proupdate;
     mapping(uint=>products) product;
     mapping(uint=>customer) customers;
     
     function adm(uint _pid,uint updateproducts,string msgalert)public returns(bytes){
         proupdate[_pid].updateproducts=updateproducts;
         proupdate[_pid].msgalert=msgalert;
         {
          if(count<5)
           {
           return "msgalert";
           }
           else
           {
               return "updateproducts";
           }
         }
     }
   function setproducts(uint id,string productname,uint productid,uint count,uint amount)public
     {
         product[id].productname=productname;
         product[id].productid=productid;
         product[id].available=count;
         product[id].amount=amount;
     }
     function avai(uint _id,uint productids) public view returns(bool)
     {
        
         if( product[_id].available>0  && productids==product[_id].productid)
         {
         return true;
         }
         else{
             return false;
         }
         }
         
     
      function buy(uint id,uint totalproducts,uint totalprice)public returns(bytes) 
      {
          customers[id].totalproducts++;
          customers[id].totalprice=totalprice;
         
          product[id].available=product[id].available-1;
         transfer (owner,totalprice);
            return "buy";
      }
      function aaa()public payable
      {
          uint256 rate=0.1 ether;
          uint256 tokens;
            tokens=msg.value/rate;
             require(tokens<=balances[owner]);
             owner.transfer(msg.value);
             balances[msg.sender]=balances[msg.sender]+tokens;
             balances[owner]-=tokens;
             //balances[owner]=balances[owner]-token;
             //transfer(owner,tokens);*/
       }
    }