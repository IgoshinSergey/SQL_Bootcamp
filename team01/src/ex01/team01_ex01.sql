WITH balance_with_filtered_date AS (
SELECT
    user_id,
    money,
    currency_id,
    CASE
        WHEN (SELECT MAX(currency.updated) FROM currency WHERE b.currency_id = id AND updated <= b.updated) IS NOT NULL
            THEN (SELECT MAX(currency.updated) FROM currency WHERE b.currency_id = id AND updated <= b.updated)
        ELSE (SELECT MIN(currency.updated) FROM currency WHERE b.currency_id = id AND updated > b.updated)
    END AS updated
FROM
    balance b
)

SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    c.name AS currency_name,
    balance_with_filtered_date.money * c.rate_to_usd AS currency_in_usd
FROM
    balance_with_filtered_date  
	JOIN currency c ON (balance_with_filtered_date.updated = c.updated AND balance_with_filtered_date.currency_id = c.id)
    LEFT JOIN public."user" u ON balance_with_filtered_date.user_id = u.id
ORDER BY
    name DESC,
    lastname ASC,
    currency_name ASC; 
