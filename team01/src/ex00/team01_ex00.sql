WITH last_currency AS (
	SELECT 
		id, name AS currency_name, rate_to_usd, updated
	FROM currency c
	JOIN (
		SELECT 
			name AS currency_name, MAX(updated) AS last_updated
		FROM currency 
		GROUP BY name 
	) AS last 
	ON c.name = last.currency_name AND c.updated = last.last_updated
)

SELECT 
	CASE WHEN u.name     IS NULL THEN 'not defined' ELSE u.name     END AS name,
	CASE WHEN u.lastname IS NULL THEN 'not defined' ELSE u.lastname END AS lastname,
	b.type 	     AS type,
	SUM(b.money) AS volume,
	CASE WHEN c.currency_name IS NULL THEN 'not defined' ELSE c.currency_name END AS currency_name,
	CASE WHEN c.rate_to_usd   IS NULL THEN 1             ELSE c.rate_to_usd   END AS last_rate_to_usd,
	CASE WHEN c.rate_to_usd   IS NULL THEN SUM(b.money)  ELSE SUM(b.money) * c.rate_to_usd END AS total_volume_in_usd
FROM public.user AS u
RIGHT JOIN balance       AS b ON b.user_id = u.id
LEFT  JOIN last_currency AS c ON c.id = b.currency_id
GROUP BY u.name, u.lastname, b.type, c.currency_name, c.rate_to_usd
ORDER BY name DESC, lastname ASC, type ASC;