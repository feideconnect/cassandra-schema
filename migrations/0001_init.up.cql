/* clients */
CREATE TABLE clients (
	id uuid PRIMARY KEY,
	client_secret text,

	name text,
	descr text,
	systemdescr text,
	logo blob,
	type text,

	redirect_uri list<text>,
	scopes set<text>,
	scopes_requested set<text>,
	orgauthorization map<text, text>,
	status set<text>,
	privacypolicyurl text,
	homepageurl text,
	loginurl text,
	supporturl text,

	authproviders set<text>,
	authoptions text,	-- JSON Structure

	owner uuid,
	organization text,
	created timestamp,
	updated timestamp
);
CREATE INDEX clients_owner_idx 				ON clients(owner);
CREATE INDEX clients_scopes_idx 			ON clients(scopes);
CREATE INDEX clients_scopes_requested_idx 	ON clients(scopes_requested);
CREATE INDEX clients_organization_idx       ON clients(organization);
CREATE INDEX clients_authproviders_idx      ON clients(authproviders);
CREATE INDEX clients_orgauthorization_idx       ON clients(keys(orgauthorization));

CREATE TABLE clients_counters (
	id uuid PRIMARY KEY,
	count_tokens counter,
	count_users counter
);




/* Users */
CREATE TABLE users (
	userid uuid PRIMARY KEY,
	created timestamp,
	updated timestamp,

	name map<text, text>,
	email map<text, text>,
	profilephoto map<text, blob>,
	profilephotohash map<text, text>,

	selectedsource text,

	aboveagelimit boolean,
	usageterms boolean,

	userid_sec set<text>,
	userid_sec_seen map<text, timestamp>
);
CREATE TABLE userid_sec (
	userid_sec text,
	userid uuid,
	PRIMARY KEY(userid_sec)
);
CREATE INDEX user_userid_sec_idx ON users(userid_sec);





/* Ad-hoc groups */
CREATE TABLE groups (
	id uuid PRIMARY KEY,

	name text,
	descr text,
	invitation_token text,
	logo blob,
	public boolean,

	owner uuid,
	created timestamp,
	updated timestamp
);

CREATE INDEX groups_owner_idx ON groups(owner);
CREATE INDEX groups_public_idx ON groups(public);


CREATE TABLE group_members (
    userid uuid,
    groupid uuid,
    type text,
    status text,
    added_by uuid,
    added timestamp,
    PRIMARY KEY (userid, groupid)
);
CREATE INDEX group_members_groupid_idx ON group_members(groupid);
CREATE INDEX group_members_status_idx ON group_members(status);
CREATE INDEX group_members_type_idx ON group_members(type);


CREATE TABLE groupmember (
	groupid text,
	userid uuid,
	type text,
	PRIMARY KEY(groupid, userid)
);


CREATE TABLE oauth_tokens (
	access_token uuid,
	clientid uuid,
	userid uuid,

	issued timestamp,

	scope set<text>,
	token_type text,
	validuntil timestamp,
	lastuse timestamp,

	PRIMARY KEY(access_token)
);
CREATE INDEX oauth_tokens_userid_idx ON oauth_tokens (userid);
CREATE INDEX oauth_tokens_clientid_idx ON oauth_tokens (clientid);
CREATE INDEX oauth_tokens_scope_idx ON oauth_tokens (scope);


CREATE TABLE oauth_codes (
	code uuid,

	clientid uuid,
	userid uuid,

	scope set<text>,
	token_type text,
	idtoken text,

	redirect_uri text,

	issued timestamp,
	validuntil timestamp,

	PRIMARY KEY(code)
);





CREATE TABLE oauth_authorizations (
	userid uuid,
	clientid uuid,
	issued timestamp,
	scopes set<text>,
	PRIMARY KEY (userid, clientid)
);

/* CREATE INDEX oauth_authorizations_userid_idx ON oauth_authorizations (userid) */
CREATE INDEX oauth_authorizations_clientid_idx ON oauth_authorizations (clientid); 
CREATE INDEX oauth_authorizations_scopes_idx ON oauth_authorizations (scopes);




CREATE TABLE apigk (
	id text PRIMARY KEY,

	name text,
	descr text,
	systemdescr text,
	logo blob,

	endpoints list<text>,

	trust text, 		-- JSON Structure
	expose text,		-- JSON Structure
	scopedef text, 		-- JSON Structure
	requireuser boolean,
	httpscertpinned text, 	-- X509 Certificate

	status set<text>,

	privacypolicyurl text,
	docurl text,

	owner uuid,
	organization text,
	created timestamp,
	updated timestamp
);
CREATE INDEX apigk_owner_idx ON apigk(owner);
CREATE INDEX apigk_organization_idx ON apigk(organization);
CREATE INDEX apigk_status_idx ON apigk(status);

CREATE TABLE grep_codes (
	id text PRIMARY KEY,
	title map<text, text>,
	code text,
	type text,
	last_changed timestamp
);
CREATE INDEX grep_codes_code_idx ON grep_codes(code);

CREATE TABLE mandatory_clients (
    realm text,
    clientid uuid,
    PRIMARY KEY (realm, clientid)
);


/* Organizations */
CREATE TABLE organizations(
       id  text PRIMARY KEY,
       fs_groups boolean,
       kindid int,
       realm text,
       type set<text>,
       organization_number text,
       name map<text, text>,
       uiinfo text,
       services set<text>,
       logo blob,
       logo_updated timestamp
);
CREATE INDEX organizations_kindid_idx ON organizations(kindid);
CREATE INDEX organizations_realm_idx ON organizations(realm);
CREATE INDEX organizations_organization_number_idx ON organizations(organization_number);
CREATE INDEX organizations_type_idx ON organizations(type);
CREATE INDEX organizations_services_idx ON organizations(services);


CREATE TABLE roles(
       feideid text,
       orgid text,
       role set<text>,
       PRIMARY KEY(feideid, orgid)
);
CREATE INDEX roles_orgid_idx ON roles(orgid);

CREATE TABLE remote_apigatekeepers (
    fqdn text PRIMARY KEY
);
