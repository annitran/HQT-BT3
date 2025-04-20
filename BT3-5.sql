-- Liệt kê những độc giả đang trong quá trình mượn sách
-- và những trẻ em độc giả này đang bảo lãnh cũng đang trong tình trạng mượn sách
CREATE PROCEDURE sp_DocGiaCoTreEmMuon
AS
BEGIN
	SELECT nl.ma_docgia, dg.ho, dg.tenlot, dg.ten
    FROM docgia AS dg
	JOIN nguoilon AS nl ON nl.ma_docgia = dg.ma_docgia
	JOIN qtrinhmuon AS qtm_nl ON qtm_nl.ma_docgia = nl.ma_docgia
	JOIN treem AS te ON te.ma_docgia_nguoilon = nl.ma_docgia
	JOIN qtrinhmuon AS qtm_te ON qtm_te.ma_docgia = te.ma_docgia
    WHERE
		qtm_nl.ngay_tra IS NULL
		AND qtm_te.ngay_tra IS NULL
    GROUP BY nl.ma_docgia, dg.ho, dg.tenlot, dg.ten
END;
