CREATE PROCEDURE sp_ThongtinDocGia
    @Ma_Docgia SMALLINT
AS
BEGIN
	-- Kiểm tra Mã độc giả này có tồn tại không
	IF EXISTS (SELECT * FROM docgia dg WHERE dg.ma_docgia = @Ma_Docgia)
	-- Nếu Mã độc giả tồn tại:
	-- Kiểm tra độc giả này thuộc loại người lớn hay trẻ em
	BEGIN
		IF EXISTS (SELECT * FROM nguoilon AS nl WHERE nl.ma_docgia = @Ma_Docgia)
		-- Nếu là người lớn thì:
		-- In các thông tin liên quan đến độc giả này, gồm: thông tin độc giả + thông tin người lớn
		BEGIN
			SELECT *
			FROM docgia AS dg JOIN nguoilon AS nl ON dg.ma_docgia = nl.ma_docgia
			WHERE nl.ma_docgia = @Ma_Docgia
		END
		ELSE
		-- Nếu là trẻ em thì:
		-- In các thông tin liên quan đến độc giả này, gồm: thông tin độc giả + thông tin trẻ em
		BEGIN
			SELECT *
			FROM docgia AS dg JOIN treem AS te ON dg.ma_docgia = te.ma_docgia
			WHERE te.ma_docgia = @Ma_Docgia
		END
	END
	-- Nếu Mã độc giả không tồn tại
	-- Thông báo
	BEGIN
		PRINT N'Độc giả này không tồn tại trong danh sách!'
	END
END;
