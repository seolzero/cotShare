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
-- Name: identifiers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identifiers (
    id integer NOT NULL,
    identifier_type character varying(255) NOT NULL,
    current_serial integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.identifiers OWNER TO postgres;

--
-- Name: identifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.identifiers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.identifiers_id_seq OWNER TO postgres;

--
-- Name: identifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.identifiers_id_seq OWNED BY public.identifiers.id;


--
-- Name: identifiers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identifiers ALTER COLUMN id SET DEFAULT nextval('public.identifiers_id_seq'::regclass);


--
-- Data for Name: identifiers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identifiers (id, identifier_type, current_serial) FROM stdin;
\.


--
-- Name: identifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.identifiers_id_seq', 1, false);


--
-- Name: identifiers identifiers_identifier_type_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identifiers
    ADD CONSTRAINT identifiers_identifier_type_key UNIQUE (identifier_type);


--
-- Name: identifiers identifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identifiers
    ADD CONSTRAINT identifiers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

