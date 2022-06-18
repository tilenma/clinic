CREATE SEQUENCE public.file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public."CaseAttachment" (
    file_id integer DEFAULT nextval('public.file_id_seq'::regclass) NOT NULL,
    file_name character varying(100) NOT NULL,
    file_type character varying(100) NOT NULL,
    content bytea NOT NULL,
    case_id integer NOT NULL
);

CREATE TABLE public."CaseMedicine" (
    "caseID" integer NOT NULL,
    name character varying(50) NOT NULL,
    unit numeric(50,2),
    remark character varying(250),
    type character varying(20) NOT NULL,
    unit2 character varying(5) DEFAULT 'g'::character varying NOT NULL
);

CREATE TABLE public."CaseRemark" (
    "caseID" integer NOT NULL,
    type character varying(50) NOT NULL,
    description character varying(250)
);


CREATE TABLE public."CaseStatistic" (
    "caseID" integer NOT NULL,
    type character varying(50) NOT NULL,
    effect integer,
    reset boolean DEFAULT true NOT NULL
);

CREATE SEQUENCE public.case_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE public."Cases" (
    "caseID" integer DEFAULT nextval('public.case_id_seq'::regclass) NOT NULL,
    "customerID" integer,
    date date,
    problem character varying(100),
    "coldHot" character varying(100),
    sweat character varying(100),
    head character varying(100),
    month character varying(100),
    body character varying(100),
    poo character varying(100),
    pee character varying(100),
    drink character varying(100),
    eat character varying(100),
    abdomen character varying(100),
    hearing character varying(100),
    menstruation character varying(200),
    sleep character varying(100),
    "tongueColor" character varying(200),
    pulse character varying(200),
    sickness character varying(100),
    diagnosis character varying(100),
    theory character varying(100),
    "createTime" timestamp(0) without time zone DEFAULT now(),
    dosage integer,
    "dosageMethod" character varying(100),
    "dosageRemark" character varying(100),
    skin character varying(100),
    "tongueLayer" character varying(100),
    "dosageRecomment" character varying(100),
    "tongueShape" character varying(100),
    "tongueStatus" character varying(100),
    price numeric(100,2),
    "dosePrice" numeric(100,2),
    "consultationFee" boolean,
    redispense integer,
    expirydate date,
    search_right character varying(200) DEFAULT 'ALL'::character varying NOT NULL,
    view_right character varying(200) DEFAULT 'ALL'::character varying NOT NULL,
    edit_right character varying(200) DEFAULT 'ALL'::character varying NOT NULL,
    "receiptRemark" character varying(100),
    "followupRemark" character varying(100),
    "certRemark" character varying(100),
    "reportRemark" character varying(100),
    confirm boolean DEFAULT false NOT NULL,
    confirm_user character varying(20)
);

CREATE SEQUENCE public.customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public."Customers" (
    "customerID" integer DEFAULT nextval('public.customer_id_seq'::regclass) NOT NULL,
    "mobileNumber" character varying(100),
    name character varying(100) NOT NULL,
    email character varying(100),
    "maritalStatus" character varying(100),
    occupation character varying(100),
    "sickHistory" character varying(500),
    "createDate" date,
    gender character varying(100),
    "dateOfBirth" date,
    relationship character varying(100),
    note character varying(500),
    "documentID" character varying(100),
    allergy character varying(100),
    address character varying(100),
    privacy integer DEFAULT 1 NOT NULL,
    name_en character varying(100)
);

CREATE SEQUENCE public.medicine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public."Medicine" (
    "ID" integer DEFAULT nextval('public.medicine_id_seq'::regclass) NOT NULL,
    code character varying(100),
    type character varying(100),
    name character varying(100) NOT NULL,
    "priceCategory" character varying(10),
    "order" integer,
    "referenceUnit" numeric(50,2),
    barcode character varying(100),
    taste character varying(200),
    meridian character varying(200),
    effect character varying(200),
    contraint character varying(200),
    usage character varying(500),
    content character varying(500),
    detail_en character varying(500),
    detail_ch character varying(500)
);

CREATE TABLE public."PriceCategory" (
    category character varying(10) NOT NULL,
    weight numeric(50,2)
);


