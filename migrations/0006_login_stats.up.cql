CREATE TABLE logins_stats (
    clientid uuid,
    date text,
    timeslot timestamp,
    authsource text,
    login_count counter,
    PRIMARY KEY ((clientid, date), authsource, timeslot)
);
