pragma solidity ^0.4.0;
 
contract Library
{
    uint time;
    uint validity;
    uint fine;
    uint f;
    uint blc;
    
      struct books{
                 string bookname;
                 string authorname;
                 uint available;
                 uint ISBN;
                }
              mapping(address=>books)book;
     struct users{
             string username;
             uint id;
                 }
             mapping(address=>users)people;
             
             function addbook(address _ass,string  bookname,string authorname)public
             {
                 book[_ass].bookname=bookname;
                 book[_ass].authorname=authorname;
             }
             
             
             function susers(address _abb,string username,uint id)public
             {
                 people[_abb].username=username;
                 people[_abb].id=id;
             }
             
             function getbook(address _add,string bookname,string authorname)public view returns(string)
            {
                book[_add].bookname=bookname;
                book[_add].authorname=authorname;

             }
          
           function Booksearch(address ISBN)public returns(string)
           {
              if(book[ISBN].available>0)
                {
                    return("book is available");
                }
                else
                {
                    return("book is not available");
                   }
           }
           function bookreturn(address ISBN)public{
                book[ISBN].available++;
                uint fine=1;
                uint returntime=now;
          
            if(returntime > validity) {
            uint blc = returntime - validity;
            blc=blc/60;
            fine= blc * fine;
            f =fine;
        }
      }
      function penalty() public {
                time=now;
                validity = time + 2 * 1 minutes;
        }  
 
            function getfine() public view returns(uint) {
            return(f);
        }
  }
  