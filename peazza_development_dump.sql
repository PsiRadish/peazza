--
-- PostgreSQL database dump
-- 
-- `rake db:schema:load` should do most of the same work.
-- Just figure out how to run the COPY commands, those actually populate tables with data.
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: Radish; Tablespace: 
--

CREATE TABLE accounts (
    id integer NOT NULL,
    email character varying(255),
    password_digest character varying(255),
    person_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE accounts OWNER TO "Radish";

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: Radish
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accounts_id_seq OWNER TO "Radish";

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Radish
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: Radish; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    account_id integer,
    name character varying(255),
    location_street_address character varying(255),
    location_city character varying(255),
    location_state character varying(12),
    location_zip character varying(9),
    date timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE events OWNER TO "Radish";

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: Radish
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_id_seq OWNER TO "Radish";

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Radish
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: friendships; Type: TABLE; Schema: public; Owner: Radish; Tablespace: 
--

CREATE TABLE friendships (
    id integer NOT NULL,
    friender_id integer,
    friend_id integer
);


ALTER TABLE friendships OWNER TO "Radish";

--
-- Name: friendships_id_seq; Type: SEQUENCE; Schema: public; Owner: Radish
--

CREATE SEQUENCE friendships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE friendships_id_seq OWNER TO "Radish";

--
-- Name: friendships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Radish
--

ALTER SEQUENCE friendships_id_seq OWNED BY friendships.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: Radish; Tablespace: 
--

CREATE TABLE people (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE people OWNER TO "Radish";

--
-- Name: people_hate_toppings; Type: TABLE; Schema: public; Owner: Radish; Tablespace: 
--

CREATE TABLE people_hate_toppings (
    person_id integer,
    topping_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE people_hate_toppings OWNER TO "Radish";

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: Radish
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE people_id_seq OWNER TO "Radish";

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Radish
--

ALTER SEQUENCE people_id_seq OWNED BY people.id;


--
-- Name: people_meh_toppings; Type: TABLE; Schema: public; Owner: Radish; Tablespace: 
--

CREATE TABLE people_meh_toppings (
    person_id integer,
    topping_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE people_meh_toppings OWNER TO "Radish";

--
-- Name: people_need_toppings; Type: TABLE; Schema: public; Owner: Radish; Tablespace: 
--

CREATE TABLE people_need_toppings (
    person_id integer,
    topping_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE people_need_toppings OWNER TO "Radish";

--
-- Name: people_want_toppings; Type: TABLE; Schema: public; Owner: Radish; Tablespace: 
--

CREATE TABLE people_want_toppings (
    person_id integer,
    topping_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE people_want_toppings OWNER TO "Radish";

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Radish; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "Radish";

--
-- Name: toppings; Type: TABLE; Schema: public; Owner: Radish; Tablespace: 
--

CREATE TABLE toppings (
    id integer NOT NULL,
    name character varying(255),
    category character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE toppings OWNER TO "Radish";

--
-- Name: toppings_id_seq; Type: SEQUENCE; Schema: public; Owner: Radish
--

CREATE SEQUENCE toppings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE toppings_id_seq OWNER TO "Radish";

--
-- Name: toppings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Radish
--

ALTER SEQUENCE toppings_id_seq OWNED BY toppings.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Radish
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Radish
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Radish
--

ALTER TABLE ONLY friendships ALTER COLUMN id SET DEFAULT nextval('friendships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Radish
--

ALTER TABLE ONLY people ALTER COLUMN id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Radish
--

ALTER TABLE ONLY toppings ALTER COLUMN id SET DEFAULT nextval('toppings_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: Radish
--

COPY accounts (id, email, password_digest, person_id, created_at, updated_at) FROM stdin;
1	okay@thelastofus.com	$2a$10$3e2eYrThhKJW9.uauaoBeeEsWQNTIaRvaF1LbKOiEHd3FwiaIwE0a	1	2015-07-28 11:26:35.132958	2015-07-28 11:26:35.132958
2	chloe@soldats.org	$2a$10$BImu2V5v1/wToeS5/ZvpYeU/Yx.Rtdfkb56Q3yyfUCR7tSs124OVO	2	2015-07-28 17:46:49.98928	2015-07-28 17:46:49.98928
3	woobie@noir.com	$2a$10$5TaiCyXMZ/0lSpG4ihih.uU9BfVOdHEkUvyk2vMhryjsHQyeKedX6	3	2015-07-28 19:13:30.848483	2015-07-28 19:13:30.848483
4	tsundere@noir.com	$2a$10$6V81MLe5rQ..mFLzus2OoeyEn5uDcO2BoTskYsBD2P78Iv2.FwYC.	4	2015-07-28 19:28:23.980336	2015-07-28 19:28:23.980336
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Radish
--

SELECT pg_catalog.setval('accounts_id_seq', 4, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: Radish
--

COPY events (id, account_id, name, location_street_address, location_city, location_state, location_zip, date, created_at, updated_at) FROM stdin;
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Radish
--

SELECT pg_catalog.setval('events_id_seq', 1, false);


--
-- Data for Name: friendships; Type: TABLE DATA; Schema: public; Owner: Radish
--

COPY friendships (id, friender_id, friend_id) FROM stdin;
1	2	3
2	4	3
3	3	4
\.


--
-- Name: friendships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Radish
--

SELECT pg_catalog.setval('friendships_id_seq', 3, true);


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: Radish
--

COPY people (id, name, created_at, updated_at) FROM stdin;
1	Ellie_KnifeGoddess	2015-07-28 11:31:08.513098	2015-07-28 11:31:08.513098
3	Kirika Yuumura	2015-07-28 19:12:33.089447	2015-07-28 19:12:33.089447
2	OMG Fork ^_^	2015-07-28 17:33:42.283988	2015-07-28 17:33:42.283988
4	Daughter of Corsica	2015-07-28 19:24:17.731465	2015-07-28 19:24:17.731465
\.


--
-- Data for Name: people_hate_toppings; Type: TABLE DATA; Schema: public; Owner: Radish
--

COPY people_hate_toppings (person_id, topping_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Radish
--

SELECT pg_catalog.setval('people_id_seq', 4, true);


--
-- Data for Name: people_meh_toppings; Type: TABLE DATA; Schema: public; Owner: Radish
--

COPY people_meh_toppings (person_id, topping_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: people_need_toppings; Type: TABLE DATA; Schema: public; Owner: Radish
--

COPY people_need_toppings (person_id, topping_id, created_at, updated_at) FROM stdin;
1	2	2015-07-29 02:59:04.929493	2015-07-29 02:59:04.929493
2	2	2015-07-29 02:59:21.066719	2015-07-29 02:59:21.066719
3	2	2015-07-29 02:59:41.774195	2015-07-29 02:59:41.774195
4	2	2015-07-29 02:59:48.700895	2015-07-29 02:59:48.700895
4	3	2015-07-29 03:00:01.97065	2015-07-29 03:00:01.97065
3	3	2015-07-29 03:00:08.761694	2015-07-29 03:00:08.761694
2	3	2015-07-29 03:00:13.007746	2015-07-29 03:00:13.007746
1	3	2015-07-29 03:00:18.039014	2015-07-29 03:00:18.039014
\.


--
-- Data for Name: people_want_toppings; Type: TABLE DATA; Schema: public; Owner: Radish
--

COPY people_want_toppings (person_id, topping_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Radish
--

COPY schema_migrations (version) FROM stdin;
20150728103527
20150728103630
20150728105521
20150728111612
20150728171443
20150728194745
20150729022834
20150729041731
20150729043649
\.


--
-- Data for Name: toppings; Type: TABLE DATA; Schema: public; Owner: Radish
--

COPY toppings (id, name, category, created_at, updated_at) FROM stdin;
1	pepperoni	meat	2015-07-28 17:30:23.94506	2015-07-28 17:30:23.94506
3	red sauce	sauce	2015-07-29 02:56:32.595615	2015-07-29 02:56:32.595615
4	gluten-free	crust	2015-07-29 02:57:27.47288	2015-07-29 02:57:27.47288
2	mozzarella	cheese	2015-07-29 02:55:31.74337	2015-07-29 02:55:31.74337
6	provolone	cheese	2015-07-29 04:28:28.565355	2015-07-29 04:28:28.565355
7	cheddar	cheese	2015-07-29 04:28:28.591351	2015-07-29 04:28:28.591351
8	parmesan	cheese	2015-07-29 04:28:28.595355	2015-07-29 04:28:28.595355
9	white sauce	sauce	2015-07-29 04:28:28.599358	2015-07-29 04:28:28.599358
10	pesto sauce	sauce	2015-07-29 04:28:28.603357	2015-07-29 04:28:28.603357
11	Italian sausage	meat	2015-07-29 04:28:28.607352	2015-07-29 04:28:28.607352
12	salami	meat	2015-07-29 04:28:28.611358	2015-07-29 04:28:28.611358
13	meatball	meat	2015-07-29 04:28:28.615358	2015-07-29 04:28:28.615358
14	ham	meat	2015-07-29 04:28:28.619358	2015-07-29 04:28:28.619358
15	bacon	meat	2015-07-29 04:28:28.623359	2015-07-29 04:28:28.623359
16	chicken	meat	2015-07-29 04:28:28.627359	2015-07-29 04:28:28.627359
17	beef	meat	2015-07-29 04:28:28.630359	2015-07-29 04:28:28.630359
18	pork	meat	2015-07-29 04:28:28.634356	2015-07-29 04:28:28.634356
19	anchovies	meat	2015-07-29 04:28:28.638354	2015-07-29 04:28:28.638354
20	black olives	plant	2015-07-29 04:28:28.642354	2015-07-29 04:28:28.642354
21	mushrooms	plant	2015-07-29 04:28:28.64636	2015-07-29 04:28:28.64636
22	pineapple	plant	2015-07-29 04:28:28.65036	2015-07-29 04:28:28.65036
23	cherry peppers	plant	2015-07-29 04:28:28.65336	2015-07-29 04:28:28.65336
24	red onions	plant	2015-07-29 04:28:28.657361	2015-07-29 04:28:28.657361
25	spinach	plant	2015-07-29 04:28:28.661361	2015-07-29 04:28:28.661361
26	diced roma tomatoes	plant	2015-07-29 04:28:28.665361	2015-07-29 04:28:28.665361
27	sliced jalapeño peppers	plant	2015-07-29 04:28:28.669362	2015-07-29 04:28:28.669362
28	green bell peppers	plant	2015-07-29 04:28:28.673356	2015-07-29 04:28:28.673356
29	sliced banana peppers	plant	2015-07-29 04:28:28.677363	2015-07-29 04:28:28.677363
\.


--
-- Name: toppings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Radish
--

SELECT pg_catalog.setval('toppings_id_seq', 29, true);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: Radish; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: friendships_pkey; Type: CONSTRAINT; Schema: public; Owner: Radish; Tablespace: 
--

ALTER TABLE ONLY friendships
    ADD CONSTRAINT friendships_pkey PRIMARY KEY (id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: Radish; Tablespace: 
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: toppings_pkey; Type: CONSTRAINT; Schema: public; Owner: Radish; Tablespace: 
--

ALTER TABLE ONLY toppings
    ADD CONSTRAINT toppings_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: Radish; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_accounts_on_person_id; Type: INDEX; Schema: public; Owner: Radish; Tablespace: 
--

CREATE INDEX index_accounts_on_person_id ON accounts USING btree (person_id);


--
-- Name: index_events_on_account_id; Type: INDEX; Schema: public; Owner: Radish; Tablespace: 
--

CREATE INDEX index_events_on_account_id ON events USING btree (account_id);


--
-- Name: index_people_hate_toppings_on_person_id; Type: INDEX; Schema: public; Owner: Radish; Tablespace: 
--

CREATE INDEX index_people_hate_toppings_on_person_id ON people_hate_toppings USING btree (person_id);


--
-- Name: index_people_hate_toppings_on_topping_id; Type: INDEX; Schema: public; Owner: Radish; Tablespace: 
--

CREATE INDEX index_people_hate_toppings_on_topping_id ON people_hate_toppings USING btree (topping_id);


--
-- Name: index_people_meh_toppings_on_person_id; Type: INDEX; Schema: public; Owner: Radish; Tablespace: 
--

CREATE INDEX index_people_meh_toppings_on_person_id ON people_meh_toppings USING btree (person_id);


--
-- Name: index_people_meh_toppings_on_topping_id; Type: INDEX; Schema: public; Owner: Radish; Tablespace: 
--

CREATE INDEX index_people_meh_toppings_on_topping_id ON people_meh_toppings USING btree (topping_id);


--
-- Name: index_people_need_toppings_on_person_id; Type: INDEX; Schema: public; Owner: Radish; Tablespace: 
--

CREATE INDEX index_people_need_toppings_on_person_id ON people_need_toppings USING btree (person_id);


--
-- Name: index_people_need_toppings_on_topping_id; Type: INDEX; Schema: public; Owner: Radish; Tablespace: 
--

CREATE INDEX index_people_need_toppings_on_topping_id ON people_need_toppings USING btree (topping_id);


--
-- Name: index_people_want_toppings_on_person_id; Type: INDEX; Schema: public; Owner: Radish; Tablespace: 
--

CREATE INDEX index_people_want_toppings_on_person_id ON people_want_toppings USING btree (person_id);


--
-- Name: index_people_want_toppings_on_topping_id; Type: INDEX; Schema: public; Owner: Radish; Tablespace: 
--

CREATE INDEX index_people_want_toppings_on_topping_id ON people_want_toppings USING btree (topping_id);


--
-- Name: index_toppings_on_name_and_category; Type: INDEX; Schema: public; Owner: Radish; Tablespace: 
--

CREATE UNIQUE INDEX index_toppings_on_name_and_category ON toppings USING btree (name, category);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: Radish; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

