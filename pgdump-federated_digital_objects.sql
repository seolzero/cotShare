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
-- Name: federated_digital_objects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_digital_objects (
    federated_digital_object_id text,
    federated_digital_twin_id text,
    federated_digital_object_name text,
    description text,
    keywords text[],
    access_url text,
    access_protocol text,
    creation_time timestamp with time zone,
    creator_id text,
    modification_time timestamp with time zone,
    location jsonb,
    time_sync_cond jsonb,
    spatial_sync_cond jsonb,
    member_digital_twin_object_count integer,
    member_digital_twin_object_ids text[],
    data_model_id text,
    preliminary_field jsonb
);


ALTER TABLE public.federated_digital_objects OWNER TO postgres;

--
-- Data for Name: federated_digital_objects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_digital_objects (federated_digital_object_id, federated_digital_twin_id, federated_digital_object_name, description, keywords, access_url, access_protocol, creation_time, creator_id, modification_time, location, time_sync_cond, spatial_sync_cond, member_digital_twin_object_count, member_digital_twin_object_ids, data_model_id, preliminary_field) FROM stdin;
F-KR-109941-0002	KR-02-K10000-20240000	한라산돈내코코스	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:36:19.853+00	keti	2024-10-11 02:55:24.118+00	null	{"time_interval": 0}	null	4	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001}	null	null
F-KR-109941-0003	KR-02-K10000-20240000	추사적거지	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:37:07.762+00	keti	2024-10-11 02:57:34.494+00	null	{"time_interval": 0}	null	4	{KR-104111-0003,KR-109941-0027,KR-109941-0053,KR-109012-0006}	null	null
F-KR-109941-0004	KR-02-K10000-20240000	천제연폭포	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:38:10.599+00	keti	2024-10-11 02:57:43.556+00	null	{"time_interval": 0}	null	4	{KR-104111-0004,KR-109941-0043,KR-109941-0052,KR-109012-0006}	null	null
F-KR-109941-0005	KR-02-K10000-20240000	한라산영실코스	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:38:47.948+00	keti	2024-10-11 02:57:54.734+00	null	{"time_interval": 0}	null	4	{KR-104111-0005,KR-109941-0041,KR-109941-0052,KR-109012-0006}	null	null
F-KR-109941-0006	KR-02-K10000-20240000	한라산어리목코스	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:39:54.099+00	keti	2024-10-11 02:58:02.667+00	null	{"time_interval": 0}	null	4	{KR-104111-0006,KR-109941-0023,KR-109941-0054,KR-109012-0002}	null	null
F-KR-109941-0007	KR-02-K10000-20240000	주상절리대(중문대포해안)	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:41:02.627+00	keti	2024-10-11 02:58:12.03+00	null	{"time_interval": 0}	null	4	{KR-104111-0007,KR-109941-0042,KR-109941-0052,KR-109012-0006}	null	null
F-KR-109941-0008	KR-02-K10000-20240000	감귤박물관	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:41:51.381+00	keti	2024-10-11 02:58:23.081+00	null	{"time_interval": 0}	null	4	{KR-104111-0008,KR-109941-0036,KR-109941-0049,KR-109012-0001}	null	null
F-KR-109941-0009	KR-02-K10000-20240000	거문오름(UNESCO 세계자연유산)	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:42:46.612+00	keti	2024-10-11 02:58:32.996+00	null	{"time_interval": 0}	null	4	{KR-104111-0009,KR-109941-0004,KR-109941-0046,KR-109012-0004}	null	null
F-KR-109941-0010	KR-02-K10000-20240000	만장굴	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:43:49.095+00	keti	2024-10-11 02:58:43.874+00	null	{"time_interval": 0}	null	4	{KR-104111-0010,KR-109941-0003,KR-109941-0046,KR-109012-0004}	null	null
F-KR-109941-0011	KR-02-K10000-20240000	비자림	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:44:14.3+00	keti	2024-10-11 02:58:51.773+00	null	{"time_interval": 0}	null	4	{KR-104111-0011,KR-109941-0003,KR-109941-0050,KR-109012-0004}	null	null
F-KR-109941-0012	KR-02-K10000-20240000	성널오름 (성판악)	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:44:48.445+00	keti	2024-10-11 02:59:00.01+00	null	{"time_interval": 0}	null	4	{KR-104111-0012,KR-109941-0020,KR-109941-0049,KR-109012-0001}	null	null
F-KR-109941-0013	KR-02-K10000-20240000	성산일출봉(UNESCO 세계자연유산)	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:45:27.574+00	keti	2024-10-11 02:59:09.959+00	null	{"time_interval": 0}	null	4	{KR-104111-0013,KR-109941-0029,KR-109941-0050,KR-109012-0004}	null	null
F-KR-109941-0015	KR-02-K10000-20240000	정방폭포	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:46:52.754+00	keti	2024-10-11 02:59:29.634+00	null	{"time_interval": 0}	null	4	{KR-104111-0015,KR-109941-0032,KR-109941-0049,KR-109012-0001}	null	null
F-KR-109941-0016	KR-02-K10000-20240000	제주목관아	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:47:29.402+00	keti	2024-10-11 02:59:36.975+00	null	{"time_interval": 0}	null	4	{KR-104111-0016,KR-109941-0008,KR-109941-0044,KR-109012-0007}	null	null
F-KR-109941-0017	KR-02-K10000-20240000	제주세계자연유산센터	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:48:14.838+00	keti	2024-10-11 02:59:45.016+00	null	{"time_interval": 0}	null	4	{KR-104111-0017,KR-109941-0004,KR-109941-0046,KR-109012-0004}	null	null
F-KR-109941-0018	KR-02-K10000-20240000	천지연폭포	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:49:00.242+00	keti	2024-10-11 02:59:53.241+00	null	{"time_interval": 0}	null	4	{KR-104111-0018,KR-109941-0036,KR-109941-0049,KR-109012-0006}	null	null
F-KR-109941-0019	KR-02-K10000-20240000	한라수목원	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:49:46.495+00	keti	2024-10-11 03:00:00.032+00	null	{"time_interval": 0}	null	4	{KR-104111-0019,KR-109941-0023,KR-109941-0054,KR-109012-0002}	null	null
F-KR-109941-0020	KR-02-K10000-20240000	항파두리항몽유적지	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:50:10.996+00	keti	2024-10-11 03:00:06.226+00	null	{"time_interval": 0}	null	4	{KR-104111-0020,KR-109941-0024,KR-109941-0054,KR-109012-0002}	null	null
F-KR-109111-0001	KR-02-K10000-20240000	fdo-control	test for control	{control}	null	null	2024-09-20 02:29:53.304+00	keti	2024-10-18 04:04:02.34+00	null	{"time_interval": 0}	null	2	{KR-109012-0011,KR-109012-0012}	null	null
F-KR-109941-0021	KR-02-K10000-20240000	돈내코-학림교	federated Data	{traffic,weather,airQuality,parkingLot,river}	null	kafka	2024-10-07 06:49:36.205+00	keti	2024-10-07 06:49:36.205+00	null	{"time_interval": 0}	null	5	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001,KR-104710-0001}	null	null
F-KR-109941-0022	KR-02-K10000-20240000	돈내코-쇠소깍다리	federated Data	{traffic,weather,airQuality,parkingLot,river}	null	kafka	2024-10-07 06:49:53.019+00	keti	2024-10-07 06:49:53.019+00	null	{"time_interval": 0}	null	5	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001,KR-104710-0002}	null	null
F-KR-109941-0023	KR-02-K10000-20240000	돈내코-돈내코교	federated Data	{traffic,weather,airQuality,parkingLot,river}	null	kafka	2024-10-07 06:50:08.488+00	keti	2024-10-07 06:50:08.488+00	null	{"time_interval": 0}	null	5	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001,KR-104710-0003}	null	null
F-KR-109941-0001	KR-02-K10000-20240000	한라산관음사코스	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:35:36.622+00	keti	2024-10-11 02:54:56.905+00	null	{"time_interval": 0}	null	4	{KR-104111-0001,KR-109941-0020,KR-109941-0045,KR-109012-0003}	null	null
F-KR-109941-0014	KR-02-K10000-20240000	용머리해안	federated Data	{traffic,weather,airQuality,parkingLot}	null	kafka	2024-09-26 04:46:19.242+00	keti	2024-10-11 02:59:20.921+00	null	{"time_interval": 0}	null	4	{KR-104111-0014,KR-109941-0030,KR-109941-0053,KR-109012-0006}	null	null
F-KR-109941-0024	KR-02-K10000-20240000	돈내코-test	federated Data	{traffic,weather,airQuality,parkingLot,river}	null	kafka	2024-10-11 04:37:45.469+00	keti	2024-10-11 04:37:45.469+00	null	{"time_interval": 0}	null	5	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001,KR-104710-0004}	null	null
\.


--
-- Name: index_federated_digital_object; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_federated_digital_object ON public.federated_digital_objects USING btree (federated_digital_twin_id, federated_digital_object_id, creation_time);


--
-- PostgreSQL database dump complete
--

