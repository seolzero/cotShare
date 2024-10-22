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
-- Name: fdo_compositions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fdo_compositions (
    compose_id text NOT NULL,
    federated_digital_twin_id text,
    federated_digital_object_id text,
    digital_object_id text,
    rowtime timestamp with time zone,
    digital_object_count integer
);


ALTER TABLE public.fdo_compositions OWNER TO postgres;

--
-- Data for Name: fdo_compositions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fdo_compositions (compose_id, federated_digital_twin_id, federated_digital_object_id, digital_object_id, rowtime, digital_object_count) FROM stdin;
CP4725bdc21760639b81cecad364867267	KR-02-K10000-20240000	F-KR-109941-0006	KR-104111-0006	2024-09-26 04:39:54.099+00	4
CP4d04c7d843c0944f90e0589187bdb0ad	KR-02-K10000-20240000	F-KR-109941-0006	KR-109941-0023	2024-09-26 04:39:54.099+00	4
CP47f984198d0dd899a31e197ad6b17f4f	KR-02-K10000-20240000	F-KR-109941-0006	KR-109941-0054	2024-09-26 04:39:54.099+00	4
CP40fd833507910e31b56179f1cf2053a0	KR-02-K10000-20240000	F-KR-109941-0006	KR-109012-0002	2024-09-26 04:39:54.099+00	4
CP40e4b1d6ff5aea47914c7c449905682c	KR-02-K10000-20240000	F-KR-109941-0001	KR-104111-0001	2024-09-26 04:35:36.622+00	4
CP4925a066739e6effaa9950b3ef1496d8	KR-02-K10000-20240000	F-KR-109941-0001	KR-109941-0020	2024-09-26 04:35:36.622+00	4
CP41a6b4788322eb54aafa110bcdb43ecd	KR-02-K10000-20240000	F-KR-109941-0001	KR-109941-0045	2024-09-26 04:35:36.622+00	4
CP4c4f4336def1e782822bfdae58ca8ae5	KR-02-K10000-20240000	F-KR-109941-0001	KR-109012-0003	2024-09-26 04:35:36.622+00	4
CP4696e915e147e58e8bd596d43f693d56	KR-02-K10000-20240000	F-KR-109941-0002	KR-104111-0002	2024-09-26 04:36:19.853+00	4
CP44dcb6d3b1bed103b944b3616783b0c6	KR-02-K10000-20240000	F-KR-109941-0002	KR-109941-0037	2024-09-26 04:36:19.853+00	4
CP42366a2ee95a3c7ab5f03e6930054c48	KR-02-K10000-20240000	F-KR-109941-0002	KR-109941-0049	2024-09-26 04:36:19.853+00	4
CP43f0f163cf9a784795c478f60c879a44	KR-02-K10000-20240000	F-KR-109941-0002	KR-109012-0001	2024-09-26 04:36:19.853+00	4
CP42c6ceaa474a31cdb50c680e01a50816	KR-02-K10000-20240000	F-KR-109941-0003	KR-104111-0003	2024-09-26 04:37:07.762+00	4
CP42fc9274a6b753d4a53f4e754651c883	KR-02-K10000-20240000	F-KR-109941-0003	KR-109941-0027	2024-09-26 04:37:07.762+00	4
CP46d92fdaebd168aaba2589aa3d54d0a2	KR-02-K10000-20240000	F-KR-109941-0003	KR-109941-0053	2024-09-26 04:37:07.762+00	4
CP4329ffe1b922c766a16c21328586b9f1	KR-02-K10000-20240000	F-KR-109941-0003	KR-109012-0006	2024-09-26 04:37:07.762+00	4
CP476620418862f26d89bbb1a7e9ba841b	KR-02-K10000-20240000	F-KR-109941-0004	KR-104111-0004	2024-09-26 04:38:10.599+00	4
CP41e30052a6aeff1e8bf98fff3b33462b	KR-02-K10000-20240000	F-KR-109941-0004	KR-109941-0043	2024-09-26 04:38:10.599+00	4
CP45117376163ad40b960e9a3777f90abf	KR-02-K10000-20240000	F-KR-109941-0004	KR-109941-0052	2024-09-26 04:38:10.599+00	4
CP4ab45513d11d8ff7b8d37b0bb8d4f4f4	KR-02-K10000-20240000	F-KR-109941-0004	KR-109012-0006	2024-09-26 04:38:10.599+00	4
CP4ee676a61972ee4f957390ba00dd5ca0	KR-02-K10000-20240000	F-KR-109941-0005	KR-104111-0005	2024-09-26 04:38:47.948+00	4
CP4b977b618c2d0fb7840051632383c7ec	KR-02-K10000-20240000	F-KR-109941-0005	KR-109941-0041	2024-09-26 04:38:47.948+00	4
CP46b4d9e54b1a16deb3b8975b9f7132ce	KR-02-K10000-20240000	F-KR-109941-0005	KR-109941-0052	2024-09-26 04:38:47.948+00	4
CP465910349379bfc9ba00ad7ca9ba22ce	KR-02-K10000-20240000	F-KR-109941-0005	KR-109012-0006	2024-09-26 04:38:47.948+00	4
CP4abc6bc58fffbebb91d9cdd4507416a5	KR-02-K10000-20240000	F-KR-109941-0007	KR-104111-0007	2024-09-26 04:41:02.627+00	4
CP4122f699f0c27f2b8de8b6f3b9656b3a	KR-02-K10000-20240000	F-KR-109941-0007	KR-109941-0042	2024-09-26 04:41:02.627+00	4
CP48fa329b05d0563587a87ac3a1c31abe	KR-02-K10000-20240000	F-KR-109941-0007	KR-109941-0052	2024-09-26 04:41:02.627+00	4
CP46f299261519b5158d8a680e55e630d5	KR-02-K10000-20240000	F-KR-109941-0007	KR-109012-0006	2024-09-26 04:41:02.627+00	4
CP49723fc7db52b805962684ae6ce01acb	KR-02-K10000-20240000	F-KR-109941-0008	KR-104111-0008	2024-09-26 04:41:51.381+00	4
CP4daac31cab2b3adba3d335f646ed82f2	KR-02-K10000-20240000	F-KR-109941-0008	KR-109941-0036	2024-09-26 04:41:51.381+00	4
CP43428417097f4a1299cec2644692b90b	KR-02-K10000-20240000	F-KR-109941-0008	KR-109941-0049	2024-09-26 04:41:51.381+00	4
CP40783110cd532ce1b59b5c6d23636a4f	KR-02-K10000-20240000	F-KR-109941-0008	KR-109012-0001	2024-09-26 04:41:51.381+00	4
CP4311ecbf5af81813a8c50c4988f71695	KR-02-K10000-20240000	F-KR-109941-0009	KR-104111-0009	2024-09-26 04:42:46.612+00	4
CP4c7e9902011aa9d3b736a368a1e789ab	KR-02-K10000-20240000	F-KR-109941-0009	KR-109941-0004	2024-09-26 04:42:46.612+00	4
CP4c701a1bcb6070f8a68e9f0bcd6dedd6	KR-02-K10000-20240000	F-KR-109941-0009	KR-109941-0046	2024-09-26 04:42:46.612+00	4
CP4047cfc1a1d2da2c9136453c2c1b19e3	KR-02-K10000-20240000	F-KR-109941-0009	KR-109012-0004	2024-09-26 04:42:46.612+00	4
CP4bd6c63d4497fd48845c0dd941f99e9a	KR-02-K10000-20240000	F-KR-109941-0010	KR-104111-0010	2024-09-26 04:43:49.095+00	4
CP476d6fb55f6396dfa3789c316429edd2	KR-02-K10000-20240000	F-KR-109941-0010	KR-109941-0003	2024-09-26 04:43:49.095+00	4
CP47da96092a961502a8a7771c7df84084	KR-02-K10000-20240000	F-KR-109941-0010	KR-109941-0046	2024-09-26 04:43:49.095+00	4
CP4040d208c3bdefeabca19427f3b56be5	KR-02-K10000-20240000	F-KR-109941-0010	KR-109012-0004	2024-09-26 04:43:49.095+00	4
CP43354e1bb8be0985b14e8fb87c690d94	KR-02-K10000-20240000	F-KR-109941-0011	KR-104111-0011	2024-09-26 04:44:14.3+00	4
CP4043b1dc31fd6b1b906a5fb5efd7b282	KR-02-K10000-20240000	F-KR-109941-0011	KR-109941-0003	2024-09-26 04:44:14.3+00	4
CP44ca792fa38469288bd8b6ba136bf778	KR-02-K10000-20240000	F-KR-109941-0011	KR-109941-0050	2024-09-26 04:44:14.3+00	4
CP40f32e005309bfabb4502237ae31cc7c	KR-02-K10000-20240000	F-KR-109941-0011	KR-109012-0004	2024-09-26 04:44:14.3+00	4
CP403ccf3feb9ef72f88ff397abee492e8	KR-02-K10000-20240000	F-KR-109941-0012	KR-104111-0012	2024-09-26 04:44:48.445+00	4
CP49e8642b1407e769a0a76ea8b45b39f7	KR-02-K10000-20240000	F-KR-109941-0012	KR-109941-0020	2024-09-26 04:44:48.445+00	4
CP4f2be0b4f520db9393bd089ee682d0f5	KR-02-K10000-20240000	F-KR-109941-0012	KR-109941-0049	2024-09-26 04:44:48.445+00	4
CP4435fa50c8c0de3cab8dcf5bb18940aa	KR-02-K10000-20240000	F-KR-109941-0012	KR-109012-0001	2024-09-26 04:44:48.445+00	4
CP414febfe080af4cead56c5bc141f6d71	KR-02-K10000-20240000	F-KR-109941-0013	KR-104111-0013	2024-09-26 04:45:27.574+00	4
CP4e749b03dedc8b86b9fbf836f947b26d	KR-02-K10000-20240000	F-KR-109941-0013	KR-109941-0029	2024-09-26 04:45:27.574+00	4
CP45ecb2b3f8d06c1d9594749b57a6f844	KR-02-K10000-20240000	F-KR-109941-0013	KR-109941-0050	2024-09-26 04:45:27.574+00	4
CP430180e0031e1018b3ca7ae363ab0a8a	KR-02-K10000-20240000	F-KR-109941-0013	KR-109012-0004	2024-09-26 04:45:27.574+00	4
CP48daed536ca22dd9bd10887ee9dc98b7	KR-02-K10000-20240000	F-KR-109941-0014	KR-104111-0014	2024-09-26 04:46:19.242+00	4
CP47c2a9357b235bd785a95969aa9e521f	KR-02-K10000-20240000	F-KR-109941-0014	KR-109941-0030	2024-09-26 04:46:19.242+00	4
CP49328a025ee095c78a1a7de092a78167	KR-02-K10000-20240000	F-KR-109941-0014	KR-109941-0053	2024-09-26 04:46:19.242+00	4
CP4f856e35c25c2abe9a3e57b61224f3a8	KR-02-K10000-20240000	F-KR-109941-0014	KR-109012-0006	2024-09-26 04:46:19.242+00	4
CP453d5b15968bc40d833d783253ca3bb5	KR-02-K10000-20240000	F-KR-109941-0015	KR-104111-0015	2024-09-26 04:46:52.754+00	4
CP4e3890489ac6e1568c340ba471c7e0dc	KR-02-K10000-20240000	F-KR-109941-0015	KR-109941-0032	2024-09-26 04:46:52.754+00	4
CP40908b8638e3e4ccaa489f5eea747ebd	KR-02-K10000-20240000	F-KR-109941-0015	KR-109941-0049	2024-09-26 04:46:52.754+00	4
CP400696f6571a7b3f818b6901965c3b88	KR-02-K10000-20240000	F-KR-109941-0015	KR-109012-0001	2024-09-26 04:46:52.754+00	4
CP4a4c3ed324560f4b85953fa89bc38b43	KR-02-K10000-20240000	F-KR-109941-0016	KR-104111-0016	2024-09-26 04:47:29.402+00	4
CP459ce2c7767bd612b8bc8c9aa783b3a5	KR-02-K10000-20240000	F-KR-109941-0016	KR-109941-0008	2024-09-26 04:47:29.402+00	4
CP4f09389a5ec5d08782af86b12234c119	KR-02-K10000-20240000	F-KR-109941-0016	KR-109941-0044	2024-09-26 04:47:29.402+00	4
CP471205d2cbe83b54b883f3cbded8a0d5	KR-02-K10000-20240000	F-KR-109941-0016	KR-109012-0007	2024-09-26 04:47:29.402+00	4
CP4e6240773eff047aa158a5c1c3cba67b	KR-02-K10000-20240000	F-KR-109941-0017	KR-104111-0017	2024-09-26 04:48:14.838+00	4
CP4053538969634418ad80e44a02936af9	KR-02-K10000-20240000	F-KR-109941-0017	KR-109941-0004	2024-09-26 04:48:14.838+00	4
CP4148095280f036c8be6d7304671fea6b	KR-02-K10000-20240000	F-KR-109941-0017	KR-109941-0046	2024-09-26 04:48:14.838+00	4
CP49041c4f4ed0644a9338d5a6b15f02a2	KR-02-K10000-20240000	F-KR-109941-0017	KR-109012-0004	2024-09-26 04:48:14.838+00	4
CP40c482cc9afa44e5a0a9bff4c65ef022	KR-02-K10000-20240000	F-KR-109941-0018	KR-104111-0018	2024-09-26 04:49:00.242+00	4
CP4af56515683fa02798f37c40cd9d44ae	KR-02-K10000-20240000	F-KR-109941-0018	KR-109941-0036	2024-09-26 04:49:00.242+00	4
CP482f8b2cc66cfe418737f52e3597393a	KR-02-K10000-20240000	F-KR-109941-0018	KR-109941-0049	2024-09-26 04:49:00.242+00	4
CP4871e5371b0608f9a9b422ead69b6149	KR-02-K10000-20240000	F-KR-109941-0018	KR-109012-0006	2024-09-26 04:49:00.242+00	4
CP432f95b4ebc8f252a18bc8481a91044a	KR-02-K10000-20240000	F-KR-109941-0019	KR-104111-0019	2024-09-26 04:49:46.495+00	4
CP44b8d48d9d1c0607ba7ff825a5e2ffc3	KR-02-K10000-20240000	F-KR-109941-0019	KR-109941-0023	2024-09-26 04:49:46.495+00	4
CP4abfb5652da8d8078a55c9a720cb95d6	KR-02-K10000-20240000	F-KR-109941-0019	KR-109941-0054	2024-09-26 04:49:46.495+00	4
CP417578c79b128e7f8cf6c5c73e481fa5	KR-02-K10000-20240000	F-KR-109941-0019	KR-109012-0002	2024-09-26 04:49:46.495+00	4
CP4d643b2a6f73929ba9a0759d19d3b40e	KR-02-K10000-20240000	F-KR-109941-0020	KR-104111-0020	2024-09-26 04:50:10.996+00	4
CP4ae642bd2d8a6fb6bf2822b000098ab7	KR-02-K10000-20240000	F-KR-109941-0020	KR-109941-0024	2024-09-26 04:50:10.996+00	4
CP4c61134b890d71fb9347d505cd67105a	KR-02-K10000-20240000	F-KR-109941-0020	KR-109941-0054	2024-09-26 04:50:10.996+00	4
CP42953d8bdfc3a09d84d9cdabf891d802	KR-02-K10000-20240000	F-KR-109941-0020	KR-109012-0002	2024-09-26 04:50:10.996+00	4
CP40c838e30be4c236a104c222c9b56578	KR-02-K10000-20240000	F-KR-109941-0021	KR-104111-0002	2024-10-07 06:49:36.205+00	5
CP449439084f2d41438e4fe4412bd3406d	KR-02-K10000-20240000	F-KR-109941-0021	KR-109941-0037	2024-10-07 06:49:36.205+00	5
CP4a933f0f5aca82b2afe97a1964d4c102	KR-02-K10000-20240000	F-KR-109941-0021	KR-109941-0049	2024-10-07 06:49:36.205+00	5
CP419072aa24b22bbca134cabe65e57595	KR-02-K10000-20240000	F-KR-109941-0021	KR-109012-0001	2024-10-07 06:49:36.205+00	5
CP43ad1484a1174092a1673a02654f1833	KR-02-K10000-20240000	F-KR-109941-0021	KR-104710-0001	2024-10-07 06:49:36.205+00	5
CP4d0aa6b679d03819bc60da93140bdbcf	KR-02-K10000-20240000	F-KR-109941-0022	KR-104111-0002	2024-10-07 06:49:53.019+00	5
CP45a6144c413367c09dd810291dd5138b	KR-02-K10000-20240000	F-KR-109941-0022	KR-109941-0037	2024-10-07 06:49:53.019+00	5
CP4a529191bfca5b6daf25f86bd00bbc32	KR-02-K10000-20240000	F-KR-109941-0022	KR-109941-0049	2024-10-07 06:49:53.019+00	5
CP4ac80afd34b87d47928edbcd5affec61	KR-02-K10000-20240000	F-KR-109941-0022	KR-109012-0001	2024-10-07 06:49:53.019+00	5
CP489c29fc156ad53287244a1dbb4baf1a	KR-02-K10000-20240000	F-KR-109941-0022	KR-104710-0002	2024-10-07 06:49:53.019+00	5
CP4aeaee67915a7485bfcb67aaee1e3f2e	KR-02-K10000-20240000	F-KR-109941-0023	KR-104111-0002	2024-10-07 06:50:08.488+00	5
CP494c20efb7ecf3dca9b2267f4609a56a	KR-02-K10000-20240000	F-KR-109941-0023	KR-109941-0037	2024-10-07 06:50:08.488+00	5
CP4af55c1a0efd2011ae1a7e8a6b1c1d73	KR-02-K10000-20240000	F-KR-109941-0023	KR-109941-0049	2024-10-07 06:50:08.488+00	5
CP4d0772c218b609bfb9a845cd75fbe558	KR-02-K10000-20240000	F-KR-109941-0023	KR-109012-0001	2024-10-07 06:50:08.488+00	5
CP4d831f10737aebaeba5d6a38e0f44daf	KR-02-K10000-20240000	F-KR-109941-0023	KR-104710-0003	2024-10-07 06:50:08.488+00	5
CP42730706c2e9e09183cc0efafdc4c993	KR-02-K10000-20240000	F-KR-109941-0024	KR-104111-0002	2024-10-11 04:37:45.469+00	5
CP4d5925cf884429f5b9c5fd771111a42e	KR-02-K10000-20240000	F-KR-109941-0024	KR-109941-0037	2024-10-11 04:37:45.469+00	5
CP4cc9386a70afddef97108a27141de2a8	KR-02-K10000-20240000	F-KR-109941-0024	KR-109941-0049	2024-10-11 04:37:45.469+00	5
CP4d5c644634647013985134924d6fd5bc	KR-02-K10000-20240000	F-KR-109941-0024	KR-109012-0001	2024-10-11 04:37:45.469+00	5
CP4a642e049a4ca4cd913c06a5dcdd842f	KR-02-K10000-20240000	F-KR-109941-0024	KR-104710-0004	2024-10-11 04:37:45.469+00	5
CP45f4136554ee6c47825ca34e70aaf92f	KR-02-K10000-20240000	F-KR-109111-0001	KR-109012-0011	2024-10-18 04:04:02.341+00	\N
CP4e9f2c07b864b685ae6aee4f498caacb	KR-02-K10000-20240000	F-KR-109111-0001	KR-109012-0012	2024-10-18 04:04:02.341+00	\N
\.


--
-- Name: fdo_compositions do_compositions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fdo_compositions
    ADD CONSTRAINT do_compositions_pkey PRIMARY KEY (compose_id);


--
-- PostgreSQL database dump complete
--

