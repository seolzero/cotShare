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
-- Name: federated_validations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_validations (
    federated_digital_twin_id text,
    validation_id text,
    validation_name text,
    description text,
    creation_time timestamp with time zone,
    creator_id text,
    modification_time timestamp with time zone,
    validation_rule text,
    validation_subject text,
    validation_engine_address text,
    validation_type text,
    explainable text,
    validation_result_history text,
    notificaitonurl text,
    input_output_info text,
    rule_value text,
    outlier_type text,
    outlier_rule_value text
);


ALTER TABLE public.federated_validations OWNER TO postgres;

--
-- Data for Name: federated_validations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_validations (federated_digital_twin_id, validation_id, validation_name, description, creation_time, creator_id, modification_time, validation_rule, validation_subject, validation_engine_address, validation_type, explainable, validation_result_history, notificaitonurl, input_output_info, rule_value, outlier_type, outlier_rule_value) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

