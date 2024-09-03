COMMENT ON TABLE person_discounts IS 'Таблица хранит персональные скидки людей';
COMMENT ON COLUMN person_discounts.id IS 'Id персональной скидки';
COMMENT ON COLUMN person_discounts.person_id IS 'Id человека, кому принадлежит скидка';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Id пиццерии, в которой действует эта скидка';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки в пиццерии';
