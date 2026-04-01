SELECT 
    ap.product_id,
    COALESCE(p.new_price, 10) AS price
FROM (
    SELECT DISTINCT product_id
    FROM Products
) ap
LEFT JOIN (
    SELECT product_id, new_price
    FROM Products p1
    WHERE change_date = (
        SELECT MAX(change_date)
        FROM Products p2
        WHERE p2.product_id = p1.product_id
          AND p2.change_date <= '2019-08-16'
    )
) p
ON ap.product_id = p.product_id;