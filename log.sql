-- Keep a log of any SQL queries you execute as you solve the mystery.

-- For starting executing queries
sqlite3 fiftyville.db

-- For understanding the schema of the database
.schema

-- For understanding the crime (Theft of cs50 duck)
SELECT * FROM crime_scene_reports WHERE id = 295;

-- For understanding the transcripts of the witnesses interviews
SELECT * FROM interviews WHERE id > 160 AND id < 164;

-- For looking at the license plate numbers
SELECT * FROM bakery_security_logs WHERE id > 257 AND id < 269;

-- For finding out the account numbers of the people who withdraw money from the atm
SELECT * FROM atm_transactions WHERE day = 28 AND atm_location = 'Leggett Street';

-- For finding out the phone numbers of the people who called on the day of the crime
SELECT * FROM phone_calls WHERE day = 28 AND duration < 61;

-- For finding the airports
SELECT * FROM airports;

-- For finding the data about the flights
SELECT * FROM flights WHERE origin_airport_id = 8 AND day = 29 ORDER BY hour;

-- For finding info about passengers
SELECT * FROM passengers WHERE flight_id = 36;

-- For finding data about bank accounts
SELECT * FROM bank_accounts WHERE account_number IN (SELECT account_number FROM atm_transactions WHERE day = 28 AND atm_location = 'Leggett Street');

-- For finding the people who did transaction on the day of crime
SELECT * FROM people WHERE id IN (SELECT person_id FROM bank_accounts WHERE account_number IN (SELECT account_number FROM atm_transactions WHERE day = 28 AND atm_location = 'Leggett Street'));

-- For finding the thief
SELECT * FROM people WHERE id IN (SELECT person_id FROM bank_accounts WHERE account_number IN (SELECT account_number FROM atm_transactions WHERE day = 28 AND atm_location = 'Leggett Street')) AND license_plate IN (SELECT license_plate FROM bakery_security_logs WHERE id > 259 AND id < 268) AND passport_number IN (SELECT passport_number FROM passengers WHERE flight_id = 36) AND phone_number IN (SELECT caller FROM phone_calls WHERE day = 28 AND duration < 60);

-- For finding out the accomplice of the thief
SELECT * FROM people WHERE phone_number = '(375) 555-8161'; -- Number of the reciever of thief's call

