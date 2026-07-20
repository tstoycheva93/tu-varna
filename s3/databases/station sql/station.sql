CREATE TABLE typetable (
    type_id   INTEGER NOT NULL,
    type_name VARCHAR2(60)
);

ALTER TABLE typetable ADD CONSTRAINT type_pk PRIMARY KEY ( type_id );

CREATE TABLE clienttable (
    client_id    INTEGER NOT NULL,
    client_name  VARCHAR2(60),
    client_phone INTEGER
);

ALTER TABLE clienttable ADD CONSTRAINT client_pk PRIMARY KEY ( client_id );

CREATE TABLE employee (
    employee_id          INTEGER NOT NULL,
    employee_name        VARCHAR2(60),
    position_id_empl     INTEGER,
    employee_phone       INTEGER,
    position_position_id INTEGER NOT NULL
);

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( employee_id );

ALTER TABLE employee
    ADD CONSTRAINT employee_position_fk FOREIGN KEY ( position_position_id )
        REFERENCES positiontable ( position_id );

CREATE TABLE positiontable (
    position_id   INTEGER NOT NULL,
    position_name VARCHAR2(60)
);

ALTER TABLE positiontable ADD CONSTRAINT position_pk PRIMARY KEY ( position_id );

CREATE TABLE ticket (
    ticket_id          INTEGER NOT NULL,
    price              NUMBER,
    type_id_tic        INTEGER NOT NULL,
    reservation_id_tic INTEGER NOT NULL
);

ALTER TABLE ticket ADD CONSTRAINT ticket_pk PRIMARY KEY ( ticket_id );

ALTER TABLE ticket
    ADD CONSTRAINT ticket_reservation_fk FOREIGN KEY ( reservation_id_tic )
        REFERENCES reservation ( reservation_id );

ALTER TABLE ticket
    ADD CONSTRAINT ticket_type_fk FOREIGN KEY ( type_id_tic )
        REFERENCES typetable ( type_id );
    
CREATE TABLE destination (
    destination_id   INTEGER NOT NULL,
    destination_name VARCHAR2(60)
);

ALTER TABLE destination ADD CONSTRAINT destination_pk PRIMARY KEY ( destination_id );

CREATE TABLE reservation (
    reservation_id   INTEGER NOT NULL,
    "Date"           DATE,
    time             DATE,
    price            NUMBER,
    transport_id_res INTEGER NOT NULL,
    employee_id_res  INTEGER NOT NULL,
    client_id_res    INTEGER NOT NULL
);

ALTER TABLE reservation ADD CONSTRAINT reservation_pk PRIMARY KEY ( reservation_id );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_client_fk FOREIGN KEY ( client_id_res )
        REFERENCES clienttable ( client_id );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_employee_fk FOREIGN KEY ( employee_id_res )
        REFERENCES employee ( employee_id );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_transport_fk FOREIGN KEY ( transport_id_res )
        REFERENCES transport ( transport_id );

CREATE TABLE transport (
    transport_id         INTEGER NOT NULL,
    destination_id_trans INTEGER NOT NULL,
    "Date"               DATE,
    time                 DATE,
    total_seats          INTEGER
);

ALTER TABLE transport ADD CONSTRAINT transport_pk PRIMARY KEY ( transport_id );

ALTER TABLE transport
    ADD CONSTRAINT transport_destination_fk FOREIGN KEY ( destination_id_trans )
        REFERENCES destination ( destination_id );