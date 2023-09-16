
DELIMITER $$

-- Membuat function FindMinDate dengan parameter concatenated_dates
CREATE FUNCTION FindMinDate(concatenated_dates TEXT) RETURNS DATE
BEGIN

    -- Mendeklarasikan variabel
    DECLARE min_date DATE;
    DECLARE date_list TEXT;
    DECLARE current_date TEXT;

    -- Menginisialisai variabel
    SET min_date = NULL;
    SET date_list = concatenated_dates;

    -- Perulangan dengan parameter date_list selama panjang date_list lebih besar dari 0
    WHILE LENGTH(date_list) > 0 DO
        -- Mengambil 1 potongan tanggal pertama dari date list yang terletak sebelum ","
        SET current_date = TRIM(SUBSTRING_INDEX(date_list, ',', 1));
        -- Memotong/hapus sebagian date_list dimulai dari panjang current_date dan 2 karekter setelahnya yaitu "," dan spasi
        SET date_list = TRIM(BOTH ',' FROM SUBSTRING(date_list, LENGTH(current_date) + 2));

        -- Jika min_date sama adalah null atau nilai current_date lebih kecil dari min_date maka nilai inisialisaikan nilai min_date dama dengan current_date
        IF min_date IS NULL OR STR_TO_DATE(current_date, '%Y-%m-%d') < min_date THEN
            SET min_date = STR_TO_DATE(current_date, '%Y-%m-%d');
        END IF;
    -- akhiri perulangan
    END WHILE;

    -- kembalikan nilai min_date
    RETURN min_date;
END$$
DELIMITER ;