--
-- PostgreSQL database dump
--

\restrict 8cEhkAjhTkp3AfwcNGQRHgJtmZBn6tv4UgcsbDWqz7xZmAVNw5xj7WnDsyaai9s

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-08-31 22:53:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS "TeacherHelper";
--
-- TOC entry 4870 (class 1262 OID 16401)
-- Name: TeacherHelper; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "TeacherHelper" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Polish_Poland.1250';


ALTER DATABASE "TeacherHelper" OWNER TO postgres;

\unrestrict 8cEhkAjhTkp3AfwcNGQRHgJtmZBn6tv4UgcsbDWqz7xZmAVNw5xj7WnDsyaai9s
\connect "TeacherHelper"
\restrict 8cEhkAjhTkp3AfwcNGQRHgJtmZBn6tv4UgcsbDWqz7xZmAVNw5xj7WnDsyaai9s

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 16636)
-- Name: extracurriculum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extracurriculum (
    extraid integer NOT NULL,
    title character varying(255),
    description text,
    teacher integer
);


ALTER TABLE public.extracurriculum OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16650)
-- Name: extracurriculum_admissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extracurriculum_admissions (
    admissionid integer NOT NULL,
    extraid integer,
    student integer
);


ALTER TABLE public.extracurriculum_admissions OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16649)
-- Name: extracurriculum_admissions_admissionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.extracurriculum_admissions_admissionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.extracurriculum_admissions_admissionid_seq OWNER TO postgres;

--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 229
-- Name: extracurriculum_admissions_admissionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.extracurriculum_admissions_admissionid_seq OWNED BY public.extracurriculum_admissions.admissionid;


--
-- TOC entry 227 (class 1259 OID 16635)
-- Name: extracurriculum_extraid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.extracurriculum_extraid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.extracurriculum_extraid_seq OWNER TO postgres;

--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 227
-- Name: extracurriculum_extraid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.extracurriculum_extraid_seq OWNED BY public.extracurriculum.extraid;


--
-- TOC entry 223 (class 1259 OID 16537)
-- Name: grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grades (
    gradeid integer NOT NULL,
    grade integer,
    weight integer,
    subject character varying(255),
    student integer,
    teacher integer,
    semester integer
);


ALTER TABLE public.grades OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16536)
-- Name: grades_gradeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grades_gradeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grades_gradeid_seq OWNER TO postgres;

--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 222
-- Name: grades_gradeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grades_gradeid_seq OWNED BY public.grades.gradeid;


--
-- TOC entry 224 (class 1259 OID 16577)
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16507)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    studentnumber integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    beginyear integer,
    classletter character varying(1)
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16506)
-- Name: students_studentnumber_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_studentnumber_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_studentnumber_seq OWNER TO postgres;

--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 217
-- Name: students_studentnumber_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_studentnumber_seq OWNED BY public.students.studentnumber;


--
-- TOC entry 221 (class 1259 OID 16526)
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects (
    subject character varying(255) NOT NULL,
    teachernumber integer
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16518)
-- Name: teacher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher (
    teachernumber integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255)
);


ALTER TABLE public.teacher OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16517)
-- Name: teacher_teachernumber_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teacher_teachernumber_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teacher_teachernumber_seq OWNER TO postgres;

--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 219
-- Name: teacher_teachernumber_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teacher_teachernumber_seq OWNED BY public.teacher.teachernumber;


--
-- TOC entry 226 (class 1259 OID 16586)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255),
    password character varying(255),
    student integer,
    teacher integer,
    isteacher boolean,
    isstudent boolean
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16585)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4678 (class 2604 OID 16639)
-- Name: extracurriculum extraid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extracurriculum ALTER COLUMN extraid SET DEFAULT nextval('public.extracurriculum_extraid_seq'::regclass);


--
-- TOC entry 4679 (class 2604 OID 16653)
-- Name: extracurriculum_admissions admissionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extracurriculum_admissions ALTER COLUMN admissionid SET DEFAULT nextval('public.extracurriculum_admissions_admissionid_seq'::regclass);


--
-- TOC entry 4676 (class 2604 OID 16540)
-- Name: grades gradeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades ALTER COLUMN gradeid SET DEFAULT nextval('public.grades_gradeid_seq'::regclass);


--
-- TOC entry 4674 (class 2604 OID 16510)
-- Name: students studentnumber; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN studentnumber SET DEFAULT nextval('public.students_studentnumber_seq'::regclass);


