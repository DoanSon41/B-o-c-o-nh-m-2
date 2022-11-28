In ra dòng ‘Xin chào’ + @ten với @ten là tham số đầu vào là tên Tiếng Việt có dấu của
bạn.

create procedure sp_bai1_a @name nvarchar(20)
as 
begin
	print'xin chào : ' +@name
	end;
exec sp_bai1_a N'toi'

➢ Nhập vào 2 số @s1,@s2. In ra câu ‘Tổng là : @tg’ với @tg=@s1+@s2

create procedure sp_bai1_b @a int ,@b int
as
begin
	declare @tong int = 0
	set @tong = @a + @b
	print @tong
	end
exec sp_bai1_b 4,5


➢ Nhập vào số nguyên @n. In ra tổng các số chẵn từ 1 đến @n.

create procedure sp_bai1_c @n int 
as
begin
	declare @tong int = 0 , @i int = 0
	while @i<@n
		begin
			set @tong = @tong + @i
			set @i = @i+ 2
		end
	print @tong
	end

exec sp_bai1_c 10

➢ Nhập vào 2 số. In ra ước chung lớn nhất của chúng

create procedure sp_bai1_d @a int ,@b int 
as
begin
	
	while (@a != @b)
		begin
			if (@a > @b)
				set	@a  = @a - @b
			else 
				set @b = @b - @a
		end
		return @a	
end


declare @c int
exec @c = sp_bai1_d 30,40
print @c