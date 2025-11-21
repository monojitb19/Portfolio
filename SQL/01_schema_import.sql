-- 01 Schema for Bank Marketing Dataset

CREATE TABLE bank (
    age INT,
    job TEXT,
    marital TEXT,
    education TEXT,
    "default" TEXT,
    balance INT,
    housing TEXT,
    loan TEXT,
    contact TEXT,
    day INT,
    month TEXT,
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    poutcome TEXT,
    target TEXT
);

-- Import bank.csv into PostgreSQL

\COPY bank FROM '/home/monojitb/SQL/bank.csv' CSV HEADER;


