CREATE PROCEDURE sp_ThongtinDauSach
    @Ma_Dausach INT
AS
BEGIN
    -- Liệt kê những thông tin của đầu sách, thông tin tựa sách
    -- và số lượng cuốn sách tương ứng hiện chưa được mượn của một đầu sách cụ thể ISBN
    SELECT ds.isbn, ts.tuasach, COUNT(CASE WHEN cs.tinhtrang = 'Y' THEN 1 END) AS SL_CuonSach_ChuaDuocMuon
	FROM dausach AS ds
	LEFT JOIN tuasach AS ts ON ts.ma_tuasach = ds.ma_tuasach
	LEFT JOIN cuonsach AS cs ON cs.isbn = ds.isbn
	WHERE ds.isbn = @Ma_Dausach
	GROUP BY ds.isbn, ts.tuasach
END
