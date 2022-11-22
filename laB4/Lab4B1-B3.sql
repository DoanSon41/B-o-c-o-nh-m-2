SELECT IIF(LUONG>=LTB,'KHÔNG TĂNG LƯƠNG','Tăng lương')
as thuong,tennv,luong,ltb
from

(select TENNV,LUONG,ltb from NHANVIEN,
(select avg(LUONG) as 'ltb',PHG from NHANVIEN group by PHG) AS TAM
WHERE NHANVIEN.PHG = TAM.PHG) as abc

SELECT * FROM NHANVIEN
select avg(LUONG) as 'ltb',PHG from NHANVIEN group by PHG


+++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT IIF(LUONG>=LTB,'truongphong','nhanvien')
as xeploai,tennv,luong,ltb
from

(select TENNV,LUONG,ltb from NHANVIEN,
(select avg(LUONG) as 'ltb',PHG from NHANVIEN group by PHG) AS TAM
WHERE NHANVIEN.PHG = TAM.PHG) as abc

SELECT * FROM NHANVIEN
select avg(LUONG) as 'ltb',PHG from NHANVIEN group by PHG

+++++++++++++++++++++++++++++++++++++++++++++++++++++++
select tennv = case PHAI
WHEN 'NAM' THEN 'MR.'+[TENNV]
WHEN N'Nữ' THEN 'MRS.'+[TENNV]
END
FROM NHANVIEN

++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT TENNV,LUONG,THUE=CASE
WHEN LUONG BETWEEN 0 AND 25000 THEN LUONG*0.1
WHEN LUONG BETWEEN 25000 AND 30000 THEN LUONG*0.12
WHEN LUONG BETWEEN 30000 AND 40000 THEN LUONG*0.15
WHEN LUONG BETWEEN 40000 AND 50000 THEN LUONG*0.2
ELSE LUONG*0.25 END
FROM NHANVIEN

+++++++++++++++++++++++++++++++++++++++++++++++++++
select * from NHANVIEN;

DECLARE @MAX INT, @NUM INT;
SELECT @MAX = MAX(CAST(MANV AS INT)) FROM NHANVIEN;

SET @NUM =1;

WHILE @NUM <= @MAX
BEGIN
	IF @NUM=4
	BEGIN
		SET @NUM=@NUM+1;
		CONTINUE;
	END

	IF @NUM %2 =0
	SELECT HONV,TENLOT, TENNV from NHANVIEN where cast (MANV as int) = @num;

	SET @NUM = @NUM +1;
END;
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
select * from PHONGBAN
BEGIN TRY
	insert into PHONGBAN(TENPHG,MAPHG,TRPHG, NG_NHANCHUC)
	values (N'Sản Xuất',7, '009','2020/03/02');
	print N'thêm dữ liệu thành công'
END TRY

BEGIN CATCH
	print N'failure : chèn dữ  liệu không thành công'
END CATCH