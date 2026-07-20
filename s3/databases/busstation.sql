CREATE TABLE clienttable (
    client_id      INTEGER NOT NULL,
    client_name    VARCHAR2(60),
    client_phone   INTEGER
);

ALTER TABLE clienttable ADD CONSTRAINT client_pk PRIMARY KEY ( client_id );

CREATE TABLE destination (
    destination_id     INTEGER NOT NULL,
    destination_name   VARCHAR2(60)
);

ALTER TABLE destination ADD CONSTRAINT destination_pk PRIMARY KEY ( destination_id );

CREATE TABLE employee (
    employee_id            INTEGER NOT NULL,
    employee_name          VARCHAR2(60),
    employee_phone         INTEGER,
    position_position_id   INTEGER NOT NULL
);

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( employee_id );

CREATE TABLE positiontable (
    position_id     INTEGER NOT NULL,
    position_name   VARCHAR2(60)
);

ALTER TABLE positiontable ADD CONSTRAINT position_pk PRIMARY KEY ( position_id );

CREATE TABLE reservation (
    reservation_id     INTEGER NOT NULL,
    "Date"             DATE,
    time               DATE,
    price              NUMBER,
    transport_id_res   INTEGER NOT NULL,
    employee_id_res    INTEGER NOT NULL,
    client_id_res      INTEGER NOT NULL
);

ALTER TABLE reservation ADD CONSTRAINT reservation_pk PRIMARY KEY ( reservation_id );

CREATE TABLE ticket (
    ticket_id            INTEGER NOT NULL,
    price                NUMBER,
    type_id_tic          INTEGER NOT NULL,
    reservation_id_tic   INTEGER NOT NULL
);

ALTER TABLE ticket ADD CONSTRAINT ticket_pk PRIMARY KEY ( ticket_id );

CREATE TABLE transport (
    transport_id           INTEGER NOT NULL,
    destination_id_trans   INTEGER NOT NULL,
    "Date"                 DATE,
    time                   DATE,
    total_seats            INTEGER
);

ALTER TABLE transport ADD CONSTRAINT transport_pk PRIMARY KEY ( transport_id );

CREATE TABLE typetable (
    type_id     INTEGER NOT NULL,
    type_name   VARCHAR2(60)
);

ALTER TABLE typetable ADD CONSTRAINT type_pk PRIMARY KEY ( type_id );

ALTER TABLE employee
    ADD CONSTRAINT employee_position_fk FOREIGN KEY ( position_position_id )
        REFERENCES positiontable ( position_id );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_client_fk FOREIGN KEY ( client_id_res )
        REFERENCES clienttable ( client_id );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_employee_fk FOREIGN KEY ( employee_id_res )
        REFERENCES employee ( employee_id );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_transport_fk FOREIGN KEY ( transport_id_res )
        REFERENCES transport ( transport_id );

ALTER TABLE ticket
    ADD CONSTRAINT ticket_reservation_fk FOREIGN KEY ( reservation_id_tic )
        REFERENCES reservation ( reservation_id );

ALTER TABLE ticket
    ADD CONSTRAINT ticket_type_fk FOREIGN KEY ( type_id_tic )
        REFERENCES typetable ( type_id );

ALTER TABLE transport
    ADD CONSTRAINT transport_destination_fk FOREIGN KEY ( destination_id_trans )
        REFERENCES destination ( destination_id );

INSERT INTO TYPETABLE (TYPE_ID, TYPE_NAME) VALUES (1, 'One Way'); 
INSERT INTO TYPETABLE (TYPE_ID, TYPE_NAME) VALUES (2, 'Round Trip');
 
INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    1,
    'Anna Ivanova',
    359001
);

INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    2,
    'Ivan Ivanov',
    359002
);

INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    3,
    'Maria Peneva',
    359003
);

INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    4,
    'Georgi Petkov',
    359004
);

INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    5,
    'Georgi Georgiev',
    359005
);

INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    6,
    'Stanislav Stanislavov',
    359006
);

INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    7,
    'Aleksandra Ilieva',
    359007
);

INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    8,
    'Martin Ganev',
    359008
);

INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    9,
    'Ivanka Stoilova',
    359009
);

INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    10,
    'Dimitar Petrov',
    359010
);

INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    11,
    'Petar Dimitrov',
    359011
);

INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    12,
    'Stoil Ivanov',
    359012
);

INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    13,
    'Todor Yordanov',
    359013
);

INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    14,
    'Boris Marinov',
    359014
);

INSERT INTO clienttable (
    client_id,
    client_name,
    client_phone
) VALUES (
    15,
    'Nikola Velikov',
    359015
);

INSERT INTO destination (
    destination_id,
    destination_name
) VALUES (
    1,
    'Sofia'
);

INSERT INTO destination (
    destination_id,
    destination_name
) VALUES (
    2,
    'Varna'
);

INSERT INTO destination (
    destination_id,
    destination_name
) VALUES (
    3,
    'Shumen'
);

INSERT INTO destination (
    destination_id,
    destination_name
) VALUES (
    4,
    'Burgas'
);

INSERT INTO destination (
    destination_id,
    destination_name
) VALUES (
    5,
    'Yambol'
);

INSERT INTO destination (
    destination_id,
    destination_name
) VALUES (
    6,
    'Lovech'
);

INSERT INTO destination (
    destination_id,
    destination_name
) VALUES (
    7,
    'Silistra'
);

INSERT INTO destination (
    destination_id,
    destination_name
) VALUES (
    8,
    'Sliven'
);

INSERT INTO destination (
    destination_id,
    destination_name
) VALUES (
    9,
    'Ruse'
);

INSERT INTO destination (
    destination_id,
    destination_name
) VALUES (
    10,
    'Popovo'
);


INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    1,
    'Teodor Todorov',
    359991,
    1
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    2,
    'Yordan Penev',
    359992,
    1
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    3,
    'Dimitar Nikolov',
    359993,
    1
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    4,
    'Stoyan Totev',
    359994,
    2
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    5,
    'Georgi Yordanov',
    359995,
    2
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    6,
    'Vasil Stoyanov',
    359996,
    2
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    7,
    'Krasimir Vasilev',
    359997,
    3
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    8,
    'Tanya Krasimirova',
    359998,
    4
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    9,
    'Velichka Teneva',
    359999,
    4
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    10,
    'Presiyan Velikov',
    359910,
    4
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    11,
    'Maria Getseva',
    359911,
    5
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    12,
    'Nikolina Marinova',
    359912,
    5
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    13,
    'Elisaveta Dimcheva',
    359913,
    6
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    14,
    'Kristiyan Dragomirov',
    359914,
    7
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    15,
    'Ekaterina Boyanova',
    359915,
    7
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    16,
    'Boyan Darinov',
    359916,
    8
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    17,
    'Daria Radichkova',
    359917,
    9
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    18,
    'Raya Dobromirova',
    359918,
    10
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    19,
    'Dobromir Hristov',
    359919,
    10
);

INSERT INTO employee (
    employee_id,
    employee_name,
    employee_phone,
    position_position_id
) VALUES (
    20,
    'Hristo Kozarev',
    359920,
    10
);


INSERT INTO positiontable (
    position_id,
    position_name
) VALUES (
    1,
    'Big Bus Driver'
);

INSERT INTO positiontable (
    position_id,
    position_name
) VALUES (
    2,
    'Small Bus Driver'
);

INSERT INTO positiontable (
    position_id,
    position_name
) VALUES (
    3,
    'Front Desk Operator'
);

INSERT INTO positiontable (
    position_id,
    position_name
) VALUES (
    4,
    'Tour Operator'
);

INSERT INTO positiontable (
    position_id,
    position_name
) VALUES (
    5,
    'Developer'
);

INSERT INTO positiontable (
    position_id,
    position_name
) VALUES (
    6,
    'Secretary'
);

INSERT INTO positiontable (
    position_id,
    position_name
) VALUES (
    7,
    'Accountant'
);

INSERT INTO positiontable (
    position_id,
    position_name
) VALUES (
    8,
    'Attourney'
);

INSERT INTO positiontable (
    position_id,
    position_name
) VALUES (
    9,
    'Cleaning Service'
);

