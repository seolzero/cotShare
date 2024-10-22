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
-- Name: federated_subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_subscriptions (
    federated_digital_twin_id text,
    subscription_id text,
    subscription_name text,
    description text,
    creation_time timestamp with time zone,
    creator_id text,
    modification_time timestamp with time zone,
    subscription_subject text[],
    subscription_protocol text,
    notification_url text[],
    expiration_time timestamp with time zone,
    expiration_count integer,
    fail_count integer,
    keywords text[],
    filtering_action_list text,
    filtering_condition_list text
);


ALTER TABLE public.federated_subscriptions OWNER TO postgres;

--
-- Data for Name: federated_subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_subscriptions (federated_digital_twin_id, subscription_id, subscription_name, description, creation_time, creator_id, modification_time, subscription_subject, subscription_protocol, notification_url, expiration_time, expiration_count, fail_count, keywords, filtering_action_list, filtering_condition_list) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

