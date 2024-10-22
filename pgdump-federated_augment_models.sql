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
-- Name: federated_augment_models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_augment_models (
    model_seq text,
    model_nm text,
    model_derp text,
    model_algrm text,
    learning_bgng_dt timestamp with time zone,
    learning_end_dt timestamp with time zone,
    model_status text,
    sdt_yn text,
    index_trgt_col text,
    input_output_info text
);


ALTER TABLE public.federated_augment_models OWNER TO postgres;

--
-- Data for Name: federated_augment_models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_augment_models (model_seq, model_nm, model_derp, model_algrm, learning_bgng_dt, learning_end_dt, model_status, sdt_yn, index_trgt_col, input_output_info) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

