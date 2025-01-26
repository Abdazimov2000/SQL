go
alter proc usp_perfect_number @number int
as
begin
	declare @sum int = 0
	declare @num int = 1
	while @num < @number
	begin
		if @number % @num = 0           --
		begin
			set @sum = @sum + @num
		end
		set @num = @num + 1
	end
	
	if @sum = @number
	begin
		print 'This is perfect number'
	end
	else
	begin
		print 'This is not perfect number'
	end
end

exec usp_perfect_number 496
