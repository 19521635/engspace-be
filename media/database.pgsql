--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-1.pgdg18.04+1)

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
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.accounts_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.accounts_user OWNER TO db;

--
-- Name: accounts_user_groups; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.accounts_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_user_groups OWNER TO db;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.accounts_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_groups_id_seq OWNER TO db;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.accounts_user_groups_id_seq OWNED BY public.accounts_user_groups.id;


--
-- Name: accounts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_id_seq OWNER TO db;

--
-- Name: accounts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.accounts_user_id_seq OWNED BY public.accounts_user.id;


--
-- Name: accounts_user_user_permissions; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.accounts_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_user_user_permissions OWNER TO db;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.accounts_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_user_permissions_id_seq OWNER TO db;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.accounts_user_user_permissions_id_seq OWNED BY public.accounts_user_user_permissions.id;


--
-- Name: accounts_userfollowing; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.accounts_userfollowing (
    id bigint NOT NULL,
    date_created timestamp with time zone NOT NULL,
    following_user_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.accounts_userfollowing OWNER TO db;

--
-- Name: accounts_userfollowing_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.accounts_userfollowing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userfollowing_id_seq OWNER TO db;

--
-- Name: accounts_userfollowing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.accounts_userfollowing_id_seq OWNED BY public.accounts_userfollowing.id;


--
-- Name: accounts_userprofile; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.accounts_userprofile (
    id bigint NOT NULL,
    dob date,
    website character varying(200) NOT NULL,
    bio text NOT NULL,
    fb_url character varying(200) NOT NULL,
    avatar character varying(100) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.accounts_userprofile OWNER TO db;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.accounts_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userprofile_id_seq OWNER TO db;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.accounts_userprofile_id_seq OWNED BY public.accounts_userprofile.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO db;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO db;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO db;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO db;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO db;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO db;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO db;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO db;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO db;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO db;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO db;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO db;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO db;

--
-- Name: forum_comment; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.forum_comment (
    id bigint NOT NULL,
    body text NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    parent_id bigint,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.forum_comment OWNER TO db;

--
-- Name: forum_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.forum_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_comment_id_seq OWNER TO db;

--
-- Name: forum_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.forum_comment_id_seq OWNED BY public.forum_comment.id;


--
-- Name: forum_commentlike; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.forum_commentlike (
    id bigint NOT NULL,
    is_like boolean NOT NULL,
    date_created timestamp with time zone NOT NULL,
    comment_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.forum_commentlike OWNER TO db;

--
-- Name: forum_commentlike_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.forum_commentlike_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_commentlike_id_seq OWNER TO db;

--
-- Name: forum_commentlike_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.forum_commentlike_id_seq OWNED BY public.forum_commentlike.id;


--
-- Name: forum_post; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.forum_post (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    body text NOT NULL,
    view_count integer NOT NULL,
    is_public boolean NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.forum_post OWNER TO db;

--
-- Name: forum_post_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.forum_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_post_id_seq OWNER TO db;

--
-- Name: forum_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.forum_post_id_seq OWNED BY public.forum_post.id;


--
-- Name: forum_postfollow; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.forum_postfollow (
    id bigint NOT NULL,
    date_created timestamp with time zone NOT NULL,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.forum_postfollow OWNER TO db;

--
-- Name: forum_postfollow_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.forum_postfollow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_postfollow_id_seq OWNER TO db;

--
-- Name: forum_postfollow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.forum_postfollow_id_seq OWNED BY public.forum_postfollow.id;


--
-- Name: forum_postlike; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.forum_postlike (
    id bigint NOT NULL,
    is_like boolean NOT NULL,
    date_created timestamp with time zone NOT NULL,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.forum_postlike OWNER TO db;

--
-- Name: forum_postlike_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.forum_postlike_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_postlike_id_seq OWNER TO db;

--
-- Name: forum_postlike_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.forum_postlike_id_seq OWNED BY public.forum_postlike.id;


--
-- Name: main_folder; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.main_folder (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    is_public boolean NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.main_folder OWNER TO db;

--
-- Name: main_folder_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.main_folder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_folder_id_seq OWNER TO db;

--
-- Name: main_folder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.main_folder_id_seq OWNED BY public.main_folder.id;


--
-- Name: main_folder_sets; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.main_folder_sets (
    id bigint NOT NULL,
    folder_id bigint NOT NULL,
    set_id bigint NOT NULL
);


ALTER TABLE public.main_folder_sets OWNER TO db;

--
-- Name: main_folder_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.main_folder_sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_folder_sets_id_seq OWNER TO db;

--
-- Name: main_folder_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.main_folder_sets_id_seq OWNED BY public.main_folder_sets.id;


--
-- Name: main_set; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.main_set (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    is_public boolean NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    topic_id bigint NOT NULL,
    user_id bigint NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.main_set OWNER TO db;

--
-- Name: main_set_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.main_set_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_set_id_seq OWNER TO db;

--
-- Name: main_set_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.main_set_id_seq OWNED BY public.main_set.id;


--
-- Name: main_setdetail; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.main_setdetail (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    term text NOT NULL,
    definition text NOT NULL,
    term_lang character varying(10) NOT NULL,
    definition_lang character varying(10) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    set_id bigint NOT NULL
);


ALTER TABLE public.main_setdetail OWNER TO db;

--
-- Name: main_setdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.main_setdetail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_setdetail_id_seq OWNER TO db;

--
-- Name: main_setdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.main_setdetail_id_seq OWNED BY public.main_setdetail.id;


--
-- Name: main_topic; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.main_topic (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    is_public boolean NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.main_topic OWNER TO db;

--
-- Name: main_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.main_topic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_topic_id_seq OWNER TO db;

--
-- Name: main_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.main_topic_id_seq OWNED BY public.main_topic.id;


--
-- Name: main_uploadimage; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.main_uploadimage (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.main_uploadimage OWNER TO db;

--
-- Name: main_uploadimage_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.main_uploadimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_uploadimage_id_seq OWNER TO db;

--
-- Name: main_uploadimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.main_uploadimage_id_seq OWNED BY public.main_uploadimage.id;


--
-- Name: accounts_user id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_user ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_id_seq'::regclass);


--
-- Name: accounts_user_groups id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_user_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_groups_id_seq'::regclass);


--
-- Name: accounts_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_user_permissions_id_seq'::regclass);


--
-- Name: accounts_userfollowing id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_userfollowing ALTER COLUMN id SET DEFAULT nextval('public.accounts_userfollowing_id_seq'::regclass);


--
-- Name: accounts_userprofile id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_userprofile ALTER COLUMN id SET DEFAULT nextval('public.accounts_userprofile_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: forum_comment id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_comment ALTER COLUMN id SET DEFAULT nextval('public.forum_comment_id_seq'::regclass);


--
-- Name: forum_commentlike id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_commentlike ALTER COLUMN id SET DEFAULT nextval('public.forum_commentlike_id_seq'::regclass);


--
-- Name: forum_post id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_post ALTER COLUMN id SET DEFAULT nextval('public.forum_post_id_seq'::regclass);


--
-- Name: forum_postfollow id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_postfollow ALTER COLUMN id SET DEFAULT nextval('public.forum_postfollow_id_seq'::regclass);


--
-- Name: forum_postlike id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_postlike ALTER COLUMN id SET DEFAULT nextval('public.forum_postlike_id_seq'::regclass);


--
-- Name: main_folder id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_folder ALTER COLUMN id SET DEFAULT nextval('public.main_folder_id_seq'::regclass);


--
-- Name: main_folder_sets id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_folder_sets ALTER COLUMN id SET DEFAULT nextval('public.main_folder_sets_id_seq'::regclass);


--
-- Name: main_set id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_set ALTER COLUMN id SET DEFAULT nextval('public.main_set_id_seq'::regclass);


--
-- Name: main_setdetail id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_setdetail ALTER COLUMN id SET DEFAULT nextval('public.main_setdetail_id_seq'::regclass);


--
-- Name: main_topic id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_topic ALTER COLUMN id SET DEFAULT nextval('public.main_topic_id_seq'::regclass);


--
-- Name: main_uploadimage id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_uploadimage ALTER COLUMN id SET DEFAULT nextval('public.main_uploadimage_id_seq'::regclass);


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.accounts_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
19	pbkdf2_sha256$260000$Tx8NMwGic3Oo9hHL86Qymi$U9EoEUfCMq1dMRwx8vvJLIbz5r7UoiohfTITA0/T4oE=	\N	f	testaccount	Huy	Quang	testaccount@localhost	f	t	2021-11-22 13:22:38.682856+00
22		\N	f	testuser	user	test	testuser@gmail.com	f	t	2021-11-25 16:06:16.477128+00
2	pbkdf2_sha256$260000$jDEzY1M7TCbsGrrki6lzUt$JBRZJzWhzhtmj8qpiqQb/eT7hDN84QPTy1iFXgUCVv0=	\N	f	member	Duy	Trieu Anh	member@example.com	f	t	2021-10-25 01:21:22+00
9	pbkdf2_sha256$260000$6hM2apOZVPFlMP1hcRaJZz$oF/60dqKBQTYADJkVPPH8MWcXclsDyx/8ce6xp9WMJ4=	\N	f	botran00	Trầnnnn	Đức Bo	botran@gmail.com	f	t	2021-11-11 15:47:27.563943+00
5	pbkdf2_sha256$260000$57DrpkVoPaxeRUFXSodLq3$5Pw1VvH+azWNhKffOp/iNKP3gXZYXNSxbPYmuRcUnmY=	\N	f	user	Van A	Nguyen	nguyenvana@localhost	f	t	2021-11-09 08:07:55+00
6	pbkdf2_sha256$260000$8mIodUygNHZfnRSCuYylMh$TkJZQn8gPB0+dZA4EDZ71ivbdZ6Nnht177MrgcWG43k=	\N	f	user1	Van B	Nguyen	nguyenvanb@localhost	f	t	2021-11-09 08:08:04+00
7	pbkdf2_sha256$260000$0j1QleCxy1eL45cp300IIq$kV8eXfcbq9qGeGWrMESnlG6asccV0odV7R+s+CQeRx0=	\N	f	user2	Van C	Nguyen	nguyenvanc@localhost	f	t	2021-11-09 08:08:12+00
8	pbkdf2_sha256$260000$SLYnfi7ZDMihuXX3mPCh46$PzNeQGoVJ3NH2BMUwtmvdtEpQXokXb0oCL6QD2UW3DA=	\N	f	staff	Staff	EngSpace	staff@localhost	t	t	2021-11-09 08:30:53+00
10	pbkdf2_sha256$260000$boS217s9sRkkZP52xOtcK2$Uwz1Zwe/ZA2iydlRs+7d30+ih9MVV2ALG8gHh50QAqQ=	\N	f	diepvan123	Diệp	Vấn	diepvan@mail.com	f	t	2021-11-11 16:43:26.758078+00
11	pbkdf2_sha256$260000$KzjjUNJc70caahDvCM8vmB$jMwYJbljNaQwV+/eWzOt+/8AoRLAfIhrvoQlKf/rqiA=	\N	f	nguyenkhoai12	Nguyễn	Khoái	nguyenkhoai@mail.com	f	t	2021-11-11 16:50:26.445584+00
12	pbkdf2_sha256$260000$ao3HWVzllAOrNpW974b92a$bMbCcXBsn9s3sPU/5K2FBGYNjUL/QjQIhGD5bzWG9P0=	\N	f	abcd123huy	huy	quang	abcd@gmail.com	f	t	2021-11-19 04:02:08.346786+00
14	pbkdf2_sha256$260000$SuGhT8Ehm7Ank9fUa1ZsiG$sBohQIQEpWZ0cvcahvJLPRqFaxMvTZzDRCUZJUw2Uv0=	\N	f	abcd2	huy	quang	abcd2@gmail.com	f	t	2021-11-19 04:09:09.946524+00
20	pbkdf2_sha256$260000$I6qhtmxT6bWI0e8t10lrTC$qGhjJuu5Jhgc6MNxw2ZkwHdwydrJT5Z2gbfPBIOtl7g=	\N	f	duy	Trieu	Duy	huy@gmail.com	f	t	2021-11-22 15:07:25.331085+00
25	pbkdf2_sha256$260000$hyhLxkU2QHGM8cfYMyz2XI$A8tRekW7T5JKFCKs38K7DSfo8Qe7+H9nskTFWMO94vc=	\N	f	duytester	Trieu	Duy	abc@gmail.com	f	t	2021-12-10 15:53:31.187423+00
29	pbkdf2_sha256$260000$gqyvX2XaOjcm5lg8bYejc3$YGuZNY41+roe0sMlDM9RPKRNuuWwK7J9IkOskojSXkQ=	\N	f	uitabc	uit	uit	wwwkkk@gmail.com	f	t	2021-12-13 17:20:27.689167+00
30	pbkdf2_sha256$260000$kSu0PhIxQbDGB9oLNPwiTJ$zlrH041m/8+TWH9lbAFJTMboou/+sDFxGCn03xiMdq8=	\N	f	ua	a	u	hhh@gmail.com	f	t	2021-12-13 17:29:12.040557+00
23	pbkdf2_sha256$260000$hMVpH7gBE64R7rO4ECwvOs$eNTgsDRQLDSmtJ+pf4+x8CqNBc4I3tb2LswGxOx19GE=	\N	f	tqhit			trieuduy81@gmail.com	f	t	2021-12-05 16:40:24.395764+00
26	pbkdf2_sha256$260000$KqYdXHwhYjuXQfgKpol3cf$Y87sGVYDDUBMvrwxUOlL4iKPR14pX4F93E5QCecFnog=	\N	f	HieuNguyen	Hiếu	Nguyễn	chodenmai@gmail.com	f	t	2021-12-12 15:22:16.966252+00
21	pbkdf2_sha256$260000$EwuJ1mhJwks2OkSVSF7egQ$Dp/lrklhnQRB6B/ZD4J9ilqyFDJMMyZI2/b376Dutr0=	\N	f	quanghuy	Huy	Quang	thieuquanghuy@gmail.com	f	t	2021-11-24 06:52:56.262863+00
13	pbkdf2_sha256$260000$EvzQvsTZUgaBxXRXFZo1Ma$GKwTnynt/nWBprYIq5E4tdUQQ60XCrIuKKAds4KTbgI=	\N	f	abcd1	Huy	Quang	abcd1@gmail.com	f	t	2021-11-19 04:06:20.008184+00
1	pbkdf2_sha256$260000$kuta7EKCWPfYZY7pnHbK6z$dqoRvr1R5gcUcEWzeTgJOP+0u99o03OqUJ21tQ+xjP4=	2021-12-12 17:38:01.343105+00	t	admin	Quang Huy	Thieu	admin@example.com	t	t	2021-10-22 15:21:23+00
3	pbkdf2_sha256$260000$FinKqCj6VWm0XgeRdBnMRb$Ld1HNDSaQxRVJTzznNKBpM3FhdCr89xA0HeZmZtFkoo=	\N	f	member1	Minh Khoi	Cao Nguyen	member1@example.com	f	t	2021-10-25 01:21:55+00
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.accounts_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: accounts_userfollowing; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.accounts_userfollowing (id, date_created, following_user_id, user_id) FROM stdin;
\.


--
-- Data for Name: accounts_userprofile; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.accounts_userprofile (id, dob, website, bio, fb_url, avatar, user_id) FROM stdin;
1	\N				default.jpg	1
2	\N				default.jpg	2
3	\N				default.jpg	3
5	\N				default.jpg	5
6	\N				default.jpg	6
7	\N				default.jpg	7
8	\N				default.jpg	8
10	\N				default.jpg	10
11	\N				default.jpg	11
12	\N				default.jpg	12
14	\N				default.jpg	14
13	2001-12-03		test		default.jpg	13
19	\N				default.jpg	19
20	2021-11-04				default.jpg	20
21	2001-11-02				default.jpg	21
22	\N				default.jpg	22
25	2001-04-11		Hello		default.jpg	25
26	\N				default.jpg	26
9	2000-10-20				default.jpg	9
23	\N				default.jpg	23
29	\N				default.jpg	29
30	\N				default.jpg	30
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add user profile	7	add_userprofile
26	Can change user profile	7	change_userprofile
27	Can delete user profile	7	delete_userprofile
28	Can view user profile	7	view_userprofile
29	Can add user following	8	add_userfollowing
30	Can change user following	8	change_userfollowing
31	Can delete user following	8	delete_userfollowing
32	Can view user following	8	view_userfollowing
33	Can add topic	9	add_topic
34	Can change topic	9	change_topic
35	Can delete topic	9	delete_topic
36	Can view topic	9	view_topic
37	Can add folder	10	add_folder
38	Can change folder	10	change_folder
39	Can delete folder	10	delete_folder
40	Can view folder	10	view_folder
41	Can add set	11	add_set
42	Can change set	11	change_set
43	Can delete set	11	delete_set
44	Can view set	11	view_set
45	Can add set detail	12	add_setdetail
46	Can change set detail	12	change_setdetail
47	Can delete set detail	12	delete_setdetail
48	Can view set detail	12	view_setdetail
49	Can add comment	13	add_comment
50	Can change comment	13	change_comment
51	Can delete comment	13	delete_comment
52	Can view comment	13	view_comment
53	Can add post	14	add_post
54	Can change post	14	change_post
55	Can delete post	14	delete_post
56	Can view post	14	view_post
57	Can add post like	15	add_postlike
58	Can change post like	15	change_postlike
59	Can delete post like	15	delete_postlike
60	Can view post like	15	view_postlike
61	Can add post follow	16	add_postfollow
62	Can change post follow	16	change_postfollow
63	Can delete post follow	16	delete_postfollow
64	Can view post follow	16	view_postfollow
65	Can add comment like	17	add_commentlike
66	Can change comment like	17	change_commentlike
67	Can delete comment like	17	delete_commentlike
68	Can view comment like	17	view_commentlike
69	Can add upload image	18	add_uploadimage
70	Can change upload image	18	change_uploadimage
71	Can delete upload image	18	delete_uploadimage
72	Can view upload image	18	view_uploadimage
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-10-25 01:21:23.089805+00	2	member	1	[{"added": {}}]	6	1
2	2021-10-25 01:21:55.92621+00	3	member1	1	[{"added": {}}]	6	1
3	2021-10-25 01:22:25.319099+00	1	admin	2	[{"changed": {"fields": ["First name", "Last name"]}}]	6	1
4	2021-10-25 01:22:34.110282+00	2	member	2	[{"changed": {"fields": ["First name", "Last name"]}}]	6	1
5	2021-10-25 01:22:44.456006+00	3	member1	2	[{"changed": {"fields": ["First name", "Last name"]}}]	6	1
6	2021-10-25 01:23:06.13454+00	2	member	2	[{"changed": {"fields": ["Email address"]}}]	6	1
7	2021-10-25 01:23:17.133614+00	3	member1	2	[{"changed": {"fields": ["Email address"]}}]	6	1
8	2021-10-25 14:39:21.366124+00	4	member2	1	[{"added": {}}]	6	1
9	2021-10-25 14:40:36.160029+00	4	member2	3		6	1
10	2021-10-25 15:02:06.402658+00	2	member	2	[{"changed": {"fields": ["First name", "Last name"]}}]	6	1
11	2021-10-25 15:02:25.012529+00	3	member1	2	[{"changed": {"fields": ["First name", "Last name"]}}]	6	1
12	2021-10-25 15:03:04.49008+00	1	admin	2	[{"changed": {"fields": ["First name", "Last name"]}}]	6	1
13	2021-11-09 08:07:55.859741+00	5	user	1	[{"added": {}}]	6	1
14	2021-11-09 08:08:04.675818+00	6	user1	1	[{"added": {}}]	6	1
15	2021-11-09 08:08:12.731586+00	7	user2	1	[{"added": {}}]	6	1
16	2021-11-09 08:08:57.039202+00	5	user	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	6	1
17	2021-11-09 08:09:12.603895+00	6	user1	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	6	1
18	2021-11-09 08:09:25.026526+00	7	user2	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	6	1
19	2021-11-09 08:17:05.27493+00	1	Cơ bản	1	[{"added": {}}]	9	1
20	2021-11-09 08:18:24.231502+00	1	Greetings - chào hỏi	1	[{"added": {}}, {"added": {"name": "set detail", "object": "SetDetail object (1)"}}, {"added": {"name": "set detail", "object": "SetDetail object (2)"}}, {"added": {"name": "set detail", "object": "SetDetail object (3)"}}, {"added": {"name": "set detail", "object": "SetDetail object (4)"}}, {"added": {"name": "set detail", "object": "SetDetail object (5)"}}, {"added": {"name": "set detail", "object": "SetDetail object (6)"}}, {"added": {"name": "set detail", "object": "SetDetail object (7)"}}, {"added": {"name": "set detail", "object": "SetDetail object (8)"}}]	11	1
21	2021-11-09 08:19:00.672952+00	2	Du lịch	1	[{"added": {}}]	9	1
22	2021-11-09 08:20:03.874102+00	2	Du lịch	1	[{"added": {}}, {"added": {"name": "set detail", "object": "SetDetail object (9)"}}, {"added": {"name": "set detail", "object": "SetDetail object (10)"}}, {"added": {"name": "set detail", "object": "SetDetail object (11)"}}, {"added": {"name": "set detail", "object": "SetDetail object (12)"}}, {"added": {"name": "set detail", "object": "SetDetail object (13)"}}, {"added": {"name": "set detail", "object": "SetDetail object (14)"}}, {"added": {"name": "set detail", "object": "SetDetail object (15)"}}, {"added": {"name": "set detail", "object": "SetDetail object (16)"}}, {"added": {"name": "set detail", "object": "SetDetail object (17)"}}, {"added": {"name": "set detail", "object": "SetDetail object (18)"}}]	11	1
23	2021-11-09 08:20:31.005818+00	3	Công nghệ	1	[{"added": {}}]	9	1
24	2021-11-09 08:21:28.754842+00	1	Từ vụng 11/11/2021	1	[{"added": {}}]	10	1
25	2021-11-09 08:30:05.5273+00	4	Không phân loại	1	[{"added": {}}]	9	1
26	2021-11-09 08:30:53.267552+00	8	staff	1	[{"added": {}}]	6	1
27	2021-11-09 08:31:45.492531+00	8	staff	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Staff status"]}}]	6	1
28	2021-11-09 08:31:58.26063+00	1	Cơ bản	2	[{"changed": {"fields": ["User"]}}]	9	1
29	2021-11-09 08:32:04.396223+00	2	Du lịch	2	[{"changed": {"fields": ["User"]}}]	9	1
30	2021-11-09 08:32:09.32554+00	3	Công nghệ	2	[{"changed": {"fields": ["User"]}}]	9	1
31	2021-11-09 08:32:14.434932+00	4	Không phân loại	2	[{"changed": {"fields": ["User"]}}]	9	1
32	2021-11-09 08:42:48.004683+00	3	New word 27/10	1	[{"added": {}}, {"added": {"name": "set detail", "object": "SetDetail object (19)"}}, {"added": {"name": "set detail", "object": "SetDetail object (20)"}}, {"added": {"name": "set detail", "object": "SetDetail object (21)"}}, {"added": {"name": "set detail", "object": "SetDetail object (22)"}}, {"added": {"name": "set detail", "object": "SetDetail object (23)"}}, {"added": {"name": "set detail", "object": "SetDetail object (24)"}}, {"added": {"name": "set detail", "object": "SetDetail object (25)"}}, {"added": {"name": "set detail", "object": "SetDetail object (26)"}}, {"added": {"name": "set detail", "object": "SetDetail object (27)"}}, {"added": {"name": "set detail", "object": "SetDetail object (28)"}}, {"added": {"name": "set detail", "object": "SetDetail object (29)"}}, {"added": {"name": "set detail", "object": "SetDetail object (30)"}}, {"added": {"name": "set detail", "object": "SetDetail object (31)"}}, {"added": {"name": "set detail", "object": "SetDetail object (32)"}}, {"added": {"name": "set detail", "object": "SetDetail object (33)"}}, {"added": {"name": "set detail", "object": "SetDetail object (34)"}}, {"added": {"name": "set detail", "object": "SetDetail object (35)"}}, {"added": {"name": "set detail", "object": "SetDetail object (36)"}}, {"added": {"name": "set detail", "object": "SetDetail object (37)"}}, {"added": {"name": "set detail", "object": "SetDetail object (38)"}}, {"added": {"name": "set detail", "object": "SetDetail object (39)"}}, {"added": {"name": "set detail", "object": "SetDetail object (40)"}}, {"added": {"name": "set detail", "object": "SetDetail object (41)"}}, {"added": {"name": "set detail", "object": "SetDetail object (42)"}}, {"added": {"name": "set detail", "object": "SetDetail object (43)"}}, {"added": {"name": "set detail", "object": "SetDetail object (44)"}}, {"added": {"name": "set detail", "object": "SetDetail object (45)"}}, {"added": {"name": "set detail", "object": "SetDetail object (46)"}}, {"added": {"name": "set detail", "object": "SetDetail object (47)"}}, {"added": {"name": "set detail", "object": "SetDetail object (48)"}}, {"added": {"name": "set detail", "object": "SetDetail object (49)"}}, {"added": {"name": "set detail", "object": "SetDetail object (50)"}}, {"added": {"name": "set detail", "object": "SetDetail object (51)"}}, {"added": {"name": "set detail", "object": "SetDetail object (52)"}}, {"added": {"name": "set detail", "object": "SetDetail object (53)"}}, {"added": {"name": "set detail", "object": "SetDetail object (54)"}}, {"added": {"name": "set detail", "object": "SetDetail object (55)"}}, {"added": {"name": "set detail", "object": "SetDetail object (56)"}}, {"added": {"name": "set detail", "object": "SetDetail object (57)"}}, {"added": {"name": "set detail", "object": "SetDetail object (58)"}}, {"added": {"name": "set detail", "object": "SetDetail object (59)"}}, {"added": {"name": "set detail", "object": "SetDetail object (60)"}}, {"added": {"name": "set detail", "object": "SetDetail object (61)"}}, {"added": {"name": "set detail", "object": "SetDetail object (62)"}}, {"added": {"name": "set detail", "object": "SetDetail object (63)"}}, {"added": {"name": "set detail", "object": "SetDetail object (64)"}}, {"added": {"name": "set detail", "object": "SetDetail object (65)"}}, {"added": {"name": "set detail", "object": "SetDetail object (66)"}}, {"added": {"name": "set detail", "object": "SetDetail object (67)"}}, {"added": {"name": "set detail", "object": "SetDetail object (68)"}}, {"added": {"name": "set detail", "object": "SetDetail object (69)"}}, {"added": {"name": "set detail", "object": "SetDetail object (70)"}}, {"added": {"name": "set detail", "object": "SetDetail object (71)"}}, {"added": {"name": "set detail", "object": "SetDetail object (72)"}}, {"added": {"name": "set detail", "object": "SetDetail object (73)"}}, {"added": {"name": "set detail", "object": "SetDetail object (74)"}}, {"added": {"name": "set detail", "object": "SetDetail object (75)"}}, {"added": {"name": "set detail", "object": "SetDetail object (76)"}}, {"added": {"name": "set detail", "object": "SetDetail object (77)"}}, {"added": {"name": "set detail", "object": "SetDetail object (78)"}}, {"added": {"name": "set detail", "object": "SetDetail object (79)"}}, {"added": {"name": "set detail", "object": "SetDetail object (80)"}}, {"added": {"name": "set detail", "object": "SetDetail object (81)"}}, {"added": {"name": "set detail", "object": "SetDetail object (82)"}}, {"added": {"name": "set detail", "object": "SetDetail object (83)"}}, {"added": {"name": "set detail", "object": "SetDetail object (84)"}}, {"added": {"name": "set detail", "object": "SetDetail object (85)"}}, {"added": {"name": "set detail", "object": "SetDetail object (86)"}}, {"added": {"name": "set detail", "object": "SetDetail object (87)"}}]	11	1
33	2021-11-09 08:46:11.250264+00	5	Kinh tế	1	[{"added": {}}]	9	1
34	2021-11-09 08:48:22.094849+00	4	Marketing	1	[{"added": {}}, {"added": {"name": "set detail", "object": "SetDetail object (88)"}}, {"added": {"name": "set detail", "object": "SetDetail object (89)"}}, {"added": {"name": "set detail", "object": "SetDetail object (90)"}}, {"added": {"name": "set detail", "object": "SetDetail object (91)"}}, {"added": {"name": "set detail", "object": "SetDetail object (92)"}}, {"added": {"name": "set detail", "object": "SetDetail object (93)"}}, {"added": {"name": "set detail", "object": "SetDetail object (94)"}}, {"added": {"name": "set detail", "object": "SetDetail object (95)"}}, {"added": {"name": "set detail", "object": "SetDetail object (96)"}}, {"added": {"name": "set detail", "object": "SetDetail object (97)"}}, {"added": {"name": "set detail", "object": "SetDetail object (98)"}}, {"added": {"name": "set detail", "object": "SetDetail object (99)"}}, {"added": {"name": "set detail", "object": "SetDetail object (100)"}}, {"added": {"name": "set detail", "object": "SetDetail object (101)"}}, {"added": {"name": "set detail", "object": "SetDetail object (102)"}}]	11	1
35	2021-11-22 13:09:53.236343+00	15	testaccount	3		6	1
36	2021-11-22 13:11:36.880046+00	16	testaccount	3		6	1
37	2021-11-22 13:13:13.784041+00	17	testaccount	3		6	1
38	2021-11-22 13:17:14.171902+00	18	testaccount	3		6	1
39	2021-11-26 06:37:16.155717+00	1	Top 5 đế quốc mạnh nhất lịch sử	1	[{"added": {}}]	14	1
40	2021-11-26 06:39:18.025027+00	2	Mình hỏi này chút xíu	1	[{"added": {}}]	14	1
41	2021-11-26 06:40:19.498131+00	3	Theo dõi nhưng không được	1	[{"added": {}}]	14	1
42	2021-11-26 06:43:51.441514+00	1	Comment object (1)	1	[{"added": {}}]	13	1
43	2021-11-26 06:44:45.186589+00	2	Comment object (2)	1	[{"added": {}}]	13	1
44	2021-12-12 17:56:13.575478+00	3	member1	2	[{"changed": {"fields": ["Email address"]}}]	6	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	accounts	user
7	accounts	userprofile
8	accounts	userfollowing
9	main	topic
10	main	folder
11	main	set
12	main	setdetail
13	forum	comment
14	forum	post
15	forum	postlike
16	forum	postfollow
17	forum	commentlike
18	main	uploadimage
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-10-22 15:20:21.083266+00
2	contenttypes	0002_remove_content_type_name	2021-10-22 15:20:21.175327+00
3	auth	0001_initial	2021-10-22 15:20:21.281429+00
4	auth	0002_alter_permission_name_max_length	2021-10-22 15:20:21.295508+00
5	auth	0003_alter_user_email_max_length	2021-10-22 15:20:21.314758+00
6	auth	0004_alter_user_username_opts	2021-10-22 15:20:21.353912+00
7	auth	0005_alter_user_last_login_null	2021-10-22 15:20:21.368298+00
8	auth	0006_require_contenttypes_0002	2021-10-22 15:20:21.376647+00
9	auth	0007_alter_validators_add_error_messages	2021-10-22 15:20:21.38825+00
10	auth	0008_alter_user_username_max_length	2021-10-22 15:20:21.404324+00
11	auth	0009_alter_user_last_name_max_length	2021-10-22 15:20:21.41877+00
12	auth	0010_alter_group_name_max_length	2021-10-22 15:20:21.468929+00
13	auth	0011_update_proxy_permissions	2021-10-22 15:20:21.482427+00
14	auth	0012_alter_user_first_name_max_length	2021-10-22 15:20:21.49654+00
15	accounts	0001_initial	2021-10-22 15:20:21.706349+00
16	admin	0001_initial	2021-10-22 15:20:21.756301+00
17	admin	0002_logentry_remove_auto_add	2021-10-22 15:20:21.77607+00
18	admin	0003_logentry_add_action_flag_choices	2021-10-22 15:20:21.792668+00
19	main	0001_initial	2021-10-22 15:20:21.888559+00
20	main	0002_auto_20210923_2148	2021-10-22 15:20:22.018498+00
21	main	0003_auto_20210925_0044	2021-10-22 15:20:22.080341+00
22	main	0004_alter_setdetail_set	2021-10-22 15:20:22.108903+00
23	main	0005_auto_20211007_2125	2021-10-22 15:20:22.369065+00
24	main	0006_auto_20211008_1925	2021-10-22 15:20:22.501982+00
25	main	0007_alter_folder_sets	2021-10-22 15:20:22.566823+00
26	sessions	0001_initial	2021-10-22 15:20:22.590583+00
27	main	0008_set_image	2021-11-09 08:15:26.269445+00
28	accounts	0002_alter_user_options	2021-11-23 05:59:10.642824+00
29	forum	0001_initial	2021-11-23 05:59:10.9068+00
30	forum	0002_alter_comment_parent	2021-11-23 05:59:10.953675+00
31	forum	0003_alter_post_options	2021-11-23 05:59:10.975535+00
32	main	0009_auto_20211122_2210	2021-11-23 05:59:11.049088+00
33	forum	0004_alter_comment_options	2021-11-27 14:10:24.834484+00
34	main	0010_uploadimage	2021-11-27 15:49:28.692891+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
bkmpibo0u2usynf93hs1rb98n3cqbjrd	.eJxVjEEOwiAQRe_C2pBhaKG4dO8ZyMCAVA0kpV0Z765NutDtf-_9l_C0rcVvPS1-ZnEWSpx-t0DxkeoO-E711mRsdV3mIHdFHrTLa-P0vBzu30GhXr71lCAAusyGEJyxlKNhy1Y5nFDrZIaUNQCiyhnHgHmIPKpoER0pa0C8P9aUNzg:1mdwUK:vcGVeDdFtit-jQDTZ8huL-JrnufdshO1pKCp5mWartM	2021-11-05 15:29:44.26038+00
5uida4hu5biye51dtm9f8d363unngo5u	.eJxVjEEOwiAQRe_C2pBhaKG4dO8ZyMCAVA0kpV0Z765NutDtf-_9l_C0rcVvPS1-ZnEWSpx-t0DxkeoO-E711mRsdV3mIHdFHrTLa-P0vBzu30GhXr71lCAAusyGEJyxlKNhy1Y5nFDrZIaUNQCiyhnHgHmIPKpoER0pa0C8P9aUNzg:1meofa:VCafdyd0CrC10Mg8rBbpM1yXEafj8gqgrYu8F3AlK5w	2021-11-08 01:20:58.933676+00
6756p0z8opggxj3jt8b1rbb51g34juxb	.eJxVjEEOwiAQRe_C2pBhaKG4dO8ZyMCAVA0kpV0Z765NutDtf-_9l_C0rcVvPS1-ZnEWSpx-t0DxkeoO-E711mRsdV3mIHdFHrTLa-P0vBzu30GhXr71lCAAusyGEJyxlKNhy1Y5nFDrZIaUNQCiyhnHgHmIPKpoER0pa0C8P9aUNzg:1mhVtH:byh_HpnGN2KYot-LB6E7nkN38gGrSpzWIqK95O8Vp_k	2021-11-15 11:54:15.243131+00
xjv4tev5g3rzjswcf239ozim6ti1j6d7	.eJxVjEEOwiAQRe_C2pBhaKG4dO8ZyMCAVA0kpV0Z765NutDtf-_9l_C0rcVvPS1-ZnEWSpx-t0DxkeoO-E711mRsdV3mIHdFHrTLa-P0vBzu30GhXr71lCAAusyGEJyxlKNhy1Y5nFDrZIaUNQCiyhnHgHmIPKpoER0pa0C8P9aUNzg:1mp94j:IiIx8K9I9NRH-fUjWiA7TFuJ3M5AVnaENYTEfLoL2e0	2021-12-06 13:09:37.548584+00
fvatcth7ckg7ndaey698i2dydiecl2ap	.eJxVjEEOwiAQRe_C2pBhaKG4dO8ZyMCAVA0kpV0Z765NutDtf-_9l_C0rcVvPS1-ZnEWSpx-t0DxkeoO-E711mRsdV3mIHdFHrTLa-P0vBzu30GhXr71lCAAusyGEJyxlKNhy1Y5nFDrZIaUNQCiyhnHgHmIPKpoER0pa0C8P9aUNzg:1mqUoa:evktXqc9mZ46_NsyMTI9BoYN55wCXeyeaZY8MvIdKtQ	2021-12-10 06:34:32.820187+00
va9q2fe4o3mxtizjs8vxx8w1g992p82m	.eJxVjEEOwiAQRe_C2pBhaKG4dO8ZyMCAVA0kpV0Z765NutDtf-_9l_C0rcVvPS1-ZnEWSpx-t0DxkeoO-E711mRsdV3mIHdFHrTLa-P0vBzu30GhXr71lCAAusyGEJyxlKNhy1Y5nFDrZIaUNQCiyhnHgHmIPKpoER0pa0C8P9aUNzg:1mwSnR:k4uSUs4lnwuq8R1ne-wNlcGoHhXk4TdFoEjluIxwA24	2021-12-26 17:38:01.346893+00
\.


--
-- Data for Name: forum_comment; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.forum_comment (id, body, date_created, date_updated, parent_id, post_id, user_id) FROM stdin;
1	Rất có thể là ng đó chặn em nên em ko theo dõi đc đấy!	2021-11-26 06:43:51.439111+00	2021-11-26 06:43:51.439131+00	\N	3	9
2	Lỗi ấy mà	2021-11-26 06:44:45.184567+00	2021-11-26 06:44:45.184595+00	\N	3	10
3	hello mọi người	2021-12-01 17:34:57.233963+00	2021-12-01 17:34:57.233996+00	\N	3	9
4	Comment test	2021-12-01 17:37:15.309895+00	2021-12-01 17:37:15.309919+00	\N	3	9
5	Hi	2021-12-01 18:08:33.201017+00	2021-12-01 18:08:33.201042+00	3	3	9
\.


--
-- Data for Name: forum_commentlike; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.forum_commentlike (id, is_like, date_created, comment_id, user_id) FROM stdin;
\.


--
-- Data for Name: forum_post; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.forum_post (id, name, body, view_count, is_public, date_created, date_updated, user_id) FROM stdin;
3	Theo dõi nhưng không được	Em theo dõi một người nhưng ấn mãi nó vẫn bảo ko theo dõi người này. Lúc đầu em nghĩ là do lag nhưng thấy mạng vẫn ổn. Mong mọi người giúp đỡ	140	t	2021-11-26 06:40:19.496338+00	2021-11-26 06:40:19.496361+00	2
2	Mình hỏi này chút xíu	Cách đăng ảnh lên bài viết?\r\nCách xuống hàng khi viết bài viết?\r\nCách đổi màu, phông, nét, cỡ chữ khi viết bài?\r\nCách đăng bài viết không bị coi là spam khi đăng đúng luật?\r\nBài viết mang tính tham khảo của mình, mong các bạn cất hết gạch đá, bỏ nokia và dép Lào xuống trc khi động vào comment! Cảm ơn!	103	t	2021-11-26 06:39:18.022727+00	2021-11-26 06:39:18.022751+00	21
4	ReactJS	<p>Test <img></p>	21	t	2021-12-12 09:02:49.632641+00	2021-12-12 09:02:49.632661+00	9
1	Top 5 đế quốc mạnh nhất lịch sử	Hế lu mn, I'm come back. Hmm....................nhân loại đã chứng kiến sự thịnh suy, hưng vong của không biết bao nhiêu đế chế. Trong số đó, có rất nhiều đế chế thực sự ảnh hưởng đến lịch sử toàn thế giới, khiến hậu thế không ngừng băn khoăn, không ngừng ngưỡng mộ. Sau đây cùng mik tìm hiểu zề " NHỮNG ĐẾ QUỐC MẠNH NHẤT LỊCH SỬ" nhee!!! À mà đặc biệt trong đó có 1 nước đã bj VN đánh bại nhee, let's gooo!!!\r\n\r\n1. Đế quốc Ba Tư (550 TCN – 330 TCN)\r\n\r\nLãnh thổ đế quốc Ba Tư\r\n\r\n\r\nĐây có lẽ là một trong những đế quốc có lãnh thổ rộng lớn nhất thời cổ đại, là triều đại đầu tiên của người Ba Tư, lãnh thổ ngày nay thuộc Iran. Những ông vua nổi tiếng nhất của vương triều này như Cyrus, Darius và Xerxes đã liên tục mở rộng lãnh thổ của đế quốc bằng những cuộc chinh phạt khắp Á, Âu.\r\n\r\nVào thời đỉnh cao của mình, đế quốc này có diện tích lên tới 5,5 triệu km2, bao gồm gần như toàn bộ vùng Trung Cận Đông (trừ bán đảo Ả Rập), một phần bán đảo Balkan (phía bắc Hy Lạp ngày nay) và Ai Cập.\r\n\r\nDưới sự trị vì của nhà Achaemenes, đế quốc Ba Tư đã thống nhất cả một vùng Trung Đông và mang lại hoà bình trong suốt hơn 200 năm cho khu vực nóng bỏng này. Không phải lúc nào trong lịch sử, Trung Đông cũng có được sự ổn định như vậy.\r\n\r\nBằng chính sách khoan dung, dung hoà dân tộc, tôn giáo của mình, các hoàng đế Ba Tư đã tạo nên một trong những đế chế có ảnh hưởng nhất thế giới trong suốt 2 thế kỷ. Tuy vậy, sự nổi lên của Alexander Đại Đế ở Macedonia đã trở thành một mối lo ngại cho Ba Tư. Năm 328 TCN, Alexander xuất quân chinh phạt, lật đổ hoàng đế Darius III, đồng thời kết thúc sự tồn tại của đế quốc Ba Tư.\r\n\r\n2. Đế quốc La Mã (27 TCN-1453)\r\n\r\nLa Mã chính là đế chế có thời gian tồn tại lâu nhất, kéo dài tới 1480 năm (27 TCN – 1453). Lịch sử của đế chế này bắt đầu khi hoàng đế Augustus lên ngôi vào năm 27 TCN và kết thúc vào năm 1453 khi thủ đô Constantinople rơi vào tay người Ottoman. Trước đó, vào năm 395, đế quốc La Mã đã phân liệt làm 2 phần: Tây La Mã và Đông La Mã. Bị quân đội của người German (một dân tộc du mục) tấn công, Tây La Mã diệt vong vào năm 476.\r\n\r\nSau khi Tây La Mã diệt vong, Đông La Mã gấp rút thực hiện công cuộc phục hưng đế chế của mình. Và thực tế, Đông La Mã đã lấy lại phần nào hình ảnh của một La Mã thời đỉnh cao. Đông La Mã đánh chiếm được bán đảo Italy (vùng đất được coi là thánh địa của đế quốc La Mã xưa). Sau này, Đông La Mã (còn gọi là Byzantine) đã trở thành một thế lực nổi trội ở phía đông châu Âu trong hơn 1000 năm.\r\n\r\nTồn tại suốt 1 thiên niên kỷ rưỡi, La Mã có một sức ảnh hưởng vô cùng lớn với lịch sử cả 3 châu lục: Âu, Á và Phi. Cùng với Hy Lạp, La Mã đã đặt nền móng cho một thời kỳ văn minh huy hoàng của nhân loại. Hàng nghìn năm sau, người châu Âu vẫn còn cảm thấy ngỡ ngàng khi phát hiện ra những di chỉ khảo cổ của nền văn minh Hy – La rực rỡ này.\r\n\r\n\r\n\r\n3. Đế quốc Omeyyad (661 – 750)\r\n\r\nNăm 632, sau khi nhà tiên tri đạo Hồi Muhammad qua đời, các khalip (vua Hồi giáo) nắm quyền điều hành quốc gia. Năm 661, nhà Omeyyad dời đô về Damascus (thủ đô Syria ngày nay) và dựng nên một đế chế hùng mạnh nhất lịch sử Hồi giáo.\r\n\r\nLãnh thổ của đế chế này lên tới 15 triệu km2, bao gồm toàn bộ vùng Trung Đông, toàn bộ Bắc Phi và phần lớn lãnh thổ Tây Ban Nha ngày nay. Đó là một trong những đế chế rộng lớn nhất lịch sử thế giới với dân số chiếm 1/3 dân số thế giới lúc bấy giờ.\r\n\r\nMột trong những cống hiến quan trọng nhất của đế chế này với lịch sử là việc đặt nền móng để Hồi giáo trở thành một trong những tôn giáo phổ biến nhất thế giới. Thời trị vì của đế chế Omeyyad chính là thời hoàng kim của Hồi giáo. Những khoa học gia, nghệ thuật gia người Hồi thời này cũng đóng góp cho nhân loại rất nhiều tri thức quý báu.\r\n\r\n4. Đế quốc Mông Cổ (1206 – 1294)\r\n\r\nMông Cổ chính là đế chế có lãnh thổ liền nhau lớn nhất lịch sử nhân loại. Từ những đồng cỏ hoang vu ở Trung Á, Thành Cát Tư Hãn, nhà sáng lập đế chế, đã phát động những cuộc chiến chinh phục đất đai, thành luỹ liên miên trong suốt cuối thế kỷ 12, đầu thế kỷ 13. Sự mở rộng của đế chế Mông Cổ vẫn được tiếp diễn dưới thời các con cháu của ông.\r\n\r\nỞ thời kỳ đỉnh cao của mình, đế quốc này trải rộng từ Trung Hoa (châu Á) đến tận phía đông Hungary (châu Âu). Đế chế Mông Cổ trải dài 9700 km từ tây sang đông với diện tích lãnh thổ lên tới 24 triệu km2, chiếm đến 1/6 diện tích mặt đất.\r\n\r\nDù vậy không phải lúc nào những cuộc chinh phạt của họ cũng thành công. Ở châu Á, ngay vào thời điểm đỉnh cao của mình, họ đã liên tiếp bại trận ở Nhật Bản, Indonesia, đặc biệt là Việt Nam ( thấy tự hào về Việt Nam ghê ). Ba lần tấn công Đại Việt vào các năm 1257, 1285 và 1287, người Mông Cổ (khi ấy là triều Nguyên) đều chuốc lấy thảm bại. Với chiến thuật khéo léo, lấy ít thắng nhiều, nhà Trần và quân dân Đại Việt đã giáng cho kẻ đi chinh phục liên tiếp những đòn đau ở Chương Dương, Hàm Tử, Tây Kết, Đông Bộ Đầu… Lương thảo cạn, thuỷ thổ khắc nghiệt, quân Mông Cổ đành thoái lui về bắc mà không đạt được bất kỳ mục đích quân sự nào.\r\n\r\n\r\n\r\nNhững cơ sở để người Mông Cổ duy trì đế quốc của mình là khá lỏng lẻo. Đó chỉ đơn giản là những vùng lãnh thổ có được nhờ chinh phạt và sức mạnh bạo lực. Nó thiếu hẳn đi sự gắn kết về văn hoá hay khoa học, kỹ thuật cho phép người Mông Cổ kiểm soát đế chế rộng lớn của mình.\r\n\r\nHậu quả là sau khi Thành Cát Tư Hãn băng hà, đế quốc của ông phân liệt thành những quốc gia nhỏ. Thành tựu lớn nhất của họ có lẽ là việc dựng lập nên nhà Nguyên ở Trung Hoa. Người khai sáng nhà Nguyên là cháu nội của Thành Cát Tư Hãn, tên gọi Hốt Tất Liệt. Sau khi vào Trung Nguyên, ông đã tiến hành rất nhiều cải cách và dần dần “Hán hoá”, gắn bó với truyền thống Trung Hoa, trở thành một nhà bảo trợ cho học thuật và nghệ thuật.\r\n\r\nNgười Mông Cổ nổi tiếng là những chiến binh hung hãn và cai trị rất tàn nhẫn. Tuy nhiên, những cuộc chinh phạt của họ cũng đem đến hiệu ứng tích cực, một trong số đó là hồi sinh “Con đường tơ lụa” nối Trung Hoa với châu Âu, vốn đã rơi vào quên lãng sau khi nhà Đường sụp đổ.\r\n\r\n5. Đế quốc Anh (1583 – 1997)\r\n\r\n\r\n\r\nCuối thế kỷ 16, từ những trạm mậu dịch hải ngoại nhỏ bé, người Anh đã thiết lập nên một trong những đế quốc vĩ đại nhất thế giới. Người ta từng nói: “Mặt trời không bao giờ lặn trên đế quốc Anh”. Và quả thực, ở thời điểm hoàng kim nhất của mình, diện tích của đế quốc Anh lên tới hơn 33 triệu km2, cai trị gần 500 triệu dân, chiếm 1/5 dân số thế giới thời đó.\r\n\r\nNhững thuộc địa lớn nhất của Anh khi ấy bao gồm: Canada, Nam Phi, Ấn Độ và Úc. Bằng sức mạnh tài chính và quân sự của mình (đặc biệt là hải quân), người Anh đã giữ vị thế bá chủ thế giới trong suốt thế kỷ 19.\r\n\r\nĐến thế kỷ 20, sự vươn lên mạnh mẽ của Hoa Kỳ và Đức đe doạ nghiêm trọng tới vị thế của đế quốc Anh. Trong thế chiến 2 (1939 – 1945), Anh mất hầu như toàn bộ thuộc địa của mình ở Đông Nam Á vào tay quân Nhật. Sau chiến tranh, Anh phải trao trả độc lập cho Ấn Độ, thuộc địa đông dân và giàu có nhất của mình. Trong suốt thế kỷ 20, các thuộc địa còn lại của Anh cũng dần dần giành được độc lập. Đế quốc Anh rộng lớn cuối cùng tan rã.\r\n\r\nNgày nay, dấu hiệu cuối cùng để người ta có thể nhận ra một đế quốc vĩ đại chỉ là một hiệp hội lỏng lẻo mang tên “Khối thịnh vượng chung” với 16 quốc gia về danh nghĩa có chung một nguyên thủ là nữ hoàng Anh Elizabeth II.\r\n\r\nHmm.....................đến phiên bản English nhennn::::\r\n\r\n1. Persian Empire (550 BC – 330 BC)\r\n\r\nPersian Empire Territory\r\nThis was perhaps one of the most extensive empires of antiquity, being the first dynasty of the Persians, the territory of which today belongs to Iran. The most famous kings of this dynasty such as Cyrus, Darius and Xerxes continuously expanded the empire's territory by conquests throughout Asia and Europe.\r\n\r\nAt its height, the empire covered an area of ​​5.5 million square kilometers, including almost the entire Middle East (except for the Arabian peninsula), part of the Balkan peninsula (north of modern Greece). present) and Egypt.\r\n\r\nUnder the rule of the Achaemenid dynasty, the Persian empire unified the entire Middle East and brought peace for more than 200 years to this hot region. Not always in history has the Middle East enjoyed such stability.\r\n\r\nWith their policy of tolerance, ethnic and religious harmony, the Persian emperors created one of the most influential empires in the world during two centuries. Nevertheless, the rise of Alexander the Great in Macedonia became a concern for Persia. In 328 BC, Alexander invaded and overthrew the emperor Darius III, and ended the existence of the Persian empire.\r\n\r\n2. Roman Empire (27 BC-1453)\r\n\r\nRome is the longest-lived empire, lasting up to 1480 years (27 BC - 1453). The history of this empire began when the emperor Augustus ascended the throne in 27 BC and ended in 1453 when the capital Constantinople fell to the Ottomans. Before that, in 395, the Roman Empire was divided into two parts: Western Rome and Eastern Rome. Attacked by armies of the Germans (a nomadic people), Western Rome perished in 476.\r\n\r\nAfter the destruction of Western Rome, the Eastern Romans rushed to restore their empire. And indeed, the Byzantines have regained somewhat of the image of a Rome at its peak. The Byzantines conquered the Italian peninsula (the land considered the holy land of the ancient Roman Empire). Later, the Byzantine (also known as Byzantine) became a dominant force in eastern Europe for more than 1000 years.\r\n\r\nExisting for a millennium and a half, Rome had a huge influence on the history of all three continents: Europe, Asia and Africa. Along with Greece, Rome laid the foundation for a glorious period of human civilization. Thousands of years later, Europeans are still amazed when they discover the archaeological remains of this brilliant Greco-Roman civilization.\r\n\r\n3. Omyyad Empire (661 – 750)\r\n\r\nIn 632, after the death of the Islamic prophet Muhammad, the caliphs (kings of Islam) took control of the country. In 661, the Omayyads moved the capital to Damascus (present-day Syria's capital) and built the most powerful empire in Islamic history.\r\n\r\nThe territory of this empire amounted to 15 million square kilometers, including the entire Middle East, all of North Africa and most of present-day Spain. It was one of the largest empires in the history of the world with a population of one-third of the world's population at that time.\r\n\r\nOne of the empire's most important contributions to history was in laying the groundwork for Islam to become one of the world's most popular religions. The reign of the Omayyad empire was the golden age of Islam. The Muslim scientists and artists of this time also contributed a lot of valuable knowledge to mankind.\r\n\r\n4. Mongol Empire (1206 – 1294)\r\n\r\nMongolia is the largest contiguous empire in human history. From the wild grasslands of Central Asia, Genghis Khan, the founder of the empire, waged wars to conquer land and fortresses continuously throughout the late 12th and early 13th centuries. The expansion of the Mongol empire continued under his descendants.\r\n\r\nAt its height, the empire stretched from China (Asia) all the way to eastern Hungary (Europe). The Mongol Empire stretched 9700 km from west to east with an area of ​​​​up to 24 million km2, accounting for 1/6 of the land area.\r\n\r\nTheir conquests were not always successful, though. In Asia, right at their peak, they were successively defeated in Japan, Indonesia, and especially Vietnam (I'm so proud of Vietnam). Three times attacking Dai Viet in 1257, 1285 and 1287, the Mongols (then the Nguyen Dynasty) were defeated. With skillful tactics, winning more with less, the Tran dynasty and Dai Viet army and people gave the conquerors consecutive painful blows in Chuong Duong, Ham Tu, Tay Ket, Dong Bo Dau, etc. harsh, the Mongols had to retreat north without achieving any military goal.\r\n\r\n\r\n\r\nThe bases for the Mongols maintained their empire was rather loose. Those were simply territories acquired through conquest and violent power. It lacked the cultural or scientific coherence that allowed the Mongols to control their vast empire.\r\n\r\nAs a result, after Genghis Khan's death, his empire split into small states. Their greatest achievement was probably the establishment of the Yuan Dynasty in China. The founder of the Yuan dynasty was the grandson of Genghis Khan, named Kublai Khan. After entering the Central Highlands, he carried out many reforms and gradually "sinicized", adhered to the Chinese tradition, became a patron of academia and the arts.\r\n\r\nThe Mongols were famous for being fierce warriors and cruel rulers. However, their conquests also brought positive effects, one of which was the revival of the "Silk Road" linking China with Europe, which had fallen into oblivion after the fall of the Tang Dynasty.\r\n\r\n5. British Empire (1583 - 1997)\r\n\r\nAt the end of the 16th century, from small overseas trading posts, the British established one of the greatest empires in the world. It was once said: "The sun never sets on the British Empire". And indeed, at its heyday, the area of ​​the British empire amounted to more than 33 million square kilometers, ruling nearly 500 million people, accounting for one-fifth of the world's population at that time.\r\n\r\nThe largest British colonies at that time included: Canada, South Africa, India and Australia. With its financial and military power (especially naval power), the British maintained world hegemony throughout the 19th century.\r\n\r\nBy the 20th century, the strong rise of the United States and Germany seriously threatened the position of the British Empire. During World War 2 (1939 - 1945), Britain lost almost all of its colonies in Southeast Asia to the Japanese. After the war, Britain had to give independence to India, its most populous and richest colony. Throughout the 20th century, the remaining British colonies also gradually gained independence. The vast British Empire eventually disintegrated.\r\n\r\nToday, the last sign of a great empire is a loose association called the "Commonwealth" of 16 countries that nominally share one head, the Queen of England. Elizabeth II.\r\n\r\nĐến đây là hết rùii, hc lịch sử xong thấy tự hào về đất nước chúng ta quá....Byebye for now <sub>~</sub>\r\n\r\nNhững ngừi vote bài của tôi đều là những ngừi tốt bụng, đẹp troai xinh gái :33..... Z nên vote bài cho tuii điiii	51	t	2021-11-26 06:37:16.142914+00	2021-11-26 06:37:16.142937+00	9
\.


--
-- Data for Name: forum_postfollow; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.forum_postfollow (id, date_created, post_id, user_id) FROM stdin;
\.


--
-- Data for Name: forum_postlike; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.forum_postlike (id, is_like, date_created, post_id, user_id) FROM stdin;
3	f	2021-11-30 16:14:32.566936+00	1	9
2	f	2021-12-06 05:03:02.167575+00	3	9
1	t	2021-12-08 14:34:49.749804+00	2	9
\.


--
-- Data for Name: main_folder; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.main_folder (id, name, description, is_public, date_created, date_updated, user_id) FROM stdin;
2	Thư mục ngày 21/11/2021	Thư mục ngày 21/11/2021	f	2021-11-21 07:15:05.669063+00	2021-11-21 07:15:05.669093+00	13
3	Thư mục ngày 20/11/2021	Thư mục ngày 20/11/2021	f	2021-11-21 07:42:00.662694+00	2021-11-21 07:42:00.662736+00	13
6	Food	Food	f	2021-11-23 17:10:38.580699+00	2021-11-23 17:10:38.580725+00	20
5	Từ vựng Toeic	Những từ vựng hay gặp trong toeic	t	2021-11-23 10:14:32.014115+00	2021-11-25 04:24:19.584841+00	9
9	Test thu muc	thu muc	t	2021-11-25 15:51:28.414683+00	2021-11-25 15:51:28.414709+00	8
1	Từ vụng 11/11/20211	Các từ vựng học ngày 11/11	t	2021-11-09 08:21:28.745739+00	2021-11-29 04:37:16.365737+00	5
11	Thư mục ngày 9/12	Mô tả	t	2021-12-09 13:34:28.74176+00	2021-12-09 13:59:55.995107+00	21
7	Thư mục ngày 24	Mô tả	t	2021-11-24 06:58:46.05115+00	2021-12-09 14:00:27.897957+00	21
12	Thư mục 11/12	Hellooo	t	2021-12-11 09:46:04.302579+00	2021-12-11 09:46:04.302609+00	25
14	Cuộc sống thường ngày	các từ thông dụng trong cuộc sống	t	2021-12-12 12:14:47.424428+00	2021-12-12 12:14:47.42445+00	23
15	Công nghệ thông tin	các từ vựng chuyên ngành CNTT	t	2021-12-12 12:16:17.698254+00	2021-12-12 12:16:17.698281+00	23
\.


--
-- Data for Name: main_folder_sets; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.main_folder_sets (id, folder_id, set_id) FROM stdin;
1	1	1
2	1	2
16	5	8
29	7	13
31	11	13
33	12	39
35	14	43
36	14	44
37	14	45
39	15	46
40	15	47
42	14	48
\.


--
-- Data for Name: main_set; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.main_set (id, name, description, is_public, date_created, date_updated, topic_id, user_id, image) FROM stdin;
1	Greetings - chào hỏi	Các từ vựng chào hỏi cơ bản	t	2021-11-09 08:18:24.212628+00	2021-11-09 08:18:24.212647+00	1	5	
3	New word 27/10	Từ vựng ngày 27/10	t	2021-11-09 08:42:47.889334+00	2021-11-09 08:42:47.889353+00	4	7	
48	phương tiện di chuyển	từ vựng về các loại phương tiện di chuyển	t	2021-12-12 12:09:49.789981+00	2021-12-12 12:09:49.790006+00	1	23	
45	các phòng trong nhà	từ vựng về các loại phòng trong nhà	t	2021-12-12 11:40:48.297895+00	2021-12-12 12:10:57.77333+00	1	23	
4	Marketing	Từ vựng marketing	t	2021-11-09 08:48:22.06684+00	2021-11-21 06:49:54.940696+00	5	6	
2	Thuật ngữ du lịch	Các từ vựng chủ đề du lịch	t	2021-11-09 08:20:03.855688+00	2021-12-12 18:04:34.10583+00	2	6	
13	Food	Food	t	2021-11-24 07:00:05.598743+00	2021-11-25 13:51:35.604254+00	1	21	
8	Thể thao	Những từ vựng liên quan đến thể thao	t	2021-11-23 07:52:30.957526+00	2021-11-25 16:34:36.180877+00	1	9	
18	Phương tiện	Các từ vựng liên quan đến phương tiện di chuyển	t	2021-11-25 17:18:58.699732+00	2021-11-25 17:35:12.723687+00	2	9	
19	Giao tiếp 1	Các từ vựng liên quan đến giao tiếp	t	2021-11-29 04:28:59.984475+00	2021-11-29 04:36:15.870745+00	1	9	
20	asasdasd	asasdasdasd	t	2021-11-29 04:36:38.597057+00	2021-11-29 04:36:38.597081+00	3	9	
47	công nghệ thông tin và thuật toán	các từ vựng chuyên ngành về CNTT và thuật toán	t	2021-12-12 12:01:48.669298+00	2021-12-13 09:38:56.844433+00	3	23	
41	Test 123	ABC	t	2021-12-10 17:55:13.669366+00	2021-12-13 11:44:07.694627+00	2	25	
38	test	test	t	2021-12-09 13:25:28.588375+00	2021-12-09 13:25:28.588397+00	4	21	
39	Verb About Daily Activity	Dong tu ve hoat dong hang ngay	t	2021-12-10 15:59:05.984415+00	2021-12-10 15:59:05.984436+00	1	25	
43	gia đình	các từ vựng về gia đình	t	2021-12-12 11:22:56.512646+00	2021-12-12 11:25:02.893037+00	1	23	
46	máy móc và thiết bị	từ vựng về bộ phận máy móc và thiết bị	t	2021-12-12 11:50:58.261562+00	2021-12-12 11:50:58.261587+00	3	23	
44	các loại nhà	từ vựng về các loại nhà	t	2021-12-12 11:34:36.291809+00	2021-12-12 11:52:04.773328+00	1	23	
\.


--
-- Data for Name: main_setdetail; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.main_setdetail (id, image, term, definition, term_lang, definition_lang, date_created, date_updated, set_id) FROM stdin;
1		Hello	Chào, xin chào; lời chào	en	vi	2021-11-09 08:18:24.215915+00	2021-11-09 08:18:24.215939+00	1
2		Good morning	Chào buổi sáng	en	vi	2021-11-09 08:18:24.218975+00	2021-11-09 08:18:24.21899+00	1
3		Good afternoon	Chào buổi trưa	en	vi	2021-11-09 08:18:24.220986+00	2021-11-09 08:18:24.221+00	1
4		Good evening	Chào buổi tối	en	vi	2021-11-09 08:18:24.222664+00	2021-11-09 08:18:24.22268+00	1
5		Who is there?	Ai kia?	en	vi	2021-11-09 08:18:24.224405+00	2021-11-09 08:18:24.224421+00	1
6		Who are you?	Bạn là ai?	en	vi	2021-11-09 08:18:24.226408+00	2021-11-09 08:18:24.22642+00	1
7		Are you American?	Bạn có phải là người Mỹ không?	en	vi	2021-11-09 08:18:24.228161+00	2021-11-09 08:18:24.228177+00	1
8		How are you?	Bạn khỏe không?	en	vi	2021-11-09 08:18:24.229842+00	2021-11-09 08:18:24.229854+00	1
9		Airline schedule	Lịch trình bay	en	vi	2021-11-09 08:20:03.858296+00	2021-11-09 08:20:03.858314+00	2
10		Baggage allowance	Số cân hành lý cho phép	en	vi	2021-11-09 08:20:03.860407+00	2021-11-09 08:20:03.860421+00	2
11		Boarding pass	Vé lên máy bay của khách hàng	en	vi	2021-11-09 08:20:03.861989+00	2021-11-09 08:20:03.862004+00	2
12		Check-in	Thủ tục vào cửa	en	vi	2021-11-09 08:20:03.863562+00	2021-11-09 08:20:03.863577+00	2
13		Complimentary	Đồ hoặc dịch vụ miễn phí, đi kèm	en	vi	2021-11-09 08:20:03.865127+00	2021-11-09 08:20:03.86514+00	2
15		Domestic travel	Du lịch nội địa	en	vi	2021-11-09 08:20:03.868094+00	2021-11-09 08:20:03.868113+00	2
16		Destination	Điểm đến	en	vi	2021-11-09 08:20:03.86955+00	2021-11-09 08:20:03.869562+00	2
17		High season	Mùa cao điểm	en	vi	2021-11-09 08:20:03.871051+00	2021-11-09 08:20:03.871065+00	2
18		Low Season	Mùa vắng khách	en	vi	2021-11-09 08:20:03.872508+00	2021-11-09 08:20:03.872521+00	2
19		washing up	rửa bát	en	vi	2021-11-09 08:42:47.892679+00	2021-11-09 08:42:47.892695+00	3
20		machinery	máy móc	en	vi	2021-11-09 08:42:47.895577+00	2021-11-09 08:42:47.895591+00	3
21		cowshed	chuồng bò	en	vi	2021-11-09 08:42:47.897703+00	2021-11-09 08:42:47.897716+00	3
22		tractor	máy cày	en	vi	2021-11-09 08:42:47.899195+00	2021-11-09 08:42:47.899207+00	3
23		argricultural	thuộc về nông nghiệp	en	vi	2021-11-09 08:42:47.900681+00	2021-11-09 08:42:47.900693+00	3
24		properly	(adv) một cách đúng đắn, một cách thích đáng	en	vi	2021-11-09 08:42:47.902806+00	2021-11-09 08:42:47.902818+00	3
25		definitely	đúng	en	vi	2021-11-09 08:42:47.904637+00	2021-11-09 08:42:47.904649+00	3
26		light showers	mưa rào nhỏ	en	vi	2021-11-09 08:42:47.906496+00	2021-11-09 08:42:47.906508+00	3
27		pretigious	có uy tín	en	vi	2021-11-09 08:42:47.907975+00	2021-11-09 08:42:47.907986+00	3
28		wee	vài	en	vi	2021-11-09 08:42:47.909661+00	2021-11-09 08:42:47.909674+00	3
29		demanding	(adj) đòi hỏi khắt khe	en	vi	2021-11-09 08:42:47.911207+00	2021-11-09 08:42:47.911219+00	3
30		amenity	sự tiện nghi, dễ chịu	en	vi	2021-11-09 08:42:47.913196+00	2021-11-09 08:42:47.913207+00	3
31		contract	hợp đồng	en	vi	2021-11-09 08:42:47.914962+00	2021-11-09 08:42:47.914978+00	3
32		underneath	bên dưới	en	vi	2021-11-09 08:42:47.916484+00	2021-11-09 08:42:47.916496+00	3
33		clifftop	vách đá	en	vi	2021-11-09 08:42:47.917903+00	2021-11-09 08:42:47.917916+00	3
34		cupboard	tủ chén	en	vi	2021-11-09 08:42:47.919297+00	2021-11-09 08:42:47.919309+00	3
35		mouldy	bị mốc	en	vi	2021-11-09 08:42:47.920892+00	2021-11-09 08:42:47.920905+00	3
36		mend	sửa chữa	en	vi	2021-11-09 08:42:47.922722+00	2021-11-09 08:42:47.922734+00	3
37		hammer	cái búa	en	vi	2021-11-09 08:42:47.924411+00	2021-11-09 08:42:47.924424+00	3
38		paintbrush	cọ vẽ	en	vi	2021-11-09 08:42:47.926085+00	2021-11-09 08:42:47.926098+00	3
39		collect	đón	en	vi	2021-11-09 08:42:47.927535+00	2021-11-09 08:42:47.927548+00	3
40		dozen	tá, 12	en	vi	2021-11-09 08:42:47.929012+00	2021-11-09 08:42:47.929025+00	3
41		backpack	ba lô	en	vi	2021-11-09 08:42:47.930467+00	2021-11-09 08:42:47.930494+00	3
42		suitcase	va li	en	vi	2021-11-09 08:42:47.932019+00	2021-11-09 08:42:47.932055+00	3
43		trainers	giày thể thao	en	vi	2021-11-09 08:42:47.933663+00	2021-11-09 08:42:47.933674+00	3
44		sailing	chèo thuyền	en	vi	2021-11-09 08:42:47.934914+00	2021-11-09 08:42:47.934925+00	3
45		leaflet	tờ rơi quảng cáo	en	vi	2021-11-09 08:42:47.936399+00	2021-11-09 08:42:47.936421+00	3
46		vegetarian	người ăn chay	en	vi	2021-11-09 08:42:47.937986+00	2021-11-09 08:42:47.938004+00	3
47		vegetarian	rau củ	en	vi	2021-11-09 08:42:47.939566+00	2021-11-09 08:42:47.939579+00	3
48		premier	thủ tướng	en	vi	2021-11-09 08:42:47.941052+00	2021-11-09 08:42:47.941082+00	3
49		accessory	phụ kiện	en	vi	2021-11-09 08:42:47.942839+00	2021-11-09 08:42:47.942857+00	3
50		pave	lát đường	en	vi	2021-11-09 08:42:47.944498+00	2021-11-09 08:42:47.944515+00	3
51		articulator	bộ phận cấu âm	en	vi	2021-11-09 08:42:47.948486+00	2021-11-09 08:42:47.948499+00	3
52		ameliorate	cải thiện	en	vi	2021-11-09 08:42:47.949819+00	2021-11-09 08:42:47.949836+00	3
53		firsthand	trực tiếp, mắt thấy tai nghe	en	vi	2021-11-09 08:42:47.951202+00	2021-11-09 08:42:47.951216+00	3
54		trader	thương nhân	en	vi	2021-11-09 08:42:47.952748+00	2021-11-09 08:42:47.95276+00	3
55		curious	tò mò	en	vi	2021-11-09 08:42:47.954193+00	2021-11-09 08:42:47.954206+00	3
56		downshifting	bỏ việc lương cao để làm việc lương thấp	en	vi	2021-11-09 08:42:47.955652+00	2021-11-09 08:42:47.955664+00	3
57		rat race	vòng xoáy công việc	en	vi	2021-11-09 08:42:47.957093+00	2021-11-09 08:42:47.957106+00	3
58		cathedral	thánh đường	en	vi	2021-11-09 08:42:47.958477+00	2021-11-09 08:42:47.958488+00	3
59		demonstration	sự chứng minh, sự giải thích	en	vi	2021-11-09 08:42:47.959861+00	2021-11-09 08:42:47.959873+00	3
60		lawn	bãi cỏ	en	vi	2021-11-09 08:42:47.961326+00	2021-11-09 08:42:47.961339+00	3
61		grape	quả nho	en	vi	2021-11-09 08:42:47.962736+00	2021-11-09 08:42:47.962747+00	3
62		tape	băng ghi âm	en	vi	2021-11-09 08:42:47.964166+00	2021-11-09 08:42:47.964178+00	3
63		put a cross	đánh dấu chéo	en	vi	2021-11-09 08:42:47.965614+00	2021-11-09 08:42:47.965632+00	3
64		garage	nhà để xe	en	vi	2021-11-09 08:42:47.96702+00	2021-11-09 08:42:47.967032+00	3
65		shade	bóng râm	en	vi	2021-11-09 08:42:47.968498+00	2021-11-09 08:42:47.968511+00	3
66		take your call	nghe máy	en	vi	2021-11-09 08:42:47.969852+00	2021-11-09 08:42:47.969865+00	3
67		hang up	cúp máy	en	vi	2021-11-09 08:42:47.971316+00	2021-11-09 08:42:47.971329+00	3
68		afterward	sau đó	en	vi	2021-11-09 08:42:47.972602+00	2021-11-09 08:42:47.972614+00	3
69		church	nhà thờ	en	vi	2021-11-09 08:42:47.974014+00	2021-11-09 08:42:47.974027+00	3
70		cheque	séc	en	vi	2021-11-09 08:42:47.975434+00	2021-11-09 08:42:47.975449+00	3
71		take place	diễn ra	en	vi	2021-11-09 08:42:47.976829+00	2021-11-09 08:42:47.976841+00	3
72		bandage	băng bó	en	vi	2021-11-09 08:42:47.978285+00	2021-11-09 08:42:47.978297+00	3
73		bandage	đèn	en	vi	2021-11-09 08:42:47.979695+00	2021-11-09 08:42:47.979707+00	3
74		a pile of books	chồng sách	en	vi	2021-11-09 08:42:47.981154+00	2021-11-09 08:42:47.981166+00	3
75		right over there	ngay đằng kia	en	vi	2021-11-09 08:42:47.982577+00	2021-11-09 08:42:47.982589+00	3
76		flat shoes	giày đế bằng	en	vi	2021-11-09 08:42:47.983966+00	2021-11-09 08:42:47.983978+00	3
77		high heels	giày cao gót	en	vi	2021-11-09 08:42:47.985317+00	2021-11-09 08:42:47.985329+00	3
78		seashore	bờ biển	en	vi	2021-11-09 08:42:47.986743+00	2021-11-09 08:42:47.986756+00	3
79		tent	cái lều	en	vi	2021-11-09 08:42:47.988186+00	2021-11-09 08:42:47.988197+00	3
80		so on	vâng vâng	en	vi	2021-11-09 08:42:47.989576+00	2021-11-09 08:42:47.989587+00	3
81		pillow	cái gối	en	vi	2021-11-09 08:42:47.990991+00	2021-11-09 08:42:47.991003+00	3
82		it's up	phụ thuộc vào...	en	vi	2021-11-09 08:42:47.992413+00	2021-11-09 08:42:47.992425+00	3
83		hitchhike	đi nhờ xe, quá giang	en	vi	2021-11-09 08:42:47.994654+00	2021-11-09 08:42:47.994667+00	3
84		intend	có ý định	en	vi	2021-11-09 08:42:47.99626+00	2021-11-09 08:42:47.996277+00	3
85		receptionist	lễ tân	en	vi	2021-11-09 08:42:47.999394+00	2021-11-09 08:42:47.999407+00	3
86		close-down	đóng cửa, ngừng hoạt động	en	vi	2021-11-09 08:42:48.00089+00	2021-11-09 08:42:48.000903+00	3
87		afford	đủ khả năng	en	vi	2021-11-09 08:42:48.002404+00	2021-11-09 08:42:48.002421+00	3
88		Attract	thu hút, hấp dẫn, lôi cuốn	en	vi	2021-11-09 08:48:22.069629+00	2021-11-09 08:48:22.069644+00	4
89		compare	đối chiếu	en	vi	2021-11-09 08:48:22.071608+00	2021-11-09 08:48:22.071621+00	4
90		comparable	có thể so sánh được	en	vi	2021-11-09 08:48:22.073267+00	2021-11-09 08:48:22.073281+00	4
91		compete	đua tranh, ganh đua, cạnh tranh	en	vi	2021-11-09 08:48:22.074982+00	2021-11-09 08:48:22.074997+00	4
92		consume	dùng, tiêu thụ	en	vi	2021-11-09 08:48:22.076632+00	2021-11-09 08:48:22.076647+00	4
93		consumer	người tiêu dùng, người tiêu thụ (hàng hoá, thực phẩm...)	en	vi	2021-11-09 08:48:22.078207+00	2021-11-09 08:48:22.07822+00	4
94		consumable	có thể ăn được, có thể tiêu thụ được	en	vi	2021-11-09 08:48:22.079715+00	2021-11-09 08:48:22.079729+00	4
95		convince	thuyết phục	en	vi	2021-11-09 08:48:22.081447+00	2021-11-09 08:48:22.08146+00	4
96		current	hiện tại, tại thời điểm này	en	vi	2021-11-09 08:48:22.082857+00	2021-11-09 08:48:22.082869+00	4
97		inspire	truyền (cảm hứng, ý nghĩ...); truyền cảm hứng cho (ai), gây cảm hứng cho (ai)	en	vi	2021-11-09 08:48:22.084413+00	2021-11-09 08:48:22.084426+00	4
98		market	thị trường; tình hình thị trường	en	vi	2021-11-09 08:48:22.086031+00	2021-11-09 08:48:22.086046+00	4
99		marketing	tiếp thị	en	vi	2021-11-09 08:48:22.087777+00	2021-11-09 08:48:22.08779+00	4
100		persuade	thuyết phục	en	vi	2021-11-09 08:48:22.089352+00	2021-11-09 08:48:22.089368+00	4
101		productive	sản xuất	en	vi	2021-11-09 08:48:22.091391+00	2021-11-09 08:48:22.091404+00	4
102		satisfy	làm thoả mãn, làm vừa lòng, đáp ứng (được yêu cầu, điều kiện...)	en	vi	2021-11-09 08:48:22.09293+00	2021-11-09 08:48:22.092943+00	4
193		Apartment	căn hộ	en	vi	2021-12-12 11:34:36.294679+00	2021-12-12 11:52:04.730231+00	44
194		Cabin	buồng	en	vi	2021-12-12 11:34:36.299356+00	2021-12-12 11:52:04.734095+00	44
173		Mother	mẹ	en	vi	2021-12-12 11:22:56.565515+00	2021-12-12 11:25:02.826278+00	43
195		Bungalow	nhà gỗ một tầng	en	vi	2021-12-12 11:34:36.303154+00	2021-12-12 11:52:04.737479+00	44
196		Condominium	chung cư	en	vi	2021-12-12 11:34:36.306732+00	2021-12-12 11:52:04.74142+00	44
197		Cottage	nhà ở vùng nông thôn	en	vi	2021-12-12 11:34:36.3099+00	2021-12-12 11:52:04.744978+00	44
198		Flat	căn hộ lớn	en	vi	2021-12-12 11:34:36.312794+00	2021-12-12 11:52:04.748586+00	44
199		House	nhà	en	vi	2021-12-12 11:34:36.315498+00	2021-12-12 11:52:04.752102+00	44
200		Palace	cung điện	en	vi	2021-12-12 11:34:36.318301+00	2021-12-12 11:52:04.755291+00	44
172		Stepparent	cha mẹ kế	en	vi	2021-12-12 11:22:56.562789+00	2021-12-12 11:25:02.785142+00	43
113		Food	Thuc an	en	vi	2021-11-24 07:00:05.602234+00	2021-11-24 07:00:05.602251+00	13
114		Hello	Xin chao	en	vi	2021-11-24 07:00:05.60744+00	2021-11-24 07:00:05.607457+00	13
118		Good morning	Chào buổi sáng	en	vi	2021-11-25 14:38:49.361694+00	2021-11-25 14:38:49.36172+00	13
107		esport	thể thao điện tử	en	en	2021-11-23 07:52:30.969711+00	2021-11-25 16:34:36.164759+00	8
108		soccer	bóng đá	en	en	2021-11-23 07:52:30.97544+00	2021-11-25 16:34:36.169561+00	8
109		badminton	cầu lông	en	en	2021-11-23 07:52:30.980315+00	2021-11-25 16:34:36.173008+00	8
110		volleyball	bóng chuyền	en	en	2021-11-23 07:52:30.98578+00	2021-11-25 16:34:36.176715+00	8
121		basketball	bóng rổ	en	en	2021-11-25 16:34:36.178614+00	2021-11-25 16:34:36.17863+00	8
151		test	thử nghiệm	en	vi	2021-12-09 13:25:28.591194+00	2021-12-09 13:25:28.591212+00	38
124		bike	xe máy	en	en	2021-11-25 17:18:58.702651+00	2021-11-25 17:35:12.721769+00	18
126		hello	chào	en	en	2021-11-29 04:29:00.001293+00	2021-11-29 04:29:00.001318+00	19
127		good evening	chào buổi tối	en	en	2021-11-29 04:29:00.01932+00	2021-11-29 04:29:00.019347+00	19
152		eat	an	en	vi	2021-12-10 15:59:05.988856+00	2021-12-10 15:59:05.988873+00	39
153		sleep	ngu	en	vi	2021-12-10 15:59:05.992834+00	2021-12-10 15:59:05.992854+00	39
154		brush	danh rang	en	vi	2021-12-10 15:59:05.998279+00	2021-12-10 15:59:05.998292+00	39
155		shower	tam rua	en	vi	2021-12-10 15:59:06.002325+00	2021-12-10 15:59:06.002338+00	39
156		watch tv	xem tivi	en	vi	2021-12-10 15:59:06.005649+00	2021-12-10 15:59:06.005663+00	39
158		a	abc	en	vi	2021-12-10 17:55:13.673166+00	2021-12-10 17:55:13.673185+00	41
161		Grandparents	ông bà	en	vi	2021-12-12 11:22:56.526449+00	2021-12-12 11:25:02.791247+00	43
162		Grandfather	ông ngoại/ ông nội	en	vi	2021-12-12 11:22:56.530394+00	2021-12-12 11:25:02.795326+00	43
163		Grandmother	bà ngoại/ bà nội	en	vi	2021-12-12 11:22:56.534126+00	2021-12-12 11:25:02.799113+00	43
164		Aunt	cô/ dì	en	vi	2021-12-12 11:22:56.537478+00	2021-12-12 11:25:02.802552+00	43
165		Uncle	chú	en	vi	2021-12-12 11:22:56.542666+00	2021-12-12 11:25:02.80579+00	43
166		Cousin	anh chị em họ	en	vi	2021-12-12 11:22:56.545717+00	2021-12-12 11:25:02.809001+00	43
167		Father-in-Law	bố chồng/vợ	en	vi	2021-12-12 11:22:56.548583+00	2021-12-12 11:25:02.812217+00	43
168		Mother-in-law	mẹ chồng/vợ	en	vi	2021-12-12 11:22:56.551549+00	2021-12-12 11:25:02.815589+00	43
169		Sister-in-law	chị dâu/ em dâu	en	vi	2021-12-12 11:22:56.554408+00	2021-12-12 11:25:02.818948+00	43
170		Brother-in-law	anh rể/ em rể	en	vi	2021-12-12 11:22:56.557252+00	2021-12-12 11:25:02.823078+00	43
174		Father	cha	en	vi	2021-12-12 11:22:56.568326+00	2021-12-12 11:25:02.829239+00	43
175		Sibling	anh chị em ruột	en	vi	2021-12-12 11:22:56.571148+00	2021-12-12 11:25:02.8323+00	43
176		Spouse	vợ chồng	en	vi	2021-12-12 11:22:56.573795+00	2021-12-12 11:25:02.835685+00	43
177		Husband	chồng	en	vi	2021-12-12 11:22:56.576773+00	2021-12-12 11:25:02.838816+00	43
178		Wife	vợ	en	vi	2021-12-12 11:22:56.579511+00	2021-12-12 11:25:02.841945+00	43
179		Child	con cái	en	vi	2021-12-12 11:22:56.582642+00	2021-12-12 11:25:02.844972+00	43
180		Daughter	con gái	en	vi	2021-12-12 11:22:56.585468+00	2021-12-12 11:25:02.848324+00	43
181		Son	con trai	en	vi	2021-12-12 11:22:56.588295+00	2021-12-12 11:25:02.852056+00	43
182		Stepfather	cha dượng	en	vi	2021-12-12 11:22:56.591741+00	2021-12-12 11:25:02.855329+00	43
183		Stepmother	mẹ kế	en	vi	2021-12-12 11:22:56.594858+00	2021-12-12 11:25:02.858854+00	43
184		Ex-husband	chồng cũ	en	vi	2021-12-12 11:22:56.59778+00	2021-12-12 11:25:02.862537+00	43
185		Ex-wife	vợ cũ	en	vi	2021-12-12 11:22:56.600742+00	2021-12-12 11:25:02.866017+00	43
186		Half-brother	anh/em cùng cha/mẹ khác mẹ/cha	en	vi	2021-12-12 11:22:56.603529+00	2021-12-12 11:25:02.869529+00	43
187		Half-sister	chị/em cùng cha/mẹ khác mẹ/ cha	en	vi	2021-12-12 11:22:56.606313+00	2021-12-12 11:25:02.873821+00	43
188		Step sister	con gái riêng của bố mẹ kế	en	vi	2021-12-12 11:22:56.609269+00	2021-12-12 11:25:02.877076+00	43
189		Younger/Little sister	em gái	en	vi	2021-12-12 11:22:56.612207+00	2021-12-12 11:25:02.880641+00	43
190		Younger/Little brother	em trai	en	vi	2021-12-12 11:22:56.618839+00	2021-12-12 11:25:02.884394+00	43
191		Older sister	chị gái	en	vi	2021-12-12 11:22:56.621703+00	2021-12-12 11:25:02.888219+00	43
192		Older brother	anh trai	en	vi	2021-12-12 11:22:56.625078+00	2021-12-12 11:25:02.891391+00	43
171		Parents	ba mẹ	en	vi	2021-12-12 11:22:56.560056+00	2021-12-12 11:25:02.777865+00	43
247		Storage	lưu trữ	en	vi	2021-12-12 12:01:48.714519+00	2021-12-12 12:01:48.714537+00	47
248		Graphics	đồ họa	en	vi	2021-12-12 12:01:48.717754+00	2021-12-12 12:01:48.717767+00	47
249		Research	nghiên cứu	en	vi	2021-12-12 12:01:48.720384+00	2021-12-12 12:01:48.720398+00	47
221		Abacus	bàn tính	en	vi	2021-12-12 11:50:58.2655+00	2021-12-12 11:50:58.265518+00	46
222		Circuit	mạch	en	vi	2021-12-12 11:50:58.269529+00	2021-12-12 11:50:58.269545+00	46
223		Computer	máy tính	en	vi	2021-12-12 11:50:58.273836+00	2021-12-12 11:50:58.273853+00	46
224		Device	thiết bị	en	vi	2021-12-12 11:50:58.277281+00	2021-12-12 11:50:58.277295+00	46
225		Disk	đĩa	en	vi	2021-12-12 11:50:58.280638+00	2021-12-12 11:50:58.280652+00	46
226		Hardware	phần cứng	en	vi	2021-12-12 11:50:58.284068+00	2021-12-12 11:50:58.284082+00	46
227		Software	phần mềm	en	vi	2021-12-12 11:50:58.287452+00	2021-12-12 11:50:58.287466+00	46
228		Memory	bộ nhớ	en	vi	2021-12-12 11:50:58.290953+00	2021-12-12 11:50:58.290967+00	46
229		Microprocessor	bộ vi xử lý	en	vi	2021-12-12 11:50:58.294388+00	2021-12-12 11:50:58.294402+00	46
230		Keyboard	bàn phím	en	vi	2021-12-12 11:50:58.298114+00	2021-12-12 11:50:58.298128+00	46
231		Screen	màn hình	en	vi	2021-12-12 11:50:58.3022+00	2021-12-12 11:50:58.302214+00	46
232		Computer mouse	chuột máy tính	en	vi	2021-12-12 11:50:58.305905+00	2021-12-12 11:50:58.305919+00	46
208		Basement	tầng hầm	en	vi	2021-12-12 11:40:48.311453+00	2021-12-12 12:10:57.720997+00	45
209		Bedroom	phòng ngủ	en	vi	2021-12-12 11:40:48.314778+00	2021-12-12 12:10:57.72452+00	45
210		Dining room	phòng ăn	en	vi	2021-12-12 11:40:48.318076+00	2021-12-12 12:10:57.728251+00	45
211		Cellar	hầm chứa, nhà kho	en	vi	2021-12-12 11:40:48.321331+00	2021-12-12 12:10:57.732207+00	45
212		Garage	nhà để xe, gara	en	vi	2021-12-12 11:40:48.325519+00	2021-12-12 12:10:57.735607+00	45
213		Hall	phòng lớn, đại sảnh	en	vi	2021-12-12 11:40:48.328641+00	2021-12-12 12:10:57.739398+00	45
214		Kitchen	nhà bếp	en	vi	2021-12-12 11:40:48.331679+00	2021-12-12 12:10:57.742868+00	45
215		Lavatory	phòng vệ sinh	en	vi	2021-12-12 11:40:48.335153+00	2021-12-12 12:10:57.750678+00	45
216		Living room	phòng khách	en	vi	2021-12-12 11:40:48.338365+00	2021-12-12 12:10:57.755023+00	45
217		Lounge	phòng chờ	en	vi	2021-12-12 11:40:48.341128+00	2021-12-12 12:10:57.758981+00	45
218		Toilet	nhà vệ sinh	en	vi	2021-12-12 11:42:23.127637+00	2021-12-12 12:10:57.763551+00	45
219		Loft	tầng lửng, gác xếp	en	vi	2021-12-12 11:42:23.129431+00	2021-12-12 12:10:57.767444+00	45
220		Garden	vườn	en	vi	2021-12-12 11:42:23.130908+00	2021-12-12 12:10:57.771644+00	45
233		USB (Universal Serial Bus)	cồng kết nối cáp tiêu chuẩn	en	vi	2021-12-12 11:50:58.309461+00	2021-12-12 11:50:58.309474+00	46
201		Penthouse	căn hộ đắt tiền	en	vi	2021-12-12 11:34:36.321451+00	2021-12-12 11:52:04.758636+00	44
202		Tent	cái lều	en	vi	2021-12-12 11:34:36.325602+00	2021-12-12 11:52:04.76187+00	44
203		Townhouse	nhiều nhà chung vách	en	vi	2021-12-12 11:34:36.333441+00	2021-12-12 11:52:04.764982+00	44
204		Detached house	nhà biệt lập	en	vi	2021-12-12 11:34:36.337705+00	2021-12-12 11:52:04.768296+00	44
205		Villa	biệt thự	en	vi	2021-12-12 11:34:36.340674+00	2021-12-12 11:52:04.771655+00	44
234		Multiplication	phép nhân	en	vi	2021-12-12 12:01:48.672285+00	2021-12-12 12:01:48.67231+00	47
235		Numeric	thuộc về số học	en	vi	2021-12-12 12:01:48.676714+00	2021-12-12 12:01:48.676737+00	47
236		Output	đầu ra	en	vi	2021-12-12 12:01:48.680162+00	2021-12-12 12:01:48.680182+00	47
237		Perform	tiến hành, thi hành	en	vi	2021-12-12 12:01:48.683291+00	2021-12-12 12:01:48.683312+00	47
238		Pulse	xung	en	vi	2021-12-12 12:01:48.686291+00	2021-12-12 12:01:48.686317+00	47
239		Process	xử lý	en	vi	2021-12-12 12:01:48.689533+00	2021-12-12 12:01:48.689555+00	47
240		Terminal	máy trạm	en	vi	2021-12-12 12:01:48.692827+00	2021-12-12 12:01:48.692846+00	47
241		Signal	tín hiệu	en	vi	2021-12-12 12:01:48.695869+00	2021-12-12 12:01:48.695887+00	47
242		Register	thanh ghi	en	vi	2021-12-12 12:01:48.698891+00	2021-12-12 12:01:48.698911+00	47
243		Transmit	truyền	en	vi	2021-12-12 12:01:48.701976+00	2021-12-12 12:01:48.701989+00	47
244		Allocate	phân phối	en	vi	2021-12-12 12:01:48.704757+00	2021-12-12 12:01:48.704786+00	47
245		Analog	tương tự	en	vi	2021-12-12 12:01:48.707869+00	2021-12-12 12:01:48.707883+00	47
246		Remote access	truy cập từ xa	en	vi	2021-12-12 12:01:48.710618+00	2021-12-12 12:01:48.710639+00	47
250		Instruction	chỉ dẫn	en	vi	2021-12-12 12:01:48.723125+00	2021-12-12 12:01:48.723144+00	47
251		Encode	mã hóa	en	vi	2021-12-12 12:01:48.725775+00	2021-12-12 12:01:48.725789+00	47
252		Decode	giải mã	en	vi	2021-12-12 12:01:48.728792+00	2021-12-12 12:01:48.728806+00	47
253		Groundwork	nền tảng	en	vi	2021-12-12 12:01:48.733702+00	2021-12-12 12:01:48.733716+00	47
254		Groundbreaking	đột phá	en	vi	2021-12-12 12:01:48.737007+00	2021-12-12 12:01:48.737021+00	47
255		Innovation	sự đổi mới	en	vi	2021-12-12 12:01:48.739846+00	2021-12-12 12:01:48.739859+00	47
256		Navigate	điều hướng	en	vi	2021-12-12 12:01:48.742779+00	2021-12-12 12:01:48.742792+00	47
257		Car	ô tô	en	vi	2021-12-12 12:09:49.792877+00	2021-12-12 12:09:49.792894+00	48
258		Bicycle	xe đạp	en	vi	2021-12-12 12:09:49.796436+00	2021-12-12 12:09:49.796452+00	48
259		Motorcycle	xe máy	en	vi	2021-12-12 12:09:49.799216+00	2021-12-12 12:09:49.79923+00	48
260		Tram	xe điện	en	vi	2021-12-12 12:09:49.801727+00	2021-12-12 12:09:49.801741+00	48
261		Caravan	xe nhà di động	en	vi	2021-12-12 12:09:49.804649+00	2021-12-12 12:09:49.804667+00	48
262		Bus	xe buýt	en	vi	2021-12-12 12:09:49.807526+00	2021-12-12 12:09:49.807539+00	48
263		Taxi	xe taxi	en	vi	2021-12-12 12:09:49.810402+00	2021-12-12 12:09:49.81042+00	48
264		Underground	tàu điện ngầm	en	vi	2021-12-12 12:09:49.813176+00	2021-12-12 12:09:49.813193+00	48
265		Subway	tàu điện ngầm	en	vi	2021-12-12 12:09:49.815999+00	2021-12-12 12:09:49.816018+00	48
266		High-speed train	tàu cao tốc	en	vi	2021-12-12 12:09:49.818835+00	2021-12-12 12:09:49.818848+00	48
267		Railway train	tàu hỏa	en	vi	2021-12-12 12:09:49.821552+00	2021-12-12 12:09:49.821565+00	48
268		Boat	thuyền	en	vi	2021-12-12 12:09:49.824751+00	2021-12-12 12:09:49.824768+00	48
269		Ship	tàu thủy	en	vi	2021-12-12 12:09:49.827548+00	2021-12-12 12:09:49.827565+00	48
270		Sailboat	thuyền buồm	en	vi	2021-12-12 12:09:49.831128+00	2021-12-12 12:09:49.831149+00	48
271		Airplain	máy bay	en	vi	2021-12-12 12:09:49.833767+00	2021-12-12 12:09:49.833784+00	48
272		Helicopter	trực thăng	en	vi	2021-12-12 12:09:49.836474+00	2021-12-12 12:09:49.836489+00	48
273		Hot-air ballon	khinh khí cầu	en	vi	2021-12-12 12:09:49.839224+00	2021-12-12 12:09:49.839241+00	48
274		Gilder	tàu lượn	en	vi	2021-12-12 12:09:49.841874+00	2021-12-12 12:09:49.84189+00	48
206		Attic	phòng gác mái	en	vi	2021-12-12 11:40:48.301365+00	2021-12-12 12:10:57.712567+00	45
207		Balcony	ban công	en	vi	2021-12-12 11:40:48.304597+00	2021-12-12 12:10:57.717259+00	45
\.


--
-- Data for Name: main_topic; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.main_topic (id, name, description, is_public, date_created, date_updated, user_id) FROM stdin;
1	Cơ bản	Các thuật ngữ cơ bản	t	2021-11-09 08:17:05.271136+00	2021-11-09 08:31:58.257787+00	8
2	Du lịch	Các thuật ngữ về du lịch	t	2021-11-09 08:19:00.670615+00	2021-11-09 08:32:04.393576+00	8
3	Công nghệ	Các thuật ngữ về công nghệ	t	2021-11-09 08:20:31.003571+00	2021-11-09 08:32:09.322706+00	8
4	Không phân loại	Các thuật ngữ thuộc về nhiều chủ đề	t	2021-11-09 08:30:05.524656+00	2021-11-09 08:32:14.432293+00	8
5	Kinh tế	Các thuật ngữ về kinh tế	t	2021-11-09 08:46:11.24766+00	2021-11-09 08:46:11.247682+00	8
8	Khoa học	Những học phần liên quan đến khoa học	t	2021-12-13 07:26:32.767467+00	2021-12-13 07:26:32.767488+00	1
\.


--
-- Data for Name: main_uploadimage; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.main_uploadimage (id, name, image) FROM stdin;
1	logo-engspace.png	img/2021/11/27/logo-engspace.png
2	What-is-React-JS.jpg	img/2021/12/08/What-is-React-JS.jpg
3	What-is-React-JS.jpg	img/2021/12/08/What-is-React-JS_wt3Ghdm.jpg
4	What-is-React-JS.jpg	img/2021/12/08/What-is-React-JS_BROT9F2.jpg
5	What-is-React-JS.jpg	img/2021/12/08/What-is-React-JS_I2OBIB8.jpg
6	What-is-React-JS.jpg	img/2021/12/08/What-is-React-JS_h3yGV7M.jpg
7	What-is-React-JS.jpg	img/2021/12/12/What-is-React-JS.jpg
8	What-is-React-JS.jpg	img/2021/12/12/What-is-React-JS_nbja3np.jpg
9	What-is-React-JS.jpg	img/2021/12/12/What-is-React-JS_8M6BjfH.jpg
10	What-is-React-JS.jpg	img/2021/12/13/What-is-React-JS.jpg
11	What-is-React-JS.jpg	img/2021/12/13/What-is-React-JS_A3gS1P9.jpg
12	What-is-React-JS.jpg	img/2021/12/13/What-is-React-JS_rebeMy0.jpg
\.


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 30, true);


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.accounts_user_user_permissions_id_seq', 1, false);


--
-- Name: accounts_userfollowing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.accounts_userfollowing_id_seq', 1, false);


--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.accounts_userprofile_id_seq', 30, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 44, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 34, true);


--
-- Name: forum_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.forum_comment_id_seq', 5, true);


--
-- Name: forum_commentlike_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.forum_commentlike_id_seq', 1, false);


--
-- Name: forum_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.forum_post_id_seq', 6, true);


--
-- Name: forum_postfollow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.forum_postfollow_id_seq', 1, false);


--
-- Name: forum_postlike_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.forum_postlike_id_seq', 3, true);


--
-- Name: main_folder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.main_folder_id_seq', 15, true);


--
-- Name: main_folder_sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.main_folder_sets_id_seq', 42, true);


--
-- Name: main_set_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.main_set_id_seq', 51, true);


--
-- Name: main_setdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.main_setdetail_id_seq', 276, true);


--
-- Name: main_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.main_topic_id_seq', 8, true);


--
-- Name: main_uploadimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.main_uploadimage_id_seq', 12, true);


--
-- Name: accounts_user_groups accounts_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups accounts_user_groups_user_id_group_id_59c0b32f_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq UNIQUE (user_id, group_id);


--
-- Name: accounts_user accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq UNIQUE (user_id, permission_id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_user accounts_user_username_key; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_username_key UNIQUE (username);


--
-- Name: accounts_userfollowing accounts_userfollowing_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_userfollowing
    ADD CONSTRAINT accounts_userfollowing_pkey PRIMARY KEY (id);


--
-- Name: accounts_userprofile accounts_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_pkey PRIMARY KEY (id);


--
-- Name: accounts_userprofile accounts_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: forum_comment forum_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_comment
    ADD CONSTRAINT forum_comment_pkey PRIMARY KEY (id);


--
-- Name: forum_commentlike forum_commentlike_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_commentlike
    ADD CONSTRAINT forum_commentlike_pkey PRIMARY KEY (id);


--
-- Name: forum_post forum_post_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_post
    ADD CONSTRAINT forum_post_pkey PRIMARY KEY (id);


--
-- Name: forum_postfollow forum_postfollow_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_postfollow
    ADD CONSTRAINT forum_postfollow_pkey PRIMARY KEY (id);


--
-- Name: forum_postlike forum_postlike_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_postlike
    ADD CONSTRAINT forum_postlike_pkey PRIMARY KEY (id);


--
-- Name: main_folder main_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_folder
    ADD CONSTRAINT main_folder_pkey PRIMARY KEY (id);


--
-- Name: main_folder_sets main_folder_sets_folder_id_set_id_166056c6_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_folder_sets
    ADD CONSTRAINT main_folder_sets_folder_id_set_id_166056c6_uniq UNIQUE (folder_id, set_id);


--
-- Name: main_folder_sets main_folder_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_folder_sets
    ADD CONSTRAINT main_folder_sets_pkey PRIMARY KEY (id);


--
-- Name: main_set main_set_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_set
    ADD CONSTRAINT main_set_pkey PRIMARY KEY (id);


--
-- Name: main_setdetail main_setdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_setdetail
    ADD CONSTRAINT main_setdetail_pkey PRIMARY KEY (id);


--
-- Name: main_topic main_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_topic
    ADD CONSTRAINT main_topic_pkey PRIMARY KEY (id);


--
-- Name: main_uploadimage main_uploadimage_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_uploadimage
    ADD CONSTRAINT main_uploadimage_pkey PRIMARY KEY (id);


--
-- Name: forum_commentlike unique_commentlike; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_commentlike
    ADD CONSTRAINT unique_commentlike UNIQUE (user_id, comment_id);


--
-- Name: accounts_userfollowing unique_followers; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_userfollowing
    ADD CONSTRAINT unique_followers UNIQUE (user_id, following_user_id);


--
-- Name: forum_postfollow unique_postfollow; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_postfollow
    ADD CONSTRAINT unique_postfollow UNIQUE (user_id, post_id);


--
-- Name: forum_postlike unique_postlike; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_postlike
    ADD CONSTRAINT unique_postlike UNIQUE (user_id, post_id);


--
-- Name: accounts_user_groups_group_id_bd11a704; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX accounts_user_groups_group_id_bd11a704 ON public.accounts_user_groups USING btree (group_id);


--
-- Name: accounts_user_groups_user_id_52b62117; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX accounts_user_groups_user_id_52b62117 ON public.accounts_user_groups USING btree (user_id);


--
-- Name: accounts_user_user_permissions_permission_id_113bb443; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX accounts_user_user_permissions_permission_id_113bb443 ON public.accounts_user_user_permissions USING btree (permission_id);


--
-- Name: accounts_user_user_permissions_user_id_e4f0a161; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX accounts_user_user_permissions_user_id_e4f0a161 ON public.accounts_user_user_permissions USING btree (user_id);


--
-- Name: accounts_user_username_6088629e_like; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX accounts_user_username_6088629e_like ON public.accounts_user USING btree (username varchar_pattern_ops);


--
-- Name: accounts_userfollowing_following_user_id_4fadd6ef; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX accounts_userfollowing_following_user_id_4fadd6ef ON public.accounts_userfollowing USING btree (following_user_id);


--
-- Name: accounts_userfollowing_user_id_6fc2b64b; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX accounts_userfollowing_user_id_6fc2b64b ON public.accounts_userfollowing USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: forum_comment_parent_id_4c29b530; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX forum_comment_parent_id_4c29b530 ON public.forum_comment USING btree (parent_id);


--
-- Name: forum_comment_post_id_eb329692; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX forum_comment_post_id_eb329692 ON public.forum_comment USING btree (post_id);


--
-- Name: forum_comment_user_id_ee1c4b93; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX forum_comment_user_id_ee1c4b93 ON public.forum_comment USING btree (user_id);


--
-- Name: forum_commentlike_comment_id_851b8bbc; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX forum_commentlike_comment_id_851b8bbc ON public.forum_commentlike USING btree (comment_id);


--
-- Name: forum_commentlike_user_id_29f1f8d6; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX forum_commentlike_user_id_29f1f8d6 ON public.forum_commentlike USING btree (user_id);


--
-- Name: forum_post_user_id_9caccb96; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX forum_post_user_id_9caccb96 ON public.forum_post USING btree (user_id);


--
-- Name: forum_postfollow_post_id_ce33f9d7; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX forum_postfollow_post_id_ce33f9d7 ON public.forum_postfollow USING btree (post_id);


--
-- Name: forum_postfollow_user_id_b0ac762f; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX forum_postfollow_user_id_b0ac762f ON public.forum_postfollow USING btree (user_id);


--
-- Name: forum_postlike_post_id_cf4a68f7; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX forum_postlike_post_id_cf4a68f7 ON public.forum_postlike USING btree (post_id);


--
-- Name: forum_postlike_user_id_eb8a58ae; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX forum_postlike_user_id_eb8a58ae ON public.forum_postlike USING btree (user_id);


--
-- Name: main_folder_sets_folder_id_f64fc860; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX main_folder_sets_folder_id_f64fc860 ON public.main_folder_sets USING btree (folder_id);


--
-- Name: main_folder_sets_set_id_dd82adee; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX main_folder_sets_set_id_dd82adee ON public.main_folder_sets USING btree (set_id);


--
-- Name: main_folder_user_id_40509235; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX main_folder_user_id_40509235 ON public.main_folder USING btree (user_id);


--
-- Name: main_set_topic_id_7d05ab41; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX main_set_topic_id_7d05ab41 ON public.main_set USING btree (topic_id);


--
-- Name: main_set_user_id_8a9f0163; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX main_set_user_id_8a9f0163 ON public.main_set USING btree (user_id);


--
-- Name: main_setdetail_set_id_3953fc43; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX main_setdetail_set_id_3953fc43 ON public.main_setdetail USING btree (set_id);


--
-- Name: main_topic_user_id_139dc1a2; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX main_topic_user_id_139dc1a2 ON public.main_topic USING btree (user_id);


--
-- Name: accounts_user_groups accounts_user_groups_group_id_bd11a704_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_user_id_52b62117_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_permission_id_113bb443_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_user_id_e4f0a161_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_userfollowing accounts_userfollowi_following_user_id_4fadd6ef_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_userfollowing
    ADD CONSTRAINT accounts_userfollowi_following_user_id_4fadd6ef_fk_accounts_ FOREIGN KEY (following_user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_userfollowing accounts_userfollowing_user_id_6fc2b64b_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_userfollowing
    ADD CONSTRAINT accounts_userfollowing_user_id_6fc2b64b_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_userprofile accounts_userprofile_user_id_92240672_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_92240672_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_comment forum_comment_parent_id_4c29b530_fk_forum_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_comment
    ADD CONSTRAINT forum_comment_parent_id_4c29b530_fk_forum_comment_id FOREIGN KEY (parent_id) REFERENCES public.forum_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_comment forum_comment_post_id_eb329692_fk_forum_post_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_comment
    ADD CONSTRAINT forum_comment_post_id_eb329692_fk_forum_post_id FOREIGN KEY (post_id) REFERENCES public.forum_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_comment forum_comment_user_id_ee1c4b93_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_comment
    ADD CONSTRAINT forum_comment_user_id_ee1c4b93_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_commentlike forum_commentlike_comment_id_851b8bbc_fk_forum_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_commentlike
    ADD CONSTRAINT forum_commentlike_comment_id_851b8bbc_fk_forum_comment_id FOREIGN KEY (comment_id) REFERENCES public.forum_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_commentlike forum_commentlike_user_id_29f1f8d6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_commentlike
    ADD CONSTRAINT forum_commentlike_user_id_29f1f8d6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_post forum_post_user_id_9caccb96_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_post
    ADD CONSTRAINT forum_post_user_id_9caccb96_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_postfollow forum_postfollow_post_id_ce33f9d7_fk_forum_post_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_postfollow
    ADD CONSTRAINT forum_postfollow_post_id_ce33f9d7_fk_forum_post_id FOREIGN KEY (post_id) REFERENCES public.forum_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_postfollow forum_postfollow_user_id_b0ac762f_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_postfollow
    ADD CONSTRAINT forum_postfollow_user_id_b0ac762f_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_postlike forum_postlike_post_id_cf4a68f7_fk_forum_post_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_postlike
    ADD CONSTRAINT forum_postlike_post_id_cf4a68f7_fk_forum_post_id FOREIGN KEY (post_id) REFERENCES public.forum_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_postlike forum_postlike_user_id_eb8a58ae_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.forum_postlike
    ADD CONSTRAINT forum_postlike_user_id_eb8a58ae_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_folder_sets main_folder_sets_folder_id_f64fc860_fk_main_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_folder_sets
    ADD CONSTRAINT main_folder_sets_folder_id_f64fc860_fk_main_folder_id FOREIGN KEY (folder_id) REFERENCES public.main_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_folder_sets main_folder_sets_set_id_dd82adee_fk_main_set_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_folder_sets
    ADD CONSTRAINT main_folder_sets_set_id_dd82adee_fk_main_set_id FOREIGN KEY (set_id) REFERENCES public.main_set(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_folder main_folder_user_id_40509235_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_folder
    ADD CONSTRAINT main_folder_user_id_40509235_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_set main_set_topic_id_7d05ab41_fk_main_topic_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_set
    ADD CONSTRAINT main_set_topic_id_7d05ab41_fk_main_topic_id FOREIGN KEY (topic_id) REFERENCES public.main_topic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_set main_set_user_id_8a9f0163_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_set
    ADD CONSTRAINT main_set_user_id_8a9f0163_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_setdetail main_setdetail_set_id_3953fc43_fk_main_set_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_setdetail
    ADD CONSTRAINT main_setdetail_set_id_3953fc43_fk_main_set_id FOREIGN KEY (set_id) REFERENCES public.main_set(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_topic main_topic_user_id_139dc1a2_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.main_topic
    ADD CONSTRAINT main_topic_user_id_139dc1a2_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

