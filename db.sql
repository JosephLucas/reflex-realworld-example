--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.13
-- Dumped by pg_dump version 11.6

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

--
-- Name: conduit; Type: DATABASE; Schema: -; Owner: conduit
--

CREATE DATABASE conduit WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE conduit OWNER TO conduit;

\connect conduit

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

SET default_with_oids = false;

--
-- Name: article_tags; Type: TABLE; Schema: public; Owner: conduit
--

CREATE TABLE public.article_tags (
    article__id integer,
    tag__name text
);


ALTER TABLE public.article_tags OWNER TO conduit;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: conduit
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    body text NOT NULL,
    slug text NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    author__id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.articles OWNER TO conduit;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: conduit
--

CREATE SEQUENCE public.articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO conduit;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conduit
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: conduit
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    body text NOT NULL,
    author__id integer,
    article__id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO conduit;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: conduit
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO conduit;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conduit
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: conduit
--

CREATE TABLE public.favorites (
    user__id integer,
    article__id integer
);


ALTER TABLE public.favorites OWNER TO conduit;

--
-- Name: follows; Type: TABLE; Schema: public; Owner: conduit
--

CREATE TABLE public.follows (
    follower__id integer,
    followee__id integer
);


ALTER TABLE public.follows OWNER TO conduit;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: conduit
--

CREATE TABLE public.tags (
    name text NOT NULL
);


ALTER TABLE public.tags OWNER TO conduit;

--
-- Name: users; Type: TABLE; Schema: public; Owner: conduit
--

CREATE TABLE public.users (
    id integer NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    bio text NOT NULL,
    image text
);


ALTER TABLE public.users OWNER TO conduit;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: conduit
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO conduit;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conduit
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: article_tags; Type: TABLE DATA; Schema: public; Owner: conduit
--

COPY public.article_tags (article__id, tag__name) FROM stdin;
3	sciences
4	arts
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: conduit
--

COPY public.articles (id, body, slug, title, description, author__id, created_at, updated_at) FROM stdin;
3	Here are the reasons why this article is so interesting. Developping these reasons might be tricky when the aim of the article is just to show that it has content.	an-article-about-sharing-ideas	An article about sharing ideas	sharing ideas	7	2019-05-07 23:48:45.982494+00	2019-05-07 23:48:45.982494+00
4	This information might be useful for this reason. I also wnat to share an argument that shows how you can make life easier for you and others.	how-to-make-life-easier	How to make life easier	easier life	5	2019-05-07 23:51:44.856755+00	2019-05-07 23:51:44.856755+00
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: conduit
--

COPY public.comments (id, body, author__id, article__id, created_at, updated_at) FROM stdin;
4	Thanks for sharing these ideas !	6	4	2019-05-12 15:25:21.996366+00	2019-05-12 15:25:21.996366+00
5	Oh, now I know how to do it. Thanks, Can you develop a bit more about that ?	7	4	2019-05-12 15:26:17.483094+00	2019-05-12 15:26:17.483094+00
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: conduit
--

COPY public.favorites (user__id, article__id) FROM stdin;
\.


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: conduit
--

COPY public.follows (follower__id, followee__id) FROM stdin;
5	6
6	5
5	7
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: conduit
--

COPY public.tags (name) FROM stdin;
sciences
arts
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: conduit
--

COPY public.users (id, password, email, username, bio, image) FROM stdin;
7	14|8|1|uyRA6mhsCBcVPywd8F1Jsqe8BE4bVgIthD5NwLhXCgw=|7+5+h+9OKFb68D1zvmnUkmQ0q7liuLwfKz1TCH07DBe7BH7Za9wQ65iSs8Peedfi0i6PgWrXAtqrCsnON83+zQ==	john@mlp	John	I am a kind person. I am interested about improving well-being	/static/avatars/john.png
6	14|8|1|9eJWoRDVyc5sKteli5y+LE0aFO4g1LhgD1ol3Yy2Tvg=|Uq8llEuBLZtdQ5pvPidP4VkeGpd1CqdeEJ+NFOcVRfeFYaDbftDxhY5sX05zdHc2nzoalzsjKgzdeFmcVcTSzw==	tom@mlp	Tom	I would like to share ideas	/static/avatars/tom.png
5	14|8|1|9eJWoRDVyc5sKteli5y+LE0aFO4g1LhgD1ol3Yy2Tvg=|Uq8llEuBLZtdQ5pvPidP4VkeGpd1CqdeEJ+NFOcVRfeFYaDbftDxhY5sX05zdHc2nzoalzsjKgzdeFmcVcTSzw==	mary@mlp	Mary	Hey ! I am Mary :)	/static/avatars/mary.png
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conduit
--

SELECT pg_catalog.setval('public.articles_id_seq', 4, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conduit
--

SELECT pg_catalog.setval('public.comments_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conduit
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: article_tags article_tags_article__id_tag__name_key; Type: CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.article_tags
    ADD CONSTRAINT article_tags_article__id_tag__name_key UNIQUE (article__id, tag__name);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: articles articles_slug_key; Type: CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_slug_key UNIQUE (slug);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (name);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: article_tags article_tags_article__id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.article_tags
    ADD CONSTRAINT article_tags_article__id_fkey FOREIGN KEY (article__id) REFERENCES public.articles(id) ON DELETE CASCADE;


--
-- Name: article_tags article_tags_tag__name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.article_tags
    ADD CONSTRAINT article_tags_tag__name_fkey FOREIGN KEY (tag__name) REFERENCES public.tags(name) ON DELETE CASCADE;


--
-- Name: articles articles_author__id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_author__id_fkey FOREIGN KEY (author__id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: comments comments_article__id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_article__id_fkey FOREIGN KEY (article__id) REFERENCES public.articles(id) ON DELETE CASCADE;


--
-- Name: comments comments_author__id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_author__id_fkey FOREIGN KEY (author__id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: favorites favorites_article__id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_article__id_fkey FOREIGN KEY (article__id) REFERENCES public.articles(id) ON DELETE CASCADE;


--
-- Name: favorites favorites_user__id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user__id_fkey FOREIGN KEY (user__id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: follows follows_followee__id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_followee__id_fkey FOREIGN KEY (followee__id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: follows follows_follower__id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conduit
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_follower__id_fkey FOREIGN KEY (follower__id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

