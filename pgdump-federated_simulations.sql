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
-- Name: federated_simulations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_simulations (
    federated_digital_twin_id text,
    simulation_id text,
    simulation_name text,
    description text,
    keywords text[],
    creation_time timestamp with time zone,
    creator_id text,
    modification_time timestamp with time zone,
    simulation_subject text[],
    simulation_access_url text,
    "authorization" text,
    simulation_request_param jsonb,
    simulation_response_info jsonb,
    response_format_type text,
    interface_type text,
    error_info jsonb,
    time_step integer,
    simulation_type text,
    simulation_attribute text[],
    resource_type text,
    include_input text,
    preliminary_field jsonb,
    simulation_state text
);


ALTER TABLE public.federated_simulations OWNER TO postgres;

--
-- Data for Name: federated_simulations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_simulations (federated_digital_twin_id, simulation_id, simulation_name, description, keywords, creation_time, creator_id, modification_time, simulation_subject, simulation_access_url, "authorization", simulation_request_param, simulation_response_info, response_format_type, interface_type, error_info, time_step, simulation_type, simulation_attribute, resource_type, include_input, preliminary_field, simulation_state) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

