CREATE TABLE ORDERITEM(
ID INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
ITEM VARCHAR(50) NOT NULL,
PRICE INT,
NUM INT
)

SELECT * FROM ORDERITEM

DROP TABLE ORDERITEM