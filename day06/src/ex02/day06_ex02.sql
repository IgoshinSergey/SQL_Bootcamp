SELECT 
	pe.name AS name,
	m.pizza_name AS pizza_name,
	m.price AS price,
	rtrim(rtrim(to_char(m.price - m.price * pd.discount / 100, '000.00'),'0'),'.') AS discount_price,
	pi.name AS pizzeria_name
FROM person_order AS po
JOIN person AS pe ON pe.id = po.person_id
JOIN menu AS m ON m.id = po.menu_id
JOIN pizzeria AS pi ON pi.id = m.pizzeria_id
JOIN person_discounts AS pd ON pd.person_id = pe.id AND pd.pizzeria_id = pi.id
ORDER BY 1, 2;