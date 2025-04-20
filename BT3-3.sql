CREATE PROC sp_ThongtinNguoilonDangmuon
AS
-- Liệt kê những thông tin của tất cả độc giả người lớn đang mượn sách của thư viện (mà chưa trả)
BEGIN
    SELECT *
    FROM docgia AS dg 
    JOIN nguoilon AS nl ON nl.ma_docgia = dg.ma_docgia
    JOIN qtrinhmuon AS qtm ON qtm.ma_docgia = nl.ma_docgia
    WHERE qtm.ngay_tra IS NULL
END
