-- DROP SCHEMA public;

CREATE TABLE auths (
    auth_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    account_id BIGINT UNIQUE NOT NULL,
    username VARCHAR UNIQUE NOT NULL,
    password VARCHAR NOT NULL
);


CREATE TABLE accounts (
    account_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nama VARCHAR NOT NULL,
    balance BIGINT NOT NULL,
    referral_account_id BIGINT,
    FOREIGN KEY (referral_account_id) REFERENCES accounts(account_id)
);

CREATE TABLE transaction_categories (
    transaction_category_id SERIAL PRIMARY KEY,
    nama VARCHAR NOT NULL
);


CREATE TABLE transaction (
    transaction_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    transaction_category_id BIGINT REFERENCES transaction_categories(transaction_category_id) ON DELETE SET NULL,
    account_id BIGINT NOT NULL,
    from_account_id BIGINT,
    to_account_id BIGINT,
    amount BIGINT NOT NULL,
    transaction_date TIMESTAMP NOT NULL
);
