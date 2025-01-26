select DATENAME(DW, 7)

;with cte as
(
	select 0 as n, DATENAME(WEEKDAY, 0) as weekday
	union all
	select n + 1, DATENAME(weekday, N+1) from cte
)
select top 7 * from cte