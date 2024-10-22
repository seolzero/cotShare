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
-- Name: federated_visual_models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_visual_models (
    federated_digital_twin_id text,
    visual_model_id text,
    visual_model_name text,
    description text,
    creation_time timestamp with time zone,
    creator_id text,
    modification_time timestamp with time zone,
    visual_model_access_url text,
    visual_model_format text,
    visual_model_file_size integer,
    location jsonb
);


ALTER TABLE public.federated_visual_models OWNER TO postgres;

--
-- Data for Name: federated_visual_models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_visual_models (federated_digital_twin_id, visual_model_id, visual_model_name, description, creation_time, creator_id, modification_time, visual_model_access_url, visual_model_format, visual_model_file_size, location) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

