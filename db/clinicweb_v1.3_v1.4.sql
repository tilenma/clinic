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
  
  
grant select on ALL TABLES in schema public to jianzhi;
grant insert on ALL TABLES in schema public to jianzhi;
grant update on ALL TABLES in schema public to jianzhi;
grant delete on ALL TABLES in schema public to jianzhi;

grant select on ALL SEQUENCES in schema public to jianzhi;
grant update on ALL SEQUENCES in schema public to jianzhi;