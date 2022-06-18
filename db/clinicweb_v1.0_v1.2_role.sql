INSERT INTO users(username,password,enabled) VALUES ('tilen','tilen2018', true);
INSERT INTO users(username,password,enabled) VALUES ('ziv','ziv2018', true);
INSERT INTO users(username,password,enabled) VALUES ('opa','abcd1234', true);

INSERT INTO user_roles (username, role) VALUES ('tilen', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role) VALUES ('ziv', 'ROLE_DOC');
INSERT INTO user_roles (username, role) VALUES ('opa', 'ROLE_OPA');

grant select on ALL TABLES in schema public to jianzhi;
grant insert on ALL TABLES in schema public to jianzhi;
grant update on ALL TABLES in schema public to jianzhi;
grant delete on ALL TABLES in schema public to jianzhi;

grant select on ALL SEQUENCES in schema public to jianzhi;
grant update on ALL SEQUENCES in schema public to jianzhi;
