SELECT menu.id AS menu_id
FROM menu
LEFT JOIN person_order ON person_order.menu_id = menu.id
WHERE person_order.id IS NULL
ORDER BY 1;