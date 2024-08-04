
--
-- Data for Name: configs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.configs VALUES (1, '2024-07-20 16:08:20.230381', '2024-07-20 16:08:20.230381', true, '{"features":["planning","server_selection"]}', 'feature_toggles');


--
-- Name: configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.configs_id_seq', 1, true);
