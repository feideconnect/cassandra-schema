
DROP TABLE IF EXISTS clients;
DROP INDEX IF EXISTS clients_owner_idx;
DROP INDEX IF EXISTS clients_scopes_idx;
DROP INDEX IF EXISTS clients_scopes_requested_idx;
DROP INDEX IF EXISTS clients_organization_idx;
DROP INDEX IF EXISTS clients_authproviders_idx;
DROP INDEX IF EXISTS clients_orgauthorization_idx;
DROP TABLE IF EXISTS clients_counters;


DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS userid_sec;
DROP INDEX IF EXISTS user_userid_sec_idx;

DROP TABLE IF EXISTS groups;
DROP INDEX IF EXISTS groups_owner_idx;
DROP INDEX IF EXISTS groups_public_idx;



DROP TABLE IF EXISTS oauth_codes;

DROP TABLE IF EXISTS oauth_tokens;
DROP INDEX IF EXISTS oauth_tokens_userid_idx;
DROP INDEX IF EXISTS oauth_tokens_clientid_idx;
DROP INDEX IF EXISTS oauth_tokens_scope_idx;

DROP TABLE IF EXISTS oauth_authorizations;

/* DROP INDEX IF EXISTS oauth_authorizations_userid_idx */
DROP INDEX IF EXISTS oauth_authorizations_clientid_idx;
DROP INDEX IF EXISTS oauth_authorizations_scopes_idx;


DROP TABLE IF EXISTS apigk;
DROP INDEX IF EXISTS apigk_owner_idx;
DROP INDEX IF EXISTS apigk_organization_idx;

DROP TABLE IF EXISTS group_members;
DROP INDEX IF EXISTS group_members_groupid_idx;
DROP INDEX IF EXISTS group_members_status_idx;
DROP INDEX IF EXISTS group_members_type_idx;

DROP TABLE IF EXISTS groupmember;

DROP TABLE IF EXISTS grep_codes;
DROP INDEX IF EXISTS grep_codes_code_idx;

DROP TABLE IF EXISTS mandatory_clients;

DROP TABLE IF EXISTS organizations;
DROP INDEX IF EXISTS organizations_kindid_idx;
DROP INDEX IF EXISTS organizations_realm_idx;
DROP INDEX IF EXISTS organizations_organization_number_idx;
DROP INDEX IF EXISTS organizations_type_idx;
DROP INDEX IF EXISTS organizations_services_idx;

DROP TABLE IF EXISTS roles;
DROP INDEX IF EXISTS roles_orgid_idx;

DROP TABLE IF EXISTS remote_apigatekeepers;

