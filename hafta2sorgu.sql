--1. Invoice tablosunda, tüm değerleri NULL olan kayıtların sayısını bulunması

SELECT COUNT(*) 
FROM Invoice 
WHERE invoice_id IS NULL 
  AND customer_id IS NULL 
  AND invoice_date IS NULL 
  AND billing_address IS NULL 
  AND billing_city IS NULL 
  AND billing_state IS NULL 
  AND billing_country IS NULL 
  AND billingpostal_code IS NULL 
  AND total IS NULL;

--2. Değerlerin iki katını görmek ve eski versiyonlarıyla birlikte karşılaştırılması (büyükten küçüğe sıralama)

SELECT invoice_id, customer_id, total AS eski_total, 
       total * 2 AS yeni_total
FROM Invoice
ORDER BY yeni_total DESC;

-- 3. Adres kolonundaki verileri düzenleme

SELECT 
    invoice_id,
    LEFT(billing_address, 3) || '...' || RIGHT(billing_address, 4) AS "Açık Adres",
    invoice_date
FROM Invoice
WHERE TO_CHAR(invoice_date, 'mm-yyyy') = '08-2013';




