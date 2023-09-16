
DELIMITER $$
CREATE PROCEDURE ExtractKursPajak()
BEGIN
    -- Membuat tabel kurs_pajak jika belum ada
    CREATE TABLE IF NOT EXISTS kurs_pajak (
        id_ksm_kurs_pajak INT,
        kurs_rate DECIMAL(10, 4),
        tgl DATE,
        curr_id INT
    );

    -- Error handler ketika tabel sudah ada akan di kosongkan
    TRUNCATE TABLE kurs_pajak;

    -- Memasukan data dari tabel ksm_kurs_pajak ke dalam tabel kurs_pajak
    INSERT INTO kurs_pajak (id_ksm_kurs_pajak, kurs_rate, tgl, curr_id)
    SELECT id, kurs_rate, tgl, curr_id
    FROM ksm_kurs_pajak;

    -- Mengembalikan pesan 'Ekstraksi Kurs Pajak Selesai' (opsional)
    SELECT 'Ekstraksi Kurs Pajak Selesai' AS message;

END $$
DELIMITER ;