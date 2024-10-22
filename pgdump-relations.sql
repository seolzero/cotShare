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
-- Name: relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.relations (
    parent_id text,
    resource_id text[],
    type integer
);


ALTER TABLE public.relations OWNER TO postgres;

--
-- Data for Name: relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.relations (parent_id, resource_id, type) FROM stdin;
KR-02-K10000-20240000	{F-KR-109111-0001}	2
F-KR-109111-0001	{KR-109111-0001}	3
F-KR-109111-0001	{NULL}	6
KR-02-K10000-20240000	{F-KR-109111-0001}	2
F-KR-109111-0001	{KR-109111-0001}	3
F-KR-109111-0001	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0001}	2
F-KR-109941-0001	{KR-104111-0001,KR-109941-0020,KR-109941-0045,KR-109012-0003}	3
F-KR-109941-0001	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0001}	2
F-KR-109941-0001	{KR-104111-0001,KR-109941-0020,KR-109941-0045,KR-109012-0003}	3
F-KR-109941-0001	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0002}	2
F-KR-109941-0002	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001}	3
F-KR-109941-0002	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0002}	2
F-KR-109941-0002	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001}	3
F-KR-109941-0002	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0003}	2
F-KR-109941-0003	{KR-104111-0003,KR-109941-0027,KR-109941-0053,KR-109012-0006}	3
F-KR-109941-0003	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0003}	2
F-KR-109941-0003	{KR-104111-0003,KR-109941-0027,KR-109941-0053,KR-109012-0006}	3
F-KR-109941-0003	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0004}	2
F-KR-109941-0004	{KR-104111-0004,KR-109941-0043,KR-109941-0052,KR-109012-0006}	3
F-KR-109941-0004	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0004}	2
F-KR-109941-0004	{KR-104111-0004,KR-109941-0043,KR-109941-0052,KR-109012-0006}	3
F-KR-109941-0004	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0005}	2
F-KR-109941-0005	{KR-104111-0005,KR-109941-0041,KR-109941-0052,KR-109012-0006}	3
F-KR-109941-0005	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0005}	2
F-KR-109941-0005	{KR-104111-0005,KR-109941-0041,KR-109941-0052,KR-109012-0006}	3
F-KR-109941-0005	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0006}	2
F-KR-109941-0006	{KR-104111-0006,KR-109941-0023,KR-109941-0054,KR-109012-0002}	3
F-KR-109941-0006	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0006}	2
F-KR-109941-0006	{KR-104111-0006,KR-109941-0023,KR-109941-0054,KR-109012-0002}	3
F-KR-109941-0006	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0007}	2
F-KR-109941-0007	{KR-104111-0007,KR-109941-0042,KR-109941-0052,KR-109012-0006}	3
F-KR-109941-0007	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0007}	2
F-KR-109941-0007	{KR-104111-0007,KR-109941-0042,KR-109941-0052,KR-109012-0006}	3
F-KR-109941-0007	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0008}	2
F-KR-109941-0008	{KR-104111-0008,KR-109941-0036,KR-109941-0049,KR-109012-0001}	3
F-KR-109941-0008	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0008}	2
F-KR-109941-0008	{KR-104111-0008,KR-109941-0036,KR-109941-0049,KR-109012-0001}	3
F-KR-109941-0008	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0009}	2
F-KR-109941-0009	{KR-104111-0009,KR-109941-0004,KR-109941-0046,KR-109012-0004}	3
F-KR-109941-0009	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0009}	2
F-KR-109941-0009	{KR-104111-0009,KR-109941-0004,KR-109941-0046,KR-109012-0004}	3
F-KR-109941-0009	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0010}	2
F-KR-109941-0010	{KR-104111-0010,KR-109941-0003,KR-109941-0046,KR-109012-0004}	3
F-KR-109941-0010	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0010}	2
F-KR-109941-0010	{KR-104111-0010,KR-109941-0003,KR-109941-0046,KR-109012-0004}	3
F-KR-109941-0010	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0011}	2
F-KR-109941-0011	{KR-104111-0011,KR-109941-0003,KR-109941-0050,KR-109012-0004}	3
F-KR-109941-0011	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0011}	2
F-KR-109941-0011	{KR-104111-0011,KR-109941-0003,KR-109941-0050,KR-109012-0004}	3
F-KR-109941-0011	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0012}	2
F-KR-109941-0012	{KR-104111-0012,KR-109941-0020,KR-109941-0049,KR-109012-0001}	3
F-KR-109941-0012	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0012}	2
F-KR-109941-0012	{KR-104111-0012,KR-109941-0020,KR-109941-0049,KR-109012-0001}	3
F-KR-109941-0012	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0013}	2
F-KR-109941-0013	{KR-104111-0013,KR-109941-0029,KR-109941-0050,KR-109012-0004}	3
F-KR-109941-0013	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0013}	2
F-KR-109941-0013	{KR-104111-0013,KR-109941-0029,KR-109941-0050,KR-109012-0004}	3
F-KR-109941-0013	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0014}	2
F-KR-109941-0014	{KR-104111-0014,KR-109941-0030,KR-109941-0053,KR-109012-0006}	3
F-KR-109941-0014	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0014}	2
F-KR-109941-0014	{KR-104111-0014,KR-109941-0030,KR-109941-0053,KR-109012-0006}	3
F-KR-109941-0014	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0015}	2
F-KR-109941-0015	{KR-104111-0015,KR-109941-0032,KR-109941-0049,KR-109012-0001}	3
F-KR-109941-0015	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0015}	2
F-KR-109941-0015	{KR-104111-0015,KR-109941-0032,KR-109941-0049,KR-109012-0001}	3
F-KR-109941-0015	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0016}	2
F-KR-109941-0016	{KR-104111-0016,KR-109941-0008,KR-109941-0044,KR-109012-0007}	3
F-KR-109941-0016	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0016}	2
F-KR-109941-0016	{KR-104111-0016,KR-109941-0008,KR-109941-0044,KR-109012-0007}	3
F-KR-109941-0016	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0017}	2
F-KR-109941-0017	{KR-104111-0017,KR-109941-0004,KR-109941-0046,KR-109012-0004}	3
F-KR-109941-0017	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0017}	2
F-KR-109941-0017	{KR-104111-0017,KR-109941-0004,KR-109941-0046,KR-109012-0004}	3
F-KR-109941-0017	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0018}	2
F-KR-109941-0018	{KR-104111-0018,KR-109941-0036,KR-109941-0049,KR-109012-0006}	3
F-KR-109941-0018	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0018}	2
F-KR-109941-0018	{KR-104111-0018,KR-109941-0036,KR-109941-0049,KR-109012-0006}	3
F-KR-109941-0018	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0019}	2
F-KR-109941-0019	{KR-104111-0019,KR-109941-0023,KR-109941-0054,KR-109012-0002}	3
F-KR-109941-0019	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0019}	2
F-KR-109941-0019	{KR-104111-0019,KR-109941-0023,KR-109941-0054,KR-109012-0002}	3
F-KR-109941-0019	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0020}	2
F-KR-109941-0020	{KR-104111-0020,KR-109941-0024,KR-109941-0054,KR-109012-0002}	3
F-KR-109941-0020	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0020}	2
F-KR-109941-0020	{KR-104111-0020,KR-109941-0024,KR-109941-0054,KR-109012-0002}	3
F-KR-109941-0020	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0021}	2
F-KR-109941-0021	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001,KR-104710-0001}	3
F-KR-109941-0021	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0021}	2
F-KR-109941-0021	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001,KR-104710-0001}	3
F-KR-109941-0021	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0022}	2
F-KR-109941-0022	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001,KR-104710-0002}	3
F-KR-109941-0022	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0022}	2
F-KR-109941-0022	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001,KR-104710-0002}	3
F-KR-109941-0022	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0023}	2
F-KR-109941-0023	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001,KR-104710-0003}	3
F-KR-109941-0023	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0023}	2
F-KR-109941-0023	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001,KR-104710-0003}	3
F-KR-109941-0023	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0024}	2
F-KR-109941-0024	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001,KR-104710-0004}	3
F-KR-109941-0024	{NULL}	6
KR-02-K10000-20240000	{F-KR-109941-0024}	2
F-KR-109941-0024	{KR-104111-0002,KR-109941-0037,KR-109941-0049,KR-109012-0001,KR-104710-0004}	3
F-KR-109941-0024	{NULL}	6
\.


--
-- PostgreSQL database dump complete
--

