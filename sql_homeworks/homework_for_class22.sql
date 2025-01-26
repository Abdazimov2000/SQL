--1

select sell_date, STRING_AGG(product, ',') as Items from Activities
group by sell_date

--2

;with cte as
(
select customer_number, sum(order_number) as result from Orders1
group by customer_number)
select customer_number from cte
group by customer_number
having max(result) = (select max(result) from cte)

--3

select event_day, emp_id, sum(out_time - in_time) as result from Employees1
group by event_day, emp_id

--4

select customer_ID from Customer
group by customer_id
having count(distinct product_key) = (select count(product_key) from Product)

--5

select user_id, concat(upper(SUBSTRING(name, 1, 1)), lower(substring(name, 2, len(name)))) from Users