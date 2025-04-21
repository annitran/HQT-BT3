-- Liệt kê những độc giả đang trong quá trình mượn sách
-- và những trẻ em độc giả này đang bảo lãnh cũng đang trong tình trạng mượn sách
CREATE PROCEDURE sp_DocGiaCoTreEmMuon
AS
BEGIN
	-- Lọc ra ds người lớn đang mượn sách
	SELECT nl.ma_docgia, dg.ho, dg.tenlot, dg.ten
    FROM docgia AS dg
	JOIN nguoilon AS nl ON nl.ma_docgia = dg.ma_docgia
	JOIN muon AS m1 ON m1.ma_docgia = nl.ma_docgia
	-- và có ít nhất 1 trẻ em được bảo lãnh
	WHERE EXISTS (
		SELECT 1 FROM treem te1
		WHERE te1.ma_docgia_nguoilon = nl.ma_docgia
	)
	-- và không tồn tại trẻ em nào thuộc bảo lãnh mà không mượn sách
	AND NOT EXISTS (
		SELECT 1 FROM treem AS te2
		WHERE te2.ma_docgia_nguoilon = nl.ma_docgia
		AND NOT EXISTS (
			SELECT 1 FROM muon m2
			WHERE m2.ma_docgia = te2.ma_docgia
		)
	)
    GROUP BY nl.ma_docgia, dg.ho, dg.tenlot, dg.ten
END;