CREATE TABLE public."PriceList" (
    category character varying(10) NOT NULL,
    price numeric(100,2),
    price2 numeric(100,2),
    system_id integer DEFAULT 1 NOT NULL
);

CREATE TABLE public."PriceSystem" (
    system_id integer NOT NULL,
    name character varying(10) NOT NULL,
    consultation_fee numeric(100,2) NOT NULL,
    per_dose_price numeric(100,2) NOT NULL,
    extra_dose_fee numeric(100,2) NOT NULL,
    dosage_limit numeric(100,2) NOT NULL,
    effective_date date NOT NULL,
    enabled boolean DEFAULT false NOT NULL
);

CREATE TABLE public."Security" (
    "user" character varying(50) NOT NULL,
    privacy integer DEFAULT 1 NOT NULL
);

CREATE SEQUENCE public.symptom_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public."Symptoms" (
    "symptomID" integer DEFAULT nextval('public.symptom_id_seq'::regclass) NOT NULL,
    type character varying(100),
    level integer,
    description character varying(100)
);

CREATE TABLE public."Types" (
    type character varying(100) NOT NULL,
    value character varying(29) NOT NULL,
    "order" integer
);

CREATE TABLE public."Units" (
    type character varying(100) NOT NULL,
    value numeric(50,2) NOT NULL
);

CREATE VIEW public."View_Cases" AS
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
    c.confirm,
    c.confirm_user,
    t.name AS customer
   FROM public."Cases" c,
    public."Customers" t
  WHERE (t."customerID" = c."customerID");

CREATE VIEW public."View_Customers" AS
 SELECT "Customers"."customerID",
    "Customers"."mobileNumber",
    "Customers".name,
    "Customers".email,
    "Customers"."maritalStatus",
    "Customers".occupation,
    "Customers"."sickHistory",
    "Customers"."createDate",
    "Customers".gender,
    "Customers"."dateOfBirth",
    "Customers".relationship,
    "Customers".note,
    "Customers"."documentID",
    "Customers".allergy,
    "Customers".address,
    (date_part('year'::text, ('now'::text)::date) - date_part('year'::text, "Customers"."dateOfBirth")) AS age
   FROM public."Customers";

CREATE SEQUENCE public.log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.audit_log (
    log_id integer DEFAULT nextval('public.log_id_seq'::regclass) NOT NULL,
    username character varying(20) NOT NULL,
    action character varying(20) NOT NULL,
    "time" timestamp with time zone DEFAULT now(),
    remark character varying(250) NOT NULL,
    case_id integer,
    text1 character varying(100),
    text2 character varying(100),
    text3 character varying(100),
    date1 date,
    date2 date,
    date3 date,
    number1 numeric(50,2),
    number2 numeric(50,2),
    number3 numeric(50,2)
);

CREATE TABLE public.system_parameter (
    "group" character varying(50) NOT NULL,
    key character varying(50) NOT NULL,
    description character varying(250),
    type character varying(2),
    text_value character varying(250),
    numeric_value numeric(100,2),
    date_value date
);

CREATE TABLE public.user_roles (
    user_role_id integer NOT NULL,
    username character varying(20) NOT NULL,
    role character varying(20) NOT NULL
);


CREATE SEQUENCE public.user_roles_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.users (
    username character varying(20) NOT NULL,
    password character varying(60) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    register_no character varying(20),
    report_name character varying(50),
    report_name_en character varying(50)
);


ALTER TABLE ONLY public.user_roles ALTER COLUMN user_role_id SET DEFAULT nextval('public.user_roles_user_role_id_seq'::regclass);







--
-- TOC entry 2126 (class 2606 OID 57746)
-- Name: CaseMedicine CaseMedicine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CaseMedicine"
    ADD CONSTRAINT "CaseMedicine_pkey" PRIMARY KEY ("caseID", name, type);


--
-- TOC entry 2128 (class 2606 OID 57748)
-- Name: CaseRemark CaseRemark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CaseRemark"
    ADD CONSTRAINT "CaseRemark_pkey" PRIMARY KEY ("caseID", type);


--
-- TOC entry 2130 (class 2606 OID 57750)
-- Name: CaseStatistic CaseStatistic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CaseStatistic"
    ADD CONSTRAINT "CaseStatistic_pkey" PRIMARY KEY ("caseID", type);


