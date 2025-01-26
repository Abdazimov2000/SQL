
--1
select * from Orders
where salesman_id =
(select salesman_id from Salesman
where name = 'Paul Adam')

--2
select * from Orders
where salesman_id =
(select salesman_id from Salesman
where city = 'London')

--3
select * from Orders
where salesman_id = 
(select distinct salesman_id from Orders
where customer_id = 3007)

--4
select * from Orders
where purch_amt > 
(select avg(purch_amt) from Orders
where ord_date = '2012-10-10')

--5
select * from Orders
where salesman_id = 
( select salesman_id from Salesman
where city = 'New York')

--6
select commission from Salesman
where salesman_id = 
(select salesman_id from Customer
where city = 'Paris')

--7
select * from Customer
where customer_id = 
(select salesman_id - 2001 from Salesman
where name = 'Mc Lyon')

--8
select grade, count(customer_id) from Customer
where grade >
(select avg(grade) from Customer
where city = 'New York')
group by grade

--9
select ord_no, purch_amt, ord_date, salesman_id from Orders
where salesman_id = 
(select salesman_id from Salesman
group by salesman_id
Order by max(commission) desc
offset 0 row fetch next 1 row only)

--10
select o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id, c.cust_name  from Orders o, Customer c
where o.customer_id = c.customer_id and o.ord_date = '2012-08-17'

--11
select salesman_id, name from Salesman
where salesman_id in (select salesman_id,count(customer_id) from Customer
		group by salesman_id
		having count(customer_id) > 1)

--12
select * from Orders
where purch_amt > (select avg(purch_amt) from Orders)


--13
select * from Orders
where purch_amt >= (select avg(purch_amt) from Orders)


--14
select ord_date, sum(purch_amt) from Orders
group by ord_date
having ord_date in 
(select ord_date from Orders
group by ord_date
having sum(purch_amt) > 1000)


--15


--16
select salesman_id, name, city, commission from Salesman
where salesman_id in (
select salesman_id from Customer
group by salesman_id
having count(customer_id) > 1)


--17
select salesman_id, name, city, commission from Salesman
where salesman_id in (
select salesman_id from Customer
group by salesman_id
having count(customer_id) = 1)


--18
select * from Salesman
select * from Orders
select * from Customer

select * from Salesman
where salesman_id in (
select  salesman_id from Orders
group by  salesman_id
having COUNT(ord_no) > 1
)

SELECT * 
FROM salesman a 
WHERE EXISTS     
  (SELECT * FROM customer b    
   WHERE a.salesman_id = b.salesman_id     
	 AND 1 <             
	    (SELECT COUNT (*)              
		  FROM orders             
		  WHERE orders.customer_id = b.customer_id)
   );

--19
select * from Salesman s
where s.salesman_id in(
select salesman_id from Customer
where Customer.city = s.city)

--20
select * from Salesman
where city in (
select city from Customer)

--24
select * from Orders
where purch_amt < (
select sum(purch_amt) from Orders
where customer_id in ( 
select customer_id from Customer
where city = 'London'))

--25

select * from orders
where customer_id < (
select max(customer_id) from Customer
where city = 'London')


--27
select salesman_id, sum(purch_amt) as Result from Orders
group by salesman_id
having salesman_id in (
select salesman_id from Salesman
where city in (
select city from Customer
where Salesman.city = Customer.city))

--28

select * from Customer
where grade not in (
select grade from Customer
where city = 'London')

--29

select * from Customer
where grade not in (
select grade from Customer
where city = 'Paris')
select * from Customer

--31

select * from company_mast
select * from item_mast
select c.COM_NAME, avg(i.PRO_PRICE) result from company_mast c
left join item_mast i
on c.COM_ID = i.PRO_COM
group by c.COM_NAME

select c.COM_NAME, avg(i.PRO_PRICE) from company_mast c, item_mast i
where c.COM_ID = i.PRO_COM
group by c.COM_NAME

--32

select c.COM_NAME, avg(i.PRO_PRICE) from company_mast c, item_mast i
where c.COM_ID = i.PRO_COM and i.PRO_PRICE >= 350
group by c.COM_NAME

--33

select * from item_mast
select * from company_mast
select i.PRO_NAME, i.PRO_PRICE,c.COM_ID, c.COM_NAME from item_mast i, company_mast c
where i.PRO_COM = c.COM_ID and i.PRO_PRICE = (
select max(PRO_PRICE) from item_mast i
where i.PRO_COM = c.COM_ID)

--34

select * from emp_details
where EMP_IDNO in (
select EMP_IDNO from emp_details
where EMP_LNAME in ('Dosio','Gabriel'))

--35

select * from emp_details
where EMP_DEPT in (89,63)

--36

select EMP_FNAME, EMP_LNAME from emp_details
where EMP_DEPT in (
select DPT_CODE from emp_department
where DPT_ALLOTMENT > 50000)

--37
select * from emp_department
where DPT_ALLOTMENT > (
select avg(DPT_ALLOTMENT) from emp_department)

--38
select DPT_NAME from emp_department
where DPT_CODE in (
select EMP_DEPT from emp_details
group by EMP_DEPT
having count(EMP_IDNO) > 2)

--39

select EMP_FNAME, EMP_LNAME from emp_details
where EMP_DEPT in (
select DPT_CODE from emp_department
 where DPT_ALLOTMENT = (
 select min(DPT_ALLOTMENT) from emp_department 
 group by DPT_CODE
 order by min(DPT_ALLOTMENT) offset 1 row fetch next 1 row only
))


SELECT emp_fname, emp_lname FROM emp_details 
WHERE emp_dept IN (
SELECT dpt_code FROM emp_department 
  WHERE dpt_allotment = (
  SELECT MIN(dpt_allotment) FROM emp_department 
  WHERE dpt_allotment > (
  SELECT MIN(dpt_allotment)  FROM emp_department 
    )
  )
);
