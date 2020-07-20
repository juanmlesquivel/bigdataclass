BEGIN;

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  customer_id integer NOT NULL,
  amount integer NOT NULL,
  purchased_at timestamp without time zone NOT NULL
);
 
 
INSERT INTO "transactions" (customer_id, amount, purchased_at) VALUES
(1, 55, '2017-03-01 09:00:00'),
(1, 125, '2017-03-01 10:00:00'),
(1, 32, '2017-03-02 13:00:00'),
(1, 64, '2017-03-02 15:00:00'),
(1, 128, '2017-03-03 10:00:00'),
(2, 333, '2017-03-01 09:00:00'),
(2, 334, '2017-03-01 09:01:00'),
(2, 333, '2017-03-01 09:02:00'),
(2, 11, '2017-03-03 20:00:00'),
(2, 44, '2017-03-03 20:15:00');

COMMIT;