--
-- TOC entry 2132 (class 2606 OID 57752)
-- Name: Cases Cases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cases"
    ADD CONSTRAINT "Cases_pkey" PRIMARY KEY ("caseID");


--
-- TOC entry 2134 (class 2606 OID 57754)
-- Name: Customers Customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customers"
    ADD CONSTRAINT "Customers_pkey" PRIMARY KEY ("customerID");


--
-- TOC entry 2138 (class 2606 OID 57758)
-- Name: Medicine Medicine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medicine"
    ADD CONSTRAINT "Medicine_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2140 (class 2606 OID 57760)
-- Name: PriceCategory PriceCategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PriceCategory"
    ADD CONSTRAINT "PriceCategory_pkey" PRIMARY KEY (category);


--
-- TOC entry 2142 (class 2606 OID 57762)
-- Name: PriceList PriceList_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PriceList"
    ADD CONSTRAINT "PriceList_pkey" PRIMARY KEY (category, system_id);


--
-- TOC entry 2144 (class 2606 OID 57764)
-- Name: PriceSystem PriceSystem_name_effective_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PriceSystem"
    ADD CONSTRAINT "PriceSystem_name_effective_date_key" UNIQUE (name, effective_date);


--
-- TOC entry 2146 (class 2606 OID 57766)
-- Name: PriceSystem PriceSystem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PriceSystem"
    ADD CONSTRAINT "PriceSystem_pkey" PRIMARY KEY (system_id);


--
-- TOC entry 2148 (class 2606 OID 57768)
-- Name: Security Security_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Security"
    ADD CONSTRAINT "Security_pkey" PRIMARY KEY ("user");


--
-- TOC entry 2150 (class 2606 OID 57770)
-- Name: Symptoms Symptoms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Symptoms"
    ADD CONSTRAINT "Symptoms_pkey" PRIMARY KEY ("symptomID");


--
-- TOC entry 2152 (class 2606 OID 57772)
-- Name: Types Types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Types"
    ADD CONSTRAINT "Types_pkey" PRIMARY KEY (type, value);


--
-- TOC entry 2154 (class 2606 OID 57774)
-- Name: Units Units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Units"
    ADD CONSTRAINT "Units_pkey" PRIMARY KEY (type, value);


--
-- TOC entry 2156 (class 2606 OID 57776)
-- Name: audit_log audit_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_log
    ADD CONSTRAINT audit_log_pkey PRIMARY KEY (log_id);


--
-- TOC entry 2158 (class 2606 OID 57778)
-- Name: system_parameter system_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_parameter
    ADD CONSTRAINT system_parameter_pkey PRIMARY KEY ("group", key);


--
-- TOC entry 2160 (class 2606 OID 57780)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_role_id);


--
-- TOC entry 2162 (class 2606 OID 57782)
-- Name: user_roles user_roles_username_role_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_username_role_key UNIQUE (username, role);


--
-- TOC entry 2164 (class 2606 OID 57784)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- TOC entry 2165 (class 2606 OID 57785)
-- Name: CaseAttachment CaseAttachment_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CaseAttachment"
    ADD CONSTRAINT "CaseAttachment_case_id_fkey" FOREIGN KEY (case_id) REFERENCES public."Cases"("caseID");


--
-- TOC entry 2167 (class 2606 OID 57790)
-- Name: audit_log audit_log_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_log
    ADD CONSTRAINT audit_log_case_id_fkey FOREIGN KEY (case_id) REFERENCES public."Cases"("caseID");


--
-- TOC entry 2168 (class 2606 OID 57795)
-- Name: audit_log audit_log_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_log
    ADD CONSTRAINT audit_log_username_fkey FOREIGN KEY (username) REFERENCES public.users(username);


--
-- TOC entry 2166 (class 2606 OID 57800)
-- Name: PriceList pricelistfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PriceList"
    ADD CONSTRAINT pricelistfk FOREIGN KEY (system_id) REFERENCES public."PriceSystem"(system_id);


--
-- TOC entry 2169 (class 2606 OID 57805)
-- Name: user_roles user_roles_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_username_fkey FOREIGN KEY (username) REFERENCES public.users(username);


