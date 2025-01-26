declare @string varchar(20) = 'A34s4a04db6e0k'
declare @result varchar(20) =''
;with cte as
(
select 1 as n, LEFT(@string, 1) as L
union all
select n + 1, SUBSTRING(@string, n+1, 1) from cte
where n < len(@string)
)
select @result = @result + L from cte
where L not like '[a-z]'
select @result

go
create proc usp_string @string varchar(20)
as
begin
		declare @result varchar(20) = ''
		;with cte as
		(
		select 1 as n, LEFT(@string, 1) as L
		union all
		select n+1, SUBSTRING(@string, n+1, 1) from cte
		where n < len(@string))
		select @result = @result + L from cte
		where L not like '[0-9]'
		select @result as Result
end
exec usp_string 'A7s0ad0b5ek007'
