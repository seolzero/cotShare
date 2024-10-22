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
-- Name: federated_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_services (
    federated_digital_twin_id text,
    service_id text,
    service_name text,
    description text,
    keywords text[],
    creation_time timestamp with time zone,
    creator_id text,
    modification_time timestamp with time zone,
    service_access_url text,
    service_request_param text,
    service_response_info text,
    response_format_type text,
    interface_type text,
    error_info text,
    "authorization" text,
    preliminary_field jsonb
);


ALTER TABLE public.federated_services OWNER TO postgres;

--
-- Data for Name: federated_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_services (federated_digital_twin_id, service_id, service_name, description, keywords, creation_time, creator_id, modification_time, service_access_url, service_request_param, service_response_info, response_format_type, interface_type, error_info, "authorization", preliminary_field) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

