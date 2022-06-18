CREATE SEQUENCE case_id_seq;
CREATE SEQUENCE symptom_id_seq;
CREATE SEQUENCE customer_id_seq;
CREATE SEQUENCE medicine_id_seq;

CREATE TABLE "Cases"("caseID" INTEGER NOT NULL DEFAULT nextval('case_id_seq') PRIMARY KEY,"customerID" INTEGER,"date" DATE,"problem" VARCHAR(100),"coldHot" VARCHAR(100),"sweat" VARCHAR(100),"head" VARCHAR(100),"month" VARCHAR(100),"body" VARCHAR(100),"poo" VARCHAR(100),"pee" VARCHAR(100),"drink" VARCHAR(100),"eat" VARCHAR(100),"abdomen" VARCHAR(100),"hearing" VARCHAR(100),"menstruation" VARCHAR(200),"sleep" VARCHAR(100),"tongueColor" VARCHAR(200),"pulse" VARCHAR(200),"sickness" VARCHAR(100),"diagnosis" VARCHAR(100),"theory" VARCHAR(100),"createTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,"dosage" INTEGER,"dosageMethod" VARCHAR(100),"dosageRemark" VARCHAR(100),"skin" VARCHAR(100),"tongueLayer" VARCHAR(100),"dosageRecomment" VARCHAR(100),"tongueShape" VARCHAR(100),"tongueStatus" VARCHAR(100),"price" DECIMAL(100,2),"dosePrice" DECIMAL(100,2),"consultationFee" BOOLEAN, "redispense" INTEGER, "expirydate" DATE);

CREATE TABLE "CaseRemark"("caseID" INTEGER NOT NULL,"type" VARCHAR(50) NOT NULL,"description" VARCHAR(250),PRIMARY KEY("caseID","type"));

CREATE TABLE "Symptoms"("symptomID" INTEGER DEFAULT nextval('symptom_id_seq') NOT NULL PRIMARY KEY,"type" VARCHAR(100),"level" INTEGER,"description" VARCHAR(100));

CREATE TABLE "Customers"("customerID" INTEGER DEFAULT nextval('customer_id_seq') NOT NULL PRIMARY KEY,"mobileNumber" VARCHAR(100),"name" VARCHAR(100) NOT NULL,"email" VARCHAR(100),"maritalStatus" VARCHAR(100),"occupation" VARCHAR(100),"sickHistory" VARCHAR(500),"createDate" DATE,"gender" VARCHAR(100),"dateOfBirth" DATE,"relationship" VARCHAR(100),"note" VARCHAR(500),"documentID" VARCHAR(100),"allergy" VARCHAR(100),"address" VARCHAR(100));

alter table "Customers" add column "privacy" INTEGER NOT NULL DEFAULT 1;

CREATE TABLE "Medicine"("ID" INTEGER DEFAULT nextval('medicine_id_seq') NOT NULL PRIMARY KEY,"code" VARCHAR(100),"type" VARCHAR(100),"name" VARCHAR(100) NOT NULL,"priceCategory" VARCHAR(10),"order" INTEGER,"referenceUnit" numeric(50,2));

--4.3.2
alter table "Medicine" add column "barcode" VARCHAR(100);
alter table "Medicine" add column "taste" VARCHAR(200);
alter table "Medicine" add column "meridian" VARCHAR(200);
alter table "Medicine" add column "effect" VARCHAR(200);
alter table "Medicine" add column "contraint" VARCHAR(200);
alter table "Medicine" add column "usage" VARCHAR(500);

CREATE TABLE "Filters"("table" VARCHAR(50) NOT NULL,"column" VARCHAR(100) NOT NULL,"value" VARCHAR(100),PRIMARY KEY("table","column"));
CREATE TABLE "Units"("type" VARCHAR(100) NOT NULL,"value" numeric(50,2) NOT NULL,PRIMARY KEY("type","value"));
CREATE TABLE "PriceList"("category" VARCHAR(10) NOT NULL PRIMARY KEY,"price" DECIMAL(100,2),"price2" DECIMAL(100,2));
CREATE TABLE "Types"("type" VARCHAR(100) NOT NULL,"value" VARCHAR(29) NOT NULL,"order" INTEGER,PRIMARY KEY("type","value"));
CREATE TABLE "CaseMedicine"("caseID" INTEGER NOT NULL,"name" VARCHAR(50) NOT NULL,"unit" numeric(50,2),"remark" VARCHAR(250),"type" VARCHAR(20) NOT NULL,PRIMARY KEY("caseID","name","type"));
CREATE TABLE "PriceCategory"("category" VARCHAR(10) NOT NULL PRIMARY KEY,"weight" NUMERIC(50,2));

CREATE TABLE "Security"("user" VARCHAR(50) NOT NULL PRIMARY KEY,"privacy" INTEGER NOT NULL DEFAULT 1);

CREATE VIEW "View_Customers" ("customerID","mobileNumber","name","email","maritalStatus","occupation","sickHistory","createDate","gender","dateOfBirth","relationship","note","documentID","allergy","address","age") AS SELECT  "Customers"."customerID","Customers"."mobileNumber","Customers"."name","Customers"."email","Customers"."maritalStatus","Customers"."occupation","Customers"."sickHistory","Customers"."createDate","Customers"."gender","Customers"."dateOfBirth","Customers"."relationship","Customers"."note","Customers"."documentID","Customers"."allergy","Customers"."address",(DATE_PART('year',current_date::DATE)-DATE_PART('year',"dateOfBirth"::DATE)) "age"  FROM "Customers";

--4.7
--drop view "View_Cases"
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
    (rank() OVER (PARTITION BY to_char(c.date::timestamp with time zone, 'YYYYMMDD'::text) ORDER BY c."caseID"))+1000 AS rank,
	 CASE WHEN CURRENT_USER = 'kin' THEN '庾學堅  (註冊編號:005411)' ELSE '嚴允材 (註冊編號:005410)' END "user",
	 t."name" AS "customer"
   FROM "Cases" c, "Customers" t
   where t."customerID" = c."customerID" AND t."privacy" <= ( SELECT "privacy" FROM "Security" WHERE "Security"."user" = CURRENT_USER );
   
--4.6
-- DROP VIEW "View_CaseSpecialMedicine";
CREATE OR REPLACE VIEW "View_CaseSpecialMedicine" AS 
 SELECT g1."caseID",
    g1.type AS name,
    0.0 AS unit,
    '$'::text || g1.price::character varying::text AS remark,
    g1.type,
	'$'::text || g1.price::character varying::text AS code
   FROM ( SELECT DISTINCT cm."caseID",
            cm.type,
            pl.price
           FROM "CaseMedicine" cm,
            "PriceList" pl
          WHERE cm.type::text <> '藥'::text AND cm.type::text = pl.category::text) g1
UNION
 SELECT cm."caseID",
    cm.name,
    cm.unit,
    cm.remark,
    cm.type,
    (SELECT MIN( "Medicine"."code" ) FROM "Medicine" WHERE "Medicine"."name" LIKE TRIM ( BOTH FROM "cm"."name" )) as code
   FROM "CaseMedicine" cm
  WHERE cm.type::text = '藥'::text;

--web 1.0
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
    (rank() OVER (PARTITION BY to_char(c.date::timestamp with time zone, 'YYYYMMDD'::text) ORDER BY c."caseID"))+1000 AS rank,
	 CASE WHEN CURRENT_USER = 'kin' THEN '庾學堅  (註冊編號:005411)' ELSE '嚴允材 (註冊編號:005410)' END "user",
	 t."name" AS "customer"
   FROM "Cases" c, "Customers" t
   where t."customerID" = c."customerID" AND t."privacy" <=  COALESCE(( SELECT "privacy" FROM "Security" WHERE "Security"."user" = CURRENT_USER ),1);
   
 --4.9
alter table "Medicine" add column "content" VARCHAR(500);

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
 
 alter table "PriceList" Add CONSTRAINT PriceListFK FOREIGN KEY (system_id) REFERENCES "PriceSystem" (system_id);
 
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