--web 1.1
alter table "Cases" add column "search_right" VARCHAR(200) NOT NULL DEFAULT 'ALL';
alter table "Cases" add column "view_right" VARCHAR(200) NOT NULL DEFAULT 'ALL';
alter table "Cases" add column "edit_right" VARCHAR(200) NOT NULL DEFAULT 'ALL';

drop view "View_Cases";
CREATE OR REPLACE VIEW "View_Cases" AS 
 SELECT c."caseID",
    c."customerID",
    c.date,
    c.problem,
    c."coldHot",
    c.sweat,
    c.head,
    c.month,
    c.body,
    c.poo,
    c.pee,
    c.drink,
    c.eat,
    c.abdomen,
    c.hearing,
    c.menstruation,
    c.sleep,
    c."tongueColor",
    c.pulse,
    c.sickness,
    c.diagnosis,
    c.theory,
    c."createTime",
    c.dosage,
    c."dosageMethod",
    c."dosageRemark",
    c.skin,
    c."tongueLayer",
    c."dosageRecomment",
    c."tongueShape",
    c."tongueStatus",
    c.price,
    c."dosePrice",
    c."consultationFee",
    c.redispense,
    c.expirydate,
	c.search_right,
	c.view_right,
	c.edit_right,
    (rank() OVER (PARTITION BY to_char(c.date::timestamp with time zone, 'YYYYMMDD'::text) ORDER BY c."caseID"))+1000 AS rank,
	t."name" AS "customer"
   FROM "Cases" c, "Customers" t
   where t."customerID" = c."customerID" AND t."privacy" <=  COALESCE(( SELECT "privacy" FROM "Security" WHERE "Security"."user" = CURRENT_USER ),1);
   
 --web 1.2
 CREATE TABLE "system_parameter"("group" VARCHAR(50) NOT NULL,"key" VARCHAR(50) NOT NULL,"description" VARCHAR(250),
 "type" VARCHAR(2), "text_value" VARCHAR(250), "numeric_value" DECIMAL(100,2), "date_value" DATE, 
 PRIMARY KEY("group","key"));
 
 CREATE TABLE "users" (
  username VARCHAR(20) NOT NULL ,
  password VARCHAR(60) NOT NULL ,
  enabled boolean NOT NULL DEFAULT FALSE ,
  PRIMARY KEY (username));
  
  CREATE TABLE user_roles (
  user_role_id SERIAL PRIMARY KEY,
  username varchar(20) NOT NULL,
  role varchar(20) NOT NULL,
  UNIQUE (username,role),
  FOREIGN KEY (username) REFERENCES users (username)
  );
  
  --201807
  alter table "Medicine" add column "detail_en" VARCHAR(500);
  alter table "Medicine" add column "detail_ch" VARCHAR(500);
  
  --20180822
  CREATE TABLE "PriceSystem"(
  "system_id" INTEGER PRIMARY KEY,
  "name" VARCHAR(10) NOT NULL, "consultation_fee" DECIMAL(100,2) NOT NULL
  , "per_dose_price" DECIMAL(100,2) NOT NULL, "extra_dose_fee" DECIMAL(100,2) NOT NULL, "dosage_limit" DECIMAL(100,2) NOT NULL,
  "effective_date" DATE NOT NULL, enabled boolean NOT NULL DEFAULT FALSE, UNIQUE("name","effective_date"));
  
  --Reset sequence number
  ALTER SEQUENCE medicine_id_seq RESTART with 400; 
 
 --20180823
 alter table "PriceList" add column "system_id" INTEGER DEFAULT 1;
 alter table "PriceList" DROP CONSTRAINT "PriceList_pkey";
 alter table "PriceList" Add PRIMARY KEY (category, system_id);
 
 --v1.3
 --20180829
   CREATE SEQUENCE file_id_seq;
   
   CREATE TABLE "CaseAttachment"(
  "file_id" INTEGER NOT NULL DEFAULT nextval('file_id_seq') PRIMARY KEY,
  "file_name" VARCHAR(100) NOT NULL, 
  "file_type" VARCHAR(100) NOT NULL, 
  "content" BYTEA NOT NULL,
  "case_id" INTEGER NOT NULL,
  FOREIGN KEY ("case_id") REFERENCES "Cases" ("caseID")
  );
  
--v1.4
--20180928
alter table "Customers" add column "name_en" VARCHAR(100);
alter table "Cases" add column "receiptRemark" VARCHAR(100);
alter table "Cases" add column "followupRemark" VARCHAR(100);
alter table "Cases" add column "certRemark" VARCHAR(100);

--v1.4
--20181005
CREATE SEQUENCE log_id_seq;

  CREATE TABLE audit_log (
  "log_id" INTEGER DEFAULT nextval('log_id_seq') PRIMARY KEY,
  "username" varchar(20) NOT NULL,
  "action" varchar(20) NOT NULL,
  "time" timestamp with time zone DEFAULT now(),
  "remark" varchar(250) NOT NULL,
  "case_id" INTEGER,
  "text1" VARCHAR(100),
  "text2" VARCHAR(100),
  "text3" VARCHAR(100),
  "date1" date,
  "date2" date,
  "date3" date,
  "number1" numeric(50,2),
  "number2" numeric(50,2),
  "number3" numeric(50,2),
  FOREIGN KEY (username) REFERENCES users (username),
  FOREIGN KEY (case_id) REFERENCES "Cases" ("caseID")
  );
  
--v1.5
--20181015
alter table "Cases" add column "reportRemark" VARCHAR(100);

CREATE TABLE "CaseStatistic"(
"caseID" INTEGER NOT NULL,
"type" VARCHAR(50) NOT NULL,
"startDate" date,
"endDate" date,
"effect" INTEGER,
PRIMARY KEY("caseID","type")
);

--user roles
INSERT INTO users(username,password,enabled) VALUES ('tilen','tilen2018', true);
INSERT INTO users(username,password,enabled) VALUES ('ziv','ziv2018', true);
INSERT INTO users(username,password,enabled) VALUES ('opa','abcd1234', true);
INSERT INTO users(username,password,enabled) VALUES ('ziv2','ziv2019', true);
INSERT INTO users(username,password,enabled) VALUES ('doc','doc2019', true);

INSERT INTO user_roles (username, role) VALUES ('tilen', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role) VALUES ('ziv', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role) VALUES ('opa', 'ROLE_OPA');
INSERT INTO user_roles (username, role) VALUES ('ziv2', 'ROLE_DOC');
INSERT INTO user_roles (username, role) VALUES ('doc', 'ROLE_DOC');

--release4b
alter table users add column "report_name" VARCHAR(50);
alter table users add column "report_name_en" VARCHAR(50);
alter table users add column "register_no" VARCHAR(20);

update users set report_name='嚴允材',report_name_en='Yim Wan Choi',register_no='005410' where username='ziv2';
update users set report_name='陳大夫',report_name_en='Chan Tai Fu',register_no='003333' where username='doc';

alter table "CaseStatistic" add column "reset" boolean NOT NULL DEFAULT true;
alter table "CaseStatistic" drop column "startDate";
alter table "CaseStatistic" drop column "endDate";

--access right
grant select on ALL TABLES in schema public to jianzhi;
grant insert on ALL TABLES in schema public to jianzhi;
grant update on ALL TABLES in schema public to jianzhi;
grant delete on ALL TABLES in schema public to jianzhi;

grant select on ALL SEQUENCES in schema public to jianzhi;
grant update on ALL SEQUENCES in schema public to jianzhi;