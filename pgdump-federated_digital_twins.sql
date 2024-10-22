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
-- Name: federated_digital_twins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_digital_twins (
    federated_digital_twin_id text,
    federated_digital_twin_name text,
    description text,
    owner text,
    keywords text[],
    point_of_access text,
    creation_time timestamp with time zone,
    creator_id text,
    modification_time timestamp with time zone,
    location jsonb,
    number_of_federated_digital_objects integer,
    number_of_subscriptions integer,
    number_of_services integer,
    number_of_simulations integer,
    number_of_digital_twins integer,
    number_of_visual_models integer
);


ALTER TABLE public.federated_digital_twins OWNER TO postgres;

--
-- Data for Name: federated_digital_twins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_digital_twins (federated_digital_twin_id, federated_digital_twin_name, description, owner, keywords, point_of_access, creation_time, creator_id, modification_time, location, number_of_federated_digital_objects, number_of_subscriptions, number_of_services, number_of_simulations, number_of_digital_twins, number_of_visual_models) FROM stdin;
KR-02-K10000-20240000	JEJU	federated digital twin server	keti	{keti,DT}	null	2024-01-05 07:07:57.177+00	keti	2024-10-11 04:37:45.47+00	{"lat": 37.403914, "lng": 127.160494}	25	0	0	0	9	\N
\.


--
-- PostgreSQL database dump complete
--

