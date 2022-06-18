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
  
  
grant select on ALL TABLES in schema public to jianzhi;
grant insert on ALL TABLES in schema public to jianzhi;
grant update on ALL TABLES in schema public to jianzhi;
grant delete on ALL TABLES in schema public to jianzhi;

grant select on ALL SEQUENCES in schema public to jianzhi;
grant update on ALL SEQUENCES in schema public to jianzhi;