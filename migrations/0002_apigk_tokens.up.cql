ALTER TABLE apigk ADD scopes set<text>;
ALTER TABLE apigk ADD scopes_requested set<text>;

ALTER TABLE oauth_authorizations ADD apigk_scopes map<text, frozen<set<text>>>;

ALTER TABLE oauth_tokens ADD apigkid text;
ALTER TABLE oauth_tokens ADD subtokens map<text, uuid>;
