--Buat Query Insert 5 data accounts

INSERT INTO public.accounts
(nama, balance, referral_account_id) 
values
('safira', 100000, 1),
('salsa', 50000, 1),
('dila', 200000, 1),
('anzeni', 250000, 1),
('hani', 50000, 1);

--Buat Query Insert 2 data transaction_categories
INSERT INTO public.transaction_categories
(nama)
VALUES('deposit'),
('pembayaran listrik');


--Buat Query Insert 12 data transaction (kasih 1 transaksi tiap bulan)

INSERT INTO public."transaction" 
(transaction_category_id, account_id, from_account_id, to_account_id, amount, transaction_date) 
VALUES
(1, 21, 21, 22, 200000, '2023-01-15'),  -- January
(1, 22, 22, 23, 150000, '2023-02-15'),  -- February
(2, 23, 23, 24, 300000, '2023-03-15'),  -- March
(2, 24, 24, 25, 100000, '2023-04-15'),  -- April
(1, 25, 25, 21, 250000, '2023-05-15'),  -- May
(2, 21, 21, 22, 50000,  '2023-06-15'),   -- June
(1, 22, 22, 23, 400000, '2023-07-15'),  -- July
(2, 23, 23, 24, 200000, '2023-08-15'),  -- August
(1, 24, 24, 25, 150000, '2023-09-15'),  -- September
(2, 25, 25, 21, 120000, '2023-10-15'),  -- October
(1, 21, 21, 22, 300000, '2023-11-15'),  -- November
(2, 22, 22, 23, 250000, '2023-12-15');  -- December

--Update nama di accounts (given account_id)
UPDATE public.accounts
SET nama='fira', balance=200000, referral_account_id=1
WHERE account_id=21;

--Update balance di accounts (given account_id)

UPDATE public.accounts
SET nama='fira', balance=300000, referral_account_id=1
WHERE account_id=21;


--List semua data accounts
select * from public.accounts


--List semua data transactions join dengan accounts (account_id = account_id) 
--dan tampilkan nama dari accounts


SELECT 
    t.transaction_id,
    t.transaction_category_id,
    a.nama AS nama_akun,
    t.from_account_id,
    t.to_account_id,
    t.amount,
    t.transaction_date
FROM 
    public.transaction t
JOIN 
    public.accounts a ON t.account_id = a.account_id;
   
--Query 1 data accounts dengan balance terbanyak
   
SELECT *
FROM public.accounts
ORDER BY balance DESC
LIMIT 1;


--Query semua transaction yg terjadi di bulan Mei (Bulan 5)
SELECT 
    transaction_id,
    transaction_category_id,
    account_id,
    from_account_id,
    to_account_id,
    amount,
    transaction_date
FROM 
    public.transaction
WHERE 
    EXTRACT(MONTH FROM transaction_date) = 5;

