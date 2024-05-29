ALTER TABLE
    properties RENAME COLUMN weight TO atomic_mass;

ALTER TABLE
    properties RENAME COLUMN melting_point TO melting_point_celsius;

ALTER TABLE
    properties RENAME COLUMN boiling_point TO boiling_point_celsius;

ALTER TABLE
    properties
ALTER COLUMN
    melting_point_celsius
SET
    NOT NULL,
ALTER COLUMN
    boiling_point_celsius
SET
    NOT NULL;

ALTER TABLE
    elements
ADD
    CONSTRAINT unique_symbol_name UNIQUE(symbol, name);

ALTER TABLE
    elements
ALTER COLUMN
    symbol
SET
    NOT NULL,
ALTER COLUMN
    name
SET
    NOT NULL;

ALTER TABLE
    properties
ADD
    FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);

UPDATE
    elements
SET
    symbol = INITCAP(symbol);

ALTER TABLE
    properties
ALTER COLUMN
    atomic_mass type VARCHAR(9);

UPDATE
    properties
SET
    atomic_mass = CAST(atomic_mass AS FLOAT);

DELETE FROM
    properties
WHERE
    atomic_number = 1000;

DELETE FROM
    elements
WHERE
    atomic_number = 1000;

ALTER TABLE
    properties DROP COLUMN type;