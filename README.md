Dokumentasi Database

1. Deskripsi
Database ini digunakan untuk sistem manajemen platform streaming yang mencakup pengguna, paket langganan, transaksi pembayaran, daftar tontonan, serta informasi tentang film, seri, genre, dan episode. Database menggunakan PostgreSQL dengan struktur yang telah dioptimalkan untuk efisiensi dan skalabilitas.

2. Struktur Database
Database ini terdiri dari beberapa entitas utama:
user: Menyimpan data pengguna seperti nama, email, dan nomor telepon.
package: Berisi informasi tentang paket langganan yang tersedia.
order: Mencatat transaksi pembelian paket langganan oleh pengguna.
payment: Menyimpan informasi pembayaran yang dilakukan pengguna.
watchlist: Merekam daftar film atau seri yang telah ditambahkan pengguna ke daftar tontonan mereka.
movie: Menyimpan data film yang tersedia di platform.
series: Menyimpan data tentang serial TV yang tersedia di platform.
episode: Berisi data episode dari masing-masing serial TV.
genre : Berisi informasi genre dari movie atau series.

3. Relasi Antar Tabel
Setiap pengguna (user) dapat memiliki banyak transaksi pembelian paket (order).
Setiap transaksi (order) terkait dengan satu paket langganan (package).
Setiap transaksi (order) memiliki satu pembayaran (payment).
Setiap pengguna (user) dapat memiliki banyak item dalam daftar tontonan (watchlist).
Setiap daftar tontonan (watchlist) dapat berisi film (movie) atau episode dari serial (episode).
Setiap film (movie) memiliki satu genre (genre).
Setiap serial (series) memiliki satu genre (genre).
Setiap serial (series) memiliki banyak episode (episode).

4. Soft Delete dan Auto Timestamp

Database ini menggunakan soft delete dengan perintah update pada kolom deleted_date. Jika data dihapus, timestamp akan otomatis tersimpan tanpa benar-benar menghapus data dari database.
Selain itu, kolom updated_date memiliki trigger untuk selalu diperbarui setiap kali ada perubahan pada data.

5. Instalasi & Setup

Pastikan PostgreSQL sudah terinstal di sistem Anda.
Jalankan perintah berikut untuk membuat database:
CREATE DATABASE streaming_service;

Gunakan perintah berikut untuk membuat tabel sesuai dengan skema database:
psql -U postgres -d streaming_service -f main_script.sql

jalankan perintah berikut untuk membuat fungsi soft_delete beserta trigger nya:
psql -U postgres -d streaming_service -f soft_delete.sql

jalankan perintah berikut untuk membuat trigger untuk kolom update:
psql -U postgres -d streaming_service -f updated_trigger.sql

6. Environment Variables
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=zainul09
DB_NAME=streaming_service

DATABASE_URL=postgres://postgres:zainul09@localhost:5432/streaming_service

7. Contoh Query untuk Testing
-- Insert user
INSERT INTO "user" (name, email, password, phone) 
VALUES ('John Doe', 'john@example.com', 'hashedpassword', '08123456789');

-- Update user
UPDATE "user" SET name = 'Jane Doe' WHERE email = 'john@example.com';

-- Soft delete user
UPDATE "user" SET deleted_date = CURRENT_TIMESTAMP WHERE email = 'john@example.com';

-- Cek hasil soft delete
SELECT * FROM "user" WHERE deleted_date IS NOT NULL;

