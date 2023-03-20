-- lets make a procedure

--looks like python
CREATE procedure late_fee_c112_athena(
    pay_id INTEGER,
    late_fee_amount NUMERIC(7, 2) --REFRESHER 7 DIGITS 2 ARE DECIMALS
)
LANGUAGE plpgsql --programming language postgresql
AS
$$
BEGIN

-- THIS IS A CODE BLOCK
--ADD LATE FEE TO PAYMENT
UPDATE payment 
SET amount = amount + late_fee_amount
WHERE payment_id = pay_id;
--commit the code block inside of transaction
COMMIT;
END
$$
;

--CREATE OR REPLACE procedure();

CALL late_fee_c112_athena()

SELECT * FROM payment where amount >0;

SELECT * FROM payment WHERE payment_id=22686;

CALL late_fee_c112_athena(22686, 447.56);


--lets store a function!

--CALL OR REPLACE function add_actor_c112_athena()

select * from actor;

--lets look at ids b/c we dont want to override anything

select * from actor
ORDER BY actor_id DESC;

CREATE OR REPLACE function add_actor_c112_athena(
    a_id INTEGER,
    f_name VARCHAR(50),
    l_name VARCHAR(50)

)

RETURNS VOID

LANGUAGE plpgsql
AS
$MAIN$
BEGIN
-- INSERT INTO THE ACTOR TABLE
INSERT INTO actor(actor_id, first_name, last_name, last_update)
VALUES (a_id, f_name, l_name, NOW()::TIMESTAMP)
;
--
END
$MAIN$
;


--DONT USE CALL HERE USE SELECT!

SELECT add_actor_c112_athena(5003, 'Pedro' , 'Pascal')

DROP procedure add_actor_c112_athena()