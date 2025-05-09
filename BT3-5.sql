-- Liệt kê những độc giả đang trong quá trình mượn sách
-- và những trẻ em độc giả này đang bảo lãnh cũng đang trong tình trạng mượn sách
CREATE PROCEDURE sp_DocGiaCoTreEmMuon
AS
BEGIN
	SELECT nl.ma_docgia
    FROM nguoilon AS nl
	JOIN muon AS m ON m.ma_docgia = nl.ma_docgia
	JOIN treem AS te ON te.ma_docgia_nguoilon = nl.ma_docgia
	LEFT JOIN muon AS m1 ON m1.ma_docgia = te.ma_docgia
	WHERE m.ma_docgia IS NOT NULL
    GROUP BY nl.ma_docgia
	HAVING SUM(CASE WHEN m1.ma_docgia IS NULL then 1 else 0 end) = 0
END;
