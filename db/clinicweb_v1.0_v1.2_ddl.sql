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
  