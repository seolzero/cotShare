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
-- Name: federated_fidelities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_fidelities (
    federated_digital_twin_id text,
    fidelity_id text,
    fidelity_name text,
    description text,
    creation_time timestamp with time zone,
    creator_id text,
    modification_time timestamp with time zone,
    fidelity_subject text,
    fidelity_type text,
    data_unit_transform_info text,
    input_output_info text,
    unit_type text,
    unit_code_1 text,
    unit_code_2 text,
    unit_formula text,
    interpolate_type text,
    resample_type text,
    resample_interval text
);


ALTER TABLE public.federated_fidelities OWNER TO postgres;

--
-- Data for Name: federated_fidelities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_fidelities (federated_digital_twin_id, fidelity_id, fidelity_name, description, creation_time, creator_id, modification_time, fidelity_subject, fidelity_type, data_unit_transform_info, input_output_info, unit_type, unit_code_1, unit_code_2, unit_formula, interpolate_type, resample_type, resample_interval) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