INSERT INTO positiontable (
    position_id,
    position_name
) VALUES (
    10,
    'Customer Support Service'
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    1,
    TO_DATE('2024-11-01', 'RRRR-MM-DD'),
    to_timestamp('2024-11-01 11:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    10,
    1,
    1,
    1
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    2,
    TO_DATE('2024-11-01', 'RRRR-MM-DD'),
    to_timestamp('2024-11-01 11:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    10,
    1,
    2,
    2
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    3,
    TO_DATE('2024-11-02', 'RRRR-MM-DD'),
    to_timestamp('2024-11-02 10:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    15,
    2,
    3,
    3
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    4,
    TO_DATE('2024-11-02', 'RRRR-MM-DD'),
    to_timestamp('2024-11-02 10:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    15,
    2,
    4,
    4
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    5,
    TO_DATE('2024-11-02', 'RRRR-MM-DD'),
    to_timestamp('2024-11-02 11:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    18,
    3,
    5,
    5
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    6,
    TO_DATE('2024-11-02', 'RRRR-MM-DD'),
    to_timestamp('2024-11-02 11:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    18,
    3,
    6,
    6
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    7,
    TO_DATE('2024-11-02', 'RRRR-MM-DD'),
    to_timestamp('2024-11-02 12:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    18,
    4,
    1,
    7
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    8,
    TO_DATE('2024-11-02', 'RRRR-MM-DD'),
    to_timestamp('2024-11-02 12:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    18,
    4,
    2,
    8
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    9,
    TO_DATE('2024-11-03', 'RRRR-MM-DD'),
    to_timestamp('2024-11-03 13:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    18,
    5,
    3,
    9
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    10,
    TO_DATE('2024-11-03', 'RRRR-MM-DD'),
    to_timestamp('2024-11-03 13:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    18,
    5,
    4,
    10
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    11,
    TO_DATE('2024-11-04', 'RRRR-MM-DD'),
    to_timestamp('2024-11-04 12:30:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    20,
    6,
    5,
    11
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    12,
    TO_DATE('2024-11-04', 'RRRR-MM-DD'),
    to_timestamp('2024-11-04 12:30:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    20,
    6,
    6,
    12
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    13,
    TO_DATE('2024-11-05', 'RRRR-MM-DD'),
    to_timestamp('2024-11-05 10:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    20,
    7,
    6,
    13
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    14,
    TO_DATE('2024-11-05', 'RRRR-MM-DD'),
    to_timestamp('2024-11-05 10:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    20,
    7,
    8,
    14
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    15,
    TO_DATE('2024-11-05', 'RRRR-MM-DD'),
    to_timestamp('2024-11-05 11:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    20,
    8,
    9,
    15
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    16,
    TO_DATE('2024-11-05', 'RRRR-MM-DD'),
    to_timestamp('2024-11-05 11:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    20,
    8,
    10,
    1
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    17,
    TO_DATE('2024-11-05', 'RRRR-MM-DD'),
    to_timestamp('2024-11-05 12:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    25,
    9,
    6,
    2
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    18,
    TO_DATE('2024-11-05', 'RRRR-MM-DD'),
    to_timestamp('2024-11-05 12:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    25,
    9,
    8,
    3
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    19,
    TO_DATE('2024-11-06', 'RRRR-MM-DD'),
    to_timestamp('2024-11-06 10:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    25,
    10,
    9,
    4
);

INSERT INTO reservation (
    reservation_id,
    "Date",
    time,
    price,
    transport_id_res,
    employee_id_res,
    client_id_res
) VALUES (
    20,
    TO_DATE('2024-11-06', 'RRRR-MM-DD'),
    to_timestamp('2024-11-06 10:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    25,
    10,
    10,
    5
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    1,
    10,
    1,
    1
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    2,
    10,
    1,
    2
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    3,
    15,
    1,
    3
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    4,
    15,
    1,
    4
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    5,
    18,
    1,
    5
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    6,
    18,
    1,
    6
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    7,
    18,
    1,
    7
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    8,
    18,
    1,
    8
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    9,
    18,
    1,
    9
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    10,
    18,
    1,
    10
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    11,
    20,
    2,
    11
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    12,
    20,
    2,
    12
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    13,
    20,
    2,
    13
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    14,
    20,
    2,
    14
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    15,
    20,
    2,
    15
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    16,
    20,
    2,
    16
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    17,
    25,
    2,
    17
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    18,
    25,
    2,
    18
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    19,
    25,
    2,
    19
);

INSERT INTO ticket (
    ticket_id,
    price,
    type_id_tic,
    reservation_id_tic
) VALUES (
    20,
    25,
    2,
    20
);

INSERT INTO transport (
    transport_id,
    destination_id_trans,
    "Date",
    time,
    total_seats
) VALUES (
    1,
    1,
    TO_DATE('2024-11-01', 'RRRR-MM-DD'),
    to_timestamp('2024-11-01 11:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    35
);

INSERT INTO transport (
    transport_id,
    destination_id_trans,
    "Date",
    time,
    total_seats
) VALUES (
    2,
    2,
    TO_DATE('2024-11-02', 'RRRR-MM-DD'),
    to_timestamp('2024-11-02 10:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    40
);

INSERT INTO transport (
    transport_id,
    destination_id_trans,
    "Date",
    time,
    total_seats
) VALUES (
    3,
    3,
    TO_DATE('2024-11-02', 'RRRR-MM-DD'),
    to_timestamp('2024-11-02 11:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    45
);

INSERT INTO transport (
    transport_id,
    destination_id_trans,
    "Date",
    time,
    total_seats
) VALUES (
    4,
    4,
    TO_DATE('2024-11-02', 'RRRR-MM-DD'),
    to_timestamp('2024-11-02 12:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    45
);

INSERT INTO transport (
    transport_id,
    destination_id_trans,
    "Date",
    time,
    total_seats
) VALUES (
    5,
    5,
    TO_DATE('2024-11-03', 'RRRR-MM-DD'),
    to_timestamp('2024-11-03 13:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    45
);

INSERT INTO transport (
    transport_id,
    destination_id_trans,
    "Date",
    time,
    total_seats
) VALUES (
    6,
    6,
    TO_DATE('2024-11-04', 'RRRR-MM-DD'),
    to_timestamp('2024-11-04 12:30:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    50
);

INSERT INTO transport (
    transport_id,
    destination_id_trans,
    "Date",
    time,
    total_seats
) VALUES (
    7,
    7,
    TO_DATE('2024-11-05', 'RRRR-MM-DD'),
    to_timestamp('2024-11-05 10:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    50
);

INSERT INTO transport (
    transport_id,
    destination_id_trans,
    "Date",
    time,
    total_seats
) VALUES (
    8,
    8,
    TO_DATE('2024-11-05', 'RRRR-MM-DD'),
    to_timestamp('2024-11-05 11:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    50
);

INSERT INTO transport (
    transport_id,
    destination_id_trans,
    "Date",
    time,
    total_seats
) VALUES (
    9,
    9,
    TO_DATE('2024-11-05', 'RRRR-MM-DD'),
    to_timestamp('2024-11-05 12:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    60
);

INSERT INTO transport (
    transport_id,
    destination_id_trans,
    "Date",
    time,
    total_seats
) VALUES (
    10,
    10,
    TO_DATE('2024-11-06', 'RRRR-MM-DD'),
    to_timestamp('2024-11-06 10:00:00.000000000', 'RRRR-MM-DD HH24:MI:SSXFF'),
    60
);

INSERT INTO typetable (
    type_id,
    type_name
) VALUES (
    1,
    'One Way'
);

INSERT INTO typetable (
    type_id,
    type_name
) VALUES (
    2,
    'Round Trip'
);

UPDATE CLIENTTABLE
SET CLIENT_NAME='&CLIENT_NAME',CLIENT_PHONE='&CLIENT_PHONE'
WHERE CLIENT_ID=&CLIENT_ID;

UPDATE EMPLOYEE
SET EMPLOYEE_NAME='&EMPLOYEE_NAME'
WHERE EMPLOYEE_ID=&EMPLOYEE_ID;

UPDATE EMPLOYEE
SET EMPLOYEE_PHONE='&EMPLOYEE_PHONE'
WHERE EMPLPYEE_ID=1;

UPDATE TICKET
SET TYPE_ID_TIC='&TYPE_ID_TIC'
WHERE TICKET_ID=5;

DELETE FROM DESTINATION 
WHERE DESTINATION_ID=&DESTINATION_ID;

DELETE FROM TICKET 
WHERE TICKET_ID=7;

DELETE FROM CLIENT
WHERE CLIENT_ID=9;

DELETE FROM RESERVATION
WHERE TRANSPORT_ID_RES=&TRANSPORT_ID_RES;

DELETE FROM POSITIONTABLE
WHERE POSITION_ID=3;

DELETE FROM TRANSPORT
WHERE DESTINATION_ID_TRANS=3;

DELETE FROM EMPLOYEE
WHERE EMPLOYEE_ID=&EMPLOYEE_ID;

SELECT 
    r."Date" as reservation_date,
    r.time as reservation_time,
    t.type_name as ticket_type,
    c.client_name as client_name,
    tr.total_seats as total_seats
FROM ticket tic
JOIN reservation r ON tic.reservation_id_tic = r.reservation_id
JOIN typetable t ON tic.type_id_tic = t.type_id
JOIN clienttable c ON r.client_id_res = c.client_id
JOIN transport tr ON r.transport_id_res = tr.transport_id
JOIN destination d ON tr.destination_id_trans = d.destination_id
WHERE destination_name='&Destination';

SELECT 
    t.type_name as ticket_type,
    c.client_name as client_name,
    d.destination_name as destination,
    tr."Date" as transport_date,
    tr.time as transport_time,
    tr.total_seats as total_seats
FROM ticket tic
JOIN reservation r ON tic.reservation_id_tic = r.reservation_id
JOIN typetable t ON tic.type_id_tic = t.type_id
JOIN clienttable c ON r.client_id_res = c.client_id
JOIN transport tr ON r.transport_id_res = tr.transport_id
JOIN destination d ON tr.destination_id_trans = d.destination_id
WHERE r."Date" = TO_DATE('&Date', 'DD-MM-YYYY');

SELECT 
    t.type_name as ticket_type,
    c.client_name as client_name,
    d.destination_name  as destination,
    tr."Date" as transport_date,
    tr.time as transport_time,
    tr.total_seats as total_seats
FROM ticket tic
JOIN reservation r ON tic.reservation_id_tic = r.reservation_id
JOIN typetable t ON tic.type_id_tic = t.type_id
JOIN clienttable c ON r.client_id_res = c.client_id
JOIN transport tr ON r.transport_id_res = tr.transport_id
JOIN destination d ON tr.destination_id_trans = d.destination_id
WHERE TO_CHAR(tr.time, 'HH24:MI:SS.FF6') = '&Time';

SELECT 
    c.client_name AS client_name,
    c.client_phone AS client_phone,
    COUNT(tic.ticket_id) AS number_of_tickets_sold
FROM clienttable c
JOIN reservation r ON c.client_id = r.client_id_res
JOIN ticket tic ON r.reservation_id = tic.reservation_id_tic
GROUP BY 
    c.client_name,
    c.client_phone;


SELECT 
    d.destination_name AS destination_name,
    tr."Date" AS transport_date,
    tr.time AS transport_time,
    tr.total_seats - COUNT(tic.ticket_id) AS number_of_free_seats
FROM transport tr
JOIN destination d ON tr.destination_id_trans = d.destination_id
LEFT JOIN reservation r ON r.transport_id_res = tr.transport_id
LEFT JOIN ticket tic ON r.reservation_id = tic.reservation_id_tic
GROUP BY 
    d.destination_name,
    tr."Date",
    tr.time,
    tr.total_seats;

SELECT 
    tr."Date" AS transport_date,
    tr.time AS transport_time,
    d.destination_name AS destination,
    c.client_name AS client_name,
    t.type_name AS ticket_type
FROM ticket tic
JOIN reservation r ON tic.reservation_id_tic = r.reservation_id
JOIN transport tr ON r.transport_id_res = tr.transport_id
JOIN destination d ON tr.destination_id_trans = d.destination_id
JOIN clienttable c ON r.client_id_res = c.client_id
JOIN typetable t ON tic.type_id_tic = t.type_id
WHERE tr."Date" BETWEEN TO_DATE('&StartDate', 'DD-MM-YYYY') AND TO_DATE('&EndDate', 'DD-MM-YYYY')
ORDER BY tr."Date" ASC;