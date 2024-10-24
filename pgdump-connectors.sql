--
-- PostgreSQL database dump
--

-- Dumped from database version 12.20 (Ubuntu 12.20-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.20 (Ubuntu 12.20-1.pgdg22.04+1)

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
-- Name: connectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.connectors (
    connector_id character varying(255),
    base_url text,
    poll_interval integer,
    digital_object_id text NOT NULL,
    digital_twin_id text NOT NULL,
    change_url text
);


ALTER TABLE public.connectors OWNER TO postgres;

--
-- Data for Name: connectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.connectors (connector_id, base_url, poll_interval, digital_object_id, digital_twin_id, change_url) FROM stdin;
HttpSource44d65c9891f6634193c4030a91980f1a	http://192.168.123.90:15000/api/entities/Traffic	600000	KR-104111-0001	KR-02-C20000-20240001	
HttpSource456932aca165bbcab17980e7d0d1bef1	http://10.252.73.125:50001/jeju/water	600000	KR-104710-0001	KR-02-K10000-20240001	
HttpSource4b9edd5c747e8794ba1b3dceade7036a	http://192.168.123.90:15000/api/entities/Weather	600000	KR-109941-0001	KR-02-K10000-20240001	
\.


--
-- PostgreSQL database dump complete
--

