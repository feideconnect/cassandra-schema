CREATE TABLE orgroles(
       identity text,
       orgid text,
       role set<text>,
       PRIMARY KEY(identity, orgid)
);
CREATE INDEX orgroles_orgid_idx ON orgroles(orgid);
