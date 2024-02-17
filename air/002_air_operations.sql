CREATE TABLE aircrafts (
    aircraft_code char ( 3 ) NOT NULL,
    model text NOT NULL,
    range integer NOT NULL,

    CHECK ( range > 0 ),
    PRIMARY KEY (aircraft_code)
);

DELETE FROM aircrafts
WHERE aircraft_code = 'SU9';

INSERT INTO aircrafts (aircraft_code, model, range)
VALUES  ( 'SU9', 'Kukhoy SuperJet-100', 300 ),
        ( '773', 'Boeing 777-300', 11100 ),
        ( '763', 'Boeing 767-300', 7900 ),
        ( '733', 'Boeing 737-300', 4200 ),
        ( '320', 'Airbus A320-200', 5700 ),
        ( '321', 'Airbus A321-200', 5600 ),
        ( '319', 'Airbus A319-100', 6700 ),
        ( 'CN1', 'Cessna 208 Caravan', 1200 ),
        ( 'CR2', 'Bombardier CRJ-200', 2700 );

SELECT * FROM aircrafts
ORDER BY model
LIMIT 10;

SELECT * FRom aircrafts
WHERE  range >= 4000 AND range <= 6000;

UPDATE aircrafts
SET range = 3500
WHERE aircraft_code = 'SU9';

CREATE TABLE seats (
    aircraft_code char( 3 ) NOT NULL,
    seat_no varchar ( 4 ) NOT NULL,
    fare_condition varchar ( 10 ) NOT NULL,
    CHECK (
        fare_condition IN ('Economy', 'Comfort', 'Business')
    ),
    PRIMARY KEY (aircraft_code, seat_no),
    FOREIGN KEY (aircraft_code)
        REFERENCES aircrafts ( aircraft_code )
        ON DELETE CASCADE
);

INSERT INTO seats VALUES ('SU9', '1A', 'Business');

DELETE FROM seats
WHERE true;

INSERT INTO seats (aircraft_code, seat_no, fare_condition)
    VALUES ( 'SU9', '1A', 'Business' ),
           ( 'SU9', '1B', 'Business' ),
           ( 'SU9', '10A', 'Economy' ),
           ( 'SU9', '10B', 'Economy' ),
           ( 'SU9', '10F', 'Economy' ),
           ( 'SU9', '20F', 'Economy' ),
           ( '319', '1A', 'Business' ),
           ( '319', '1B', 'Business' ),
           ( '319', '10A', 'Economy' ),
           ( '319', '10B', 'Economy' ),
           ( '319', '10F', 'Economy' ),
           ( '319', '20F', 'Economy' ),
           ( '320', '1A', 'Business' ),
           ( '320', '1B', 'Business' ),
           ( '320', '10A', 'Economy' ),
           ( '320', '10B', 'Economy' ),
           ( '320', '10F', 'Economy' ),
           ( '320', '20F', 'Economy' ),
           ( '321', '1A', 'Business' ),
           ( '321', '1B', 'Business' ),
           ( '321', '10A', 'Economy' ),
           ( '321', '10B', 'Economy' ),
           ( '321', '10F', 'Economy' ),
           ( '321', '20F', 'Economy' ),
           ( '733', '1A', 'Business' ),
           ( '733', '1B', 'Business' ),
           ( '733', '10A', 'Economy' ),
           ( '733', '10B', 'Economy' ),
           ( '733', '10F', 'Economy' ),
           ( '733', '20F', 'Economy' ),
           ( '763', '1A', 'Business' ),
           ( '763', '1B', 'Business' ),
           ( '763', '10A', 'Economy' ),
           ( '763', '10B', 'Economy' ),
           ( '763', '10F', 'Economy' ),
           ( '763', '20F', 'Economy' ),
           ( '773', '1A', 'Business' ),
           ( '773', '1B', 'Business' ),
           ( '773', '10A', 'Economy' ),
           ( '773', '10B', 'Economy' ),
           ( '773', '10F', 'Economy' ),
           ( '773', '20F', 'Economy' ),
           ( 'CN1', '1A', 'Business' ),
           ( 'CN1', '1B', 'Business' ),
           ( 'CN1', '10A', 'Economy' ),
           ( 'CN1', '10B', 'Economy' ),
           ( 'CN1', '10F', 'Economy' ),
           ( 'CN1', '20F', 'Economy' ),
           ( 'CR2', '1A', 'Business' ),
           ( 'CR2', '1B', 'Business' ),
           ( 'CR2', '10A', 'Economy' ),
           ( 'CR2', '10B', 'Economy' ),
           ( 'CR2', '10F', 'Economy' ),
           ( 'CR2', '20F', 'Economy' );


