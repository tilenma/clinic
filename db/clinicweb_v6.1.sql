 --Release v6.3 20190307
--Insert new user opa
INSERT INTO users(username,password,enabled) VALUES ('opa','abcd1234', true);
INSERT INTO user_roles (username, role) VALUES ('opa', 'ROLE_OPA');

delete from "Medicine" where type not in ('藥','方','針') and "ID" > 10000;
delete from "PriceList" where system_id = 1 and category in ('每劑基本','診金','劑量限額','額外劑量收費');