-- Liệt kê những thông tin của tất cả độc giả người lớn đang mượn sách của thư viện đang trong tình trạng mượn quá hạn
-- (theo quy định là quá 14 ngày)
CREATE PROCEDURE sp_ThongtinNguoilonQuahan
AS
BEGIN
	SELECT *
    FROM docgia AS dg
	JOIN nguoilon AS nl ON nl.ma_docgia = dg.ma_docgia
	JOIN muon AS m ON m.ma_docgia = nl.ma_docgia
	WHERE m.ngay_hethan < GETDATE()
END;
