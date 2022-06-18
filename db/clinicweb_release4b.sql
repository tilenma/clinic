INSERT INTO users(username,password,enabled) VALUES ('ziv2','ziv2019', true);
INSERT INTO user_roles (username, role) VALUES ('ziv2', 'ROLE_DOC');

INSERT INTO users(username,password,enabled) VALUES ('doc','doc2019', true);
INSERT INTO user_roles (username, role) VALUES ('doc', 'ROLE_DOC');

alter table users add column "report_name" VARCHAR(50);
alter table users add column "report_name_en" VARCHAR(50);
alter table users add column "register_no" VARCHAR(20);

update users set report_name='嚴允材',report_name_en='Yim Wan Choi',register_no='005410' where username='ziv2';
update users set report_name='陳大夫',report_name_en='Chan Tai Fu',register_no='003333' where username='doc';

alter table "CaseStatistic" add column "reset" boolean NOT NULL DEFAULT true;
alter table "CaseStatistic" drop column "startDate";
alter table "CaseStatistic" drop column "endDate";