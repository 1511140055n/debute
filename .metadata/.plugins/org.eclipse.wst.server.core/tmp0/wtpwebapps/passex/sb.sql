CREATE TABLE RESULT(
ID INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
DAY VARCHAR(50) NOT NULL,
TEAM VARCHAR(50),
SCORE VARCHAR(50)
)