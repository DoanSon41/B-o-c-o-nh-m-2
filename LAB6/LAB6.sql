///BÀi1//
create trigger insert_NhanVien_1a on NHANVIEN
for insert
as
	if (select LUONG from inserted) < 15000
		begin
			print 'Luong phai lon hon 15000'
			rollback transaction
		end
select  * from NHANVIEN
insert into NHANVIEN
values ('Nguyen','Minh','tin','99','2002-03-06','Hatinh','Nam',17000,'006',1)

--câu 2----
create trigger insert_NhanVien_1b on NHANVIEN
for insert
as
	declare @age int
	set @age = year(getdate()) - (select year(NgSinh) from inserted)
	if (@age < 18 or @age > 65)
		begin
			print 'Tuoi khong hop le'
			rollback transaction
		end
insert into NHANVIEN
values ('Nguyen','Minh','tin','99','2002-03-06','Hatinh','Nam',17000,'006',1)

--câu 3 ----
create trigger update_NhanVien_1c on NHANVIEN
for update
as
	if(select DCHI from inserted) like '%HCM'
		begin
			print 'Dia chi khong hop le'
			rollback transaction
		end

select * from NHANVIEN
update NHANVIEN set TENNV = 'NamNV' where MANV = '006'

--//Bài 2//câu 1
create trigger insert_NhanVien_2a on NHANVIEN
after insert
as
begin
	select count(case when upper(phai) = 'Nam' then 1 end) Nam,
		   count(case when upper(phai) = N'Nữ' then 1 end) Nữ
	from NHANVIEN
end

insert into NHANVIEN
values ('Nguyen','Minh','tin','99','2002-03-06','Hatinh','Nam',17000,'006',1)

--//BÀi 2 //câu2 
create trigger update_NhanVien_2b on NHANVIEN
after update
as
begin
	if update(PHAI)
		begin
			select count(case when upper(PHAI) = 'Nam' then 1 end) Nam,
				   count(case when upper(PHAI) = N'Nữ' then 1 end) Nữ
			from NHANVIEN
		end
end

update NHANVIEN set PHAI = 'Nam' where MANV = '006'
select * from NHANVIEN

--B2_câu//3 
create trigger count_DeAn_2c on DEAN
after delete
as
	begin
		select MA_NVIEN, COUNT(MADA) as 'So Luong' from PHANCONG
		group by MA_NVIEN
	end

select * from DEAN
delete DEAN where MADA = '22'

--BÀI 3 câu //1
create trigger delete_THANNHANNV_3a on NHANVIEN
instead of delete
as
begin
	delete from THANNHAN where MA_NVIEN in (select MANV from deleted)
	delete from NHANVIEN where MANV in (select MANV from deleted)
end

delete NHANVIEN where MANV = '001'
select * from NHANVIEN

--Bài 3 câu //2
create trigger insert_NhanVien_3b on NHANVIEN
for insert
as 
begin
	insert into PHANCONG values ((select MANV from inserted),1,1,100)
end

insert into NHANVIEN
values ('Nguyen','Minh','tin','99','2002-03-06','Hatinh','Nam',17000,'006',1)