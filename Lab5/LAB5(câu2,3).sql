create proc bai2_1 @MaNV varchar(3)
as
begin
  select * from NHANVIEN where MANV =@MaNV
END
exec bai2_1'001'

select COUNT(MANV) as 'SoLuong',MADA, TENPHG from NHANVIEN
inner join PHONGBAN on NHANVIEN.PHG = PHONGBAN.MAPHG
inner join DEAN on DEAN.PHONG = PHONGBAN.MAPHG
where MADA = 2 and DDIEM_DA = 'Nha Trang'
group by TENPHG,MADA

---------2

alter proc bai2_2 @manv int
as
begin
     select COUNT (MANV) as 'so luong' ,MADA, TENPHG from NHANVIEN
     inner join PHONGBAN on NHANVIEN. PHG = PHONGBAN.MAPHG
     inner join DEAN on DEAN. PHONG = PHONGBAN.MAPHG
    where MADA = @manv
     group by TENPHG, MADA
end
exec bai2_2 10
-----
create proc.bai2_4 @MaTP varchar (5)
as
begin
    select HONV, TENNV, TENPHG, NHANVIEN.MANV, THANNHAN. *
	from NHANVIEN
    inner join PHONGBAN on PHONGBAN.MAPHG= NHANVIEN . PHG
    left outer join THANNHAN on THANNHAN.MA_NVIEN = NHANVIEN.MANV
	where THANNHAN .MA_NVIEN is null and TRPHG = @MaTP
end

exec bai2_4 '008'
--------

if exists(select * from NHANVIEN where MANV = '001' and PHG ='5')
	print 'Nhan Vien co trong phong ban'
else
	print 'Nhan Vien ko co trong phong ban'

create proc bai2_5 @MaNV varchar(5), @MaPB varchar (5)
as
begin
	if exists(select * from NHANVIEN where MANV = @MaNV and PHG =@MaPB)
	print 'Nhan Vien: '+ @MaNV+' co trong phong ban: '+ @MaPB
else
	print 'Nhan Vien: '+ @MaNV+' KO co trong phong ban: '+@MaPB

end











///bài 3//

create proc THEMPHONGBANMOI	
  @TenPHG nvarchar(20), @MaPHG int , @TrPHG nvarchar(10), @ng_Nhanchuc date 
  as 
  begin 
    if exists(select * from PHONGBAN 
	where MAPHG = @MAPHG)
	begin
	 print('Mã Phòng Ban đã  tồn tại');
	 return;
	end 

	insert into [dbo] . [PHONGBAN]
	([TENPHG],[MAPHG],[TRPHG],[NG_NHANCHUC])
	values
	 (@TENPHG , @MAPHG, @TRPHG,@NG_NHANCHUC);
end

exec THEMPHONGBANMOI 'IT',11,'005','2022-11-29';*/
----------------------
create proc sp_CAPNHATPHONGBAN 
  @OldTENPHG nvarchar (15),
  @TENPHG nvarchar(15),
  @MAPHG int,
  @TRPHG nvarchar (10),
  @NG_NHANCHUC date 
as
begin
  update [dbo].[PHONGBAN]
   set 
    [TENPHG] = @TENPHG ,[MAPHG]= @MAPHG,[TRPHG]=@TRPHG ,[NG_NHANCHUC]=@NG_NHANCHUC
	WHERE TENPHG = @OldTENPHG;
end;
exec [dbo].[sp_CAPNHATPHONGBAN] 'CNTT' , 'IT',10,'005','1-1-2020';*/



create proc sp_insertNV @Ho nvarchar(15), @tenLot nvarchar(15),@tenNV nvarchar(15),@MANV nvarchar(15),@ngaysinh datetime,@diachi nvarchar(30),@phai nvarchar(3),@Luong float, @MA_NQL nvarchar(9), @PHG int 
as 
begin
if not exists(select * from PHONGBAN where TENPHG LIKE 'IT')
begin 
print 'Nhan vien phai la phong it'
return
end 
if @Luong  <25000
set @MA_NQL = '009'
else 
begin
set @MA_NQL='005'
end
DECLARE int= datediff(YEAR,@NGAYSINH,getdate())
if (@PHAI LIKE 'nam' and @age >65 and @age <18)
begin
print 'nam pai tu 18-65'
return 
end 
else if(@PHAI LIKE N'nu' and @Age >65 and @Age <18)
begin
print 'Nu phai tu 18-65'
return
end
insert into NHANVIEN(HONV,TENLOT,TENNV,MANV,NGSINH,DCHi,PHAI,LUONG,MA_NQL,PHG)
values (@HO,@tenlot ,@tennv ,@MANV ,@Ngaysinh,@diachi ,@phai,@luong,@MA_NQL,@PHG)

end























