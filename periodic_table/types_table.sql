CREATE TABLE types(
    type_id SERIAL PRIMARY KEY,
    type VARCHAR(30) NOT NULL
);

INSERT INTO
    types(type)
SELECT
    DISTINCT (TYPE)
FROM
    properties;

ALTER TABLE
    properties
ADD
    COLUMN type_id INT;

ALTER TABLE
    properties
ADD
    FOREIGN KEY(type_id) REFERENCES types(type_id);

UPDATE
    properties
SET
    type_id = types.type_id
FROM
    types
WHERE
    properties.type = types.type;

ALTER TABLE
    properties
ALTER COLUMN
    type_id
SET
    NOT NULL;