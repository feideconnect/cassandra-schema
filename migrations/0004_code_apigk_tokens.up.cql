ALTER TABLE oauth_codes ADD apigk_scopes map<text, frozen<set<text>>>;