SELECT DISTINCT aircraft_code, seat_no FROM seats LIMIT 15;

SELECT seat_no, count(aircraft_code) FROM seats
WHERE fare_condition = 'Business'
GROUP BY seat_no;

SELECT seat_no, fare_condition, count(aircraft_code) FROM seats
GROUP BY seat_no, fare_condition;

SELECT seat_no, aircraft_code, fare_condition FROM seats
WHERE fare_condition = 'Business';


SELECT seat_no, aircraft_code FROM seats
WHERE seat_no = '1A';

SELECT seats.aircraft_code, count(seat_no) FROM seats
GROUP BY aircraft_code;


SELECT aircraft_code, seat_no FRom seats;

SELECT * from aircrafts
ORDER BY range DESC ;

UPDATE aircrafts
SET range = range*2
WHERE aircraft_code = 'SU9';

SELECT * FROM aircrafts
WHERE aircraft_code = 'SU9';

DELETE FROM aircrafts
WHERE aircraft_code = 'JUe';

SELECT 'Postgres ''sql''';

SELECT E'Postgres \n sql';


-- yyyy-mm-dd
SELECT '2016-09-12'::date;
SELECT 'Sep 12, 2016'::date;

SELECT current_date;
SELECT to_char( current_date, 'dd:mm-yyyy');

SELECT '21:15'::time;
SELECT '33:15'::time;

SELECT '21:15:26'::time;
SELECT '10:15:16 am'::time;
SELECT '02:10:45 pm'::time;

SELECT current_time;


SELECT timestamp with time zone '2016-09-21 22:25:35';

SELECT timestamp '2016-09-21 22:25:35';
SELECT '2016-09-21 22:25:35'::timestamp;
SELECT current_timestamp;
-- rounding a number
SELECT date_trunc('hour', current_timestamp) ;
SELECT extract('mon' FROM current_timestamp);


SELECT '1 year 2 months ago'::interval;
SELECT '1 year 2 months'::interval;
SELECT ('2016-09-16'::timestamp- '2016-09-01'::timestamp)::interval;

-- boolean type

CREATE TABLE databases(
    is_open_source boolean,
    name varchar (15)
);

INSERT INTO databases (name, is_open_source)
VALUES  ('Postgresql', TRUE),
        ('Oracle', False),
        ('MySql', 'yes'),
        ('MS SQL SERVER', '0');

SELECT name, is_open_source FROM databases
LIMIT 10;


SELECT name, is_open_source FROM databases
WHERE NOT is_open_source
LIMIT 10;


CREATE TABLE pilots
(
    pilot_name text,
    schedule integer[]
);


INSERT INTO pilots (pilot_name, schedule)
    VALUES ('Ivan', '{ 1, 3, 5, 6, 7 }'::integer[]),
           ('Petr', '{ 1, 2, 5, 7 }'::integer[]),
           ('Pavel', '{ 2, 5 }'::integer[]),
           ('Boris', '{ 3, 5, 6 }'::integer[]);

SELECT * FROM pilots;

UPDATE pilots
SET schedule = schedule || 7
WHERE pilot_name = 'Boris';

UPDATE pilots
    SET schedule = array_append(schedule, 6)
    WHERE pilot_name = 'Boris';

UPDATE pilots
    SET schedule = array_prepend(1, schedule)
    WHERE pilot_name = 'Pavel';

UPDATE pilots
    SET schedule = array_remove(schedule, 6)
    WHERE pilot_name = 'Boris';


UPDATE pilots
SET schedule[1] = 2,
    schedule[2]=3
WHERE pilot_name = 'Petr';

SELECT * FROM pilots;

UPDATE  pilots
SET schedule[1:2] = ARRAY [2,8]
WHERE pilot_name = 'Petr';

SELECT * FROM pilots;

-- find by value
-- array_postition return value index if array contains it else return NULL
SELECT * FROM pilots
WHERE array_position(schedule, 3 ) IS NOT NULL;

--  find by index
SELECT * FROM pilots
WHERE schedule[2] IS NOT NULL;

--  find by index value
SELECT * FROM pilots
WHERE schedule[2] = 3;

-- schedule contains all value from {1, 7}
SELECT * FROM pilots
    WHERE schedule @> '{1, 7}'::integer[];



