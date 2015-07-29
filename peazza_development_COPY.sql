
-- psql -d peazza_development -f peazza_development_COPY.sql

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
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Radish
--
SELECT pg_catalog.setval('people_id_seq', 4, true);


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

