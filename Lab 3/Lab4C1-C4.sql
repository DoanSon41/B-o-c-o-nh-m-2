/câu 1/
---------------------------------------------------------
select da.TENDEAN, CAST(sum(pc.THOIGIAN) as decimal(8, 2)) as tong_so_gio_lam_viec 
from DEAN da
inner join phancong pc 
on da.MADA = pc.MADA
group by da.TENDEAN	
-----------------------------------------------------------
select da.TENDEAN, CAST(sum(pc.THOIGIAN) as varchar) as tong_so_gio_lam_viec 
from DEAN da
inner join phancong pc 
on da.MADA = pc.MADA
group by da.TENDEAN
------------------------------------------------------------
select pb.TENPHG, 
REPLACE(CONVERT(nvarchar, CAST(avg(nv.LUONG) as decimal(10, 2))), '.', ',') 
as luong_trung_binh 
from PHONGBAN pb
inner join NHANVIEN nv 
on pb.MAPHG = nv.PHG
group by pb.TENPHG
---------------------------------------------------------
select pb.TENPHG,
left(CAST(avg(nv.LUONG) as varchar), 3) + 
REPLACE(CAST(avg(nv.LUONG) as varchar), left(CAST(avg(nv.LUONG) as varchar), 3), ',')
as luong_trung_binh
from PHONGBAN pb
inner join NHANVIEN nv 
on pb.MAPHG = nv.PHG
group by pb.TENPHG

/câu 2/
-------------------------------------------------------
select da.TENDEAN, CEILING(CAST(sum(pc.THOIGIAN) as decimal(8, 2))) as tong_so_gio_lam_viec 
from DEAN da
inner join phancong pc 
on da.MADA = pc.MADA
group by da.TENDEAN
------------------------------------------------------
select da.TENDEAN, FLOOR(CAST(sum(pc.THOIGIAN) as decimal(8, 2))) as tong_so_gio_lam_viec 
from DEAN da
inner join phancong pc 
on da.MADA = pc.MADA
group by da.TENDEAN
-------------------------------------------------------------
select da.TENDEAN, CAST(sum(pc.THOIGIAN) as decimal(8, 2)) as tong_so_gio_lam_viec 
from DEAN da
inner join phancong pc 
on da.MADA = pc.MADA
group by da.TENDEAN
----------------------------------------------------------------
DECLARE @luong_trung_binh int
SET @luong_trung_binh = (select avg(nv.LUONG)
	as luong_trung_binh
	from PHONGBAN pb
	inner join NHANVIEN nv 
	on pb.MAPHG = nv.PHG)
select HONV, TENLOT, TENNV, LUONG from NHANVIEN 
where NHANVIEN.LUONG > @luong_trung_binh

/câu 3/
-----------------------------------------------------------------
select UPPER(nv.HONV) + ' ' + nv.TENLOT + ' ' + nv.TENNV as hoten, nv.DCHI, count(nt.TENTN) from NHANVIEN nv 
inner join THANNHAN nt on nv.MANV = nt.MA_NVIEN
group by nv.HONV, nv.TENLOT, nv.TENNV, nv.DCHI
having count(nt.TENTN) > 2
---------------------------------------------------------------------------------------
select nv.HONV + ' ' + UPPER(nv.TENLOT) + ' ' + nv.TENNV as hoten, nv.DCHI, count(nt.TENTN) from NHANVIEN nv 
inner join THANNHAN nt on nv.MANV = nt.MA_NVIEN
group by nv.HONV, nv.TENLOT, nv.TENNV, nv.DCHI
having count(nt.TENTN) > 2
--------------------------------------------------------------------

select nv.HONV + ' ' + nv.TENLOT + ' ' + 
left(nv.TENNV, 1) +
UPPER(right(left(nv.TENNV, 2), 1)) +
right(nv.TENNV, LEN(nv.TENNV) - 2)
as hoten, nv.DCHI, 
nv.TENNV,
count(nt.TENTN) as sonhanthan from NHANVIEN nv 
inner join THANNHAN nt on nv.MANV = nt.MA_NVIEN
group by nv.HONV, nv.TENLOT, nv.TENNV, nv.DCHI
having count(nt.TENTN) > 2
--------------------------------------------------------------
select nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV as hoten,  
SUBSTRING(nv.DCHI, PATINDEX('% %',nv.DCHI), PATINDEX('%,%',nv.DCHI) - PATINDEX('% %',nv.DCHI))
as tenduong, 
count(nt.TENTN) as sonhanthan from NHANVIEN nv 
inner join THANNHAN nt on nv.MANV = nt.MA_NVIEN
group by nv.HONV, nv.TENLOT, nv.TENNV, nv.DCHI
having count(nt.TENTN) > 2

/câu 4/
----------------------------------------------------
go
Select *
From NHANVIEN
Where Year(NGSINH) Between 1960 and 1965
go

-----------------------------------------------------
go	
		select TENNV,Year(getdate())-Year(NGSINH) as 'Tuổi'
		from NHANVIEN
	go
----------------------------------------------------------
 SELECT TENPHG, CONVERT(VARCHAR, NG_NHANCHUC,105) AS 'NGAY SINH',HONV,TENLOT,TENNV,COUNT(*) NHANVIEN
  FROM PHONGBAN, NHANVIEN
  WHERE   MANV=TRPHG and MAPHG=PHG
  GROUP BY TENPHG,NG_NHANCHUC,HONV,TENLOT,TENNV
