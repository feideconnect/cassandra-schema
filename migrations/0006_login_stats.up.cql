CREATE TABLE logins_stats (
    clientid uuid,
    date text,
    timeslot timestamp,
    authsource text,
    value counter,
    PRIMARY KEY ((clientid, date), authsource, timeslot)
);
