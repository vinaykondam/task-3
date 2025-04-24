--  Use SELECT, WHERE, ORDER BY, GROUP BY
SELECT * FROM sakila.customer;  
select * FROM sakila.customer where store_id=1; 
SELECT * FROM sakila.customer order by store_id;
SELECT store_id,count(address_id) FROM sakila.customer group by store_id ;

-- Use JOINS (INNER, LEFT, RIGHT)
select * from sakila.customer  inner join sakila.store on sakila.customer.store_id=sakila.store.store_id;
select sakila.customer.first_name,sakila.store.manager_staff_id from sakila.customer left join sakila.store on sakila.customer.store_id=sakila.store.store_id;
select sakila.customer.customer_id,sakila.customer.first_name,sakila.store.manager_staff_id from sakila.customer right join sakila.store on sakila.customer.store_id=sakila.store.store_id;

-- USE SUB-QUERIES and agreegate functions(Avg,sum)
select payment_id,payment_date,amount from sakila.payment where amount>(select avg(sakila.payment.amount) from sakila.payment);
select payment_id, sum(amount) from sakila.payment;
-- create views for analysis
use sakila;
CREATE VIEW customers AS SELECT customer_id,first_name,last_name FROM sakila.customer WHERE store_id=1; 
desc customers;
select * from address;
-- optimise queries with indexes
CREATE INDEX idx_address ON address(address_id,address);
show index from address;