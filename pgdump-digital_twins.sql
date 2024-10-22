--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: digital_twins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.digital_twins (
    digital_twin_id text,
    digital_twin_name text,
    description text,
    owner text,
    keywords text[],
    creation_time timestamp with time zone,
    creator_id text,
    modification_time timestamp with time zone,
    point_of_access text,
    contact_point text,
    subjects text[],
    location jsonb,
    member_digital_objects_ids text[],
    number_of_digital_objects integer,
    number_of_services integer,
    number_of_simulations integer
);


ALTER TABLE public.digital_twins OWNER TO postgres;

--
-- Data for Name: digital_twins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.digital_twins (digital_twin_id, digital_twin_name, description, owner, keywords, creation_time, creator_id, modification_time, point_of_access, contact_point, subjects, location, member_digital_objects_ids, number_of_digital_objects, number_of_services, number_of_simulations) FROM stdin;
KR-02-N10000-20240001	관광 디지털 트윈	관광 디지털 트윈	관광관리과	{관광}	2024-03-11 01:00:00.945+00	keti	2024-03-04 01:00:00+00	http://220.124.222.84:1219/fedit/v1/federated-twins/KR-02-K10000-20240000/digital-twins/KR-02-N10000-20240001	000-000-0000	{관광}	{"type": "MultiPoint", "coordinates": [[126.532371, 33.500116], [126.500055, 33.48863], [126.64412, 33.539831], [126.268778, 33.409109], [126.57045614, 33.51733013], [126.56506, 33.246244], [126.91007, 33.460229], [126.715115, 33.2843415], [126.489923, 33.2508702], [126.2473589, 33.2277489], [126.4746922, 33.4838002], [126.162165, 33.292471]]}	{KR-1-09941-0003}	12	0	0
KR-02-C20000-20240001	교통 디지털 트윈	제주도 관광지 소개 디지털 트윈	제주관광공사	{교통}	2024-03-11 01:00:00.945+00	n2m_iot	2024-03-04 05:00:01+00	http://220.124.222.84:1219/fedit/v1/federated-twins/KR-02-K10000-20240000/digital-twins/KR-02-C20000-20240001	064-740-6000~1	{교통}	{"type": "MultiPoint", "coordinates": [[126.532371, 33.500116], [126.500055, 33.48863], [126.64412, 33.539831], [126.268778, 33.409109], [126.57045614, 33.51733013], [126.56506, 33.246244], [126.91007, 33.460229], [126.715115, 33.2843415], [126.489923, 33.2508702], [126.2473589, 33.2277489], [126.4746922, 33.4838002], [126.162165, 33.292471]]}	{KR-1-04111-0001}	20	0	0
KR-02-K10000-20240001	환경 디지털 트윈	제주도 날씨와 대기 상태를 알려주는 디지털 트윈	제주지방기상청	{날씨,예보,미세먼지}	2024-03-11 01:00:00.945+00	n2m_iot	2024-03-04 05:00:00+00	http://220.124.222.84:1219/fedit/v1/federated-twins/KR-02-K10000-20240000/digital-twins/KR-02-K10000-20240001	064-909-3900	{기상,날씨,대기정보}	{"type": "MultiPoint", "coordinates": [[126.532371, 33.500116], [126.500055, 33.48863], [126.64412, 33.539831], [126.268778, 33.409109], [126.57045614, 33.51733013], [126.56506, 33.246244], [126.91007, 33.460229], [126.715115, 33.2843415], [126.489923, 33.2508702], [126.2473589, 33.2277489], [126.4746922, 33.4838002], [126.162165, 33.292471]]}	{KR-1-09941-0001,KR-1-09941-0002}	59	1	1
US-01-A01220-20240002	(시험용) 양돈 디지털 트윈	(시험용) 양돈 디지털 트윈	제주도청	{}	\N	meta_test	\N	http://192.168.1.101	064-123-4567	{}	null	{NULL}	\N	\N	\N
\.


--
-- PostgreSQL database dump complete
--

