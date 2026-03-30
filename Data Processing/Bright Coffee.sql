--- Big Query

SELECT 
      transaction_id,
      transaction_date,
      transaction_time,
      transaction_qty,
      store_id,
      store_location,
      product_id,
      unit_price,
      product_category,
      product_type,
      product_detail,

--- Day Name Column 1
   Dayname(transaction_date) AS Day_name,

--- Month Name_Column 2
   Monthname(transaction_date) AS Month_name,

--- Time_Column 3
   date_format(transaction_time, 'HH:MM:SS'),
   Dayofmonth(transaction_date) AS Day_of_Month,

--- Classificatiob of Days_Column 4
CASE 
  WHEN Dayname(transaction_date) IN('Sun') THEN 'Weekend'
  ELSE 'Weekday'
  END AS Day_Classification,

--- Time classification_Column 5
CASE
  WHEN date_format(transaction_time, 'HH:MM:SS') BETWEEN '05:00:00' AND '08:59:59' THEN '01.Rush Hour'
  WHEN date_format(transaction_time, 'HH:MM:SS') BETWEEN '09:00:00' AND '11:59:59' THEN '02.Mid Hour'
  WHEN date_format(transaction_time, 'HH:MM:SS') BETWEEN '12:00:00' AND '15:59:59' THEN '03.Afternoon'
   WHEN date_format(transaction_time, 'HH:MM:SS') BETWEEN '16:00:00' AND '18:00:00' THEN '01.Rush Hour'
   ELSE '04.Night'
   END AS Time_Classification,

--- New Column Spend Bucket_Column 6
CASE
   WHEN (transaction_qty*unit_price) <=50 THEN '01.Low Spender'
   WHEN (transaction_qty*unit_price) BETWEEN 51 AND 200 THEN '02.Medium Spender'
   WHEN (transaction_qty*unit_price) BETWEEN 201 AND 300 THEN '03.Moreki'
   ELSE '04.Blesser'
   END AS Spend_Bucket,

--- Revenue columns 7
transaction_qty*unit_price AS Revenue
FROM `workspace`.`default`.`brightcoffee_consultation`;
