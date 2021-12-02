SET SEARCH_PATH TO JobMarket;  
DROP TABLE IF exists q1 CASCADE;  
  
CREATE TABLE q1(  
     
);  
  
-- Do this for each of the views that define your intermediate steps.    
-- (But give them better names!) The IF EXISTS avoids generating an error   
-- the first time this file is imported.  
DROP VIEW IF EXISTS intermediate_step CASCADE;  

  
-- Define views for your intermediate steps here:  

  
-- Your query that answers the question goes below the "insert into" line:  
insert into q1  
