-- Table: public."CaseAttachment"

-- DROP TABLE public."CaseAttachment";

CREATE TABLE public."CaseAttachment"
(
    file_id integer NOT NULL DEFAULT nextval('file_id_seq'::regclass),
    file_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    file_type character varying(100) COLLATE pg_catalog."default" NOT NULL,
    content bytea NOT NULL,
    case_id integer NOT NULL,
    CONSTRAINT "CaseAttachment_pkey" PRIMARY KEY (file_id),
    CONSTRAINT "CaseAttachment_case_id_fkey" FOREIGN KEY (case_id)
        REFERENCES public."Cases" ("caseID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CaseAttachment"
    OWNER to postgres;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE public."CaseAttachment" TO jianzhi;

GRANT ALL ON TABLE public."CaseAttachment" TO postgres;

-- Table: public."CaseMedicine"

-- DROP TABLE public."CaseMedicine";

CREATE TABLE public."CaseMedicine"
(
    "caseID" integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    unit numeric(50,2),
    remark character varying(250) COLLATE pg_catalog."default",
    type character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "CaseMedicine_pkey" PRIMARY KEY ("caseID", name, type)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CaseMedicine"
    OWNER to postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."CaseMedicine" TO jianzhi;

GRANT ALL ON TABLE public."CaseMedicine" TO postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."CaseMedicine" TO ziv;

-- Table: public."CaseRemark"

-- DROP TABLE public."CaseRemark";

CREATE TABLE public."CaseRemark"
(
    "caseID" integer NOT NULL,
    type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    description character varying(250) COLLATE pg_catalog."default",
    CONSTRAINT "CaseRemark_pkey" PRIMARY KEY ("caseID", type)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CaseRemark"
    OWNER to postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."CaseRemark" TO jianzhi;

GRANT ALL ON TABLE public."CaseRemark" TO postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."CaseRemark" TO ziv;

-- Table: public."CaseStatistic"

-- DROP TABLE public."CaseStatistic";

CREATE TABLE public."CaseStatistic"
(
    "caseID" integer NOT NULL,
    type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "startDate" date,
    "endDate" date,
    effect integer,
    CONSTRAINT "CaseStatistic_pkey" PRIMARY KEY ("caseID", type)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CaseStatistic"
    OWNER to postgres;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE public."CaseStatistic" TO jianzhi;

GRANT ALL ON TABLE public."CaseStatistic" TO postgres;

-- Table: public."Cases"

-- DROP TABLE public."Cases";

CREATE TABLE public."Cases"
(
    "caseID" integer NOT NULL DEFAULT nextval('case_id_seq'::regclass),
    "customerID" integer,
    date date,
    problem character varying(100) COLLATE pg_catalog."default",
    "coldHot" character varying(100) COLLATE pg_catalog."default",
    sweat character varying(100) COLLATE pg_catalog."default",
    head character varying(100) COLLATE pg_catalog."default",
    month character varying(100) COLLATE pg_catalog."default",
    body character varying(100) COLLATE pg_catalog."default",
    poo character varying(100) COLLATE pg_catalog."default",
    pee character varying(100) COLLATE pg_catalog."default",
    drink character varying(100) COLLATE pg_catalog."default",
    eat character varying(100) COLLATE pg_catalog."default",
    abdomen character varying(100) COLLATE pg_catalog."default",
    hearing character varying(100) COLLATE pg_catalog."default",
    menstruation character varying(200) COLLATE pg_catalog."default",
    sleep character varying(100) COLLATE pg_catalog."default",
    "tongueColor" character varying(200) COLLATE pg_catalog."default",
    pulse character varying(200) COLLATE pg_catalog."default",
    sickness character varying(100) COLLATE pg_catalog."default",
    diagnosis character varying(100) COLLATE pg_catalog."default",
    theory character varying(100) COLLATE pg_catalog."default",
    "createTime" timestamp(0) without time zone DEFAULT now(),
    dosage integer,
    "dosageMethod" character varying(100) COLLATE pg_catalog."default",
    "dosageRemark" character varying(100) COLLATE pg_catalog."default",
    skin character varying(100) COLLATE pg_catalog."default",
    "tongueLayer" character varying(100) COLLATE pg_catalog."default",
    "dosageRecomment" character varying(100) COLLATE pg_catalog."default",
    "tongueShape" character varying(100) COLLATE pg_catalog."default",
    "tongueStatus" character varying(100) COLLATE pg_catalog."default",
    price numeric(100,2),
    "dosePrice" numeric(100,2),
    "consultationFee" boolean,
    redispense integer,
    expirydate date,
    search_right character varying(200) COLLATE pg_catalog."default" NOT NULL DEFAULT 'ALL'::character varying,
    view_right character varying(200) COLLATE pg_catalog."default" NOT NULL DEFAULT 'ALL'::character varying,
    edit_right character varying(200) COLLATE pg_catalog."default" NOT NULL DEFAULT 'ALL'::character varying,
    "receiptRemark" character varying(100) COLLATE pg_catalog."default",
    "followupRemark" character varying(100) COLLATE pg_catalog."default",
    "certRemark" character varying(100) COLLATE pg_catalog."default",
    "reportRemark" character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "Cases_pkey" PRIMARY KEY ("caseID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Cases"
    OWNER to postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."Cases" TO jianzhi;

GRANT ALL ON TABLE public."Cases" TO postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."Cases" TO ziv;


-- Table: public."Customers"

-- DROP TABLE public."Customers";

CREATE TABLE public."Customers"
(
    "customerID" integer NOT NULL DEFAULT nextval('customer_id_seq'::regclass),
    "mobileNumber" character varying(100) COLLATE pg_catalog."default",
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default",
    "maritalStatus" character varying(100) COLLATE pg_catalog."default",
    occupation character varying(100) COLLATE pg_catalog."default",
    "sickHistory" character varying(500) COLLATE pg_catalog."default",
    "createDate" date,
    gender character varying(100) COLLATE pg_catalog."default",
    "dateOfBirth" date,
    relationship character varying(100) COLLATE pg_catalog."default",
    note character varying(500) COLLATE pg_catalog."default",
    "documentID" character varying(100) COLLATE pg_catalog."default",
    allergy character varying(100) COLLATE pg_catalog."default",
    address character varying(100) COLLATE pg_catalog."default",
    privacy integer NOT NULL DEFAULT 1,
    name_en character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "Customers_pkey" PRIMARY KEY ("customerID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Customers"
    OWNER to postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."Customers" TO jianzhi;

GRANT ALL ON TABLE public."Customers" TO postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."Customers" TO ziv;


-- Table: public."Medicine"

-- DROP TABLE public."Medicine";

CREATE TABLE public."Medicine"
(
    "ID" integer NOT NULL DEFAULT nextval('medicine_id_seq'::regclass),
    code character varying(100) COLLATE pg_catalog."default",
    type character varying(100) COLLATE pg_catalog."default",
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "priceCategory" character varying(10) COLLATE pg_catalog."default",
    "order" integer,
    "referenceUnit" numeric(50,2),
    barcode character varying(100) COLLATE pg_catalog."default",
    taste character varying(200) COLLATE pg_catalog."default",
    meridian character varying(200) COLLATE pg_catalog."default",
    effect character varying(200) COLLATE pg_catalog."default",
    contraint character varying(200) COLLATE pg_catalog."default",
    usage character varying(500) COLLATE pg_catalog."default",
    content character varying(500) COLLATE pg_catalog."default",
    detail_en character varying(500) COLLATE pg_catalog."default",
    detail_ch character varying(500) COLLATE pg_catalog."default",
    CONSTRAINT "Medicine_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Medicine"
    OWNER to postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."Medicine" TO jianzhi;

GRANT ALL ON TABLE public."Medicine" TO postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."Medicine" TO ziv;

-- Table: public."PriceCategory"

-- DROP TABLE public."PriceCategory";

CREATE TABLE public."PriceCategory"
(
    category character varying(10) COLLATE pg_catalog."default" NOT NULL,
    weight numeric(50,2),
    CONSTRAINT "PriceCategory_pkey" PRIMARY KEY (category)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PriceCategory"
    OWNER to postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."PriceCategory" TO jianzhi;

GRANT ALL ON TABLE public."PriceCategory" TO postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."PriceCategory" TO ziv;

-- Table: public."PriceList"

-- DROP TABLE public."PriceList";

CREATE TABLE public."PriceList"
(
    category character varying(10) COLLATE pg_catalog."default" NOT NULL,
    price numeric(100,2),
    price2 numeric(100,2),
    system_id integer NOT NULL DEFAULT 1,
    CONSTRAINT "PriceList_pkey" PRIMARY KEY (category, system_id),
    CONSTRAINT pricelistfk FOREIGN KEY (system_id)
        REFERENCES public."PriceSystem" (system_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PriceList"
    OWNER to postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."PriceList" TO jianzhi;

GRANT ALL ON TABLE public."PriceList" TO postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."PriceList" TO ziv;

-- Table: public."PriceSystem"

-- DROP TABLE public."PriceSystem";

CREATE TABLE public."PriceSystem"
(
    system_id integer NOT NULL,
    name character varying(10) COLLATE pg_catalog."default" NOT NULL,
    consultation_fee numeric(100,2) NOT NULL,
    per_dose_price numeric(100,2) NOT NULL,
    extra_dose_fee numeric(100,2) NOT NULL,
    dosage_limit numeric(100,2) NOT NULL,
    effective_date date NOT NULL,
    enabled boolean NOT NULL DEFAULT false,
    CONSTRAINT "PriceSystem_pkey" PRIMARY KEY (system_id),
    CONSTRAINT "PriceSystem_name_effective_date_key" UNIQUE (name, effective_date)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PriceSystem"
    OWNER to postgres;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE public."PriceSystem" TO jianzhi;

GRANT ALL ON TABLE public."PriceSystem" TO postgres;

-- Table: public."Symptoms"

-- DROP TABLE public."Symptoms";

CREATE TABLE public."Symptoms"
(
    "symptomID" integer NOT NULL DEFAULT nextval('symptom_id_seq'::regclass),
    type character varying(100) COLLATE pg_catalog."default",
    level integer,
    description character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "Symptoms_pkey" PRIMARY KEY ("symptomID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Symptoms"
    OWNER to postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."Symptoms" TO jianzhi;

GRANT ALL ON TABLE public."Symptoms" TO postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."Symptoms" TO ziv;

-- Table: public."Types"

-- DROP TABLE public."Types";

CREATE TABLE public."Types"
(
    type character varying(100) COLLATE pg_catalog."default" NOT NULL,
    value character varying(29) COLLATE pg_catalog."default" NOT NULL,
    "order" integer,
    CONSTRAINT "Types_pkey" PRIMARY KEY (type, value)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Types"
    OWNER to postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."Types" TO jianzhi;

GRANT ALL ON TABLE public."Types" TO postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."Types" TO ziv;

-- Table: public."Units"

-- DROP TABLE public."Units";

CREATE TABLE public."Units"
(
    type character varying(100) COLLATE pg_catalog."default" NOT NULL,
    value numeric(50,2) NOT NULL,
    CONSTRAINT "Units_pkey" PRIMARY KEY (type, value)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Units"
    OWNER to postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."Units" TO jianzhi;

GRANT ALL ON TABLE public."Units" TO postgres;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE public."Units" TO ziv;

-- Table: public.audit_log

-- DROP TABLE public.audit_log;

CREATE TABLE public.audit_log
(
    log_id integer NOT NULL DEFAULT nextval('log_id_seq'::regclass),
    username character varying(20) COLLATE pg_catalog."default" NOT NULL,
    action character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "time" timestamp with time zone DEFAULT now(),
    remark character varying(250) COLLATE pg_catalog."default" NOT NULL,
    case_id integer,
    text1 character varying(100) COLLATE pg_catalog."default",
    text2 character varying(100) COLLATE pg_catalog."default",
    text3 character varying(100) COLLATE pg_catalog."default",
    date1 date,
    date2 date,
    date3 date,
    number1 numeric(50,2),
    number2 numeric(50,2),
    number3 numeric(50,2),
    CONSTRAINT audit_log_pkey PRIMARY KEY (log_id),
    CONSTRAINT audit_log_case_id_fkey FOREIGN KEY (case_id)
        REFERENCES public."Cases" ("caseID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT audit_log_username_fkey FOREIGN KEY (username)
        REFERENCES public.users (username) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.audit_log
    OWNER to postgres;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE public.audit_log TO jianzhi;

GRANT ALL ON TABLE public.audit_log TO postgres;

-- Table: public.system_parameter

-- DROP TABLE public.system_parameter;

CREATE TABLE public.system_parameter
(
    "group" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    key character varying(50) COLLATE pg_catalog."default" NOT NULL,
    description character varying(250) COLLATE pg_catalog."default",
    type character varying(2) COLLATE pg_catalog."default",
    text_value character varying(250) COLLATE pg_catalog."default",
    numeric_value numeric(100,2),
    date_value date,
    CONSTRAINT system_parameter_pkey PRIMARY KEY ("group", key)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.system_parameter
    OWNER to postgres;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE public.system_parameter TO jianzhi;

GRANT ALL ON TABLE public.system_parameter TO postgres;

-- Table: public.user_roles

-- DROP TABLE public.user_roles;

CREATE TABLE public.user_roles
(
    user_role_id integer NOT NULL DEFAULT nextval('user_roles_user_role_id_seq'::regclass),
    username character varying(20) COLLATE pg_catalog."default" NOT NULL,
    role character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT user_roles_pkey PRIMARY KEY (user_role_id),
    CONSTRAINT user_roles_username_role_key UNIQUE (username, role),
    CONSTRAINT user_roles_username_fkey FOREIGN KEY (username)
        REFERENCES public.users (username) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.user_roles
    OWNER to postgres;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE public.user_roles TO jianzhi;

GRANT ALL ON TABLE public.user_roles TO postgres;

-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
    username character varying(20) COLLATE pg_catalog."default" NOT NULL,
    password character varying(60) COLLATE pg_catalog."default" NOT NULL,
    enabled boolean NOT NULL DEFAULT false,
    CONSTRAINT users_pkey PRIMARY KEY (username)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to postgres;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE public.users TO jianzhi;

GRANT ALL ON TABLE public.users TO postgres;