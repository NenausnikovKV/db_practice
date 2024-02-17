CREATE TABLE aircrafts(
    aircraft_code char( 3 ) NOT NULL,
    models text Not NULL,
    range integer NOT NULL,
    CHECK ( range > 0 ),
    PRIMARY KEY (aircraft_code)
);