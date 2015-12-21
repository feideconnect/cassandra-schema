ALTER TABLE apigk DROP scopes;
ALTER TABLE apigk DROP scopes_requested;

ALTER TABLE oauth_authorizations DROP apigk_scopes;

ALTER TABLE oauth_tokens DROP apigkid;
ALTER TABLE oauth_tokens DROP subtokens;