--
-- TOC entry 4675 (class 2604 OID 16521)
-- Name: teacher teachernumber; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher ALTER COLUMN teachernumber SET DEFAULT nextval('public.teacher_teachernumber_seq'::regclass);


--
-- TOC entry 4677 (class 2604 OID 16589)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4862 (class 0 OID 16636)
-- Dependencies: 228
-- Data for Name: extracurriculum; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.extracurriculum VALUES (1, 'Testowa implementacja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sodales elementum nisl, ac dapibus justo porttitor non. Mauris malesuada, mi eu posuere pretium, mi erat mollis quam, non sagittis arcu lacus id mi. Donec hendrerit ligula et purus tempor, sed hendrerit augue maximus. Quisque sollicitudin lectus non justo maximus luctus sit amet nec sem. Pellentesque sagittis nulla in sollicitudin ultrices.', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.extracurriculum VALUES (2, 'Test Course on App', 'Phasellus at orci aliquet, sodales magna vitae, aliquam augue. Donec dictum ante non libero convallis, quis rhoncus leo pharetra. Integer commodo cursus purus. ', 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 4864 (class 0 OID 16650)
-- Dependencies: 230
-- Data for Name: extracurriculum_admissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.extracurriculum_admissions VALUES (1, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.extracurriculum_admissions VALUES (2, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.extracurriculum_admissions VALUES (3, NULL, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.extracurriculum_admissions VALUES (4, NULL, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.extracurriculum_admissions VALUES (5, NULL, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.extracurriculum_admissions VALUES (6, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.extracurriculum_admissions VALUES (7, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.extracurriculum_admissions VALUES (8, 2, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 4857 (class 0 OID 16537)
-- Dependencies: 223
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.grades VALUES (1, 4, 2, 'Biology', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (2, 4, 2, 'Biology', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (3, 4, 2, 'Biology', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (4, 4, 2, 'Biology', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (5, 4, 2, 'Biology', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (6, 4, 2, 'Biology', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (7, 5, 2, 'Math', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (8, 5, 2, 'Math', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (9, 5, 2, 'Math', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (10, 5, 2, 'Math', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (11, 5, 2, 'Math', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (12, 5, 2, 'History', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (13, 5, 2, 'History', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (14, 5, 2, 'History', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (15, 5, 2, 'History', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (16, 5, 2, 'History', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (17, 5, 2, 'History', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (18, 1, 7, 'History', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (19, 3, 6, 'Math', 1, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (20, 3, 6, 'Math', 1, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (21, 2, 7, 'History', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (22, 2, 7, 'History', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (23, 2, 7, 'History', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (24, 2, 7, 'History', 1, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (25, 2, 7, 'History', 2, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (26, 2, 7, 'History', 2, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (27, 2, 7, 'History', 2, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (28, 2, 7, 'History', 2, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (29, 2, 7, 'History', 2, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (30, 2, 7, 'History', 2, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (31, 6, 1, 'History', 4, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (32, 1, 1, 'Math', 3, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.grades VALUES (33, 4, 1, 'History', 4, 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 4858 (class 0 OID 16577)
-- Dependencies: 224
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.session VALUES ('LkoLHGq9ea_oDHPHo-e6mQOK9NnrxFle', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T13:45:19.068Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":4},"user":{"id":4,"name":"teacher","password":"$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq","student":null,"teacher":1,"isteacher":true,"isstudent":false}}', '2025-09-30 15:45:20') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('yTUTZL3To5mlN2H0ggfnUxl-BW-3PqSQ', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T14:08:34.490Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 16:08:35') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('cBePZepNj4gRS1q0-rXiakyNwmaKCwn-', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-29T23:40:08.318Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 01:40:09') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('FOuh45W0mwx6F5EKmEhQq2zo4WJQ_WbZ', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-29T22:54:01.135Z","secure":false,"httpOnly":true,"path":"/"}}', '2025-09-30 00:54:02') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('rLb-kb8fNrf8-ZuWBDOtdouvOC-DhYPT', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-29T23:28:21.064Z","secure":false,"httpOnly":true,"path":"/"}}', '2025-09-30 01:28:22') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('wHnLQocrQxYiLYxZFxwzp8AtsVgSMDT-', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-29T23:28:28.501Z","secure":false,"httpOnly":true,"path":"/"}}', '2025-09-30 01:28:29') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('O4Sr4fBXFu4cNRkJr2K5ysYkary0ctYO', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-29T23:42:51.844Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 01:42:52') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('3Wta78k5qt9RmySchkC83I8kOrheows3', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-29T23:35:21.401Z","secure":false,"httpOnly":true,"path":"/"}}', '2025-09-30 01:35:22') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('IVXFSFuNveRvNb1SqGORJR5dFL8WuWA2', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-29T23:54:01.935Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 01:54:02') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('xO4eLoifvKFpGJsngKcyvDQ2eZKHKqHi', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-29T23:54:40.450Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 01:54:41') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('P7wo-SQJm4k_LKZD7mIvIayiiwuzuE-D', '{"cookie":{"originalMaxAge":2591999999,"expires":"2025-09-29T23:55:35.528Z","secure":false,"httpOnly":true,"path":"/"}}', '2025-09-30 01:55:36') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('qesonBuMJqpWBOysXC-2P6IdFHi-PF64', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-29T23:55:43.739Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 01:55:44') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('nq4Mfb3vkDrcRAM87U76TYLkh4w4f3rk', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T09:50:55.285Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":2},"user":{"id":2,"name":"student","password":"$2b$10$7rjGHq4Gafy8JaQ62p.nAOEB4hv5AQwal69X1oCvKOHHO6Bc7VjTS","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 11:50:56') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('dhzb4Kith7adBczd3nuzjHcgDcYgQ-o2', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T09:51:03.055Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":4},"user":{"id":4,"name":"teacher","password":"$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq","student":null,"teacher":1,"isteacher":true,"isstudent":false}}', '2025-09-30 11:51:04') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('y8GcBRoujGCIc3oc02zNIW06YRDSPHH8', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T09:54:58.430Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 11:54:59') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('r1rM2g1I72ArnweKAiREGFadbXN19WEZ', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T09:55:30.091Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 11:55:31') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('V0QZ4QQJv9rEfE1spKTztvsdRFNMbziB', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T09:56:28.505Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 11:56:29') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('eCWDWlIu7Nr_E8EWNGIlwYgqnfl73GX-', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T09:56:53.043Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 11:56:54') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('_0QBNdmmEbBuCut3ndsDcFZmpB9XHwXJ', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T09:59:15.198Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 11:59:16') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('NWYd70EUfLrHVX8ZjHaxwlrsxUwrsyo4', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T09:59:24.385Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 11:59:25') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('We8PGfyEtIMrtDB4tKEGH8xh116QzYO8', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T10:15:44.963Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 12:15:45') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('f6mcVeAe83KqaE5cveKfwH9KZacE8WYb', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T10:16:55.300Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 12:16:56') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('QEtgfCZpl3o2fHE0c3zG3SIThEeVNWAU', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T10:17:36.291Z","secure":false,"httpOnly":true,"path":"/"}}', '2025-09-30 12:17:37') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('zkDacbgi41QdrO9MZkfK58z3MPZDmn0d', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T10:17:41.612Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 12:17:42') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('q3Kn6uV1Q_WKXjtOo2T51Q09LXcEZaWl', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T10:18:24.716Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 12:18:25') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('CneonhavcSRZqzDBKWmnwflLkRzj91Jm', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T17:39:42.898Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":4},"user":{"id":4,"name":"teacher","password":"$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq","student":null,"teacher":1,"isteacher":true,"isstudent":false}}', '2025-09-30 19:39:43') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('medN8URJ4msT4M7hrZIfBnAoKl8Tebzu', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T11:26:51.374Z","secure":false,"httpOnly":true,"path":"/"}}', '2025-09-30 13:26:52') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('qrUHQixBNK-PbsPiJjnh0OMQllPPxlRC', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T11:27:04.867Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 13:27:05') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('5VUSd2NVEamM1ioHfClKlq31Go4vxQkb', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T11:27:40.710Z","secure":false,"httpOnly":true,"path":"/"}}', '2025-09-30 13:27:41') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('HWkVQYF6id9C65TP0vzzvyyNUQwFtQaF', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T11:31:44.930Z","secure":false,"httpOnly":true,"path":"/"}}', '2025-09-30 13:31:45') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('tQ4odcCn0VDNQpBY5gwRPnUOFxyGQs7g', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T11:31:50.401Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 13:31:51') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('lA_-Z2fahGYZN8P3T-F9nZuSAVGhE4cx', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T11:34:13.958Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 13:34:14') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('FnNtoDwUdjP_5z3oZ_MMhU2HowaeVuBx', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T11:36:39.731Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 13:36:40') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('pZyqwvOzLav8xWFvaN0UN_zGQoSKAUe7', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T11:39:30.617Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 13:39:31') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('IUEiP9164zjZpDGRlYe_felRiZcmLpFE', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T13:27:58.206Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 15:27:59') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('r10n4c-rkE8cGZJl8aMAAy69j_0TEw4z', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T16:29:41.963Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":2},"user":{"id":2,"name":"student","password":"$2b$10$7rjGHq4Gafy8JaQ62p.nAOEB4hv5AQwal69X1oCvKOHHO6Bc7VjTS","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 18:29:42') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('BOqBePv4j3R26O1PfGQVdf41ghEnW596', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T16:29:59.397Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":4},"user":{"id":4,"name":"teacher","password":"$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq","student":null,"teacher":1,"isteacher":true,"isstudent":false}}', '2025-09-30 18:30:00') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('Zag2_RnAVNZIjtdOZbkfsJgMjRPc60Xk', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T16:59:29.367Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":2},"user":{"id":2,"name":"student","password":"$2b$10$7rjGHq4Gafy8JaQ62p.nAOEB4hv5AQwal69X1oCvKOHHO6Bc7VjTS","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 18:59:30') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('jgk32oor2zhUtY2iHR-2hz5ASsTLZSbI', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T16:59:49.350Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":4},"user":{"id":4,"name":"teacher","password":"$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq","student":null,"teacher":1,"isteacher":true,"isstudent":false}}', '2025-09-30 18:59:50') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('HtPFErRDbDPo7GOp2QAEN0Ye8uBY_SME', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T17:02:29.191Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":2},"user":{"id":2,"name":"student","password":"$2b$10$7rjGHq4Gafy8JaQ62p.nAOEB4hv5AQwal69X1oCvKOHHO6Bc7VjTS","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 19:02:30') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('G4vtu2KJpcAYyN-bM6j-Nb0X55M70Aen', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T17:06:09.879Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":4},"user":{"id":4,"name":"teacher","password":"$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq","student":null,"teacher":1,"isteacher":true,"isstudent":false}}', '2025-09-30 19:06:10') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('fn4ZFQBxhyr8T6DTFcAd4-DRVE1YUbvz', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T17:18:54.422Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":2},"user":{"id":2,"name":"student","password":"$2b$10$7rjGHq4Gafy8JaQ62p.nAOEB4hv5AQwal69X1oCvKOHHO6Bc7VjTS","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 19:18:55') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('3i25TtBJAP7cQu-C-2ZWfstyVy08oinw', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T17:31:19.210Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":2},"user":{"id":2,"name":"student","password":"$2b$10$7rjGHq4Gafy8JaQ62p.nAOEB4hv5AQwal69X1oCvKOHHO6Bc7VjTS","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 19:31:20') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('L-adsLY8Aa-xH4nmfMpj3OcspdcRSUCC', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T17:19:26.080Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":4},"user":{"id":4,"name":"teacher","password":"$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq","student":null,"teacher":1,"isteacher":true,"isstudent":false}}', '2025-09-30 19:19:27') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('9q0ChgHKEBXdWREFsJ5p69txpZyWp_h_', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T17:45:48.547Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":4},"user":{"id":4,"name":"teacher","password":"$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq","student":null,"teacher":1,"isteacher":true,"isstudent":false}}', '2025-09-30 19:45:49') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('nrKhz-Rp4GweAn6gqaVLctdxE3ViqggS', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T18:19:21.732Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":2},"user":{"id":2,"name":"student","password":"$2b$10$7rjGHq4Gafy8JaQ62p.nAOEB4hv5AQwal69X1oCvKOHHO6Bc7VjTS","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 20:19:22') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('8FsVHBfZTDPxm8QbXXBx8yBXI1mfd7u1', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T18:44:20.103Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 20:44:21') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('gVuGEnrPojOCOimLIo5iMQxySrzT8Sc4', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T17:21:48.764Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":2},"user":{"id":2,"name":"student","password":"$2b$10$7rjGHq4Gafy8JaQ62p.nAOEB4hv5AQwal69X1oCvKOHHO6Bc7VjTS","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 19:21:49') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('VdBGZmfGemI076ZiaFQbtSf8iRFrm2ON', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T18:06:46.027Z","secure":false,"httpOnly":true,"path":"/"}}', '2025-09-30 20:06:47') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('1yfSZDK74qdRg6SzoC6gKNzFl-x8us77', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T18:06:53.016Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":4},"user":{"id":4,"name":"teacher","password":"$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq","student":null,"teacher":1,"isteacher":true,"isstudent":false}}', '2025-09-30 20:06:54') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('USl-9ggtQmljGmbSBRh8RsRIFbLhOxsm', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T18:19:40.027Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":2},"user":{"id":2,"name":"student","password":"$2b$10$7rjGHq4Gafy8JaQ62p.nAOEB4hv5AQwal69X1oCvKOHHO6Bc7VjTS","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 20:19:41') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('tQMaw-pu9O38UMHqMdqkG95XZzai3UYp', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T17:22:12.656Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":4},"user":{"id":4,"name":"teacher","password":"$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq","student":null,"teacher":1,"isteacher":true,"isstudent":false}}', '2025-09-30 19:22:13') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('8RagnpjLzxzS5jRwFuPD1NyJeVVxZ51D', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T18:10:13.945Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":2},"user":{"id":2,"name":"student","password":"$2b$10$7rjGHq4Gafy8JaQ62p.nAOEB4hv5AQwal69X1oCvKOHHO6Bc7VjTS","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 20:10:14') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('K-Rrh0S1RRn8k1w7q1qO7ihYcp-DJnGs', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T18:20:01.222Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":4},"user":{"id":4,"name":"teacher","password":"$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq","student":null,"teacher":1,"isteacher":true,"isstudent":false}}', '2025-09-30 20:20:02') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('QftSTBodiAUfMWA_pkKR9J8x9t3NzMT7', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T17:30:35.705Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":4},"user":{"id":4,"name":"teacher","password":"$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq","student":null,"teacher":1,"isteacher":true,"isstudent":false}}', '2025-09-30 19:30:36') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('qedMr30BLuBJr6xR6JKbXzPtUxnEFzyk', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T18:13:34.827Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 20:13:35') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('PJAK9_YHhJTmKGK5hoAt4_T3eOQvWZ2x', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T18:34:47.004Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 20:34:48') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('GeQ98dCtAlZP3f2GIOHJy4TBjecsTYLJ', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T18:44:24.084Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 20:44:25') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('i6IfrFgMHfy8gzkjuX71tK2L-zxBbq1S', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T17:35:17.365Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":4},"user":{"id":4,"name":"teacher","password":"$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq","student":null,"teacher":1,"isteacher":true,"isstudent":false}}', '2025-09-30 19:35:18') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('gQwCEI_Vz0BZAO8EKBPM0vQtIltWa5vw', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T18:15:10.795Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":1},"user":{"id":1,"name":"tescik","password":"$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe","student":1,"teacher":null,"isteacher":false,"isstudent":true}}', '2025-09-30 20:15:11') ON CONFLICT DO NOTHING;
INSERT INTO public.session VALUES ('_1_D2Y12-hc1u--QNUA59ly18oOOsYN3', '{"cookie":{"originalMaxAge":2592000000,"expires":"2025-09-30T18:36:07.333Z","secure":false,"httpOnly":true,"path":"/"},"passport":{"user":4},"user":{"id":4,"name":"teacher","password":"$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq","student":null,"teacher":1,"isteacher":true,"isstudent":false}}', '2025-09-30 20:36:08') ON CONFLICT DO NOTHING;


--
-- TOC entry 4852 (class 0 OID 16507)
-- Dependencies: 218
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.students VALUES (1, 'test', 'student', 2018, 'a') ON CONFLICT DO NOTHING;
INSERT INTO public.students VALUES (2, 'drugi', 'drugowski', 2018, 'a') ON CONFLICT DO NOTHING;
INSERT INTO public.students VALUES (3, 'drugi', 'drugowski', 2018, 'a') ON CONFLICT DO NOTHING;
INSERT INTO public.students VALUES (4, 'trzeci', 'drugowski', 2018, 'a') ON CONFLICT DO NOTHING;
INSERT INTO public.students VALUES (5, 'drugi', 'trzeciowski', 2018, 'a') ON CONFLICT DO NOTHING;


--
-- TOC entry 4855 (class 0 OID 16526)
-- Dependencies: 221
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.subjects VALUES ('Biology', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.subjects VALUES ('History', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.subjects VALUES ('Math', 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 4854 (class 0 OID 16518)
-- Dependencies: 220
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.teacher VALUES (1, 'Teacher', 'Testowy') ON CONFLICT DO NOTHING;


--
-- TOC entry 4860 (class 0 OID 16586)
-- Dependencies: 226
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'tescik', '$2b$10$WWpWy8zcpnQj9zANYL63dOUe6pIPH.EHiXyYXJ5nIsI0Qd6kyXUOe', 1, NULL, false, true) ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES (2, 'student', '$2b$10$7rjGHq4Gafy8JaQ62p.nAOEB4hv5AQwal69X1oCvKOHHO6Bc7VjTS', 1, NULL, false, true) ON CONFLICT DO NOTHING;
INSERT INTO public.users VALUES (4, 'teacher', '$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq', NULL, 1, true, false) ON CONFLICT DO NOTHING;


--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 229
-- Name: extracurriculum_admissions_admissionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.extracurriculum_admissions_admissionid_seq', 8, true);


--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 227
-- Name: extracurriculum_extraid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.extracurriculum_extraid_seq', 2, true);


--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 222
-- Name: grades_gradeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grades_gradeid_seq', 33, true);


--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 217
-- Name: students_studentnumber_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_studentnumber_seq', 5, true);


--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 219
-- Name: teacher_teachernumber_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teacher_teachernumber_seq', 1, true);


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 4696 (class 2606 OID 16655)
-- Name: extracurriculum_admissions extracurriculum_admissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extracurriculum_admissions
    ADD CONSTRAINT extracurriculum_admissions_pkey PRIMARY KEY (admissionid);


--
-- TOC entry 4694 (class 2606 OID 16643)
-- Name: extracurriculum extracurriculum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extracurriculum
    ADD CONSTRAINT extracurriculum_pkey PRIMARY KEY (extraid);


--
-- TOC entry 4687 (class 2606 OID 16542)
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (gradeid);


--
-- TOC entry 4690 (class 2606 OID 16583)
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- TOC entry 4681 (class 2606 OID 16514)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (studentnumber);


--
-- TOC entry 4685 (class 2606 OID 16530)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (subject);


--
-- TOC entry 4683 (class 2606 OID 16525)
-- Name: teacher teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (teachernumber);


--
-- TOC entry 4692 (class 2606 OID 16593)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4688 (class 1259 OID 16584)
-- Name: IDX_session_expire; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_session_expire" ON public.session USING btree (expire);


--
-- TOC entry 4704 (class 2606 OID 16656)
-- Name: extracurriculum_admissions fk_extra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extracurriculum_admissions
    ADD CONSTRAINT fk_extra FOREIGN KEY (extraid) REFERENCES public.extracurriculum(extraid);


--
-- TOC entry 4698 (class 2606 OID 16548)
-- Name: grades fk_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT fk_student FOREIGN KEY (student) REFERENCES public.students(studentnumber);


--
-- TOC entry 4701 (class 2606 OID 16599)
-- Name: users fk_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_student FOREIGN KEY (student) REFERENCES public.students(studentnumber);


--
-- TOC entry 4705 (class 2606 OID 16661)
-- Name: extracurriculum_admissions fk_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extracurriculum_admissions
    ADD CONSTRAINT fk_student FOREIGN KEY (student) REFERENCES public.students(studentnumber);


--
-- TOC entry 4699 (class 2606 OID 16553)
-- Name: grades fk_subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT fk_subject FOREIGN KEY (subject) REFERENCES public.subjects(subject);


--
-- TOC entry 4697 (class 2606 OID 16531)
-- Name: subjects fk_teacher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT fk_teacher FOREIGN KEY (teachernumber) REFERENCES public.teacher(teachernumber);


--
-- TOC entry 4700 (class 2606 OID 16543)
-- Name: grades fk_teacher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT fk_teacher FOREIGN KEY (teacher) REFERENCES public.teacher(teachernumber);


--
-- TOC entry 4702 (class 2606 OID 16594)
-- Name: users fk_teacher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_teacher FOREIGN KEY (teacher) REFERENCES public.teacher(teachernumber);


--
-- TOC entry 4703 (class 2606 OID 16644)
-- Name: extracurriculum fk_teacher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extracurriculum
    ADD CONSTRAINT fk_teacher FOREIGN KEY (teacher) REFERENCES public.teacher(teachernumber);


-- Completed on 2025-08-31 22:53:39

--
-- PostgreSQL database dump complete
--

\unrestrict 8cEhkAjhTkp3AfwcNGQRHgJtmZBn6tv4UgcsbDWqz7xZmAVNw5xj7WnDsyaai9s

