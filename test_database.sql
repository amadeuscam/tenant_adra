--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9
-- Dumped by pg_dump version 13.9

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
-- Name: tenant-arganda; Type: SCHEMA; Schema: -; Owner: luciancati
--

CREATE SCHEMA "tenant-arganda";


ALTER SCHEMA "tenant-arganda" OWNER TO luciancati;

--
-- Name: tenant-torrejon; Type: SCHEMA; Schema: -; Owner: luciancati
--

CREATE SCHEMA "tenant-torrejon";


ALTER SCHEMA "tenant-torrejon" OWNER TO luciancati;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO luciancati;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO luciancati;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO luciancati;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO luciancati;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: adra_alimentos; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.adra_alimentos (
    id integer NOT NULL,
    alimento_1 integer NOT NULL,
    alimento_2 integer NOT NULL,
    alimento_3 integer NOT NULL,
    alimento_4 integer NOT NULL,
    alimento_5 integer NOT NULL,
    alimento_6 integer NOT NULL,
    alimento_7 integer NOT NULL,
    alimento_8 integer NOT NULL,
    alimento_9 integer NOT NULL,
    alimento_10 integer NOT NULL,
    alimento_11 integer NOT NULL,
    alimento_12 integer NOT NULL,
    alimento_13 integer NOT NULL,
    signature text,
    fecha_recogida timestamp with time zone NOT NULL,
    created_at date NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    modificado_por_id integer,
    persona_id integer NOT NULL
);


ALTER TABLE public.adra_alimentos OWNER TO luciancati;

--
-- Name: adra_alimentos_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.adra_alimentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adra_alimentos_id_seq OWNER TO luciancati;

--
-- Name: adra_alimentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.adra_alimentos_id_seq OWNED BY public.adra_alimentos.id;


--
-- Name: adra_almacenalimentos; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.adra_almacenalimentos (
    id integer NOT NULL,
    alimento_1 integer NOT NULL,
    alimento_2 integer NOT NULL,
    alimento_3 integer NOT NULL,
    alimento_4 integer NOT NULL,
    alimento_5 integer NOT NULL,
    alimento_6 integer NOT NULL,
    alimento_7 integer NOT NULL,
    alimento_8 integer NOT NULL,
    alimento_9 integer NOT NULL,
    alimento_10 integer NOT NULL,
    alimento_11 integer NOT NULL,
    alimento_12 integer NOT NULL,
    alimento_13 integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    alimento_1_caducidad date NOT NULL,
    alimento_2_caducidad date NOT NULL,
    alimento_3_caducidad date NOT NULL,
    alimento_4_caducidad date NOT NULL,
    alimento_5_caducidad date NOT NULL,
    alimento_6_caducidad date NOT NULL,
    alimento_7_caducidad date NOT NULL,
    alimento_8_caducidad date NOT NULL,
    alimento_9_caducidad date NOT NULL,
    alimento_10_caducidad date NOT NULL,
    alimento_11_caducidad date NOT NULL,
    alimento_12_caducidad date NOT NULL,
    alimento_13_caducidad date NOT NULL,
    modificado_por_id integer
);


ALTER TABLE public.adra_almacenalimentos OWNER TO luciancati;

--
-- Name: adra_almacenalimentos_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.adra_almacenalimentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adra_almacenalimentos_id_seq OWNER TO luciancati;

--
-- Name: adra_almacenalimentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.adra_almacenalimentos_id_seq OWNED BY public.adra_almacenalimentos.id;


--
-- Name: adra_hijo; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.adra_hijo (
    id integer NOT NULL,
    parentesco character varying(50) NOT NULL,
    sexo character varying(20) NOT NULL,
    nombre_apellido character varying(50) NOT NULL,
    dni character varying(50) NOT NULL,
    otros_documentos character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    edad integer NOT NULL,
    active boolean NOT NULL,
    discapacidad boolean NOT NULL,
    modificado_por_id integer,
    persona_id integer NOT NULL
);


ALTER TABLE public.adra_hijo OWNER TO luciancati;

--
-- Name: adra_hijo_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.adra_hijo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adra_hijo_id_seq OWNER TO luciancati;

--
-- Name: adra_hijo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.adra_hijo_id_seq OWNED BY public.adra_hijo.id;


--
-- Name: adra_persona; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.adra_persona (
    id integer NOT NULL,
    nombre_apellido character varying(100) NOT NULL,
    dni character varying(20) NOT NULL,
    otros_documentos character varying(20) NOT NULL,
    fecha_nacimiento date NOT NULL,
    numero_adra integer NOT NULL,
    nacionalidad character varying(20) NOT NULL,
    covid boolean NOT NULL,
    domicilio text NOT NULL,
    are_acte boolean NOT NULL,
    ciudad character varying(350) NOT NULL,
    telefono integer NOT NULL,
    email character varying(100) NOT NULL,
    mensaje text NOT NULL,
    active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    sexo character varying(20) NOT NULL,
    discapacidad boolean NOT NULL,
    codigo_postal integer NOT NULL,
    empadronamiento boolean NOT NULL,
    libro_familia boolean NOT NULL,
    fotocopia_dni boolean NOT NULL,
    prestaciones boolean NOT NULL,
    nomnia boolean NOT NULL,
    cert_negativo boolean NOT NULL,
    aquiler_hipoteca boolean NOT NULL,
    recibos boolean NOT NULL,
    modificado_por_id integer
);


ALTER TABLE public.adra_persona OWNER TO luciancati;

--
-- Name: adra_persona_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.adra_persona_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adra_persona_id_seq OWNER TO luciancati;

--
-- Name: adra_persona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.adra_persona_id_seq OWNED BY public.adra_persona.id;


--
-- Name: adra_profile; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.adra_profile (
    id integer NOT NULL,
    date_of_birth date,
    user_id integer NOT NULL,
    sexo character varying(20) NOT NULL
);


ALTER TABLE public.adra_profile OWNER TO luciancati;

--
-- Name: adra_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.adra_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adra_profile_id_seq OWNER TO luciancati;

--
-- Name: adra_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.adra_profile_id_seq OWNED BY public.adra_profile.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO luciancati;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO luciancati;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO luciancati;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO luciancati;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO luciancati;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO luciancati;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
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


ALTER TABLE public.auth_user OWNER TO luciancati;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO luciancati;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO luciancati;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO luciancati;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO luciancati;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO luciancati;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO luciancati;

--
-- Name: delegaciones_beneficiariosglobales; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.delegaciones_beneficiariosglobales (
    id bigint NOT NULL,
    delegacion_name character varying(350) NOT NULL,
    nombre_beneficiario character varying(250) NOT NULL,
    documentacion_beneficiario character varying(250) NOT NULL,
    ciudad character varying(256) NOT NULL,
    provincia character varying(256) NOT NULL,
    telefono integer NOT NULL,
    delegacion_code integer,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.delegaciones_beneficiariosglobales OWNER TO luciancati;

--
-- Name: delegaciones_beneficiariosglobales_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.delegaciones_beneficiariosglobales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delegaciones_beneficiariosglobales_id_seq OWNER TO luciancati;

--
-- Name: delegaciones_beneficiariosglobales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.delegaciones_beneficiariosglobales_id_seq OWNED BY public.delegaciones_beneficiariosglobales.id;


--
-- Name: delegaciones_delegaciones; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.delegaciones_delegaciones (
    id bigint NOT NULL,
    schema_name character varying(63) NOT NULL,
    nombre character varying(255) NOT NULL,
    code integer NOT NULL,
    codigo_postal integer NOT NULL,
    ciudad character varying(254) NOT NULL,
    provincia character varying(255) NOT NULL,
    telegram_code character varying(500) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    calle character varying(254) NOT NULL,
    oar character varying(500) NOT NULL
);


ALTER TABLE public.delegaciones_delegaciones OWNER TO luciancati;

--
-- Name: delegaciones_delegaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.delegaciones_delegaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delegaciones_delegaciones_id_seq OWNER TO luciancati;

--
-- Name: delegaciones_delegaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.delegaciones_delegaciones_id_seq OWNED BY public.delegaciones_delegaciones.id;


--
-- Name: delegaciones_domain; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.delegaciones_domain (
    id bigint NOT NULL,
    domain character varying(253) NOT NULL,
    is_primary boolean NOT NULL,
    tenant_id bigint NOT NULL
);


ALTER TABLE public.delegaciones_domain OWNER TO luciancati;

--
-- Name: delegaciones_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.delegaciones_domain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delegaciones_domain_id_seq OWNER TO luciancati;

--
-- Name: delegaciones_domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.delegaciones_domain_id_seq OWNED BY public.delegaciones_domain.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO luciancati;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO luciancati;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO luciancati;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO luciancati;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO luciancati;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO luciancati;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO luciancati;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: luciancati
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO luciancati;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: luciancati
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO luciancati;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luciancati
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: account_emailaddress; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE "tenant-arganda".account_emailaddress OWNER TO luciancati;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".account_emailaddress_id_seq OWNER TO luciancati;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".account_emailaddress_id_seq OWNED BY "tenant-arganda".account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE "tenant-arganda".account_emailconfirmation OWNER TO luciancati;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".account_emailconfirmation_id_seq OWNER TO luciancati;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".account_emailconfirmation_id_seq OWNED BY "tenant-arganda".account_emailconfirmation.id;


--
-- Name: adra_alimentos; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".adra_alimentos (
    id integer NOT NULL,
    alimento_1 integer NOT NULL,
    alimento_2 integer NOT NULL,
    alimento_3 integer NOT NULL,
    alimento_4 integer NOT NULL,
    alimento_5 integer NOT NULL,
    alimento_6 integer NOT NULL,
    alimento_7 integer NOT NULL,
    alimento_8 integer NOT NULL,
    alimento_9 integer NOT NULL,
    alimento_10 integer NOT NULL,
    alimento_11 integer NOT NULL,
    alimento_12 integer NOT NULL,
    alimento_13 integer NOT NULL,
    signature text,
    fecha_recogida timestamp with time zone NOT NULL,
    created_at date NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    modificado_por_id integer,
    persona_id integer NOT NULL
);


ALTER TABLE "tenant-arganda".adra_alimentos OWNER TO luciancati;

--
-- Name: adra_alimentos_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".adra_alimentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".adra_alimentos_id_seq OWNER TO luciancati;

--
-- Name: adra_alimentos_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".adra_alimentos_id_seq OWNED BY "tenant-arganda".adra_alimentos.id;


--
-- Name: adra_almacenalimentos; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".adra_almacenalimentos (
    id integer NOT NULL,
    alimento_1 integer NOT NULL,
    alimento_2 integer NOT NULL,
    alimento_3 integer NOT NULL,
    alimento_4 integer NOT NULL,
    alimento_5 integer NOT NULL,
    alimento_6 integer NOT NULL,
    alimento_7 integer NOT NULL,
    alimento_8 integer NOT NULL,
    alimento_9 integer NOT NULL,
    alimento_10 integer NOT NULL,
    alimento_11 integer NOT NULL,
    alimento_12 integer NOT NULL,
    alimento_13 integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    alimento_1_caducidad date NOT NULL,
    alimento_2_caducidad date NOT NULL,
    alimento_3_caducidad date NOT NULL,
    alimento_4_caducidad date NOT NULL,
    alimento_5_caducidad date NOT NULL,
    alimento_6_caducidad date NOT NULL,
    alimento_7_caducidad date NOT NULL,
    alimento_8_caducidad date NOT NULL,
    alimento_9_caducidad date NOT NULL,
    alimento_10_caducidad date NOT NULL,
    alimento_11_caducidad date NOT NULL,
    alimento_12_caducidad date NOT NULL,
    alimento_13_caducidad date NOT NULL,
    modificado_por_id integer
);


ALTER TABLE "tenant-arganda".adra_almacenalimentos OWNER TO luciancati;

--
-- Name: adra_almacenalimentos_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".adra_almacenalimentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".adra_almacenalimentos_id_seq OWNER TO luciancati;

--
-- Name: adra_almacenalimentos_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".adra_almacenalimentos_id_seq OWNED BY "tenant-arganda".adra_almacenalimentos.id;


--
-- Name: adra_hijo; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".adra_hijo (
    id integer NOT NULL,
    parentesco character varying(50) NOT NULL,
    sexo character varying(20) NOT NULL,
    nombre_apellido character varying(50) NOT NULL,
    dni character varying(50) NOT NULL,
    otros_documentos character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    edad integer NOT NULL,
    active boolean NOT NULL,
    discapacidad boolean NOT NULL,
    modificado_por_id integer,
    persona_id integer NOT NULL
);


ALTER TABLE "tenant-arganda".adra_hijo OWNER TO luciancati;

--
-- Name: adra_hijo_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".adra_hijo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".adra_hijo_id_seq OWNER TO luciancati;

--
-- Name: adra_hijo_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".adra_hijo_id_seq OWNED BY "tenant-arganda".adra_hijo.id;


--
-- Name: adra_persona; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".adra_persona (
    id integer NOT NULL,
    nombre_apellido character varying(100) NOT NULL,
    dni character varying(20) NOT NULL,
    otros_documentos character varying(20) NOT NULL,
    fecha_nacimiento date NOT NULL,
    numero_adra integer NOT NULL,
    nacionalidad character varying(20) NOT NULL,
    covid boolean NOT NULL,
    domicilio text NOT NULL,
    are_acte boolean NOT NULL,
    ciudad character varying(350) NOT NULL,
    telefono integer NOT NULL,
    email character varying(100) NOT NULL,
    mensaje text NOT NULL,
    active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    sexo character varying(20) NOT NULL,
    discapacidad boolean NOT NULL,
    codigo_postal integer NOT NULL,
    empadronamiento boolean NOT NULL,
    libro_familia boolean NOT NULL,
    fotocopia_dni boolean NOT NULL,
    prestaciones boolean NOT NULL,
    nomnia boolean NOT NULL,
    cert_negativo boolean NOT NULL,
    aquiler_hipoteca boolean NOT NULL,
    recibos boolean NOT NULL,
    modificado_por_id integer
);


ALTER TABLE "tenant-arganda".adra_persona OWNER TO luciancati;

--
-- Name: adra_persona_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".adra_persona_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".adra_persona_id_seq OWNER TO luciancati;

--
-- Name: adra_persona_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".adra_persona_id_seq OWNED BY "tenant-arganda".adra_persona.id;


--
-- Name: adra_profile; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".adra_profile (
    id integer NOT NULL,
    date_of_birth date,
    user_id integer NOT NULL,
    sexo character varying(20) NOT NULL
);


ALTER TABLE "tenant-arganda".adra_profile OWNER TO luciancati;

--
-- Name: adra_profile_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".adra_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".adra_profile_id_seq OWNER TO luciancati;

--
-- Name: adra_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".adra_profile_id_seq OWNED BY "tenant-arganda".adra_profile.id;


--
-- Name: auth_group; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE "tenant-arganda".auth_group OWNER TO luciancati;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".auth_group_id_seq OWNER TO luciancati;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".auth_group_id_seq OWNED BY "tenant-arganda".auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE "tenant-arganda".auth_group_permissions OWNER TO luciancati;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".auth_group_permissions_id_seq OWNER TO luciancati;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".auth_group_permissions_id_seq OWNED BY "tenant-arganda".auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE "tenant-arganda".auth_permission OWNER TO luciancati;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".auth_permission_id_seq OWNER TO luciancati;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".auth_permission_id_seq OWNED BY "tenant-arganda".auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".auth_user (
    id integer NOT NULL,
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


ALTER TABLE "tenant-arganda".auth_user OWNER TO luciancati;

--
-- Name: auth_user_groups; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE "tenant-arganda".auth_user_groups OWNER TO luciancati;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".auth_user_groups_id_seq OWNER TO luciancati;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".auth_user_groups_id_seq OWNED BY "tenant-arganda".auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".auth_user_id_seq OWNER TO luciancati;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".auth_user_id_seq OWNED BY "tenant-arganda".auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE "tenant-arganda".auth_user_user_permissions OWNER TO luciancati;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".auth_user_user_permissions_id_seq OWNER TO luciancati;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".auth_user_user_permissions_id_seq OWNED BY "tenant-arganda".auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE "tenant-arganda".authtoken_token OWNER TO luciancati;

--
-- Name: django_admin_log; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE "tenant-arganda".django_admin_log OWNER TO luciancati;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".django_admin_log_id_seq OWNER TO luciancati;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".django_admin_log_id_seq OWNED BY "tenant-arganda".django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE "tenant-arganda".django_content_type OWNER TO luciancati;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".django_content_type_id_seq OWNER TO luciancati;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".django_content_type_id_seq OWNED BY "tenant-arganda".django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE "tenant-arganda".django_migrations OWNER TO luciancati;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".django_migrations_id_seq OWNER TO luciancati;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".django_migrations_id_seq OWNED BY "tenant-arganda".django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE "tenant-arganda".django_session OWNER TO luciancati;

--
-- Name: django_site; Type: TABLE; Schema: tenant-arganda; Owner: luciancati
--

CREATE TABLE "tenant-arganda".django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE "tenant-arganda".django_site OWNER TO luciancati;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: tenant-arganda; Owner: luciancati
--

CREATE SEQUENCE "tenant-arganda".django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-arganda".django_site_id_seq OWNER TO luciancati;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-arganda; Owner: luciancati
--

ALTER SEQUENCE "tenant-arganda".django_site_id_seq OWNED BY "tenant-arganda".django_site.id;


--
-- Name: account_emailaddress; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE "tenant-torrejon".account_emailaddress OWNER TO luciancati;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".account_emailaddress_id_seq OWNER TO luciancati;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".account_emailaddress_id_seq OWNED BY "tenant-torrejon".account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE "tenant-torrejon".account_emailconfirmation OWNER TO luciancati;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".account_emailconfirmation_id_seq OWNER TO luciancati;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".account_emailconfirmation_id_seq OWNED BY "tenant-torrejon".account_emailconfirmation.id;


--
-- Name: adra_alimentos; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".adra_alimentos (
    id integer NOT NULL,
    alimento_1 integer NOT NULL,
    alimento_2 integer NOT NULL,
    alimento_3 integer NOT NULL,
    alimento_4 integer NOT NULL,
    alimento_5 integer NOT NULL,
    alimento_6 integer NOT NULL,
    alimento_7 integer NOT NULL,
    alimento_8 integer NOT NULL,
    alimento_9 integer NOT NULL,
    alimento_10 integer NOT NULL,
    alimento_11 integer NOT NULL,
    alimento_12 integer NOT NULL,
    alimento_13 integer NOT NULL,
    signature text,
    fecha_recogida timestamp with time zone NOT NULL,
    created_at date NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    modificado_por_id integer,
    persona_id integer NOT NULL
);


ALTER TABLE "tenant-torrejon".adra_alimentos OWNER TO luciancati;

--
-- Name: adra_alimentos_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".adra_alimentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".adra_alimentos_id_seq OWNER TO luciancati;

--
-- Name: adra_alimentos_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".adra_alimentos_id_seq OWNED BY "tenant-torrejon".adra_alimentos.id;


--
-- Name: adra_almacenalimentos; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".adra_almacenalimentos (
    id integer NOT NULL,
    alimento_1 integer NOT NULL,
    alimento_2 integer NOT NULL,
    alimento_3 integer NOT NULL,
    alimento_4 integer NOT NULL,
    alimento_5 integer NOT NULL,
    alimento_6 integer NOT NULL,
    alimento_7 integer NOT NULL,
    alimento_8 integer NOT NULL,
    alimento_9 integer NOT NULL,
    alimento_10 integer NOT NULL,
    alimento_11 integer NOT NULL,
    alimento_12 integer NOT NULL,
    alimento_13 integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    alimento_1_caducidad date NOT NULL,
    alimento_2_caducidad date NOT NULL,
    alimento_3_caducidad date NOT NULL,
    alimento_4_caducidad date NOT NULL,
    alimento_5_caducidad date NOT NULL,
    alimento_6_caducidad date NOT NULL,
    alimento_7_caducidad date NOT NULL,
    alimento_8_caducidad date NOT NULL,
    alimento_9_caducidad date NOT NULL,
    alimento_10_caducidad date NOT NULL,
    alimento_11_caducidad date NOT NULL,
    alimento_12_caducidad date NOT NULL,
    alimento_13_caducidad date NOT NULL,
    modificado_por_id integer
);


ALTER TABLE "tenant-torrejon".adra_almacenalimentos OWNER TO luciancati;

--
-- Name: adra_almacenalimentos_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".adra_almacenalimentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".adra_almacenalimentos_id_seq OWNER TO luciancati;

--
-- Name: adra_almacenalimentos_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".adra_almacenalimentos_id_seq OWNED BY "tenant-torrejon".adra_almacenalimentos.id;


--
-- Name: adra_hijo; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".adra_hijo (
    id integer NOT NULL,
    parentesco character varying(50) NOT NULL,
    sexo character varying(20) NOT NULL,
    nombre_apellido character varying(50) NOT NULL,
    dni character varying(50) NOT NULL,
    otros_documentos character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    edad integer NOT NULL,
    active boolean NOT NULL,
    discapacidad boolean NOT NULL,
    modificado_por_id integer,
    persona_id integer NOT NULL
);


ALTER TABLE "tenant-torrejon".adra_hijo OWNER TO luciancati;

--
-- Name: adra_hijo_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".adra_hijo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".adra_hijo_id_seq OWNER TO luciancati;

--
-- Name: adra_hijo_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".adra_hijo_id_seq OWNED BY "tenant-torrejon".adra_hijo.id;


--
-- Name: adra_persona; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".adra_persona (
    id integer NOT NULL,
    nombre_apellido character varying(100) NOT NULL,
    dni character varying(20) NOT NULL,
    otros_documentos character varying(20) NOT NULL,
    fecha_nacimiento date NOT NULL,
    numero_adra integer NOT NULL,
    nacionalidad character varying(20) NOT NULL,
    covid boolean NOT NULL,
    domicilio text NOT NULL,
    are_acte boolean NOT NULL,
    ciudad character varying(350) NOT NULL,
    telefono integer NOT NULL,
    email character varying(100) NOT NULL,
    mensaje text NOT NULL,
    active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    sexo character varying(20) NOT NULL,
    discapacidad boolean NOT NULL,
    codigo_postal integer NOT NULL,
    empadronamiento boolean NOT NULL,
    libro_familia boolean NOT NULL,
    fotocopia_dni boolean NOT NULL,
    prestaciones boolean NOT NULL,
    nomnia boolean NOT NULL,
    cert_negativo boolean NOT NULL,
    aquiler_hipoteca boolean NOT NULL,
    recibos boolean NOT NULL,
    modificado_por_id integer
);


ALTER TABLE "tenant-torrejon".adra_persona OWNER TO luciancati;

--
-- Name: adra_persona_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".adra_persona_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".adra_persona_id_seq OWNER TO luciancati;

--
-- Name: adra_persona_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".adra_persona_id_seq OWNED BY "tenant-torrejon".adra_persona.id;


--
-- Name: adra_profile; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".adra_profile (
    id integer NOT NULL,
    date_of_birth date,
    user_id integer NOT NULL,
    sexo character varying(20) NOT NULL
);


ALTER TABLE "tenant-torrejon".adra_profile OWNER TO luciancati;

--
-- Name: adra_profile_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".adra_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".adra_profile_id_seq OWNER TO luciancati;

--
-- Name: adra_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".adra_profile_id_seq OWNED BY "tenant-torrejon".adra_profile.id;


--
-- Name: auth_group; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE "tenant-torrejon".auth_group OWNER TO luciancati;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".auth_group_id_seq OWNER TO luciancati;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".auth_group_id_seq OWNED BY "tenant-torrejon".auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE "tenant-torrejon".auth_group_permissions OWNER TO luciancati;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".auth_group_permissions_id_seq OWNER TO luciancati;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".auth_group_permissions_id_seq OWNED BY "tenant-torrejon".auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE "tenant-torrejon".auth_permission OWNER TO luciancati;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".auth_permission_id_seq OWNER TO luciancati;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".auth_permission_id_seq OWNED BY "tenant-torrejon".auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".auth_user (
    id integer NOT NULL,
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


ALTER TABLE "tenant-torrejon".auth_user OWNER TO luciancati;

--
-- Name: auth_user_groups; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE "tenant-torrejon".auth_user_groups OWNER TO luciancati;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".auth_user_groups_id_seq OWNER TO luciancati;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".auth_user_groups_id_seq OWNED BY "tenant-torrejon".auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".auth_user_id_seq OWNER TO luciancati;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".auth_user_id_seq OWNED BY "tenant-torrejon".auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE "tenant-torrejon".auth_user_user_permissions OWNER TO luciancati;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".auth_user_user_permissions_id_seq OWNER TO luciancati;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".auth_user_user_permissions_id_seq OWNED BY "tenant-torrejon".auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE "tenant-torrejon".authtoken_token OWNER TO luciancati;

--
-- Name: django_admin_log; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE "tenant-torrejon".django_admin_log OWNER TO luciancati;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".django_admin_log_id_seq OWNER TO luciancati;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".django_admin_log_id_seq OWNED BY "tenant-torrejon".django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE "tenant-torrejon".django_content_type OWNER TO luciancati;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".django_content_type_id_seq OWNER TO luciancati;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".django_content_type_id_seq OWNED BY "tenant-torrejon".django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE "tenant-torrejon".django_migrations OWNER TO luciancati;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".django_migrations_id_seq OWNER TO luciancati;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".django_migrations_id_seq OWNED BY "tenant-torrejon".django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE "tenant-torrejon".django_session OWNER TO luciancati;

--
-- Name: django_site; Type: TABLE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE TABLE "tenant-torrejon".django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE "tenant-torrejon".django_site OWNER TO luciancati;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: tenant-torrejon; Owner: luciancati
--

CREATE SEQUENCE "tenant-torrejon".django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tenant-torrejon".django_site_id_seq OWNER TO luciancati;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: tenant-torrejon; Owner: luciancati
--

ALTER SEQUENCE "tenant-torrejon".django_site_id_seq OWNED BY "tenant-torrejon".django_site.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: adra_alimentos id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_alimentos ALTER COLUMN id SET DEFAULT nextval('public.adra_alimentos_id_seq'::regclass);


--
-- Name: adra_almacenalimentos id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_almacenalimentos ALTER COLUMN id SET DEFAULT nextval('public.adra_almacenalimentos_id_seq'::regclass);


--
-- Name: adra_hijo id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_hijo ALTER COLUMN id SET DEFAULT nextval('public.adra_hijo_id_seq'::regclass);


--
-- Name: adra_persona id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_persona ALTER COLUMN id SET DEFAULT nextval('public.adra_persona_id_seq'::regclass);


--
-- Name: adra_profile id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_profile ALTER COLUMN id SET DEFAULT nextval('public.adra_profile_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: delegaciones_beneficiariosglobales id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.delegaciones_beneficiariosglobales ALTER COLUMN id SET DEFAULT nextval('public.delegaciones_beneficiariosglobales_id_seq'::regclass);


--
-- Name: delegaciones_delegaciones id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.delegaciones_delegaciones ALTER COLUMN id SET DEFAULT nextval('public.delegaciones_delegaciones_id_seq'::regclass);


--
-- Name: delegaciones_domain id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.delegaciones_domain ALTER COLUMN id SET DEFAULT nextval('public.delegaciones_domain_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".account_emailaddress ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".account_emailconfirmation_id_seq'::regclass);


--
-- Name: adra_alimentos id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_alimentos ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".adra_alimentos_id_seq'::regclass);


--
-- Name: adra_almacenalimentos id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_almacenalimentos ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".adra_almacenalimentos_id_seq'::regclass);


--
-- Name: adra_hijo id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_hijo ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".adra_hijo_id_seq'::regclass);


--
-- Name: adra_persona id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_persona ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".adra_persona_id_seq'::regclass);


--
-- Name: adra_profile id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_profile ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".adra_profile_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_group ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_permission ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_user ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_user_groups ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".django_admin_log ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".django_content_type ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".django_migrations ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".django_site ALTER COLUMN id SET DEFAULT nextval('"tenant-arganda".django_site_id_seq'::regclass);


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".account_emailaddress ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".account_emailconfirmation_id_seq'::regclass);


--
-- Name: adra_alimentos id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_alimentos ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".adra_alimentos_id_seq'::regclass);


--
-- Name: adra_almacenalimentos id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_almacenalimentos ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".adra_almacenalimentos_id_seq'::regclass);


--
-- Name: adra_hijo id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_hijo ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".adra_hijo_id_seq'::regclass);


--
-- Name: adra_persona id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_persona ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".adra_persona_id_seq'::regclass);


--
-- Name: adra_profile id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_profile ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".adra_profile_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_group ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_permission ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_user ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_user_groups ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".django_admin_log ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".django_content_type ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".django_migrations ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".django_site ALTER COLUMN id SET DEFAULT nextval('"tenant-torrejon".django_site_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	amadeuscam@yahoo.es	t	t	1
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: adra_alimentos; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.adra_alimentos (id, alimento_1, alimento_2, alimento_3, alimento_4, alimento_5, alimento_6, alimento_7, alimento_8, alimento_9, alimento_10, alimento_11, alimento_12, alimento_13, signature, fecha_recogida, created_at, updated_at, modificado_por_id, persona_id) FROM stdin;
\.


--
-- Data for Name: adra_almacenalimentos; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.adra_almacenalimentos (id, alimento_1, alimento_2, alimento_3, alimento_4, alimento_5, alimento_6, alimento_7, alimento_8, alimento_9, alimento_10, alimento_11, alimento_12, alimento_13, created_at, updated_at, alimento_1_caducidad, alimento_2_caducidad, alimento_3_caducidad, alimento_4_caducidad, alimento_5_caducidad, alimento_6_caducidad, alimento_7_caducidad, alimento_8_caducidad, alimento_9_caducidad, alimento_10_caducidad, alimento_11_caducidad, alimento_12_caducidad, alimento_13_caducidad, modificado_por_id) FROM stdin;
\.


--
-- Data for Name: adra_hijo; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.adra_hijo (id, parentesco, sexo, nombre_apellido, dni, otros_documentos, fecha_nacimiento, edad, active, discapacidad, modificado_por_id, persona_id) FROM stdin;
\.


--
-- Data for Name: adra_persona; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.adra_persona (id, nombre_apellido, dni, otros_documentos, fecha_nacimiento, numero_adra, nacionalidad, covid, domicilio, are_acte, ciudad, telefono, email, mensaje, active, created_at, updated_at, sexo, discapacidad, codigo_postal, empadronamiento, libro_familia, fotocopia_dni, prestaciones, nomnia, cert_negativo, aquiler_hipoteca, recibos, modificado_por_id) FROM stdin;
\.


--
-- Data for Name: adra_profile; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.adra_profile (id, date_of_birth, user_id, sexo) FROM stdin;
1	\N	1	mujer
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add delegaciones	1	add_delegaciones
2	Can change delegaciones	1	change_delegaciones
3	Can delete delegaciones	1	delete_delegaciones
4	Can view delegaciones	1	view_delegaciones
5	Can add domain	2	add_domain
6	Can change domain	2	change_domain
7	Can delete domain	2	delete_domain
8	Can view domain	2	view_domain
9	Can add beneficiarios globales	3	add_beneficiariosglobales
10	Can change beneficiarios globales	3	change_beneficiariosglobales
11	Can delete beneficiarios globales	3	delete_beneficiariosglobales
12	Can view beneficiarios globales	3	view_beneficiariosglobales
13	Can add profile	4	add_profile
14	Can change profile	4	change_profile
15	Can delete profile	4	delete_profile
16	Can view profile	4	view_profile
17	Can add Beneficiario	5	add_persona
18	Can change Beneficiario	5	change_persona
19	Can delete Beneficiario	5	delete_persona
20	Can view Beneficiario	5	view_persona
21	Can add Familiar del Beneficiario	6	add_hijo
22	Can change Familiar del Beneficiario	6	change_hijo
23	Can delete Familiar del Beneficiario	6	delete_hijo
24	Can view Familiar del Beneficiario	6	view_hijo
25	Can add Almacen Alimento	7	add_almacenalimentos
26	Can change Almacen Alimento	7	change_almacenalimentos
27	Can delete Almacen Alimento	7	delete_almacenalimentos
28	Can view Almacen Alimento	7	view_almacenalimentos
29	Can add Alimento	8	add_alimentos
30	Can change Alimento	8	change_alimentos
31	Can delete Alimento	8	delete_alimentos
32	Can view Alimento	8	view_alimentos
33	Can add content type	9	add_contenttype
34	Can change content type	9	change_contenttype
35	Can delete content type	9	delete_contenttype
36	Can view content type	9	view_contenttype
37	Can add log entry	10	add_logentry
38	Can change log entry	10	change_logentry
39	Can delete log entry	10	delete_logentry
40	Can view log entry	10	view_logentry
41	Can add permission	11	add_permission
42	Can change permission	11	change_permission
43	Can delete permission	11	delete_permission
44	Can view permission	11	view_permission
45	Can add group	12	add_group
46	Can change group	12	change_group
47	Can delete group	12	delete_group
48	Can view group	12	view_group
49	Can add user	13	add_user
50	Can change user	13	change_user
51	Can delete user	13	delete_user
52	Can view user	13	view_user
53	Can add session	14	add_session
54	Can change session	14	change_session
55	Can delete session	14	delete_session
56	Can view session	14	view_session
57	Can add site	15	add_site
58	Can change site	15	change_site
59	Can delete site	15	delete_site
60	Can view site	15	view_site
61	Can add email address	16	add_emailaddress
62	Can change email address	16	change_emailaddress
63	Can delete email address	16	delete_emailaddress
64	Can view email address	16	view_emailaddress
65	Can add email confirmation	17	add_emailconfirmation
66	Can change email confirmation	17	change_emailconfirmation
67	Can delete email confirmation	17	delete_emailconfirmation
68	Can view email confirmation	17	view_emailconfirmation
69	Can add Token	18	add_token
70	Can change Token	18	change_token
71	Can delete Token	18	delete_token
72	Can view Token	18	view_token
73	Can add token	19	add_tokenproxy
74	Can change token	19	change_tokenproxy
75	Can delete token	19	delete_tokenproxy
76	Can view token	19	view_tokenproxy
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$AOOuuKL8nxKpmkfaB2Fk0n$S+Tvi0RwxM75f1/7cSK6Bx58CF7TL5kYQteDZ0xbSEA=	2022-12-17 06:48:06.87241+00	t	lucian			amadeuscam@yahoo.es	t	t	2022-11-02 03:35:58.802844+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
96f4cd76d705b33b3656acfc6d6bfc67bce51aa1	2022-11-02 03:35:59.210197+00	1
\.


--
-- Data for Name: delegaciones_beneficiariosglobales; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.delegaciones_beneficiariosglobales (id, delegacion_name, nombre_beneficiario, documentacion_beneficiario, ciudad, provincia, telefono, delegacion_code, created_at) FROM stdin;
341	Adra Torrejon	HAMID EL MOUKHLOUFI	X3996311-S	Torrejon De Ardoz	Madrid	615763836	2	2022-11-04 06:55:28.249938+00
342	Adra Torrejon	Elena Felea	X9843656-R	Torrejon De Ardoz	Madrid	653061231	2	2022-11-04 06:55:28.360249+00
343	Adra Torrejon	MARIANA VICTORIA ILIE	X6477872-Z	Torrejon De Ardoz	Madrid	0	2	2022-11-04 06:55:28.394242+00
344	Adra Torrejon	EL FILALI EL KOURCHI HABIBA	09129847-C	Torrejon De Ardoz	Madrid	604249332	2	2022-11-04 06:55:28.417942+00
345	Adra Torrejon	HANANE OKRICH	X7743747-S	Torrejon De Ardoz	Madrid	632743452	2	2022-11-04 06:55:28.45042+00
346	Adra Torrejon	IKRAM EL YAAMOURI	X8881214-V	Torrejon De Ardoz	Madrid	602398767	2	2022-11-04 06:55:28.516938+00
347	Adra Torrejon	LATIFA RAHMOUNI	X6329284-Y	Torrejon De Ardoz	Madrid	643617707	2	2022-11-04 06:55:28.573656+00
348	Adra Torrejon	KHADIJA SBAA	Y3281136-Q	Torrejon De Ardoz	Madrid	603194639	2	2022-11-04 06:55:28.60739+00
349	Adra Torrejon	AMINA EL HADDAD	X8089538-R	Torrejon De Ardoz	Madrid	0	2	2022-11-04 06:55:28.640549+00
350	Adra Torrejon	AICHA MOUKHLOUFI	X8089475-F	Torrejon De Ardoz	Madrid	602146389	2	2022-11-04 06:55:28.654545+00
352	Adra Torrejon	ACIA ECH CHARKAOUY	Y0411680-V	Torrejon De Ardoz	Madrid	602149933	2	2022-11-04 06:55:28.732337+00
353	Adra Torrejon	RADIA AACHBOUN	X7664452-B	Torrejon De Ardoz	Madrid	662434781	2	2022-11-04 06:55:28.779786+00
354	Adra Torrejon	ZAKIA EL MAALLIN	X6162645-W	Torrejon De Ardoz	Madrid	602827678	2	2022-11-04 06:55:28.827243+00
355	Adra Torrejon	RACHIDA AZZOUZ	X9990995-W	Torrejon De Ardoz	Madrid	643840816	2	2022-11-04 06:55:28.88969+00
356	Adra Torrejon	MOUNIRA AGMIR	X5741828-Q	Torrejon De Ardoz	Madrid	603270949	2	2022-11-04 06:55:28.913222+00
357	Adra Torrejon	RAHMA BEN STAHIR SERROUKH	Y2327957A	Torrejon De Ardoz	Madrid	642607119	2	2022-11-04 06:55:28.975954+00
358	Adra Torrejon	KARIMA SLIMANI	X6924456F	Torrejon De Ardoz	Madrid	654180297	2	2022-11-04 06:55:29.031985+00
359	Adra Torrejon	EL MEBLI ZIYAMI AOUATIF	50743252P	Torrejon De Ardoz	Madrid	642002611	2	2022-11-04 06:55:29.067485+00
360	Adra Torrejon	IMANE BAKKALI	X6198271R	Torrejon De Ardoz	Madrid	602368067	2	2022-11-04 06:55:29.080257+00
361	Adra Torrejon	BOUSSABOUN AHIBOUJ MOHAMED	54962138G	Torrejon De Ardoz	Madrid	600815200	2	2022-11-04 06:55:29.136976+00
362	Adra Torrejon	ASMA NAJHI	X4853480C	Torrejon De Ardoz	Madrid	671471687	2	2022-11-04 06:55:29.202155+00
363	Adra Torrejon	FATIMA ZOHRA AMTOUR	Y3418014K	Torrejon De Ardoz	Madrid	603339752	2	2022-11-04 06:55:29.236142+00
364	Adra Torrejon	LATIFA FOURSI	55216900h	Torrejon De Ardoz	Madrid	650742586	2	2022-11-04 06:55:29.301054+00
365	Adra Torrejon	FRAGA CHIQUITO MARIA JOSE	54705775E	Torrejon De Ardoz	Madrid	680705157	2	2022-11-04 06:55:29.356486+00
366	Adra Torrejon	TALLEH BAISSA FATIMA	09129291Q	Torrejon De Ardoz	Madrid	648611430	2	2022-11-04 06:55:29.373126+00
367	Adra Torrejon	AZIZA ZYYANI	X2685010-J	Torrejon De Ardoz	Madrid	671222344	2	2022-11-04 06:55:29.427649+00
368	Adra Torrejon	SAMIRA FOURSI BOURJAL	03509761-F	Torrejon De Ardoz	Madrid	632043251	2	2022-11-04 06:55:29.480484+00
369	Adra Torrejon	YENZ FRANCISCO LOPEZ ARIAS	141478612	Torrejon De Ardoz	Madrid	0	2	2022-11-04 06:55:29.550245+00
370	Adra Torrejon	SOUAD EL HALOULI	X4974350-W	Torrejon De Ardoz	Madrid	610637397	2	2022-11-04 06:55:29.573264+00
371	Adra Torrejon	BOBOC MITA	Y2010710-H	Torrejon De Ardoz	Madrid	0	2	2022-11-04 06:55:29.615772+00
372	Adra Torrejon	AUREL BOBOC	X6869082-V	Torrejon De Ardoz	Madrid	0	2	2022-11-04 06:55:29.628639+00
373	Adra Torrejon	SARRA EL MASOUDI	Y2388035-M	Torrejon De Ardoz	Madrid	632334387	2	2022-11-04 06:55:29.652464+00
374	Adra Torrejon	ZOUHRA BOUZIT	X9646321-Y	Torrejon De Ardoz	Madrid	0	2	2022-11-04 06:55:29.710057+00
375	Adra Torrejon	HAJIBA SETTAR	X9124623-V	Torrejon De Ardoz	Madrid	653132785	2	2022-11-04 06:55:29.767767+00
376	Adra Torrejon	HOUSYNA ELMOALEM	X6431332-A	Torrejon De Ardoz	Madrid	0	2	2022-11-04 06:55:29.821973+00
377	Adra Torrejon	HANAN BERROUHOU	X7672470-S	Torrejon De Ardoz	Madrid	631247102	2	2022-11-04 06:55:29.876733+00
378	Adra Torrejon	EL MOUSSAOUI AIT MHAND MOULOUD	53826702-D	Torrejon De Ardoz	Madrid	0	2	2022-11-04 06:55:29.94471+00
379	Adra Torrejon	SABAH TOUTOUH	X9719063-E	Torrejon De Ardoz	Madrid	602321666	2	2022-11-04 06:55:29.999476+00
380	Adra Torrejon	LILIANA GEORGETA BRINZAN	X9062451-Z	Torrejon De Ardoz	Madrid	664350603	2	2022-11-04 06:55:30.110747+00
381	Adra Torrejon	ASMAA ZYATE	X9398731-B	Torrejon De Ardoz	Madrid	640286822	2	2022-11-04 06:55:30.137621+00
382	Adra Torrejon	PILAR AVOMO NDONG	Y0481657-M	Torrejon De Ardoz	Madrid	612432299	2	2022-11-04 06:55:30.209495+00
383	Adra Torrejon	ASMAE EL KADDOURI	X9259841H	Torrejon De Ardoz	Madrid	616746917	2	2022-11-04 06:55:30.274096+00
384	Adra Torrejon	KARIMA EL BOUTROUKI	X7992352-J	Torrejon De Ardoz	Madrid	642065395	2	2022-11-04 06:55:30.345633+00
385	Adra Torrejon	RABIA EL FARSIOUI	X1911463W	Torrejon De Ardoz	Madrid	692938386	2	2022-11-04 06:55:30.400252+00
386	Adra Torrejon	MALIKA BOURFAA	X6266269-L	Torrejon De Ardoz	Madrid	631755693	2	2022-11-04 06:55:30.445613+00
387	Adra Torrejon	FATYHA RAHMANI	X7784589-D	Torrejon De Ardoz	Madrid	604361732	2	2022-11-04 06:55:30.468596+00
388	Adra Torrejon	ZAHRA SKHIENE	X7790781-Z	Torrejon De Ardoz	Madrid	615050607	2	2022-11-04 06:55:30.535241+00
389	Adra Torrejon	NAIMA EL MACHROUHI	X6226710-N	Torrejon De Ardoz	Madrid	631468391	2	2022-11-04 06:55:30.603242+00
390	Adra Torrejon	SALIMA ZARKAN	X4236266-B	Torrejon De Ardoz	Madrid	602146389	2	2022-11-04 06:55:30.627861+00
391	Adra Torrejon	SABAH EL AMRANI	Y1726896-R	Torrejon De Ardoz	Madrid	632448231	2	2022-11-04 06:55:30.695107+00
392	Adra Torrejon	AMINA EL METIOUI	X6025137-B	Torrejon De Ardoz	Madrid	631121209	2	2022-11-04 06:55:30.748949+00
393	Adra Torrejon	SAKINA EL MANSOURI	Y0355993-J	Torrejon De Ardoz	Madrid	722285615	2	2022-11-04 06:55:30.785642+00
394	Adra Torrejon	KHADDOUJ BEL HAJ	X2749254-H	Torrejon De Ardoz	Madrid	631199210	2	2022-11-04 06:55:30.830354+00
395	Adra Torrejon	AFIA ABOUSSAID OUASSIMA	50646150N	Torrejon De Ardoz	Madrid	655325445	2	2022-11-04 06:55:30.868496+00
396	Adra Torrejon	NISRINE CHAIRI	X5313692-W	Torrejon De Ardoz	Madrid	676907822	2	2022-11-04 06:55:30.91186+00
397	Adra Torrejon	HAJAR AKAZIM	Y0273393Y	Torrejon De Ardoz	Madrid	602575828	2	2022-11-04 06:55:30.96769+00
398	Adra Torrejon	AICHA EL FARSIOUI	X3734165-T	Torrejon De Ardoz	Madrid	631180588	2	2022-11-04 06:55:31.024893+00
399	Adra Torrejon	FATOUM BOUSSAID	X2326896-D	Torrejon De Ardoz	Madrid	655325445	2	2022-11-04 06:55:31.059678+00
400	Adra Torrejon	FATIMA SALHI	Y0290502-A	Torrejon De Ardoz	Madrid	603274091	2	2022-11-04 06:55:31.096134+00
401	Adra Torrejon	SAIDA RIYADI	X3360197-N	Torrejon De Ardoz	Madrid	605349941	2	2022-11-04 06:55:31.167893+00
402	Adra Torrejon	KHADIJA ALOUAT	X7615513-Y	Torrejon De Ardoz	Madrid	672914278	2	2022-11-04 06:55:31.226841+00
403	Adra Torrejon	EL AZIZA AL AMRANI	X9645766-A	Torrejon De Ardoz	Madrid	689289276	2	2022-11-04 06:55:31.300167+00
404	Adra Torrejon	HABIBA BOUTASGHOUNTE	X6961108-C	Torrejon De Ardoz	Madrid	672899236	2	2022-11-04 06:55:31.371248+00
405	Adra Torrejon	LAHCEN DHIKAR	X3139107-K	Torrejon De Ardoz	Madrid	602691629	2	2022-11-04 06:55:31.415396+00
406	Adra Torrejon	SAIDA BOUJIDA	X2280778-Y	Torrejon De Ardoz	Madrid	604399572	2	2022-11-04 06:55:31.471619+00
407	Adra Torrejon	SANAA ANAKAR	Y0185277-A	Torrejon De Ardoz	Madrid	632979580	2	2022-11-04 06:55:31.529813+00
408	Adra Torrejon	OMKELTOUM EL GUARRATI	X8582085-A	Torrejon De Ardoz	Madrid	632051625	2	2022-11-04 06:55:31.600646+00
409	Adra Torrejon	FATIMA KAINA	X5934241-B	Torrejon De Ardoz	Madrid	632011813	2	2022-11-04 06:55:31.64603+00
410	Adra Torrejon	HORIA BEN ABDELLAH	X8231122-C	Torrejon De Ardoz	Madrid	633363405	2	2022-11-04 06:55:31.712655+00
411	Adra Torrejon	FAUSTINA AGYEI	Y3260740-K	Torrejon De Ardoz	Madrid	631080645	2	2022-11-04 06:55:31.769099+00
412	Adra Torrejon	YAA ROSINA AGYEI	Y1123338-D	Torrejon De Ardoz	Madrid	631387647	2	2022-11-04 06:55:31.83732+00
413	Adra Torrejon	BEATRICE OPPONG	Y0231244-Q	Torrejon De Ardoz	Madrid	632764349	2	2022-11-04 06:55:31.888702+00
414	Adra Torrejon	MOSTAFA BENABDELLAH	X1357646-W	Torrejon De Ardoz	Madrid	654209095	2	2022-11-04 06:55:31.944739+00
415	Adra Torrejon	ROUHAND EL AOUMRANI AHMED	51528834-W	Torrejon De Ardoz	Madrid	699688484	2	2022-11-04 06:55:31.978639+00
416	Adra Torrejon	AHMED ENNAMOUTI	X1310352-L	Torrejon De Ardoz	Madrid	664664668	2	2022-11-04 06:55:32.051515+00
417	Adra Torrejon	SAMIRA EL KHAMMARI	54648509A	Torrejon De Ardoz	Madrid	617285809	2	2022-11-04 06:55:32.107527+00
418	Adra Torrejon	EL HADI JAHJAH	X1380607D	Torrejon De Ardoz	Madrid	0	2	2022-11-04 06:55:32.175806+00
419	Adra Torrejon	EL KHAMMARI EL MAJDOUBI RACHIDA	X09125296T	Torrejon De Ardoz	Madrid	603297705	2	2022-11-04 06:55:32.231781+00
420	Adra Torrejon	ZAKIA EL MANSOURI	X2874623-Z	Torrejon De Ardoz	Madrid	698643007	2	2022-11-04 06:55:32.297594+00
421	Adra Torrejon	DRAGU ILIE	X8503333-A	Torrejon De Ardoz	Madrid	664665165	2	2022-11-04 06:55:32.355594+00
422	Adra Torrejon	JOSEPH KWATENG	X6855810-Q	Torrejon De Ardoz	Madrid	0	2	2022-11-04 06:55:32.380965+00
423	Adra Torrejon	DINCA ELENA EUGENIA	X8999455-S	Torrejon De Ardoz	Madrid	0	2	2022-11-04 06:55:32.427503+00
424	Adra Torrejon	ANA CRESPO VEGA	9012836X	Torrejon De Ardoz	Madrid	628125211	2	2022-11-04 06:55:32.461025+00
425	Adra Torrejon	LOBNA EL AZAAR	X75121366-Z	Torrejon De Ardoz	Madrid	631569661	2	2022-11-04 06:55:32.485342+00
426	Adra Torrejon	FAOUZIYA MAKRANE	Y4696158-D	Torrejon De Ardoz	Madrid	675202181	2	2022-11-04 06:55:32.553664+00
427	Adra Torrejon	SOHAILA ELKHAMLICHI	Y5599602-J	Torrejon De Ardoz	Madrid	631085094	2	2022-11-04 06:55:32.609096+00
428	Adra Torrejon	RADIA AKHAZZANE	X6034452--B	Torrejon De Ardoz	Madrid	626116831	2	2022-11-04 06:55:32.667089+00
429	Adra Torrejon	JAMILA ADAHCHOUR	X8791477-A	Torrejon De Ardoz	Madrid	617216176	2	2022-11-04 06:55:32.730233+00
430	Adra Torrejon	LAILA SAFFI	X6525968.-V	Torrejon De Ardoz	Madrid	631049455	2	2022-11-04 06:55:32.754803+00
431	Adra Torrejon	RAMONA NICOLETA POPOVICI	X6692914-Y	Torrejon De Ardoz	Madrid	642725308	2	2022-11-04 06:55:32.821515+00
432	Adra Torrejon	GEORGEL RADU	X6780349-H	Torrejon De Ardoz	Madrid	642843531	2	2022-11-04 06:55:32.865509+00
433	Adra Torrejon	HOURIA ARAZZOUK	X8557195-E	Torrejon De Ardoz	Madrid	602085764	2	2022-11-04 06:55:32.94498+00
434	Adra Torrejon	Abigaila Sephora Tataru	y1658526x	Torrejon De Ardoz	Madrid	642864152	2	2022-11-04 06:55:33.005838+00
435	Adra Torrejon	NORMA VICTORIA GONZALES PAJARES	50908315-T	Torrejon De Ardoz	Madrid	0	2	2022-11-04 06:55:33.019446+00
436	Adra Torrejon	MARIAN PIRVU	y1882395-c	Torrejon De Ardoz	Madrid	604155846	2	2022-11-04 06:55:33.032784+00
437	Adra Torrejon	MIÑANA NICOLAS	03137807D	Torrejon De Ardoz	Madrid	633480798	2	2022-11-04 06:55:33.046017+00
438	Adra Torrejon	EDWIM ALEXANDER	Y7235151	Torrejon De Ardoz	Madrid	643960637	2	2022-11-04 06:55:33.059196+00
439	Adra Torrejon	ALEJANDRINA PORTILLO SORTO	F415597	Torrejon De Ardoz	Madrid	632142446	2	2022-11-04 06:55:33.095214+00
440	Adra Torrejon	MAJIDA EL MANSOURI	X3269326Z	Torrejon De Ardoz	Madrid	603321623	2	2022-11-04 06:55:33.120186+00
441	Adra Torrejon	LATIFA SABBAHI	X7805187E	Torrejon De Ardoz	Madrid	664128450	2	2022-11-04 06:55:33.164265+00
442	Adra Torrejon	MIHAILA IULIAN RADU	053450022	Torrejon De Ardoz	Madrid	1	2	2022-11-04 06:55:33.220144+00
443	Adra Torrejon	IBTISSAM MAWHOUB	X9993183-M	Torrejon De Ardoz	Madrid	642144729	2	2022-11-04 06:55:33.232761+00
444	Adra Torrejon	BOUCHRA AOUARFAT OUTOUHAMI	54011252F	Torrejon De Ardoz	Madrid	632748695	2	2022-11-04 06:55:33.287123+00
445	Adra Torrejon	KHADIJA NAITBARI BKKA	53756846G	Torrejon De Ardoz	Madrid	643585427	2	2022-11-04 06:55:33.342298+00
446	Adra Torrejon	Aurora Florentina Raducan	Y6313412H	Torrejon De Ardoz	Madrid	642170761	2	2022-11-04 06:55:33.354711+00
447	Adra Torrejon	LOREDANA DUMITRASCU	X7792871B	Torrejon De Ardoz	Madrid	643360643	2	2022-11-04 06:55:33.374889+00
448	Adra Torrejon	Giovani Gentile	000000	Torrejon De Ardoz	Madrid	600286391	2	2022-11-04 06:55:33.440123+00
449	Adra Torrejon	Cornel Edu	x8829799f	Torrejon De Ardoz	Madrid	600391671	2	2022-11-04 06:55:33.494832+00
450	Adra Torrejon	Florin Mitrica	x9102926d	Torrejon De Ardoz	Madrid	603122131	2	2022-11-04 06:55:33.549904+00
451	Adra Torrejon	Mita Florea	rx740328	Torrejon De Ardoz	Madrid	674028736	2	2022-11-04 06:55:33.573096+00
452	Adra Torrejon	Luis Rodriguez Flores	y6884400p	Torrejon De Ardoz	Madrid	643689225	2	2022-11-04 06:55:33.698446+00
453	Adra Torrejon	Iulian Catalin zamfir	x4967475g	Torrejon De Ardoz	Madrid	640762743	2	2022-11-04 06:55:33.747713+00
454	Adra Torrejon	Ramona Alupoaiei	x6581006q	Torrejon De Ardoz	Madrid	689493377	2	2022-11-04 06:55:33.796597+00
455	Adra Torrejon	Viorel Alexandru	x6640597	Torrejon De Ardoz	Madrid	617288998	2	2022-11-04 06:55:33.830936+00
456	Adra Torrejon	Elena Bilti	x7511829y	Torrejon De Ardoz	Madrid	663329065	2	2022-11-04 06:55:33.876307+00
457	Adra Torrejon	Junior Enrique Quintero Barrios	y7122747y	Torrejon De Ardoz	Madrid	643967300	2	2022-11-04 06:55:33.899736+00
458	Adra Torrejon	Ciocan  Mugurel	x6975307m	Torrejon De Ardoz	Madrid	678112831	2	2022-11-04 06:55:33.936676+00
459	Adra Torrejon	Eremia Andrei	x3367787n	Torrejon De Ardoz	Madrid	666966644	2	2022-11-04 06:55:33.981104+00
460	Adra Torrejon	Bran Mihai Mircea	y0136869t	Torrejon De Ardoz	Madrid	672513351	2	2022-11-04 06:55:34.036983+00
461	Adra Torrejon	Serbanescu Stefania	x9273663v	Torrejon De Ardoz	Madrid	643417020	2	2022-11-04 06:55:34.061454+00
462	Adra Torrejon	Efren Parada Cardoza	y7130307e	Torrejon De Ardoz	Madrid	0	2	2022-11-04 06:55:34.107287+00
463	Adra Torrejon	Luca Olga	y1783948j	Torrejon De Ardoz	Madrid	642944669	2	2022-11-04 06:55:34.143115+00
464	Adra Torrejon	Constantin Avram	x9139236w	Torrejon De Ardoz	Madrid	642297147	2	2022-11-04 06:55:34.157091+00
465	Adra Torrejon	Fouad lamart slimart	x2852017v	Torrejon De Ardoz	Madrid	602391392	2	2022-11-04 06:55:34.191988+00
466	Adra Torrejon	Radu Marin	x6853446k	Torrejon De Ardoz	Madrid	644663852	2	2022-11-04 06:55:34.205327+00
467	Adra Torrejon	Matei Marinez Danut	x9210713h	Torrejon De Ardoz	Madrid	642401105	2	2022-11-04 06:55:34.230177+00
468	Adra Torrejon	Iulian Platica	x6729693p	Torrejon De Ardoz	Madrid	672502443	2	2022-11-04 06:55:34.266054+00
469	Adra Torrejon	Coca Vasile	x6814648r	Torrejon De Ardoz	Madrid	642709195	2	2022-11-04 06:55:34.300181+00
470	Adra Torrejon	Ovidiu Ceica	y0155951w	Torrejon De Ardoz	Madrid	642881012	2	2022-11-04 06:55:34.334772+00
471	Adra Torrejon	Juan Carlos Alonso de la Morena	51361312n	Torrejon De Ardoz	Madrid	673253628	2	2022-11-04 06:55:34.36819+00
472	Adra Torrejon	Raul Anton Mojoatca	x8775584a	Torrejon De Ardoz	Madrid	644043472	2	2022-11-04 06:55:34.392315+00
473	Adra Torrejon	Maria Cojocaru	x9113672z	Torrejon De Ardoz	Madrid	642118035	2	2022-11-04 06:55:34.409371+00
474	Adra Torrejon	Ion Gabriela	x8567152c	Torrejon De Ardoz	Madrid	643165178	2	2022-11-04 06:55:34.443425+00
475	Adra Torrejon	Garcia Ruiz Wilson Vicente	51557436s	Torrejon De Ardoz	Madrid	0	2	2022-11-04 06:55:34.456519+00
476	Adra Torrejon	Tipanluisa Mata Freddy	49309529s	Torrejon De Ardoz	Madrid	688408781	2	2022-11-04 06:55:34.511339+00
477	Adra Torrejon	Petruta Sareanu	y479228p	Torrejon De Ardoz	Madrid	643373222	2	2022-11-04 06:55:34.546021+00
478	Adra Torrejon	Constantin Viorel Florin	x5637897e	Torrejon De Ardoz	Madrid	678213092	2	2022-11-04 06:55:34.570091+00
479	Adra Torrejon	Simona Dobrin	x6629030q	Torrejon De Ardoz	Madrid	643049567	2	2022-11-04 06:55:34.615602+00
480	Adra Torrejon	Radoi Grigorita	x6037155t	Torrejon De Ardoz	Madrid	622527859	2	2022-11-04 06:55:34.659872+00
481	Adra Torrejon	Munteanu Albert Octavian	x4274646g	Torrejon De Ardoz	Madrid	670893966	2	2022-11-04 06:55:34.682941+00
482	Adra Torrejon	Cati Eugenia	x6724425f	Torrejon De Ardoz	Madrid	642733251	2	2022-11-04 06:55:34.737595+00
483	Adra Torrejon	Steliana Dobre	x6820629w	Torrejon De Ardoz	Madrid	625384551	2	2022-11-04 06:55:34.750758+00
484	Adra Torrejon	Stoica Tudor	X9076026L	Torrejon De Ardoz	Madrid	664523553	2	2022-11-04 06:55:34.764648+00
485	Adra Torrejon	Rece Ion	TR643230	Torrejon De Ardoz	Madrid	642961670	2	2022-11-04 06:55:34.788131+00
486	Adra Torrejon	Turcios Cruz Josue Ariel	G. 118392	Torrejon De Ardoz	Madrid	644651939	2	2022-11-04 06:55:34.801543+00
487	Adra Torrejon	Strătilă Alin	SV055321863	Torrejon De Ardoz	Madrid	642079097	2	2022-11-04 06:55:34.825385+00
488	Adra Torrejon	Dumitrean Iosif	XB565077	Torrejon De Ardoz	Madrid	677347531	2	2022-11-04 06:55:34.838282+00
489	Adra Torrejon	Munteanu Letiția	X6602617F	Torrejon De Ardoz	Madrid	642279172	2	2022-11-04 06:55:34.863607+00
490	Adra Torrejon	Javier Argumenez Patiñio	06271943 G	Torrejon De Ardoz	Madrid	618294714	2	2022-11-04 06:55:34.876349+00
491	Adra Torrejon	Mario Rodrigo Yapo Maila	X5637918 C	Torrejon De Ardoz	Madrid	663260550	2	2022-11-04 06:55:34.909545+00
492	Adra Torrejon	Doinita Paraschiva Olar	X6596688N	Torrejon De Ardoz	Madrid	643127240	2	2022-11-04 06:55:34.944529+00
493	Adra Torrejon	Matei Ionez	Y6195289T	Torrejon De Ardoz	Madrid	642979570	2	2022-11-04 06:55:34.958216+00
494	Adra Torrejon	Dincă Doina	X4266987 G	Torrejon De Ardoz	Madrid	642237319	2	2022-11-04 06:55:34.983843+00
495	Adra Torrejon	Nechifor Mihaita	X8531260P	Torrejon De Ardoz	Madrid	642771001	2	2022-11-04 06:55:34.99937+00
496	Adra Torrejon	Larisa Ribca	X9798462 W	Torrejon De Ardoz	Madrid	647240479	2	2022-11-04 06:55:35.030136+00
497	Adra Torrejon	Constanța Costoiu	X9284310 S	Torrejon De Ardoz	Madrid	642503382	2	2022-11-04 06:55:35.067696+00
498	Adra Torrejon	Renata Da Silva Colmero	6A074325	Torrejon De Ardoz	Madrid	644939476	2	2022-11-04 06:55:35.091099+00
499	Adra Torrejon	Rotaru Elena	X5211836J	Torrejon De Ardoz	Madrid	642797905	2	2022-11-04 06:55:35.114914+00
500	Adra Torrejon	Cimpoeru Cornelia	KT846017	Torrejon De Ardoz	Madrid	628134082	2	2022-11-04 06:55:35.130722+00
501	Adra Torrejon	Iordache Crina	X6502853 V	Torrejon De Ardoz	Madrid	642139285	2	2022-11-04 06:55:35.144002+00
502	Adra Torrejon	Consuelo Cervera	50770018W	Torrejon De Ardoz	Madrid	632770495	2	2022-11-04 06:55:35.156915+00
503	Adra Torrejon	Stanciulesc Pompiliu	X4105533D	Torrejon De Ardoz	Madrid	661046039	2	2022-11-04 06:55:35.169343+00
504	Adra Torrejon	Ebuka Cyprian Ikebude	A09092566	Torrejon De Ardoz	Madrid	641844581	2	2022-11-04 06:55:35.193145+00
505	Adra Torrejon	Daniela Laura Anuta	X5580373K	Torrejon De Ardoz	Madrid	642733930	2	2022-11-04 06:55:35.209587+00
506	Adra Torrejon	Siteavu Eugen	058746638	Torrejon De Ardoz	Madrid	642360530	2	2022-11-04 06:55:35.242847+00
507	Adra Torrejon	Stanciu Nicoleta	X2631464B	Torrejon De Ardoz	Madrid	642773429	2	2022-11-04 06:55:35.256485+00
508	Adra Torrejon	Hriscu Mihai	X6293062 D	Torrejon De Ardoz	Madrid	643032141	2	2022-11-04 06:55:35.268885+00
509	Adra Torrejon	Roman Ileana	X9143766B	Torrejon De Ardoz	Madrid	642083842	2	2022-11-04 06:55:35.292795+00
510	Adra Torrejon	Pacescu Florin	Xxxxxxx	Torrejon De Ardoz	Madrid	642804916	2	2022-11-04 06:55:35.342491+00
511	Adra Torrejon	Filiuta Mariana	X3492966W	Torrejon De Ardoz	Madrid	642104344	2	2022-11-04 06:55:35.354991+00
512	Adra Torrejon	Evelina Odica	X5130001N	Torrejon De Ardoz	Madrid	643941135	2	2022-11-04 06:55:35.378756+00
513	Adra Torrejon	Amalia Grigore	X5329228 J	Torrejon De Ardoz	Madrid	600695931	2	2022-11-04 06:55:35.411749+00
514	Adra Torrejon	Vasile Urse	X5507599L	Torrejon De Ardoz	Madrid	642550445	2	2022-11-04 06:55:35.445552+00
515	Adra Torrejon	Antemiuc Vasile	Xxxxxxx	Torrejon De Ardoz	Madrid	677347531	2	2022-11-04 06:55:35.469596+00
516	Adra Torrejon	Mustafá Benabdellah	X1357646W	Torrejon De Ardoz	Madrid	654209095	2	2022-11-04 06:55:35.482475+00
517	Adra Torrejon	Daniel Neacsu	X9078417H	Torrejon De Ardoz	Madrid	642756791	2	2022-11-04 06:55:35.546011+00
518	Adra Torrejon	Ionut Avram	X8503785H	Torrejon De Ardoz	Madrid	663307830	2	2022-11-04 06:55:35.593492+00
519	Adra Torrejon	Gheorghiță Danilencu	Y0235190 Y	Torrejon De Ardoz	Madrid	643603579	2	2022-11-04 06:55:35.636852+00
520	Adra Torrejon	Constantín Halit	X5667414F	Torrejon De Ardoz	Madrid	642560522	2	2022-11-04 06:55:35.691099+00
521	Adra Torrejon	Florin Gheorghe	X3149035 J	Torrejon De Ardoz	Madrid	649604554	2	2022-11-04 06:55:35.735224+00
522	Adra Torrejon	Felix Ivan Mejia Marder	F209697	Torrejon De Ardoz	Madrid	643251820	2	2022-11-04 06:55:35.779928+00
523	Adra Torrejon	Oscar Rayon Ramiro	47020040 J	Torrejon De Ardoz	Madrid	699730721	2	2022-11-04 06:55:35.836927+00
524	Adra Torrejon	Stan Mihaela	X4233391 B	Torrejon De Ardoz	Madrid	677487490	2	2022-11-04 06:55:35.891171+00
525	Adra Torrejon	Dinu Mihaela	Y1444824 R	Torrejon De Ardoz	Madrid	677641487	2	2022-11-04 06:55:35.913972+00
526	Adra Torrejon	Luis Jefry Jaramillo Marin	Xxxxxx	Torrejon De Ardoz	Madrid	602527488	2	2022-11-04 06:55:35.948628+00
527	Adra Torrejon	Esther Gonzales Rodriguez	Xxxxx	Torrejon De Ardoz	Madrid	655444684	2	2022-11-04 06:55:35.961775+00
528	Adra Torrejon	Tarnaru Dumitru	X9031596W	Torrejon De Ardoz	Madrid	686319374	2	2022-11-04 06:55:35.97546+00
529	Adra Torrejon	Emanuel Truica	TR648028	Torrejon De Ardoz	Madrid	642948056	2	2022-11-04 06:55:36.034074+00
530	Adra Torrejon	Alexandru Togoi	Y2282620 E	Torrejon De Ardoz	Madrid	642545572	2	2022-11-04 06:55:36.056786+00
531	Adra Torrejon	Steliana Vasui	X5526523 Z	Torrejon De Ardoz	Madrid	642406963	2	2022-11-04 06:55:36.09014+00
532	Adra Torrejon	Mohora Claudiu	X9335475 M	Torrejon De Ardoz	Madrid	642624364	2	2022-11-04 06:55:36.114164+00
533	Adra Torrejon	Ichim Adrian Cristian	X7124894T	Torrejon De Ardoz	Madrid	642470293	2	2022-11-04 06:55:36.168915+00
534	Adra Torrejon	Petrea Ecaterina Giorgiana	Y5530382	Torrejon De Ardoz	Madrid	642978027	2	2022-11-04 06:55:36.212291+00
535	Adra Torrejon	Acatrinei Constantin	X2999851F	Torrejon De Ardoz	Madrid	642036024	2	2022-11-04 06:55:36.235696+00
536	Adra Torrejon	Estera Violeta Ivascu	X4250589M	Torrejon De Ardoz	Madrid	671846310	2	2022-11-04 06:55:36.281067+00
537	Adra Torrejon	Marius Sandel Stan	Y6243838L	Torrejon De Ardoz	Madrid	643456681	2	2022-11-04 06:55:36.31403+00
538	Adra Torrejon	Munteanu Gabriel Corneliu	Y0741107S	Torrejon De Ardoz	Madrid	642028132	2	2022-11-04 06:55:36.337763+00
539	Adra Torrejon	Ana Maria Badea	Y1646902R	Torrejon De Ardoz	Madrid	643257756	2	2022-11-04 06:55:36.374367+00
540	Adra Torrejon	Ion Emilia Rebeca	X9217888V	Torrejon De Ardoz	Madrid	663385428	2	2022-11-04 06:55:36.419678+00
541	Adra Torrejon	Talea Valentin	X5610972F	Torrejon De Ardoz	Madrid	665860057	2	2022-11-04 06:55:36.435957+00
542	Adra Torrejon	Cati Lucian	x8731368q	Torrejon De Ardoz	Madrid	604150313	2	2022-11-04 06:55:36.480955+00
543	Adra Torrejon	Hafsa khalifa	ds1452094	Torrejon De Ardoz	Madrid	631553825	2	2022-11-04 06:55:36.515558+00
544	Adra Torrejon	Aziza el gouad	x4651607h	Torrejon De Ardoz	Madrid	633648197	2	2022-11-04 06:55:36.568569+00
545	Adra Torrejon	Soumaya ouahabi chriaa	48226864g	Torrejon De Ardoz	Madrid	685191634	2	2022-11-04 06:55:36.592299+00
546	Adra Torrejon	Naima   Sabbahi	x7805179z	Torrejon De Ardoz	Madrid	664196720	2	2022-11-04 06:55:36.637079+00
547	Adra Torrejon	Karima bourfaa	X6323867v	Torrejon De Ardoz	Madrid	602847644	2	2022-11-04 06:55:36.69233+00
548	Adra Torrejon	Said el bakri	X1319087z	Torrejon De Ardoz	Madrid	602514392	2	2022-11-04 06:55:36.72642+00
549	Adra Torrejon	Fatima zouhra essabar oulad hahamouch	09145398t	Torrejon De Ardoz	Madrid	632721248	2	2022-11-04 06:55:36.740625+00
550	Adra Torrejon	Bakouk Hadhoum	x6040298s	Torrejon De Ardoz	Madrid	608704362	2	2022-11-04 06:55:36.77494+00
551	Adra Torrejon	Do Nacimiento machado Jose	76901658p	Torrejon De Ardoz	Madrid	692007981	2	2022-11-04 06:55:36.798926+00
552	Adra Torrejon	Lydia Abena Yeboaa	G1358473	Torrejon De Ardoz	Madrid	642054472	2	2022-11-04 06:55:36.811798+00
553	Adra Torrejon	Hinta Jenica	x6481964n	Torrejon De Ardoz	Madrid	642749056	2	2022-11-04 06:55:36.826669+00
554	Adra Torrejon	goncalves silva lourdes prazeres	53439490W	Torrejon De Ardoz	Madrid	606889740	2	2022-11-04 06:55:36.849866+00
555	Adra Torrejon	malika el mansouri	x2540300l	Torrejon De Ardoz	Madrid	631328219	2	2022-11-04 06:55:36.883234+00
556	Adra Torrejon	ALAMALNI JAMILA	X6294706C	Torrejon De Ardoz	Madrid	631629522	2	2022-11-04 06:55:36.938232+00
557	Adra Torrejon	Iermina	X5678976X	Torrejon De Ardoz	Madrid	642720402	2	2022-11-04 06:55:37.022452+00
558	Adra Torrejon	DORA MERCEDES DE LA CRUZ BENUI	116517544	Torrejon De Ardoz	Madrid	640603771	2	2022-11-04 06:55:37.047981+00
559	Adra Torrejon	Zambrano Roa Andy Osmel	Y6879029l	Torrejon De Ardoz	Madrid	631752943	2	2022-11-04 06:55:37.061277+00
560	Adra Torrejon	El abrouj faiza	Y3457153z	Torrejon De Ardoz	Madrid	662422707	2	2022-11-04 06:55:37.106911+00
561	Adra Torrejon	Ana Agustina Zambrano Roa	126274794	Torrejon De Ardoz	Madrid	77777777	2	2022-11-04 06:55:37.164667+00
562	Adra Torrejon	El ezz fadoua	Tr8525175	Torrejon De Ardoz	Madrid	653099931	2	2022-11-04 06:55:37.177818+00
564	Adra Arganda	Lakchouch Bensaid Bouchra	51014424x	Arganda del Rey	Madrid	632147874	1	2022-11-04 20:41:40.06165+00
565	Adra Arganda	Fernandez Mendoza Ricardo	00263121 R	Arganda del Rey	Madrid	656648797	1	2022-11-04 21:03:12.788303+00
566	Adra Arganda	Curcan Maria	x5461419T	Arganda del Rey	Madrid	636277742	1	2022-11-04 21:11:50.078782+00
567	Adra Arganda	Lubna Fouzi Al Ghazali	y6943024M	Arganda del Rey	Madrid	643941084	1	2022-11-05 09:33:35.93581+00
568	Adra Arganda	Safia Hassani El Mhamdi	X7530651 Z	Arganda del Rey	Madrid	602078629	1	2022-11-05 09:49:52.491504+00
569	Adra Arganda	Mohammed Hassani	TP 3606364	Arganda del Rey	Madrid	641633082	1	2022-11-05 10:01:36.403334+00
570	Adra Arganda	Fernandez Vazquez Ricardo	070061198	Arganda del Rey	Madrid	610993710	1	2022-11-05 10:04:47.411208+00
571	Adra Arganda	Gonzalez Gonzalez Maria	004206640 D	Arganda del Rey	Madrid	643954610	1	2022-11-05 10:19:59.163535+00
572	Adra Arganda	Remedios Heredia Gonzalez	70081253T	Arganda del Rey	Madrid	603604971	1	2022-11-07 19:44:44.1472+00
573	Adra Arganda	Said El Mankoury El Khiari	02352494P	Arganda del Rey	Madrid	634923351	1	2022-11-09 19:17:31.035847+00
574	Adra Arganda	Ahmed Dahbi	x7793653B	Arganda del Rey	Madrid	606548498	1	2022-11-09 19:25:12.773243+00
575	Adra Arganda	Dehak Ep Echatbi Bouchra	y0657104P	Arganda del Rey	Madrid	685200467	1	2022-11-09 19:31:57.438936+00
576	Adra Arganda	Aziza Zine	x4604821Z	Arganda del Rey	Madrid	671826257	1	2022-11-09 19:34:07.677288+00
577	Adra Arganda	Navarro Cruz Samara	051558717P	Arganda del Rey	Madrid	611158988	1	2022-11-09 19:44:33.425221+00
578	Adra Arganda	Lozano Jimenez Soledad	012339654Q	Arganda del Rey	Madrid	605426016	1	2022-11-09 19:52:37.130645+00
579	Adra Arganda	Halima Debdi	x90115660 M	Arganda del Rey	Madrid	631062619	1	2022-11-09 19:58:50.102746+00
580	Adra Arganda	Maria Liliana Durango	AT990816	Arganda del Rey	Madrid	693928989	1	2022-11-09 20:43:36.139925+00
581	Adra Arganda	Anissa Hadouchene	648228542A	Arganda del Rey	Madrid	631653771	1	2022-11-10 12:38:56.456627+00
582	Adra Arganda	Pilar Silva Vargas	070079834F	Arganda del Rey	Madrid	688328929	1	2022-11-10 12:42:36.931409+00
583	Adra Arganda	Huelves Josefa	00353043Q	Arganda del Rey	Madrid	643981018	1	2022-11-10 13:05:45.840118+00
584	Adra Arganda	Garcia Pacheco Susana	051932774Q	Arganda del Rey	Madrid	633216882	1	2022-11-10 13:12:08.191667+00
585	Adra Arganda	Maria Muñoz Muñoz	050983391 E	Arganda del Rey	Madrid	611143545	1	2022-11-10 13:19:57.788474+00
586	Adra Arganda	Fernandez Vazquez Rafael	051943638R	Arganda del Rey	Madrid	651121751	1	2022-11-10 19:40:35.134332+00
587	Adra Arganda	Abdeljaouad Serrouk	x6450356y	Arganda del Rey	Madrid	602878016	1	2022-11-10 19:46:24.700177+00
588	Adra Arganda	Ascension Fernandez Vazquez	070061197T	Arganda del Rey	Madrid	660833054	1	2022-11-10 19:52:26.707969+00
589	Adra Arganda	Muñoz Garcia Juaquin	70065846A	Arganda del Rey	Madrid	642551879	1	2022-11-10 20:01:27.272991+00
590	Adra Arganda	Jamila Naji	x7413163X	Arganda del Rey	Madrid	642519378	1	2022-11-10 20:05:59.990984+00
591	Adra Arganda	Abdeslam Mejjaqui	538003550	Arganda del Rey	Madrid	602338229	1	2022-11-10 20:17:48.584024+00
592	Adra Arganda	Karima Hitach	x7212499k	Arganda del Rey	Madrid	612508524	1	2022-11-10 20:22:23.687791+00
593	Adra Arganda	Mohammed Azzouz	X2699358D	Arganda del Rey	Madrid	600017138	1	2022-11-10 20:33:38.330639+00
594	Adra Arganda	Y esenia Frias Victoriano	x9848460K	Arganda del Rey	Madrid	663428033	1	2022-11-10 20:46:48.554068+00
595	Adra Arganda	Zulay Maria Benitez	Y3689582M	Arganda del Rey	Madrid	631009715	1	2022-11-10 21:02:18.021299+00
596	Adra Arganda	Nicoleta Curcan	02352607y	Arganda del Rey	Madrid	649002292	1	2022-11-11 18:06:39.227821+00
597	Adra Arganda	Jamila Makhchan	x7715564F	Arganda del Rey	Madrid	663530495	1	2022-11-11 18:13:41.076273+00
598	Adra Arganda	Moises Gonzalez Gonzalez	03981775N	Arganda del Rey	Madrid	643358683	1	2022-11-11 18:19:45.691669+00
599	Adra Arganda	Valentina Valer Csavlovits	y0574716 y	Arganda del Rey	Madrid	662424429	1	2022-11-11 18:28:27.354344+00
600	Adra Arganda	Mirta Iris Rojas	y153933D	Arganda del Rey	Madrid	686207473	1	2022-11-11 18:38:53.573358+00
601	Adra Arganda	Curcan Corina	x5103215k	Arganda del Rey	Madrid	630754208	1	2022-11-11 18:44:54.741315+00
602	Adra Arganda	Ana Cecilia Julca Tirado	118465638	Arganda del Rey	Madrid	603161417	1	2022-11-11 18:52:01.112391+00
603	Adra Arganda	Simona Petruta Cojocea	643516970	Arganda del Rey	Madrid	643516970	1	2022-11-12 14:10:04.632391+00
604	Adra Arganda	David Lester Rojas	119062724	Arganda del Rey	Madrid	697737790	1	2022-11-12 14:19:47.951752+00
605	Adra Arganda	Maria del Carmen Iglesia Gonzalez	51511109X	Arganda del Rey	Madrid	643660603	1	2022-11-12 14:28:08.797352+00
606	Adra Arganda	Luz Marina Velazquez Suarez	y7567151G	Arganda del Rey	Madrid	684304927	1	2022-11-12 14:34:09.511164+00
607	Adra Arganda	Badiu Adriana Raluca	y3883416H	Arganda del Rey	Madrid	642688312	1	2022-11-12 14:38:59.557357+00
608	Adra Arganda	Farcas Iosif	x6689184W	Arganda del Rey	Madrid	634032845	1	2022-11-12 14:46:38.764865+00
609	Adra Arganda	Josefina Romero Feliz	Y3419403K	Arganda del Rey	Madrid	665385582	1	2022-11-12 14:50:15.075778+00
610	Adra Arganda	Khadija Jaki Bahij	02338179E	Arganda del Rey	Madrid	605418952	1	2022-11-12 14:53:06.600372+00
611	Adra Arganda	Rogelio Gaspar Lugo	y7338638L	Arganda del Rey	Madrid	603252400	1	2022-11-12 14:58:54.017152+00
612	Adra Arganda	Halima Grat	x3890971 S	Arganda del Rey	Madrid	679326535	1	2022-11-12 15:01:01.390439+00
613	Adra Arganda	Mahdi Jabir	Y6250476X	Arganda del Rey	Madrid	643091723	1	2022-11-12 15:04:24.7073+00
614	Adra Arganda	Fatima Karim Touil	70066808E	Arganda del Rey	Madrid	642353697	1	2022-11-12 15:06:58.614675+00
615	Adra Arganda	Batbouti Zahra	X7492089T	Arganda del Rey	Madrid	677259111	1	2022-11-12 15:12:03.153817+00
616	Adra Arganda	Lorena Sosa	X5617294G	Arganda del Rey	Madrid	632763573	1	2022-11-13 19:27:05.436798+00
617	Adra Arganda	Nisrin Gbalou	x606047C	Arganda del Rey	Madrid	637154891	1	2022-11-13 19:32:52.781038+00
618	Adra Arganda	Joselin Rocio Reina	x9418772L	Arganda del Rey	Madrid	685567150	1	2022-11-13 19:45:28.874119+00
619	Adra Arganda	Monica Carmen Matasaru	x9279835W	Arganda del Rey	Madrid	642259611	1	2022-11-14 20:12:23.095481+00
620	Adra Arganda	Omar El Yaacoubi Tahiri Sanae	002324290W	Arganda del Rey	Madrid	631010957	1	2022-11-14 20:16:37.04306+00
621	Adra Arganda	Abdellatif Mallem	x3842405W	Arganda del Rey	Madrid	632508838	1	2022-11-14 20:23:38.26835+00
622	Adra Arganda	Abdeslam Serroukh	x4178842H	Arganda del Rey	Madrid	632731956	1	2022-11-14 20:32:13.22179+00
623	Adra Arganda	Nabila El Ahmadi	XD4379039	Arganda del Rey	Madrid	632224435	1	2022-11-15 15:29:41.126467+00
624	Adra Arganda	Rahma Hichou Bajali	002304339S	Arganda del Rey	Madrid	643837701	1	2022-11-15 15:37:36.962113+00
625	Adra Arganda	Guerrero Gautier Diego	50842631G	Arganda del Rey	Madrid	722539492	1	2022-11-15 15:39:32.765914+00
626	Adra Arganda	Petre Nicoleta	Y1525111H	Arganda del Rey	Madrid	666724862	1	2022-11-15 15:42:08.65506+00
627	Adra Arganda	Alyousif Fatimah	Y7441418N	Arganda del Rey	Madrid	631735783	1	2022-11-15 15:47:17.625165+00
628	Adra Arganda	Ion Neacsu	x1826381C	Arganda del Rey	Madrid	685499106	1	2022-11-15 15:51:52.009265+00
629	Adra Arganda	Fanny Rocio Sangucho Oña	1725474066	Arganda del Rey	Madrid	722323611	1	2022-11-15 15:57:25.607274+00
630	Adra Arganda	Salinas Ortiz Almudena	46880216y	Arganda del Rey	Madrid	642704738	1	2022-11-15 16:32:23.594384+00
631	Adra Arganda	Loubna El Faik Dadouche	002352691K	Arganda del Rey	Madrid	631282020	1	2022-11-15 16:37:18.537599+00
632	Adra Arganda	Paredes Mizaico Elizabeth	054268106	Arganda del Rey	Madrid	675839704	1	2022-11-16 14:30:01.547031+00
633	Adra Arganda	Russo Blanco Rafael  Antonio	Y6792633B	Arganda del Rey	Madrid	602625414	1	2022-11-16 14:35:43.772934+00
634	Adra Arganda	Miguel De La Vela	05391394X	Arganda del Rey	Madrid	683427663	1	2022-11-16 14:37:59.679488+00
635	Adra Arganda	Bushra Sameer Altaleb	Y 7032916J	Arganda del Rey	Madrid	672773958	1	2022-11-16 14:43:48.487285+00
636	Adra Arganda	Jaris Aliht Tarragona Pareja	05978952X	Arganda del Rey	Madrid	628265773	1	2022-11-16 16:23:50.193889+00
637	Adra Arganda	Ana Maria Reghin Lupan	x7694764E	Arganda del Rey	Madrid	642490531	1	2022-11-16 16:30:58.141917+00
638	Adra Arganda	Ilie Steblea Gabriela	X09202377P	Arganda del Rey	Madrid	638250828	1	2022-11-16 16:35:16.633842+00
639	Adra Arganda	Noelia Francisca	Y4291945K	Arganda del Rey	Madrid	632729723	1	2022-11-16 16:38:09.600715+00
640	Adra Arganda	Maria Lamrabet	Y 4410339B	Arganda del Rey	Madrid	627118623	1	2022-11-16 16:43:48.59465+00
641	Adra Arganda	Angulo Romero Marta	121912251	Arganda del Rey	Madrid	642574334	1	2022-11-16 16:58:58.062387+00
642	Adra Arganda	Ronal Canaviri Marca	x8823009W	Arganda del Rey	Madrid	631211287	1	2022-11-16 17:16:34.869475+00
643	Adra Arganda	Onofrei Mirela	X03491841G	Arganda del Rey	Madrid	642350174	1	2022-11-16 17:22:44.633444+00
644	Adra Arganda	Farida Hadi El Ghazbzouri	45306818S	Arganda del Rey	Madrid	641274387	1	2022-11-16 17:26:24.396265+00
645	Adra Arganda	Idram Choaib Lhassan	55296414K	Arganda del Rey	Madrid	660676711	1	2022-11-16 17:28:41.59703+00
646	Adra Arganda	Achraf Benseddik	Y7606301Q	Arganda del Rey	Madrid	623235914	1	2022-11-16 17:30:23.232756+00
647	Adra Arganda	Zeballos Rodriquez David	49962685S	Arganda del Rey	Madrid	692494174	1	2022-11-16 20:28:54.953448+00
648	Adra Arganda	Mcaouri Kanchil Fatima	x6651677P	Arganda del Rey	Madrid	603159512	1	2022-11-16 20:34:12.914041+00
649	Adra Arganda	Jeanneth Alexandra Cuzco Paste	51788632S	Arganda del Rey	Madrid	697563112	1	2022-11-16 20:46:53.907246+00
650	Adra Arganda	Zahrae Fatima El Ahmadi	Y0350710C	Arganda del Rey	Madrid	632814772	1	2022-11-16 20:53:26.719369+00
651	Adra Arganda	Russi Alvaro de Jesus	Y137949855	Arganda del Rey	Madrid	612503399	1	2022-11-16 21:04:37.419299+00
652	Adra Arganda	Islam Moqaddem Khlifa	002353854B	Arganda del Rey	Madrid	642518663	1	2022-11-17 21:06:48.559245+00
653	Adra Arganda	Colorado Mosquera Eliana Janeth	X8609746H	Arganda del Rey	Madrid	654515628	1	2022-11-17 21:17:11.284432+00
654	Adra Arganda	Damaris Feliz Ramírez	003239058Z	Arganda del Rey	Madrid	606032181	1	2022-11-17 21:28:18.388368+00
655	Adra Arganda	El Mesrare Abdel Ilah	UW5202587	Arganda del Rey	Madrid	643794103	1	2022-11-17 21:35:57.245576+00
656	Adra Arganda	Amerzguiou AchahbareJamal	050370640L	Arganda del Rey	Madrid	676188507	1	2022-11-17 21:41:14.276823+00
657	Adra Arganda	Bibi Afzal Mohammad	054934697W	Arganda del Rey	Madrid	623344002	1	2022-11-18 18:08:21.574749+00
658	Adra Arganda	Hitach El Kanar Rahma	02324824F	Arganda del Rey	Madrid	602011971	1	2022-11-18 18:19:35.785203+00
659	Adra Arganda	Bayari Fatima Ezzahra	X7121620S	Arganda del Rey	Madrid	662175809	1	2022-11-18 18:30:45.705001+00
660	Adra Arganda	Monica Garcia Jara	052890769S	Arganda del Rey	Madrid	665525230	1	2022-11-18 18:46:00.259492+00
661	Adra Arganda	Saidi Zakia	X8607800G	Arganda del Rey	Madrid	678251886	1	2022-11-18 18:56:01.117767+00
662	Adra Arganda	El Hraquel Mohamed	JN2616970	Arganda del Rey	Madrid	632815886	1	2022-11-18 19:07:20.816202+00
663	Adra Arganda	Jimenez Rausseo Jaynnap del Valle	Y9000698F	Arganda del Rey	Madrid	28500	1	2022-11-18 19:11:00.693616+00
664	Adra Arganda	Rosmar Lisette Alvarado del Zamora	091226716	Arganda del Rey	Madrid	641316035	1	2022-11-18 19:18:41.080376+00
665	Adra Arganda	Salas Saldaña Norma Lorena	X6389688N	Arganda del Rey	Madrid	640909714	1	2022-11-18 19:26:03.56579+00
666	Adra Arganda	Salem Mabrouka	X4354848M	Arganda del Rey	Madrid	631547841	1	2022-11-18 19:33:52.192653+00
667	Adra Arganda	Gurmouh Yahya	XM0265347	Arganda del Rey	Madrid	612567972	1	2022-11-18 19:36:36.301228+00
668	Adra Arganda	Sosa Cortez Alfonsina Antonia	1613226074	Arganda del Rey	Madrid	611519756	1	2022-11-18 19:41:31.049183+00
669	Adra Arganda	Alvarado Touar Haydee Josefina	162316476	Arganda del Rey	Madrid	0	1	2022-11-18 19:44:48.619059+00
670	Adra Arganda	Chram  Youssef	DQ78697215	Arganda del Rey	Madrid	625409803	1	2022-11-18 19:48:06.295508+00
671	Adra Arganda	Mohamed Aynaou	Y8482776E	Arganda del Rey	Madrid	672510786	1	2022-11-18 19:50:13.937895+00
672	Adra Arganda	Andres Mnuel Escalona Madrid	Y9266397X	Arganda del Rey	Madrid	643909572	1	2022-11-18 19:53:30.278139+00
673	Adra Arganda	Paula Andrea Lopez	x3314065H	Arganda del Rey	Madrid	641633148	1	2022-11-18 20:00:37.039398+00
674	Adra Arganda	Juan Carlos Caldas Estrada	120377424	Arganda del Rey	Madrid	0	1	2022-11-18 20:07:35.14126+00
675	Adra Arganda	Aynaou Salahaddine	FI1570765	Arganda del Rey	Madrid	631815211	1	2022-11-18 20:09:30.981038+00
676	Adra Arganda	Zohra Bout	X9204049R	Arganda del Rey	Madrid	632934759	1	2022-11-18 20:11:49.027039+00
677	Adra Arganda	Jimenez Goñe Alexis	120719084	Arganda del Rey	Madrid	624080497	1	2022-11-19 09:01:54.833639+00
678	Adra Arganda	Boulercha Amel	DY8049597	Arganda del Rey	Madrid	643120216	1	2022-11-19 09:08:35.508098+00
679	Adra Arganda	Touhou Najat	Y8566516L	Arganda del Rey	Madrid	643829823	1	2022-11-19 09:15:48.163008+00
680	Adra Arganda	Costales Ramos Veronica	Y7691306M	Arganda del Rey	Madrid	602462414	1	2022-11-19 09:19:47.522376+00
681	Adra Arganda	Melissa Yanire Noriega Guevara	120681596	Arganda del Rey	Madrid	642685126	1	2022-11-19 09:23:19.134082+00
683	Adra Arganda	Rosmery Elizabeth	208524940	Arganda del Rey	Madrid	642368685	1	2022-11-19 09:38:12.794245+00
684	Adra Torrejon	Blade amadou	X3996484g	Torrejon De Ardoz	Madrid	632355778	2	2022-11-20 09:14:20.015618+00
685	Adra Torrejon	Eugenia Paraniuc	058286450	Torrejon De Ardoz	Madrid	697590845	2	2022-11-20 10:16:07.405666+00
686	Adra Torrejon	Constantin Daniel	MM666312	Torrejon De Ardoz	Madrid	642904294	2	2022-11-20 11:02:16.351363+00
687	Adra Arganda	Yamina Kawache	BH2037190	Arganda del Rey	Madrid	0	1	2022-11-30 17:32:36.47567+00
688	Adra Arganda	Lorena Jimenez Gonzalez	..................	Arganda del Rey	Madrid	643493295	1	2022-11-30 17:44:10.066839+00
689	Adra Arganda	Garcia Garcia Banesa	050989215D	Arganda del Rey	Madrid	680647520	1	2022-11-30 17:49:35.540873+00
690	Adra Arganda	Ahinoa Fernandez Garcia	06007400F	Arganda del Rey	Madrid	643092355	1	2022-11-30 17:57:14.595422+00
691	Adra Arganda	Eugenio William Gonzalez Aragon	120651040	Arganda del Rey	Madrid	633211815	1	2022-12-05 11:02:17.489985+00
692	Adra Arganda	Zahia Chari	x9705286E	Arganda del Rey	Madrid	722489477	1	2022-12-05 12:19:17.661069+00
682	Adra Arganda	Miquel Angel Rojas Rojas	122039497	Arganda del Rey	Madrid	643299709	1	2022-11-19 09:31:58.744521+00
694	Adra Arganda	Fernandez Garcia Llanira	51010600G	Arganda del Rey	Madrid	624841977	1	2022-12-05 14:32:08.756062+00
695	Adra Arganda	Alonso Johnson Tocasca	120596045	Arganda del Rey	Madrid	641933958	1	2022-12-16 18:16:44.176544+00
696	Adra Arganda	Jose Manuel Heredia	070053799P	Arganda del Rey	Madrid	600018931	1	2022-12-16 18:21:24.155283+00
697	Adra Arganda	Jenifer Iglesia Gonzalez	052019578H	Arganda del Rey	Madrid	674950765	1	2022-12-16 18:44:30.903001+00
698	Adra Arganda	Carolina Matuto	x8281141Z	Arganda del Rey	Madrid	623284146	1	2022-12-16 18:49:58.024305+00
699	Adra Arganda	Maria Laaouej Bouferma	02352277K	Arganda del Rey	Madrid	632238077	1	2022-12-16 18:58:14.595007+00
700	Adra Arganda	Toloza Carabali Luz Elvira	AW742857	Arganda del Rey	Madrid	624103106	1	2022-12-16 19:12:39.73551+00
701	Adra Arganda	Mhamdi El Miloud	CJ6264653	Arganda del Rey	Madrid	111	1	2022-12-16 19:19:42.160547+00
702	Adra Arganda	Khlifa Houria	SA12800973	Arganda del Rey	Madrid	603510038	1	2022-12-16 19:24:20.603346+00
703	Adra Arganda	Arcenia Pacheco Aguirre	120029539	Arganda del Rey	Madrid	645406513	1	2022-12-16 19:28:25.011471+00
693	Adra Arganda	Marcos Rios	165628459	Arganda del Rey	Madrid	603023608	1	2022-12-05 14:24:00.815853+00
704	Adra Torrejon	Asavei Dina Tatiana	Y7561169	Torrejon De Ardoz	Madrid	7777777	2	2022-12-18 07:56:23.781621+00
705	Adra Torrejon	Badea Ana Maria	Y1646902 R	Torrejon De Ardoz	Madrid	777777	2	2022-12-18 08:31:13.09672+00
706	Adra Torrejon	Ion Bogdan	GZ 717035	Torrejon De Ardoz	Madrid	56555555	2	2022-12-18 08:58:05.729584+00
351	Adra Torrejon	SOUMIA MASROURI	Y0280496-W	Torrejon De Ardoz	Madrid	673295142	2	2022-11-04 06:55:28.677226+00
707	Adra Torrejon	Milagros del Carmen	118095926	Torrejon De Ardoz	Madrid	640603770	2	2022-12-18 10:11:56.527895+00
708	Adra Torrejon	Rojas Raymundo Lucero	122289140	Torrejon De Ardoz	Madrid	111111122	2	2022-12-18 10:44:18.206279+00
\.


--
-- Data for Name: delegaciones_delegaciones; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.delegaciones_delegaciones (id, schema_name, nombre, code, codigo_postal, ciudad, provincia, telegram_code, created_at, calle, oar) FROM stdin;
1	public	General	0	45200	illescas	toledo	0	2022-11-02 03:34:10.132451+00	sin numero	General
2	tenant-arganda	Madrid-Arganda	1	28500	Arganda del Rey	Madrid	0	2022-11-02 03:39:11.204122+00	Calle Maestro  Chicote 7	Adra Arganda
3	tenant-torrejon	Madrid Torrejon	2	28850	Torrejon De Ardoz	Madrid	0	2022-11-03 05:21:42.69332+00	C/ Primavera 15	Adra Torrejon
\.


--
-- Data for Name: delegaciones_domain; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.delegaciones_domain (id, domain, is_primary, tenant_id) FROM stdin;
1	repartoalimentos.com	t	1
2	madrid-arganda.repartoalimentos.com	t	2
3	madrid-torrejon.repartoalimentos.com	t	3
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-11-02 03:39:13.45675+00	2	Madrid-Arganda	1	[{"added": {}}, {"added": {"name": "domain", "object": "madrid-arganda.repartoalimentos.com"}}]	1	1
2	2022-11-02 04:01:12.297315+00	1	General	2	[{"changed": {"fields": ["Nombre", "Oar"]}}]	1	1
3	2022-11-03 05:21:44.515353+00	3	Madrid Torrejon	1	[{"added": {}}, {"added": {"name": "domain", "object": "madrid-torrejon.repartoalimentos.com"}}]	1	1
4	2022-11-04 06:11:12.651258+00	3	Madrid Torrejon	2	[{"changed": {"fields": ["Code"]}}]	1	1
5	2022-11-04 06:54:50.438869+00	339	El ezz fadoua	3		3	1
6	2022-11-04 06:54:50.443346+00	338	Ana Agustina Zambrano Roa	3		3	1
7	2022-11-04 06:54:50.447153+00	337	El abrouj faiza	3		3	1
8	2022-11-04 06:54:50.450734+00	336	Zambrano Roa Andy Osmel	3		3	1
9	2022-11-04 06:54:50.454536+00	335	DORA MERCEDES DE LA CRUZ BENUI	3		3	1
10	2022-11-04 06:54:50.458297+00	334	Iermina	3		3	1
11	2022-11-04 06:54:50.461832+00	333	ALAMALNI JAMILA	3		3	1
12	2022-11-04 06:54:50.465304+00	332	malika el mansouri	3		3	1
13	2022-11-04 06:54:50.469053+00	331	goncalves silva lourdes prazeres	3		3	1
14	2022-11-04 06:54:50.472711+00	330	Hinta Jenica	3		3	1
15	2022-11-04 06:54:50.476211+00	329	Lydia Abena Yeboaa	3		3	1
16	2022-11-04 06:54:50.479796+00	328	Do Nacimiento machado Jose	3		3	1
17	2022-11-04 06:54:50.483336+00	327	Bakouk Hadhoum	3		3	1
18	2022-11-04 06:54:50.48685+00	326	Fatima zouhra essabar oulad hahamouch	3		3	1
19	2022-11-04 06:54:50.49035+00	325	Said el bakri	3		3	1
20	2022-11-04 06:54:50.494071+00	324	Karima bourfaa	3		3	1
21	2022-11-04 06:54:50.501395+00	323	Naima   Sabbahi	3		3	1
22	2022-11-04 06:54:50.505566+00	322	Soumaya ouahabi chriaa	3		3	1
23	2022-11-04 06:54:50.509225+00	321	Aziza el gouad	3		3	1
24	2022-11-04 06:54:50.512895+00	320	Hafsa khalifa	3		3	1
25	2022-11-04 06:54:50.516347+00	319	Cati Lucian	3		3	1
26	2022-11-04 06:54:50.520016+00	318	Talea Valentin	3		3	1
27	2022-11-04 06:54:50.52397+00	317	Ion Emilia Rebeca	3		3	1
28	2022-11-04 06:54:50.5276+00	316	Ana Maria Badea	3		3	1
29	2022-11-04 06:54:50.531058+00	315	Munteanu Gabriel Corneliu	3		3	1
30	2022-11-04 06:54:50.534663+00	314	Marius Sandel Stan	3		3	1
31	2022-11-04 06:54:50.538074+00	313	Estera Violeta Ivascu	3		3	1
32	2022-11-04 06:54:50.541817+00	312	Acatrinei Constantin	3		3	1
33	2022-11-04 06:54:50.545401+00	311	Petrea Ecaterina Giorgiana	3		3	1
34	2022-11-04 06:54:50.548888+00	310	Ichim Adrian Cristian	3		3	1
35	2022-11-04 06:54:50.552873+00	309	Mohora Claudiu	3		3	1
36	2022-11-04 06:54:50.556357+00	308	Steliana Vasui	3		3	1
37	2022-11-04 06:54:50.559872+00	307	Alexandru Togoi	3		3	1
38	2022-11-04 06:54:50.563476+00	306	Emanuel Truica	3		3	1
39	2022-11-04 06:54:50.566987+00	305	Tarnaru Dumitru	3		3	1
40	2022-11-04 06:54:50.570497+00	304	Esther Gonzales Rodriguez	3		3	1
41	2022-11-04 06:54:50.574002+00	303	Luis Jefry Jaramillo Marin	3		3	1
42	2022-11-04 06:54:50.577491+00	302	Dinu Mihaela	3		3	1
43	2022-11-04 06:54:50.580935+00	301	Stan Mihaela	3		3	1
44	2022-11-04 06:54:50.584523+00	300	Oscar Rayon Ramiro	3		3	1
45	2022-11-04 06:54:50.588136+00	299	Felix Ivan Mejia Marder	3		3	1
46	2022-11-04 06:54:50.595013+00	298	Florin Gheorghe	3		3	1
47	2022-11-04 06:54:50.598534+00	297	Constantín Halit	3		3	1
48	2022-11-04 06:54:50.602041+00	296	Gheorghiță Danilencu	3		3	1
49	2022-11-04 06:54:50.605467+00	295	Ionut Avram	3		3	1
50	2022-11-04 06:54:50.608823+00	294	Daniel Neacsu	3		3	1
51	2022-11-04 06:54:50.612565+00	293	Mustafá Benabdellah	3		3	1
52	2022-11-04 06:54:50.616081+00	292	Antemiuc Vasile	3		3	1
53	2022-11-04 06:54:50.623538+00	291	Vasile Urse	3		3	1
54	2022-11-04 06:54:50.627212+00	290	Amalia Grigore	3		3	1
55	2022-11-04 06:54:50.630789+00	289	Evelina Odica	3		3	1
56	2022-11-04 06:54:50.634486+00	288	Filiuta Mariana	3		3	1
57	2022-11-04 06:54:50.638674+00	287	Pacescu Florin	3		3	1
58	2022-11-04 06:54:50.642284+00	286	Roman Ileana	3		3	1
59	2022-11-04 06:54:50.64574+00	285	Hriscu Mihai	3		3	1
60	2022-11-04 06:54:50.649115+00	284	Stanciu Nicoleta	3		3	1
61	2022-11-04 06:54:50.652922+00	283	Siteavu Eugen	3		3	1
62	2022-11-04 06:54:50.656366+00	282	Daniela Laura Anuta	3		3	1
63	2022-11-04 06:54:50.659906+00	281	Ebuka Cyprian Ikebude	3		3	1
64	2022-11-04 06:54:50.663295+00	280	Stanciulesc Pompiliu	3		3	1
65	2022-11-04 06:54:50.66664+00	279	Consuelo Cervera	3		3	1
66	2022-11-04 06:54:50.670094+00	278	Iordache Crina	3		3	1
67	2022-11-04 06:54:50.67335+00	277	Cimpoeru Cornelia	3		3	1
68	2022-11-04 06:54:50.676659+00	276	Rotaru Elena	3		3	1
69	2022-11-04 06:54:50.68005+00	275	Renata Da Silva Colmero	3		3	1
70	2022-11-04 06:54:50.683372+00	274	Constanța Costoiu	3		3	1
71	2022-11-04 06:54:50.686837+00	273	Larisa Ribca	3		3	1
72	2022-11-04 06:54:50.69042+00	272	Nechifor Mihaita	3		3	1
73	2022-11-04 06:54:50.693784+00	271	Dincă Doina	3		3	1
74	2022-11-04 06:54:50.697294+00	270	Matei Ionez	3		3	1
75	2022-11-04 06:54:50.70123+00	269	Doinita Paraschiva Olar	3		3	1
76	2022-11-04 06:54:50.704599+00	268	Mario Rodrigo Yapo Maila	3		3	1
77	2022-11-04 06:54:50.708024+00	267	Javier Argumenez Patiñio	3		3	1
78	2022-11-04 06:54:50.711579+00	266	Munteanu Letiția	3		3	1
79	2022-11-04 06:54:50.714974+00	265	Dumitrean Iosif	3		3	1
80	2022-11-04 06:54:50.718311+00	264	Strătilă Alin	3		3	1
81	2022-11-04 06:54:50.721764+00	263	Turcios Cruz Josue Ariel	3		3	1
82	2022-11-04 06:54:50.725067+00	262	Rece Ion	3		3	1
83	2022-11-04 06:54:50.728521+00	261	Stoica Tudor	3		3	1
84	2022-11-04 06:54:50.731742+00	260	Steliana Dobre	3		3	1
85	2022-11-04 06:54:50.735009+00	259	Cati Eugenia	3		3	1
86	2022-11-04 06:54:50.738563+00	258	Munteanu Albert Octavian	3		3	1
87	2022-11-04 06:54:50.741816+00	257	Radoi Grigorita	3		3	1
88	2022-11-04 06:54:50.745134+00	256	Simona Dobrin	3		3	1
89	2022-11-04 06:54:50.74881+00	255	Constantin Viorel Florin	3		3	1
90	2022-11-04 06:54:50.752167+00	254	Petruta Sareanu	3		3	1
91	2022-11-04 06:54:50.759348+00	253	Tipanluisa Mata Freddy	3		3	1
92	2022-11-04 06:54:50.762806+00	252	Garcia Ruiz Wilson Vicente	3		3	1
93	2022-11-04 06:54:50.766249+00	251	Ion Gabriela	3		3	1
94	2022-11-04 06:54:50.769855+00	250	Maria Cojocaru	3		3	1
95	2022-11-04 06:54:50.773364+00	249	Raul Anton Mojoatca	3		3	1
96	2022-11-04 06:54:50.77702+00	248	Juan Carlos Alonso de la Morena	3		3	1
97	2022-11-04 06:54:50.780697+00	247	Ovidiu Ceica	3		3	1
98	2022-11-04 06:54:50.784509+00	246	Coca Vasile	3		3	1
99	2022-11-04 06:54:50.788302+00	245	Iulian Platica	3		3	1
100	2022-11-04 06:54:50.791683+00	244	Matei Marinez Danut	3		3	1
101	2022-11-04 06:54:50.795302+00	243	Radu Marin	3		3	1
102	2022-11-04 06:54:50.798778+00	242	Fouad lamart slimart	3		3	1
103	2022-11-04 06:54:50.802936+00	241	Constantin Avram	3		3	1
104	2022-11-04 06:54:50.80627+00	240	Luca Olga	3		3	1
105	2022-11-04 06:54:50.809737+00	239	Efren Parada Cardoza	3		3	1
106	2022-11-04 06:54:50.813355+00	238	Serbanescu Stefania	3		3	1
107	2022-11-04 06:54:50.816858+00	237	Bran Mihai Mircea	3		3	1
108	2022-11-04 06:54:50.820677+00	236	Eremia Andrei	3		3	1
109	2022-11-04 06:54:50.824211+00	235	Ciocan  Mugurel	3		3	1
110	2022-11-04 06:54:50.827702+00	234	Junior Enrique Quintero Barrios	3		3	1
111	2022-11-04 06:54:50.831306+00	233	Elena Bilti	3		3	1
112	2022-11-04 06:54:50.834815+00	232	Viorel Alexandru	3		3	1
113	2022-11-04 06:54:50.838366+00	231	Ramona Alupoaiei	3		3	1
114	2022-11-04 06:54:50.842017+00	230	Iulian Catalin zamfir	3		3	1
115	2022-11-04 06:54:50.845431+00	229	Luis Rodriguez Flores	3		3	1
116	2022-11-04 06:54:50.848943+00	228	Mita Florea	3		3	1
117	2022-11-04 06:54:50.852453+00	227	Florin Mitrica	3		3	1
118	2022-11-04 06:54:50.855973+00	226	Cornel Edu	3		3	1
119	2022-11-04 06:54:50.859313+00	225	Giovani Gentile	3		3	1
120	2022-11-04 06:54:50.863485+00	224	LOREDANA DUMITRASCU	3		3	1
121	2022-11-04 06:54:50.86708+00	223	Aurora Florentina Raducan	3		3	1
122	2022-11-04 06:54:50.870574+00	222	KHADIJA NAITBARI BKKA	3		3	1
123	2022-11-04 06:54:50.874009+00	221	BOUCHRA AOUARFAT OUTOUHAMI	3		3	1
124	2022-11-04 06:54:50.877302+00	220	IBTISSAM MAWHOUB	3		3	1
125	2022-11-04 06:54:50.882202+00	219	MIHAILA IULIAN RADU	3		3	1
126	2022-11-04 06:54:50.885469+00	218	LATIFA SABBAHI	3		3	1
127	2022-11-04 06:54:50.889071+00	217	MAJIDA EL MANSOURI	3		3	1
128	2022-11-04 06:54:50.892806+00	216	ALEJANDRINA PORTILLO SORTO	3		3	1
129	2022-11-04 06:54:50.896403+00	215	EDWIM ALEXANDER	3		3	1
130	2022-11-04 06:54:50.899917+00	214	MIÑANA NICOLAS	3		3	1
131	2022-11-04 06:54:50.905537+00	213	MARIAN PIRVU	3		3	1
132	2022-11-04 06:54:50.909629+00	212	NORMA VICTORIA GONZALES PAJARES	3		3	1
133	2022-11-04 06:54:50.91303+00	211	Abigaila Sephora Tataru	3		3	1
134	2022-11-04 06:54:50.916605+00	210	HOURIA ARAZZOUK	3		3	1
135	2022-11-04 06:54:50.920118+00	209	GEORGEL RADU	3		3	1
136	2022-11-04 06:54:50.923791+00	208	RAMONA NICOLETA POPOVICI	3		3	1
137	2022-11-04 06:54:50.927514+00	207	LAILA SAFFI	3		3	1
138	2022-11-04 06:54:50.931859+00	206	JAMILA ADAHCHOUR	3		3	1
139	2022-11-04 06:54:50.935265+00	205	RADIA AKHAZZANE	3		3	1
140	2022-11-04 06:54:50.93938+00	204	SOHAILA ELKHAMLICHI	3		3	1
141	2022-11-04 06:54:50.94307+00	203	FAOUZIYA MAKRANE	3		3	1
142	2022-11-04 06:54:50.947064+00	202	LOBNA EL AZAAR	3		3	1
143	2022-11-04 06:54:50.950515+00	201	ANA CRESPO VEGA	3		3	1
144	2022-11-04 06:54:50.954018+00	200	DINCA ELENA EUGENIA	3		3	1
145	2022-11-04 06:54:50.957459+00	199	JOSEPH KWATENG	3		3	1
146	2022-11-04 06:54:50.960833+00	198	DRAGU ILIE	3		3	1
147	2022-11-04 06:54:50.964393+00	197	ZAKIA EL MANSOURI	3		3	1
148	2022-11-04 06:54:50.967935+00	196	EL KHAMMARI EL MAJDOUBI RACHIDA	3		3	1
149	2022-11-04 06:54:50.971571+00	195	EL HADI JAHJAH	3		3	1
150	2022-11-04 06:54:50.975532+00	194	SAMIRA EL KHAMMARI	3		3	1
151	2022-11-04 06:54:50.978845+00	193	AHMED ENNAMOUTI	3		3	1
152	2022-11-04 06:54:50.982338+00	192	ROUHAND EL AOUMRANI AHMED	3		3	1
153	2022-11-04 06:54:50.985909+00	191	MOSTAFA BENABDELLAH	3		3	1
154	2022-11-04 06:54:50.989365+00	190	BEATRICE OPPONG	3		3	1
155	2022-11-04 06:54:50.992771+00	189	YAA ROSINA AGYEI	3		3	1
156	2022-11-04 06:54:50.996127+00	188	FAUSTINA AGYEI	3		3	1
157	2022-11-04 06:54:50.999585+00	187	HORIA BEN ABDELLAH	3		3	1
158	2022-11-04 06:54:51.010129+00	186	FATIMA KAINA	3		3	1
159	2022-11-04 06:54:51.014091+00	185	OMKELTOUM EL GUARRATI	3		3	1
160	2022-11-04 06:54:51.018127+00	184	SANAA ANAKAR	3		3	1
161	2022-11-04 06:54:51.02174+00	183	SAIDA BOUJIDA	3		3	1
162	2022-11-04 06:54:51.025282+00	182	LAHCEN DHIKAR	3		3	1
163	2022-11-04 06:54:51.028866+00	181	HABIBA BOUTASGHOUNTE	3		3	1
164	2022-11-04 06:54:51.032522+00	180	EL AZIZA AL AMRANI	3		3	1
165	2022-11-04 06:54:51.036056+00	179	KHADIJA ALOUAT	3		3	1
166	2022-11-04 06:54:51.039737+00	178	SAIDA RIYADI	3		3	1
167	2022-11-04 06:54:51.043266+00	177	FATIMA SALHI	3		3	1
168	2022-11-04 06:54:51.047172+00	176	FATOUM BOUSSAID	3		3	1
169	2022-11-04 06:54:51.050855+00	175	AICHA EL FARSIOUI	3		3	1
170	2022-11-04 06:54:51.054494+00	174	HAJAR AKAZIM	3		3	1
171	2022-11-04 06:54:51.058164+00	173	NISRINE CHAIRI	3		3	1
172	2022-11-04 06:54:51.061867+00	172	AFIA ABOUSSAID OUASSIMA	3		3	1
173	2022-11-04 06:54:51.065493+00	171	KHADDOUJ BEL HAJ	3		3	1
174	2022-11-04 06:54:51.068945+00	170	SAKINA EL MANSOURI	3		3	1
175	2022-11-04 06:54:51.072767+00	169	AMINA EL METIOUI	3		3	1
176	2022-11-04 06:54:51.076222+00	168	SABAH EL AMRANI	3		3	1
177	2022-11-04 06:54:51.079728+00	167	SALIMA ZARKAN	3		3	1
178	2022-11-04 06:54:51.08323+00	166	NAIMA EL MACHROUHI	3		3	1
179	2022-11-04 06:54:51.086666+00	165	ZAHRA SKHIENE	3		3	1
180	2022-11-04 06:54:51.090137+00	164	FATYHA RAHMANI	3		3	1
181	2022-11-04 06:54:51.093604+00	163	MALIKA BOURFAA	3		3	1
182	2022-11-04 06:54:51.096988+00	162	RABIA EL FARSIOUI	3		3	1
183	2022-11-04 06:54:51.100435+00	161	KARIMA EL BOUTROUKI	3		3	1
184	2022-11-04 06:54:51.104451+00	160	ASMAE EL KADDOURI	3		3	1
185	2022-11-04 06:54:51.10804+00	159	PILAR AVOMO NDONG	3		3	1
186	2022-11-04 06:54:51.111592+00	158	ASMAA ZYATE	3		3	1
187	2022-11-04 06:54:51.115356+00	157	LILIANA GEORGETA BRINZAN	3		3	1
188	2022-11-04 06:54:51.118863+00	156	SABAH TOUTOUH	3		3	1
189	2022-11-04 06:54:51.122276+00	155	EL MOUSSAOUI AIT MHAND MOULOUD	3		3	1
190	2022-11-04 06:54:51.126181+00	154	HANAN BERROUHOU	3		3	1
191	2022-11-04 06:54:51.129748+00	153	HOUSYNA ELMOALEM	3		3	1
192	2022-11-04 06:54:51.133434+00	152	HAJIBA SETTAR	3		3	1
193	2022-11-04 06:54:51.136864+00	151	ZOUHRA BOUZIT	3		3	1
194	2022-11-04 06:54:51.140296+00	150	SARRA EL MASOUDI	3		3	1
195	2022-11-04 06:54:51.14402+00	149	AUREL BOBOC	3		3	1
196	2022-11-04 06:54:51.14759+00	148	BOBOC MITA	3		3	1
197	2022-11-04 06:54:51.151028+00	147	SOUAD EL HALOULI	3		3	1
198	2022-11-04 06:54:51.154595+00	146	YENZ FRANCISCO LOPEZ ARIAS	3		3	1
199	2022-11-04 06:54:51.158106+00	145	SAMIRA FOURSI BOURJAL	3		3	1
200	2022-11-04 06:54:51.162033+00	144	AZIZA ZYYANI	3		3	1
201	2022-11-04 06:54:51.165791+00	143	TALLEH BAISSA FATIMA	3		3	1
202	2022-11-04 06:54:51.169303+00	142	FRAGA CHIQUITO MARIA JOSE	3		3	1
203	2022-11-04 06:54:51.173054+00	141	LATIFA FOURSI	3		3	1
204	2022-11-04 06:54:51.176562+00	140	FATIMA ZOHRA AMTOUR	3		3	1
205	2022-11-04 06:54:51.180687+00	139	ASMA NAJHI	3		3	1
206	2022-11-04 06:54:51.184182+00	138	BOUSSABOUN AHIBOUJ MOHAMED	3		3	1
207	2022-11-04 06:54:51.187885+00	137	IMANE BAKKALI	3		3	1
208	2022-11-04 06:54:51.191591+00	136	EL MEBLI ZIYAMI AOUATIF	3		3	1
209	2022-11-04 06:54:51.195473+00	135	KARIMA SLIMANI	3		3	1
210	2022-11-04 06:54:51.199864+00	134	RAHMA BEN STAHIR SERROUKH	3		3	1
211	2022-11-04 06:54:51.203539+00	133	MOUNIRA AGMIR	3		3	1
212	2022-11-04 06:54:51.207332+00	132	RACHIDA AZZOUZ	3		3	1
213	2022-11-04 06:54:51.210984+00	131	ZAKIA EL MAALLIN	3		3	1
214	2022-11-04 06:54:51.214675+00	130	RADIA AACHBOUN	3		3	1
215	2022-11-04 06:54:51.218485+00	129	ACIA ECH CHARKAOUY	3		3	1
216	2022-11-04 06:54:51.221974+00	128	SOUMIA MASROURI	3		3	1
217	2022-11-04 06:54:51.225482+00	127	AICHA MOUKHLOUFI	3		3	1
218	2022-11-04 06:54:51.229082+00	126	AMINA EL HADDAD	3		3	1
219	2022-11-04 06:54:51.232636+00	125	KHADIJA SBAA	3		3	1
220	2022-11-04 06:54:51.2363+00	124	LATIFA RAHMOUNI	3		3	1
221	2022-11-04 06:54:51.239835+00	123	IKRAM EL YAAMOURI	3		3	1
222	2022-11-04 06:54:51.243502+00	122	HANANE OKRICH	3		3	1
223	2022-11-04 06:54:51.247043+00	121	EL FILALI EL KOURCHI HABIBA	3		3	1
224	2022-11-04 06:54:51.250599+00	120	MARIANA VICTORIA ILIE	3		3	1
225	2022-11-04 06:54:51.254119+00	119	Elena Felea	3		3	1
226	2022-11-04 06:54:51.257821+00	118	HAMID EL MOUKHLOUFI	3		3	1
227	2022-11-04 07:37:52.47869+00	563	sdasW32dasdas	3		3	1
228	2022-11-07 16:45:37.843477+00	2	Madrid-Arganda	2	[{"changed": {"fields": ["Calle"]}}]	1	1
229	2022-11-07 16:45:58.766292+00	2	Madrid-Arganda	2	[{"changed": {"fields": ["Calle"]}}]	1	1
230	2022-11-13 10:30:03.727321+00	2	Madrid-Arganda	2	[]	1	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	delegaciones	delegaciones
2	delegaciones	domain
3	delegaciones	beneficiariosglobales
4	adra	profile
5	adra	persona
6	adra	hijo
7	adra	almacenalimentos
8	adra	alimentos
9	contenttypes	contenttype
10	admin	logentry
11	auth	permission
12	auth	group
13	auth	user
14	sessions	session
15	sites	site
16	account	emailaddress
17	account	emailconfirmation
18	authtoken	token
19	authtoken	tokenproxy
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-11-02 03:33:11.551187+00
2	auth	0001_initial	2022-11-02 03:33:11.718467+00
3	account	0001_initial	2022-11-02 03:33:11.814202+00
4	account	0002_email_max_length	2022-11-02 03:33:11.841454+00
5	admin	0001_initial	2022-11-02 03:33:11.902142+00
6	admin	0002_logentry_remove_auto_add	2022-11-02 03:33:11.927572+00
7	admin	0003_logentry_add_action_flag_choices	2022-11-02 03:33:11.956168+00
8	adra	0001_initial	2022-11-02 03:33:12.210218+00
9	contenttypes	0002_remove_content_type_name	2022-11-02 03:33:12.270582+00
10	auth	0002_alter_permission_name_max_length	2022-11-02 03:33:12.315265+00
11	auth	0003_alter_user_email_max_length	2022-11-02 03:33:12.470342+00
12	auth	0004_alter_user_username_opts	2022-11-02 03:33:12.507411+00
13	auth	0005_alter_user_last_login_null	2022-11-02 03:33:12.547475+00
14	auth	0006_require_contenttypes_0002	2022-11-02 03:33:12.559828+00
15	auth	0007_alter_validators_add_error_messages	2022-11-02 03:33:12.596922+00
16	auth	0008_alter_user_username_max_length	2022-11-02 03:33:12.64478+00
17	auth	0009_alter_user_last_name_max_length	2022-11-02 03:33:12.684028+00
18	auth	0010_alter_group_name_max_length	2022-11-02 03:33:12.727401+00
19	auth	0011_update_proxy_permissions	2022-11-02 03:33:12.769296+00
20	auth	0012_alter_user_first_name_max_length	2022-11-02 03:33:12.810037+00
21	authtoken	0001_initial	2022-11-02 03:33:12.867685+00
22	authtoken	0002_auto_20160226_1747	2022-11-02 03:33:12.990892+00
23	authtoken	0003_tokenproxy	2022-11-02 03:33:13.006752+00
24	delegaciones	0001_initial	2022-11-02 03:33:13.074086+00
25	delegaciones	0002_alter_delegaciones_ciudad	2022-11-02 03:33:13.102237+00
26	delegaciones	0003_delegaciones_calle	2022-11-02 03:33:13.127413+00
27	delegaciones	0004_profile	2022-11-02 03:33:13.188331+00
28	delegaciones	0005_delete_profile	2022-11-02 03:33:13.204013+00
29	delegaciones	0006_beneficiariosglobales	2022-11-02 03:33:13.226895+00
30	delegaciones	0007_beneficiariosglobales_delegacion_code	2022-11-02 03:33:13.249705+00
31	delegaciones	0008_delegaciones_oar	2022-11-02 03:33:13.271797+00
32	delegaciones	0009_beneficiariosglobales_created_at	2022-11-02 03:33:13.292039+00
33	sessions	0001_initial	2022-11-02 03:33:13.32593+00
34	sites	0001_initial	2022-11-02 03:33:13.345381+00
35	sites	0002_alter_domain_unique	2022-11-02 03:33:13.370081+00
36	adra	0002_auto_20221104_0515	2022-11-04 06:06:56.027076+00
37	adra	0003_alter_hijo_parentesco	2022-11-06 07:01:09.523601+00
38	adra	0004_profile_sexo	2022-11-16 07:03:08.259008+00
39	adra	0005_auto_20221201_0712	2022-12-05 07:42:19.334286+00
40	adra	0006_auto_20221205_1155	2022-12-05 11:00:52.938853+00
41	adra	0007_remove_persona_categoria	2022-12-08 08:37:43.370816+00
42	adra	0008_persona_categoria	2022-12-08 08:37:43.421963+00
43	adra	0009_remove_persona_categoria	2022-12-08 08:37:43.453061+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
nok9yfym2pgfzdg2p18d8ulqcp4rgmhi	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1oq4wY:LKvaEdAysEqIhz2rScb1EkQHPgc7ql_qycj5rqp_bhE	2022-11-03 04:01:34.483427+00
xjc2wnvm9nwcfzyqkj326k8kj6v7r16i	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1oq8FV:Pft4SqSxgyE31iCr0_ZMy2aZbcUUf2SlHhYntYV3ezo	2022-11-03 07:33:21.80755+00
yazjcblwfsww0mih49sase1ugnp7fydl	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1oq8FW:wUm6oq60yS3EiW29hxjn4aw2P81it1M1qnHAkggbnd8	2022-11-03 07:33:22.251568+00
bkltgxaes0tjfgme5w4gfws4tosicu1r	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1oqplJ:gbeCClorifn2Tvl1iheXO1Aq8RAFzQWsWAuRV9-FAf4	2022-11-05 06:01:05.950318+00
rf1w38gmtc7hpq0iefz3uytfvztuxq8y	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1ora0T:CSWokSaxsd_qlSdieZOiMUTv9JpN45zdo0iFDFogg64	2022-11-07 07:23:49.953374+00
5qq9zr73fa0uhsu8jfmje3gausb24vff	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1os5Eo:jvbOFHgtD367ThIZ6STDr1ZX8YokhyPGvjqSboMzc-8	2022-11-08 16:44:42.143549+00
s9gor89ujgq15ehlh4zk6ip1klg7te7i	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1ot07r:uQtjyN-o2R0Bk3h_x_3t1ShNo4Pmt5ksOtC0na8ICgU	2022-11-11 05:29:19.520639+00
v6k34jot99d9r6jyixhph6k66h2ll57f	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1ouA9R:eGFYx-txMYsbbT_djVW5iu4RJP7NsxCrtmUahhV0D8Y	2022-11-14 10:23:45.216639+00
y0mxts1otzymz4c2xrf8b493027mufhk	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1oudUq:_th8Uto1tdxg3c6f15DUdVGlvsGJ0c68OSn9q8pqZOU	2022-11-15 17:43:48.327102+00
oiqsgs7li6mjy4f75mp07djr2hddgrtc	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1ovAw0:KFOeNki0EmE6BSJ5moR7Aow-MBaC8Ac5dr2nchaRUu8	2022-11-17 05:26:04.478252+00
ctxifmi4wv2yqwmk1ycq2ijomulw4wbj	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1ow1ac:de9GuAWzlNeEH__SsSiKtbSFIg0_BglO_R8yEgy5xG8	2022-11-19 13:39:30.726713+00
wqdrdlfibt9l8z112msnwzs2ylfhh6aq	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1owSWA:ra2GPQSFdA9R-p75G1jB8w3tuPTaBNPboax5WmAwzK0	2022-11-20 18:24:42.526386+00
jq562e1foza9zuwv3hrvozayvzzfohm0	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1owUSx:x0SlQ_09Iuy2Z7r1exiVary_xTuTE-LPzSoVSL-UkMU	2022-11-20 20:29:31.53808+00
cbln555bfaiv3c7obwrgf7xrcje54xdo	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1owyU5:jWREFM1VBa15zb8_ly2x4akLmS-_SUwuOJEvIKThNIY	2022-11-22 04:32:41.875149+00
bbfihjh0vpv63kl5tu0jjltvcakxntaa	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1owyU6:4E58cdku73vXPbqx7rO4yJsMQbSbN-TD9zm2p6kJ49Q	2022-11-22 04:32:42.343034+00
doedfql2rz0p2px4m4qnx1uowf6oovd9	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1oxO9N:RZ8kG1UHMClKu4KQJKhYq8m4WsK7IUB-X9oUYw26ECk	2022-11-23 07:57:01.241857+00
ige03od3i5ft08eq2s6mfma0s7ejyb3z	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1oyoke:nQ4rZCbAkQ34h0XrxNK-C3oM4MMdaZLWu6wBI7Nunk4	2022-11-27 06:33:24.356182+00
yqu6eohsivk4kewuhu08reenljnv0t5n	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1ozMEo:uqn0-e27vrH3oY042CA3hWfXtqyjLH0F6gDRYZrih6s	2022-11-28 18:18:46.40801+00
sch05374gy83viwf35gnlb2w6w9shb3n	.eJxVjMsOwiAQRf-FtSG82kKX7v0GMh0Gixow0CYa479rk266veec-2G-UWupZE-vZ6pvNtreCHFiHtZl9muj6lNgI5PssE2Ad8obCDfI18Kx5KWmiW8K32njlxLocd7dw8EMbf7XYJF6azRqFNE4RTBog84EQLASXFSgqYsdKAxkgxVBCiX1AFEbB5Nm3x_UTECT:1p1WaZ:cYUXM5HShJUAoXYzj5IazxwmLcGnGZsWYQaR4-gkU7Y	2022-12-04 17:46:11.623107+00
2zwedevmvvi13uzp8mfvbrz77qgo35hu	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1p1jFS:LTVXIcoz5cizpQRSQGfb1ksCEIap9VheCnIK1xs-1pM	2022-12-05 07:17:14.237269+00
hx2w0bdibak7ygu1wvvwo2bo14qymv4v	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1p265l:KUpfsD2L9JDDM2_ToVTraL5EAG69KmCsYB4sDIMYYN4	2022-12-06 07:40:45.528131+00
tonpo3lyiezmbvv26qup33h9ng2z2wlt	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1p265l:KUpfsD2L9JDDM2_ToVTraL5EAG69KmCsYB4sDIMYYN4	2022-12-06 07:40:45.794884+00
j8fsjwuoa84l840xpxjhpixb7sfkl99d	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1p2Vbt:xwEjRsXyUbHEFdqTLhndUxGN9Wnuo6Ta89Og-riMs9k	2022-12-07 10:55:37.175298+00
x73807iele96eyzs1l76gktunbexhwpg	.eJxVjDsOwjAUBO_iGqL4F9uU9JzBWvs9J3yUoDgIIcTdIRIFtDuz8xQRt2WIt8pzPJLYCSk2v1tCPvO4Ajph7KcmT-MyH1OzKs2X1uYwEV_2X_cvMKAOnzd85s4bnXVuiwmK4bTJwRAyvEQoCpptsVCZ2JNvSbZKaoeiTUDSa_SKWu_TTHHmyks88-MTTr3pndt2TnJXOrTJwWvlSjEIZIO01snCEK83xzJMPA:1p3IkR:d_8Xl1gS8BZ9ekED1R6ywi-_eT38n77AdfIi7gdd5lA	2022-12-09 15:23:43.686824+00
0vt99777wlx8jzgn6d8hmkri7w3y1ieg	.eJxVjEEOgjAQRe_StWlop0jr0j1nIJ-ZqaAGEgor492VhIVu_3vvv0yHbR26rejSjWIuxpnT79aDHzrtQO6YbrPleVqXsbe7Yg9abDuLPq-H-3cwoAzfGpH1HAMxcZVD8oqGAqcgYESHlD1I61zDs2iUWImrvKMGmUJCT-b9Af67OIQ:1p6QzO:RGQqWSyK5fHBeOmXVa-29SxMduWZv7ff9EGVvNL1DQk	2022-12-18 06:48:06.883753+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: luciancati
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
2	sutarjetadevisita@gmail.com	t	t	3
3	danielbfilip@gmail.com	t	t	4
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: adra_alimentos; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".adra_alimentos (id, alimento_1, alimento_2, alimento_3, alimento_4, alimento_5, alimento_6, alimento_7, alimento_8, alimento_9, alimento_10, alimento_11, alimento_12, alimento_13, signature, fecha_recogida, created_at, updated_at, modificado_por_id, persona_id) FROM stdin;
10	2	4	4	3	8	3	4	3	3	0	0	3	3	\N	2022-11-20 09:12:00+00	2022-11-20	2022-11-20 09:12:42.940731+00	3	141
11	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 09:14:00+00	2022-11-20	2022-11-20 09:14:30.520325+00	3	211
12	4	5	6	4	12	4	5	5	4	4	0	4	4	\N	2022-11-20 09:16:00+00	2022-11-20	2022-11-20 09:16:06.827235+00	3	175
13	3	4	5	3	10	3	5	3	3	0	0	4	3	[{"x": [340], "y": [84]}]	2022-11-20 09:17:00+00	2022-11-20	2022-11-20 09:18:05.9414+00	3	145
14	1	2	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 09:20:00+00	2022-11-20	2022-11-20 09:20:39.666991+00	3	222
15	3	4	5	3	10	3	5	3	2	0	0	4	3	\N	2022-11-20 09:22:00+00	2022-11-20	2022-11-20 09:22:18.144733+00	3	216
16	5	6	7	5	15	4	6	4	4	0	0	5	4	[{"x": [365], "y": [1]}]	2022-11-20 09:28:00+00	2022-11-20	2022-11-20 09:29:09.42546+00	3	126
17	1	2	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 09:34:00+00	2022-11-20	2022-11-20 09:34:20.157157+00	3	231
18	4	5	6	4	12	4	5	4	4	0	0	4	4	[{"x": [283], "y": [37]}]	2022-11-20 09:49:00+00	2022-11-20	2022-11-20 09:52:51.989764+00	3	212
19	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 09:54:00+00	2022-11-20	2022-11-20 09:55:00.89943+00	3	220
20	4	5	6	4	12	4	5	4	4	0	0	4	4	\N	2022-11-20 09:56:00+00	2022-11-20	2022-11-20 09:56:55.717916+00	3	143
21	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 09:58:00+00	2022-11-20	2022-11-20 09:58:38.682027+00	3	120
22	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 09:59:00+00	2022-11-20	2022-11-20 09:59:50.592924+00	3	176
23	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 10:00:00+00	2022-11-20	2022-11-20 10:01:17.440752+00	3	177
24	1	3	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 10:02:00+00	2022-11-20	2022-11-20 10:02:41.536367+00	3	198
25	3	4	5	3	10	3	5	3	3	0	2	4	3	\N	2022-11-20 10:04:00+00	2022-11-20	2022-11-20 10:06:56.841631+00	3	195
26	1	3	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 10:08:00+00	2022-11-20	2022-11-20 10:08:12.16957+00	3	165
27	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 10:09:00+00	2022-11-20	2022-11-20 10:10:16.242765+00	3	146
28	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 10:11:00+00	2022-11-20	2022-11-20 10:11:53.311638+00	3	219
29	1	2	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 10:12:00+00	2022-11-20	2022-11-20 10:13:06.744783+00	3	210
30	4	5	6	4	12	4	5	4	4	0	0	4	4	\N	2022-11-20 10:14:00+00	2022-11-20	2022-11-20 10:14:28.303858+00	3	154
31	1	3	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 10:15:00+00	2022-11-20	2022-11-20 10:16:44.207072+00	3	234
32	1	3	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 10:15:00+00	2022-11-20	2022-11-20 10:16:54.287251+00	3	234
33	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 10:18:00+00	2022-11-20	2022-11-20 10:18:30.05965+00	3	127
34	4	5	6	4	12	4	5	4	4	0	0	4	4	[{"x": [119], "y": [25]}]	2022-11-20 10:24:00+00	2022-11-20	2022-11-20 10:24:56.213701+00	3	122
35	4	5	6	4	12	4	5	4	4	0	0	4	4	[{"x": [119], "y": [25]}]	2022-11-20 10:24:00+00	2022-11-20	2022-11-20 10:24:56.462677+00	3	122
36	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 10:27:00+00	2022-11-20	2022-11-20 10:27:34.370586+00	3	159
37	1	3	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 10:30:00+00	2022-11-20	2022-11-20 10:31:25.168024+00	3	235
38	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 10:33:00+00	2022-11-20	2022-11-20 10:33:39.81513+00	3	161
39	2	4	4	3	8	3	4	3	3	0	0	3	3	[{"x": [369], "y": [60]}]	2022-11-20 10:34:00+00	2022-11-20	2022-11-20 10:34:57.172726+00	3	152
40	2	4	4	3	8	3	4	3	3	0	0	3	3	[{"x": [369], "y": [60]}]	2022-11-20 10:34:00+00	2022-11-20	2022-11-20 10:34:57.434449+00	3	152
41	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 10:35:00+00	2022-11-20	2022-11-20 10:36:08.345586+00	3	136
42	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 10:37:00+00	2022-11-20	2022-11-20 10:37:30.83693+00	3	123
43	4	5	6	4	12	4	5	4	4	0	0	4	4	\N	2022-11-20 10:40:00+00	2022-11-20	2022-11-20 10:40:41.470626+00	3	215
44	2	4	4	3	8	3	4	3	3	2	2	3	3	\N	2022-11-20 10:52:00+00	2022-11-20	2022-11-20 10:53:01.928942+00	3	196
45	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 10:58:00+00	2022-11-20	2022-11-20 10:58:36.793895+00	3	192
46	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 11:01:00+00	2022-11-20	2022-11-20 11:01:35.965392+00	3	238
47	1	3	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 11:02:00+00	2022-11-20	2022-11-20 11:03:33.105492+00	3	167
48	2	4	4	3	8	3	4	3	3	0	0	3	3	\N	2022-11-20 11:05:00+00	2022-11-20	2022-11-20 11:05:40.971882+00	3	208
49	3	4	5	3	10	3	5	3	3	0	2	4	3	\N	2022-11-20 11:07:00+00	2022-11-20	2022-11-20 11:07:26.612262+00	3	233
50	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 11:12:00+00	2022-11-20	2022-11-20 11:12:21.852208+00	3	132
51	1	2	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 11:13:00+00	2022-11-20	2022-11-20 11:13:31.823122+00	3	132
52	5	6	8	5	18	4	7	4	5	4	4	6	5	\N	2022-11-20 11:18:00+00	2022-11-20	2022-11-20 11:18:09.494531+00	3	125
53	2	4	4	3	8	3	4	3	3	0	0	3	3	\N	2022-11-20 11:37:00+00	2022-11-20	2022-11-20 11:37:53.338082+00	3	131
54	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 11:38:00+00	2022-11-20	2022-11-20 11:39:16.198397+00	3	130
55	2	4	4	3	8	3	4	3	3	0	0	3	3	\N	2022-11-20 11:40:00+00	2022-11-20	2022-11-20 11:41:12.409178+00	3	204
56	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 11:41:00+00	2022-11-20	2022-11-20 11:42:12.72429+00	3	194
57	4	5	7	4	14	4	5	4	4	0	2	5	4	\N	2022-11-20 11:43:00+00	2022-11-20	2022-11-20 11:43:35.743434+00	3	148
58	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 11:44:00+00	2022-11-20	2022-11-20 11:45:02.005187+00	3	227
59	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 11:44:00+00	2022-11-20	2022-11-20 11:45:02.403226+00	3	227
60	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 11:45:00+00	2022-11-20	2022-11-20 11:46:09.674034+00	3	187
61	4	5	6	4	12	4	5	4	4	0	0	4	4	\N	2022-11-20 11:47:00+00	2022-11-20	2022-11-20 11:47:31.642145+00	3	129
62	1	3	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 11:48:00+00	2022-11-20	2022-11-20 11:48:51.084108+00	3	207
63	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 11:49:00+00	2022-11-20	2022-11-20 11:50:01.879777+00	3	128
64	2	4	4	3	8	3	4	3	3	0	0	3	3	\N	2022-11-20 11:50:00+00	2022-11-20	2022-11-20 11:51:15.464518+00	3	133
65	4	5	7	4	14	4	5	4	4	0	0	5	4	\N	2022-11-20 11:55:00+00	2022-11-20	2022-11-20 11:56:13.249306+00	3	137
66	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 11:57:00+00	2022-11-20	2022-11-20 11:57:24.321236+00	3	178
67	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 11:58:00+00	2022-11-20	2022-11-20 11:58:39.324692+00	3	205
68	4	5	6	4	12	4	5	4	4	0	0	4	4	\N	2022-11-20 12:11:00+00	2022-11-20	2022-11-20 12:11:39.296515+00	3	172
69	5	6	8	5	18	4	7	4	5	0	0	6	5	\N	2022-11-20 12:16:00+00	2022-11-20	2022-11-20 12:16:33.203293+00	3	203
70	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 12:17:00+00	2022-11-20	2022-11-20 12:17:45.917551+00	3	213
71	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 12:18:00+00	2022-11-20	2022-11-20 12:18:45.574676+00	3	147
72	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 12:19:00+00	2022-11-20	2022-11-20 12:19:31.014793+00	3	135
73	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 12:34:00+00	2022-11-20	2022-11-20 12:34:39.190769+00	3	182
74	1	2	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 16:17:00+00	2022-11-30	2022-11-30 16:17:32.258384+00	3	124
75	1	2	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 16:29:00+00	2022-11-30	2022-11-30 16:29:59.543471+00	3	236
76	1	3	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 16:32:00+00	2022-11-30	2022-11-30 16:32:31.486801+00	3	171
77	1	2	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 16:35:00+00	2022-11-30	2022-11-30 16:35:29.090439+00	3	224
78	1	2	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 16:37:00+00	2022-11-30	2022-11-30 16:37:40.94758+00	3	223
79	1	2	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 16:38:00+00	2022-11-30	2022-11-30 16:38:52.870759+00	3	230
80	4	5	6	4	12	4	5	4	4	0	0	4	4	\N	2022-11-20 16:40:00+00	2022-11-30	2022-11-30 16:40:56.300401+00	3	186
81	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 17:36:00+00	2022-11-30	2022-11-30 17:36:53.790073+00	3	239
82	2	4	4	3	8	3	4	3	3	0	0	3	3	\N	2022-11-20 17:45:00+00	2022-11-30	2022-11-30 17:45:18.792074+00	3	240
83	1	3	3	2	6	1	4	1	1	2	2	1	1	\N	2022-11-20 18:01:00+00	2022-11-30	2022-11-30 18:01:18.037529+00	3	242
84	2	4	4	3	8	3	4	3	3	0	0	3	3	\N	2022-11-20 18:02:00+00	2022-11-30	2022-11-30 18:02:31.464032+00	3	241
85	1	2	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 18:05:00+00	2022-11-30	2022-11-30 18:05:12.572326+00	3	180
86	2	4	4	3	8	3	4	3	3	2	2	3	3	\N	2022-11-20 14:36:00+00	2022-12-05	2022-12-05 14:37:11.22395+00	3	245
87	1	3	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 14:38:00+00	2022-12-05	2022-12-05 14:38:33.264898+00	3	246
88	4	5	7	4	14	4	5	4	4	0	0	5	4	\N	2022-11-20 14:40:00+00	2022-12-05	2022-12-05 14:40:09.428275+00	3	244
89	1	3	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 14:41:00+00	2022-12-05	2022-12-05 14:41:40.838882+00	3	243
90	1	2	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 18:18:00+00	2022-12-16	2022-12-16 18:18:40.603208+00	3	247
91	1	2	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 19:33:00+00	2022-12-16	2022-12-16 19:34:04.241616+00	3	255
92	1	2	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 19:35:00+00	2022-12-16	2022-12-16 19:35:17.18736+00	3	254
93	2	4	4	3	8	3	4	3	3	0	0	3	3	\N	2022-11-20 20:27:00+00	2022-12-16	2022-12-16 20:27:47.926893+00	3	253
94	2	4	4	3	8	3	4	3	3	0	0	3	3	\N	2022-11-20 20:29:00+00	2022-12-16	2022-12-16 20:29:30.993311+00	3	252
95	4	5	6	4	12	4	5	4	4	0	0	4	4	\N	2022-11-20 20:32:00+00	2022-12-16	2022-12-16 20:32:22.760488+00	3	251
96	4	5	6	4	12	4	5	4	4	0	0	4	4	\N	2022-11-20 20:34:00+00	2022-12-16	2022-12-16 20:34:46.565186+00	3	251
97	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-11-20 20:36:00+00	2022-12-16	2022-12-16 20:36:21.864803+00	3	250
98	1	3	3	2	6	1	4	1	1	0	0	1	1	\N	2022-11-20 20:37:00+00	2022-12-16	2022-12-16 20:37:29.083758+00	3	249
99	4	5	6	4	12	4	5	4	4	0	0	4	4	\N	2022-11-20 20:38:00+00	2022-12-16	2022-12-16 20:39:04.793462+00	3	248
100	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-11-20 20:54:00+00	2022-12-16	2022-12-16 20:54:27.126846+00	3	151
101	3	4	5	3	10	3	5	3	3	0	0	4	3	[{"x": [324], "y": [18]}]	2022-12-18 10:30:00+00	2022-12-18	2022-12-18 10:31:37.361753+00	4	211
102	3	4	5	3	10	3	5	3	3	0	0	4	3	[{"x": [324], "y": [18]}]	2022-12-18 10:30:00+00	2022-12-18	2022-12-18 10:31:37.533135+00	4	211
103	2	4	4	3	8	3	4	3	3	2	2	3	3	\N	2022-12-18 10:32:00+00	2022-12-18	2022-12-18 10:33:18.392582+00	4	240
104	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-12-18 10:34:00+00	2022-12-18	2022-12-18 10:34:34.732587+00	4	132
105	2	4	4	3	8	3	4	3	3	2	2	3	3	[{"x": [297], "y": [62]}]	2022-12-18 10:35:00+00	2022-12-18	2022-12-18 10:35:54.969269+00	4	196
106	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-12-18 10:36:00+00	2022-12-18	2022-12-18 10:37:01.102349+00	4	146
107	1	3	3	2	6	1	4	1	1	0	0	1	1	[{"x": [374], "y": [68]}]	2022-12-18 10:42:00+00	2022-12-18	2022-12-18 10:42:27.971448+00	4	165
108	4	5	6	4	12	4	5	4	4	0	0	4	4	[{"x": [250], "y": [44]}]	2022-12-18 10:43:00+00	2022-12-18	2022-12-18 10:43:28.432752+00	4	175
109	3	4	5	3	10	3	5	3	3	0	0	4	3	[{"x": [349], "y": [50]}]	2022-12-18 10:44:00+00	2022-12-18	2022-12-18 10:44:22.815006+00	4	216
110	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-12-18 10:45:00+00	2022-12-18	2022-12-18 10:45:33.971639+00	4	145
111	5	6	7	5	15	4	6	4	4	2	2	5	4	\N	2022-12-18 10:46:00+00	2022-12-18	2022-12-18 10:46:39.541716+00	4	126
112	1	3	3	2	6	1	4	1	1	0	0	1	1	[{"x": [318], "y": [51]}]	2022-12-18 10:47:00+00	2022-12-18	2022-12-18 10:48:01.638212+00	4	234
113	2	4	4	3	8	3	4	3	3	0	0	3	3	[{"x": [322], "y": [57]}, {"x": [322], "y": [57]}, {"x": [322], "y": [57]}, {"x": [322], "y": [57]}, {"x": [322], "y": [57]}, {"x": [322], "y": [57]}]	2022-12-18 10:48:00+00	2022-12-18	2022-12-18 10:49:04.09811+00	4	141
114	4	5	6	4	12	4	5	4	4	0	0	4	4	[{"x": [344], "y": [60]}, {"x": [344], "y": [60]}, {"x": [344], "y": [60]}, {"x": [344], "y": [60]}, {"x": [344], "y": [60]}, {"x": [344], "y": [60]}]	2022-12-18 10:49:00+00	2022-12-18	2022-12-18 10:50:06.245963+00	4	143
115	1	3	3	2	6	1	4	1	1	0	0	1	1	[{"x": [315], "y": [54]}]	2022-12-18 10:51:00+00	2022-12-18	2022-12-18 10:51:30.300878+00	4	143
116	1	3	3	2	6	1	4	1	1	0	0	1	1	[{"x": [278], "y": [55]}, {"x": [278], "y": [55]}, {"x": [278], "y": [55]}, {"x": [278], "y": [60]}, {"x": [278], "y": [60]}]	2022-12-18 10:52:00+00	2022-12-18	2022-12-18 10:52:20.073232+00	4	120
117	1	2	3	2	6	1	4	1	1	0	0	1	1	[{"x": [254], "y": [58]}]	2022-12-18 10:53:00+00	2022-12-18	2022-12-18 10:53:47.895099+00	4	231
118	2	3	4	2	8	2	4	2	2	0	0	2	2	[{"x": [224], "y": [104]}, {"x": [224], "y": [104]}, {"x": [224], "y": [104]}]	2022-12-18 10:54:00+00	2022-12-18	2022-12-18 10:54:46.171861+00	4	239
119	1	3	3	2	6	1	4	1	1	0	0	1	1	[{"x": [354], "y": [35]}]	2022-12-18 10:55:00+00	2022-12-18	2022-12-18 10:55:58.340603+00	4	249
120	2	4	4	3	8	3	4	3	3	0	0	3	3	[{"x": [340], "y": [35]}, {"x": [340], "y": [35]}, {"x": [340], "y": [35]}, {"x": [225], "y": [86]}, {"x": [225], "y": [86]}, {"x": [225], "y": [86]}, {"x": [225], "y": [86]}, {"x": [225], "y": [86]}, {"x": [225], "y": [86]}, {"x": [225], "y": [86]}, {"x": [225], "y": [86]}, {"x": [225], "y": [86]}]	2022-12-18 10:56:00+00	2022-12-18	2022-12-18 10:56:57.669496+00	4	252
121	4	5	7	4	14	4	5	4	4	0	0	5	4	[{"x": [335], "y": [14]}]	2022-12-18 11:34:00+00	2022-12-18	2022-12-18 11:34:33.558734+00	4	148
122	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-12-18 11:35:00+00	2022-12-18	2022-12-18 11:35:18.979064+00	4	135
123	5	6	8	5	18	4	7	4	5	0	6	6	5	\N	2022-12-18 11:36:00+00	2022-12-18	2022-12-18 11:36:23.924374+00	4	125
124	1	3	3	2	6	1	4	1	1	0	0	1	1	\N	2022-12-18 11:40:00+00	2022-12-18	2022-12-18 11:40:18.473998+00	4	242
125	2	4	4	3	8	3	4	3	3	0	0	3	3	\N	2022-12-18 11:41:00+00	2022-12-18	2022-12-18 11:41:16.820303+00	4	241
126	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-12-18 12:17:00+00	2022-12-18	2022-12-18 12:17:51.883287+00	4	159
127	1	3	3	2	6	1	4	1	1	0	0	1	1	[{"x": [354], "y": [86]}]	2022-12-18 12:18:00+00	2022-12-18	2022-12-18 12:18:43.575045+00	4	235
128	4	5	6	4	12	4	5	4	4	0	0	4	4	\N	2022-12-18 12:19:00+00	2022-12-18	2022-12-18 12:19:37.477793+00	4	154
129	2	4	4	3	8	3	4	3	3	0	0	3	3	\N	2022-12-18 12:20:00+00	2022-12-18	2022-12-18 12:20:31.30043+00	4	152
130	4	5	6	4	12	4	5	4	4	0	0	4	4	\N	2022-12-18 12:21:00+00	2022-12-18	2022-12-18 12:21:28.500909+00	4	186
131	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-12-18 12:22:00+00	2022-12-18	2022-12-18 12:22:43.381497+00	4	161
132	4	5	6	4	12	4	5	4	4	0	0	4	4	\N	2022-12-18 12:23:00+00	2022-12-18	2022-12-18 12:23:45.598898+00	4	212
133	2	3	4	2	8	2	4	2	2	0	0	2	2	\N	2022-12-18 12:25:00+00	2022-12-18	2022-12-18 12:25:09.492969+00	4	187
134	2	4	4	3	8	3	4	3	3	0	0	3	3	\N	2022-12-18 12:25:00+00	2022-12-18	2022-12-18 12:25:55.047668+00	4	208
135	3	4	5	3	10	3	5	3	3	0	2	4	3	\N	2022-12-18 12:26:00+00	2022-12-18	2022-12-18 12:26:56.896042+00	4	233
136	3	4	5	3	10	3	5	3	3	0	0	4	3	\N	2022-12-18 12:27:00+00	2022-12-18	2022-12-18 12:27:46.821467+00	4	123
137	2	4	4	3	8	3	4	3	3	2	0	3	3	\N	2022-12-18 12:28:00+00	2022-12-18	2022-12-18 12:28:39.676542+00	4	248
\.


--
-- Data for Name: adra_almacenalimentos; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".adra_almacenalimentos (id, alimento_1, alimento_2, alimento_3, alimento_4, alimento_5, alimento_6, alimento_7, alimento_8, alimento_9, alimento_10, alimento_11, alimento_12, alimento_13, created_at, updated_at, alimento_1_caducidad, alimento_2_caducidad, alimento_3_caducidad, alimento_4_caducidad, alimento_5_caducidad, alimento_6_caducidad, alimento_7_caducidad, alimento_8_caducidad, alimento_9_caducidad, alimento_10_caducidad, alimento_11_caducidad, alimento_12_caducidad, alimento_13_caducidad, modificado_por_id) FROM stdin;
1	543	1371	1858	621	1704	595	782	874	673	26	6	6386	1172	2022-11-03 05:06:22.37213+00	2022-11-03 05:06:22.372149+00	2024-08-08	2023-11-02	2023-11-02	2024-04-04	2023-11-02	2023-11-02	2023-11-02	2023-11-02	2023-11-02	2023-11-02	2023-11-02	2023-02-13	2023-11-02	3
\.


--
-- Data for Name: adra_hijo; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".adra_hijo (id, parentesco, sexo, nombre_apellido, dni, otros_documentos, fecha_nacimiento, edad, active, discapacidad, modificado_por_id, persona_id) FROM stdin;
367	hija	mujer	Benaissa Mariam	51001741T		1999-09-14	0	t	f	3	119
368	esposa	mujer	Vazquez Moros  Julita	51693655M		1945-10-09	0	t	f	3	120
369	hija	mujer	Sanchez Redondo Aurora	53957916P		1995-05-14	0	t	f	3	120
376	hija	mujer	Noor Esham Al Ghazali		Y 6943056 Z	2017-03-06	0	t	f	3	122
378	hija	mujer	Mhamdi Mariam	02322327 V		2010-08-28	0	t	f	3	123
380	hija	mujer	Mhamdi Kawtar		02321768 X	2007-09-06	0	t	f	3	123
381	esposa	mujer	Garcia Muñoz Sefora	044527741 V		1988-01-26	0	t	f	3	125
382	hija	mujer	Garcia Muñoz Coral	51198922 W		2006-04-20	0	t	f	3	125
383	hija	mujer	Garcia Muñoz Navara	051198921 R		2004-10-22	0	t	f	3	125
384	hija	mujer	Garcia Muñoz Sefora	.....................		2008-09-04	0	t	f	3	125
386	hija	mujer	Garcia Muñoz Samira	...............		2013-09-07	0	t	f	3	125
387	hija	mujer	Garcia Muñoz Elisabeth	...............		2015-10-27	0	t	f	3	125
391	hija	mujer	Fernandez Vazquez Noemi	051197077 C		2001-02-13	0	t	f	3	126
396	hija	mujer	Fernandez Vazquez Noemi	............		2020-07-25	0	t	f	3	126
366	hijo	hombre	Benaissa Yassin	50647033K		2005-06-22	0	t	f	3	119
370	hijo	hombre	Curcan Levi Robert	x5103235H		1990-09-22	0	t	f	3	121
371	esposo	hombre	Curcan Daniel	x4086547E		1950-08-17	0	t	f	3	121
372	esposo	hombre	Mohamed Jabra Al Ghazali	y6943015L		1970-09-15	0	t	f	3	122
373	hijo	hombre	Yaman Mohamed Al Ghazali		y6943040 K	2007-07-28	0	t	f	3	122
374	hijo	hombre	Yamen Al Ghazali		y 6943032 J	2006-01-01	0	t	f	3	122
375	hijo	hombre	Taim Allah Al Ghazali		y 6943046 G	2010-07-02	0	t	f	3	122
377	hijo	hombre	Mhamdi Moustapha		Y4646293 P	2016-01-25	0	t	f	3	123
379	hijo	hombre	Mhamdi Hassani Otman		02350232T	2012-09-17	0	t	f	3	123
385	hijo	hombre	Garcia Muñoz Yeray	....................		2011-12-11	0	t	f	3	125
388	hijo	hombre	Garcia Muñoz Adaray	..................		2021-03-22	0	t	f	3	125
389	hijo	hombre	Garcia Muñoz Adaray	..................		2021-03-22	0	t	f	3	125
390	esposo	hombre	Fernandez Vazquez Manuel	051908923Q		1970-03-27	0	t	f	3	126
392	hijo	hombre	Fernandez Vazquez Emilio	002351608 L		2004-06-06	0	t	f	3	126
393	hijo	hombre	Fernandez Vazquez Joan	002354308M		2010-08-17	0	t	f	3	126
394	hijo	hombre	Fernandez Vazquez Jairo	002354309 Y		2010-08-17	0	t	f	3	126
395	hijo	hombre	Fernandez Vazquez Diego	...............		2019-05-28	0	t	f	3	126
397	ESPOSO	hombre	Muñoz Flores Miquel	51983842 R		1983-07-29	0	t	f	3	127
398	Hija	mujer	Luisa Muñoz Heredia	023528732		2005-09-10	0	t	f	3	127
399	Hijo	hombre	Manuel Muñoz	0235295713		2009-11-27	0	t	f	3	127
400	Hijo	hombre	Antonio Muñoz	02342958N		2014-06-08	0	t	f	3	127
401	Esposa	mujer	Assiya Boukdouri	x7528843T		1984-06-19	0	t	f	3	128
402	Hija	mujer	Salima El Mankouri	x8366613H		2006-01-04	0	t	f	3	128
403	Hijo	hombre	Mohamed El Mahkouri	x9762149y		2008-01-03	0	t	f	3	128
404	Hijo	hombre	Ilyas El Manhkouri	002352495D		2012-01-26	0	t	f	3	128
405	Esposa	mujer	Hashaa Kourit	x8844499X		1989-08-30	0	t	f	3	129
406	Hija	mujer	Omnia Dahbi	y5255394T		2016-10-08	0	t	f	3	129
407	Hija	mujer	Doha Dahbi	y6719250k		2018-06-19	0	t	f	3	129
408	Hija	mujer	Arwa Dahbi	y8258107V		2019-12-24	0	t	f	3	129
409	Hijo	hombre	Yasser Dahbi	...............		2022-03-17	0	t	f	3	129
410	ESPOSO	hombre	El Yousfi Ahmed	x1203072B		1963-01-01	0	t	f	3	131
411	Hija	mujer	El Yousfi Malak	02350779H		2009-06-16	0	t	f	3	131
412	Hijo	hombre	El Yousfi  Ibrahim	02321482T		2007-09-04	0	t	f	3	131
413	ESPOSO	hombre	Etchabi El Houssine	x5757683R		1967-10-10	0	t	f	3	130
414	Hija	mujer	Echatbi Oumnia	y0657116c		2004-04-25	0	t	f	3	130
415	Hija	mujer	Echatbi Wiam	y0657127P		2007-04-23	0	t	f	3	130
416	Hija	mujer	Echatbi Sabrina	y02354016N		2010-12-22	0	t	f	3	130
417	ESPOSO	hombre	Jimenez Felix	003959930C		1997-11-28	0	t	f	3	132
418	Hijo	hombre	Jimenez Nathanael	04736466F		2017-07-10	0	t	f	3	132
419	Hijo	hombre	Navarro Cruz Adonay	04736598R		2014-01-13	0	t	f	3	132
420	Hijo	hombre	Jimenez Nain	04736469x		2019-08-19	0	t	f	3	132
421	Esposo	hombre	Abad Jose Ortega	002659394L		1979-03-09	0	t	f	3	133
422	Hijo	hombre	Diego Ortega Lozano	...............		2015-02-13	0	t	f	3	133
423	Hijo	hombre	Brayan Ortega Lozano	...............		2019-03-17	0	t	f	3	133
424	Esposo	hombre	Redouan Boulaiz	x9894698y		1977-11-12	0	t	f	3	134
425	Hija	mujer	Lina Boulaiz	02323633N		2010-07-01	0	t	f	3	134
426	Hija	mujer	Layane Boulaiz	02353200R		2012-03-27	0	t	f	3	134
427	Hijo	hombre	Loujayne Boulaiz	y4986230M		2016-07-15	0	t	f	3	134
428	Hijo	hombre	Suhaik Boulaiz	y7088828N		2019-01-20	0	t	f	3	134
429	Hija	mujer	Mariana Paladines Durango		AT990814	2008-01-21	0	t	f	3	135
430	Hijo	hombre	Sabtiago Paladin Durango		AT474491	2012-02-04	0	t	f	3	135
431	Hijo	hombre	Adam Hadouchene	051549369k		2008-01-10	0	t	f	3	136
432	Hija	mujer	Rania Hadouchene	051545242 B		2010-08-21	0	t	f	3	136
433	Esposo	hombre	Jonathan Cortes Torosio	047023857N		1982-08-24	0	t	f	3	137
434	Hijo	hombre	Antonio Cortes	002350180V		2003-03-07	0	t	f	3	137
435	Hijo	hombre	Israel	002350673G		2004-06-11	0	t	f	3	137
436	Hijo	hombre	Angel	55314885T		2008-08-11	0	t	f	3	137
437	Hija	mujer	Samara Cortes	02354749D		2007-12-15	0	t	f	3	137
438	Hija	mujer	Samara Cortes	02354749D		2007-12-15	0	t	f	3	137
439	Hijo	hombre	Ezequiel Cortes	02354748P		2007-12-15	0	t	f	3	137
440	Hijo	hombre	Perez Huelves Javier	005256486C		1967-12-12	0	t	t	3	138
441	Hija	mujer	Diaz Garcia Noelia	02325522 S		2007-01-26	0	t	f	3	139
442	Hija	mujer	Diaz Garcia Noelia	02325522 S		2007-01-26	0	t	f	3	139
443	Hija	mujer	Diaz Garcia Noelia	02325522 S		2007-01-26	0	t	f	3	139
444	Hija	mujer	Diaz Garcia Noelia	02325522 S		2007-01-26	0	t	f	3	139
445	Hijo	hombre	Diaz Garcia Luis	02325523Q		2012-09-08	0	t	f	3	139
446	Hijo	hombre	Diaz Garcia Luis	02325523Q		2012-09-08	0	t	f	3	139
448	Hijo	hombre	Fernando Muñoz	054685091S		2003-01-09	0	t	f	3	140
523	Hijo	hombre	Daniel Sanchez	...............		2015-05-10	0	t	f	3	160
524	Esposo	hombre	Carlos Alberto Rangel		148510979	1987-07-30	0	t	f	3	161
450	Hijo	hombre	Jonathan Muñoz	051026562G		2003-11-09	0	t	f	3	140
451	Hija	mujer	Maria	.........		2006-09-13	0	t	f	3	140
452	Hija	mujer	Ainara	..........		2008-12-05	0	t	f	3	140
453	Esposa	mujer	Torres Malla Maria	044516664A		1980-09-23	0	t	f	3	141
454	Hijo	hombre	Torres Jesus	002353680k		2005-12-04	0	t	f	3	141
455	Hijo	hombre	Torres Juan Antonio	...............		2012-12-13	0	t	f	3	141
456	Esposa	mujer	Zineb	FQ1761479		1989-12-02	0	t	f	3	142
457	Hijo	hombre	Anas	y5434968j		1999-06-23	0	t	f	3	142
458	Hijo	hombre	Qousay	y7086154y		2018-12-02	0	t	f	3	142
459	Hijo	hombre	Jose Antonio Fernandez	51197009D		2001-06-29	0	t	f	3	143
460	Hija	mujer	Garcia Fernandez Sulamita	51197090X		2007-07-20	0	t	f	3	143
461	Hija	mujer	Garcia Fernandez Nazaret	...............		2010-12-29	0	t	f	3	143
462	Hija	mujer	Bruno Bruno Isabel	051024340J		2001-04-02	0	t	f	3	143
463	Hijo	hombre	Fernandez Bruno Ricardo	...............		2019-10-08	0	t	f	3	143
464	Pareja	mujer	Dumitran Naomi	x8944019D		1997-09-30	0	t	f	3	144
465	Hijo	hombre	Muñoz Eiden		PaJ840822	2019-08-01	0	t	f	3	144
466	Esposo	hombre	Akbib Abdelatif	y3618185T		1979-07-20	0	t	f	3	145
467	Hijo	hombre	Akbib Yassir	002353123Q		2012-06-22	0	t	f	3	145
468	Hijo	hombre	Akbib Yassin	002353124V		2012-06-22	0	t	f	3	145
469	Hijo	hombre	Akbib Iyad	y7038884R		2019-01-29	0	t	f	3	145
470	Esposa	mujer	El Kheir Rabha	50498013H		1959-01-01	0	t	f	3	146
471	Hija	mujer	Mejjaqui Samia	53479684S		2002-02-23	0	t	f	3	146
472	Hija	mujer	Mejjaqui Samia	53479684S		2002-02-23	0	t	f	3	146
473	Esposo	hombre	Abdeljalil Hammoumira	x2868054T		1978-01-01	0	t	f	3	147
474	Hijo	hombre	Hitach Ayman	54404001P		2006-09-30	0	t	f	3	147
475	Hijo	hombre	Hitach Achraf	54404002D		2008-01-01	0	t	f	3	147
476	Hija	mujer	Hammounira Nourmam	y2958270R		2013-03-30	0	t	f	3	147
477	Esposa	mujer	Latifa Laghmich	x9539983C		1987-09-25	0	t	f	3	148
478	Hijo	hombre	Mohammed Azzouz	Y3713840K		2014-08-12	0	t	f	3	148
479	Hijo	hombre	Ilyas Azzouz Laghmich	51744806G		2009-09-24	0	t	f	3	148
480	Hija	mujer	Ikhlas Azzouz Laghmich	03498981Z		2012-04-01	0	t	f	3	148
481	Hija	mujer	Inas Azzouz	...............		2020-01-07	0	t	f	3	148
482	Hijo	hombre	Iyaz Azzouz	y 9077370C		2021-08-25	0	t	f	3	148
483	Padre	hombre	Cristino Frios Rosario		49810996B	1962-04-13	0	t	f	3	149
484	Pareja	hombre	Socrates Solomon	Y0631514U		1981-03-27	0	t	f	3	149
485	Hijo	hombre	Darlin Rafael	y4896974G		2007-01-28	0	t	f	3	149
486	Hija	mujer	Odette Joselin Ramirez	y4896834X		2001-08-08	0	t	f	3	149
487	Hijo	hombre	Oscar Gabriel Benitez	Y 6326804R		2017-01-22	0	t	f	3	150
488	Hija	mujer	Eva Maria Benitez		MD0679775	2018-02-25	0	t	f	3	150
489	Esposo	hombre	Mirel Gavanescu	x4118572P		1974-11-14	0	t	f	3	151
490	Hija	mujer	Gavanescu Helen	02352710 V		2001-02-09	0	t	f	3	151
491	Hija	mujer	Gavanescu Marta	02324089P		2005-06-04	0	t	f	3	151
492	Hijo	hombre	Gavanescu Eric	y3050125V		2013-02-09	0	t	f	3	151
493	Hija	mujer	Bouras Kaouthar	y2224343G		1999-06-09	0	t	f	3	152
494	Esposo	hombre	Bouras Mustapha	x8519857J		1959-01-01	0	t	f	3	152
495	Hija	mujer	Bouras Nada	y2224306J		1998-06-11	0	t	f	3	152
496	Esposa	hombre	Rosario Vazquez	11852326N		1980-05-10	0	t	f	3	153
497	Hija	mujer	Yumalay Gonzalez	2325786A		2009-06-27	0	t	f	3	153
498	Esposo	hombre	Catalin Edi Csavlovits	x8855514P		1977-07-29	0	t	f	3	154
499	Hija	mujer	Emilia Timeea Csavlovits	y0574762Y		2001-10-15	0	t	f	3	154
500	Hija	mujer	Viven Ada	Y0574763Y		2004-09-30	0	t	f	3	154
501	Hijo	hombre	Eduard Csavlovits	y2149394N		2009-09-14	0	t	f	3	154
502	Hija	mujer	Sara Csavlovits	x5452294C		2014-03-20	0	t	f	3	154
503	Hijo	hombre	Dylan Rojas	7366853		2015-09-21	0	t	f	3	155
504	Esposo	hombre	Daniel Filip	x3526926z		1981-05-06	0	t	f	3	156
505	Hijo	hombre	Filip Marcos	...............		2008-12-09	0	t	f	3	156
506	Hijo	hombre	Filip Gabriel	...............		2014-04-24	0	t	f	3	156
507	Hijo	hombre	Filip Ruben	...............		2018-02-07	0	t	f	3	156
508	Hija	mujer	Tanisma Valery Julca	21600992Z		2007-10-02	0	t	f	3	157
509	Hijo	mujer	Janko Yardel Julca	216009923		2013-10-05	0	t	f	3	157
510	Hijo	hombre	Cojocea Alexandru	x09848589N		2001-12-20	0	t	f	3	158
511	Hija	mujer	Cojocea Andreea	x09848616Q		2004-04-18	0	t	f	3	158
512	Hijo	hombre	Cojocea Cornel	x8934009G		1975-05-16	0	t	f	3	158
513	Hijo	hombre	Cojocea Tabita	...............		2007-12-04	0	t	f	3	158
514	Hijo	hombre	Cojocea Samuel	...............		2012-10-03	0	t	f	3	158
515	Hijo	hombre	Cojocea Ruben	x9848569S		2000-04-01	0	t	f	3	158
516	Esposa	mujer	Fermina Luisa Inche	y8073693V		1983-03-15	0	t	f	3	159
517	Hija	mujer	Rojas Inche	002354338N		2020-11-03	0	t	f	3	159
518	Hijo	hombre	Rojas Huaraca David	119063586		2008-10-07	0	t	f	3	159
519	Suegra	mujer	Vizcarra Cruz Estefania	y8073693V		1954-01-01	0	t	f	3	159
520	Esposo	hombre	Daniel Sanchez Galan	70057288R		1990-05-21	0	t	f	3	160
521	Hija	mujer	Jaqueline Sanchez	...............		2008-12-01	0	t	f	3	160
522	Hija	mujer	Yanira Sanchez	...............		2010-03-05	0	t	f	3	160
525	Hija	mujer	Ashley Valentina Rangel		148510982	2015-10-12	0	t	f	3	161
526	Esposo	hombre	Badiu Petru	y2402603Z		1984-06-24	0	t	f	3	162
527	Hijo	hombre	Badiu Ionut	y 4215919K		2010-01-15	0	t	f	3	162
528	Hija	mujer	Badiu Ioana	y4216983Q		2015-03-18	0	t	f	3	162
529	Hija	mujer	Badiu Iudith		058194674	2019-09-07	0	t	f	3	162
530	Hija	mujer	Badiu Iasmina	x6556240N		2018-03-26	0	t	f	3	162
531	Esposa	mujer	Farcas Rodica	x9374262Z		1977-02-02	0	t	f	3	163
532	Hijo	hombre	Farcas Jose	x9374389A		2003-06-04	0	t	f	3	163
533	Hijo	hombre	Miquel Alberto Lopez	Y3920043Y		2001-02-05	0	t	f	3	164
534	Esposo	hombre	El Kbir Badine	x2727249R		1966-01-01	0	t	f	3	165
535	Hijo	hombre	Annani Aassarhoum	y5182896R		2016-09-09	0	t	f	3	167
536	Hijo	hombre	Karim Karim Mohammed	50487082N		1978-09-07	0	t	f	3	169
537	Esposo	hombre	Abdellah Karim	x1114444w		1975-11-11	0	t	f	3	170
538	Hijo	hombre	Badr Karim Batbouti	y4680222N		2016-02-28	0	t	f	3	170
539	Hija	mujer	Sahira Sosa	Y6944830V		2016-04-30	0	t	f	3	171
540	Esposo	hombre	Dayae Abdouh Azziddin	002352810T		1971-04-28	0	t	f	3	172
541	Hija	mujer	Dekra Deyae	009124617B		2008-02-01	0	t	f	3	172
542	Hija	mujer	Hala Deyae	009124616X		2006-09-07	0	t	f	3	172
543	Hijo	hombre	Jassim Deyae	y6660863P		2018-07-23	0	t	f	3	172
544	Hija	mujer	Deyae Gbalou Arwa	002324120Q		2010-10-24	0	t	f	3	172
545	Hija	mujer	Reina Saray Alejandra	...............		2009-10-06	0	t	f	3	173
546	Hija	mujer	Reina Carolayn Esilda	...............		2011-05-09	0	t	f	3	173
547	Hijo	hombre	Reina Eddy Aitor	...............		2015-10-31	0	t	f	3	173
548	Hijo	hombre	Piloso Reina Joshua Thiago	...............		2014-03-22	0	t	f	3	173
549	Esposo	hombre	Serban Daniel	x6825390W		1986-02-16	0	t	f	3	174
550	Esposo	hombre	Serban Daniel	x6825390W		1986-02-16	0	t	f	3	174
551	Hijo	hombre	Serban Eduard	...............		2013-03-24	0	t	f	3	174
552	Esposo	hombre	Omar Yaacoubi Haddou	002324288T		1965-05-15	0	t	f	3	175
553	Hijo	hombre	Mahdi	003540699X		2000-05-07	0	t	f	3	175
554	Hijo	hombre	Mohamed	002325423P		2001-11-18	0	t	f	3	175
555	Hija	mujer	Malika	X2591338G		1978-01-01	0	t	f	3	175
556	Hijo	hombre	Hassan	002325422F		2006-07-17	0	t	f	3	175
557	Esposa	mujer	Bouchra Serroukh	x6450335P		1986-11-20	0	t	f	3	176
558	Hijo	hombre	Narji Mallem	y1990743S		2011-07-15	0	t	f	3	176
559	Hijo	hombre	Nouh Mallem	y4587848Y		2015-12-30	0	t	f	3	176
560	Hijo	hombre	Adam Mallem	x9207604Z		2007-06-25	0	t	f	3	176
561	Esposa	mujer	Naima Boulaich	x64503132D		1964-01-01	0	t	f	3	177
562	Hijo	hombre	Abdenour Serrouk	x6119040M		1991-03-21	0	t	f	3	177
563	Hijo	hombre	Serroukh Abdeljabar	Ey 540314		1984-12-30	0	t	f	3	177
564	Hija	mujer	Assia	TY6841605		1986-01-17	0	t	f	3	177
565	Esposo	hombre	Rachid Haydah	x9211354B		1981-01-01	0	t	f	3	178
566	Hija	mujer	El Ahmadi Assia	BD9576893		1992-10-22	0	t	f	3	178
567	Hija	mujer	Ilona Nicole Leca	y6801718B		2018-07-15	0	t	f	3	181
568	Hija	mujer	Leca Alexia	Y4701091C		2016-01-02	0	t	f	3	181
569	Esposo	hombre	Leca Vasilica	Y2257894k		1984-05-19	0	t	f	3	181
570	Esposo	hombre	Alyousif Ahmad	y7441369D		1998-08-03	0	t	f	3	182
571	Hija	mujer	Alyousif Khadija	y7441443Z		2018-04-06	0	t	f	3	182
572	Esposa	mujer	Neascu Felicia		053691983	1966-07-20	0	t	f	3	183
573	Hijo	hombre	Eduard Daniel Neascu	x3352651x		1993-06-29	0	t	f	3	183
574	Esposo	hombre	Edison Rolando		1720238102	1990-08-06	0	t	f	3	184
575	Hijo	hombre	Jared Isaac Sanguncho		1757141724	2015-12-01	0	t	f	3	184
576	Hermana	mujer	Jessica Johana Quito		1720238078	1994-09-11	0	t	f	3	184
577	Padre	hombre	Eliberto Ontaheda Segundo	x4675934B		1972-03-05	0	t	f	3	184
578	Esposo	hombre	Eduard Poenaru	x2904041 S		1975-05-23	0	t	f	3	185
579	Hijo	hombre	Poenaru Salinas Ruben	003210033 S		2002-01-19	0	t	f	3	185
580	Hijo	hombre	Poenaru Salinas Hector	0032333041 T		2010-06-11	0	t	f	3	185
581	Esposo	hombre	El Moufid Abdelali	002352692E		1976-03-20	0	t	f	3	186
582	Hijo	hombre	El Moufid Reda	051538893X		2006-05-17	0	t	f	3	186
583	Hija	mujer	El Moufid Laila	055218348V		2014-02-27	0	t	f	3	186
584	Hijo	hombre	El Moufid Rehab	049394523E		2008-04-25	0	t	f	3	186
585	Hijo	hombre	El Moufid Rayan	y5089089P		2016-08-25	0	t	f	3	186
586	Hijo	hombre	Emmanuel Mizaico	002352611X		2019-02-10	0	t	f	3	187
587	Madre	mujer	Auria Mizaico Ucharima	D05500134		1962-07-19	0	t	f	3	187
588	Esposa	mujer	Nuria Ortega	08990821Y		1970-04-17	0	t	f	3	189
589	Hija	mujer	Claudia De La Vela	53757039J		1993-05-26	0	t	f	3	189
590	Hija	mujer	Dora Yahya Abdul	y7032978y		2008-01-01	0	t	f	3	190
591	Hija	mujer	Aya Yahya Abdul	y7032983B		2009-05-26	0	t	f	3	190
592	Hija	mujer	Tala Yahya Abdul	y 0732991L		2012-01-01	0	t	f	3	190
593	Hija	mujer	Ghina Yahya Abdul	y 07033014L		2018-05-28	0	t	f	3	190
594	Hijo	hombre	Leonel Andres	02729533P		2004-09-11	0	t	f	3	191
595	Madre	mujer	Delia Gabina	05978953B		1954-12-01	0	t	f	3	191
596	Hija	mujer	Lupan Noemi Sunamita	Y 1782370E		2007-10-10	0	t	f	3	192
597	Hija	mujer	Adelina Lidia Lupan	Y8691012Q		2021-03-12	0	t	f	3	192
598	Esposo	hombre	Ion Ilie Steblea	X09203058E		1961-12-11	0	t	f	3	193
599	Hijo	hombre	Meza Figueroa Adrian	Y5525013J		2016-07-08	0	t	f	3	194
600	Hija	mujer	Peralta Meza Daniela	G218959		2002-08-23	0	t	f	3	194
601	Esposo	hombre	Aboumerouane Mahboub	08006890S		1978-08-02	0	t	f	3	195
602	Hijo	hombre	Riad Lamrabet	35681742W		2017-02-01	0	t	f	3	195
603	Hijo	hombre	Yasser Lamrabet	3568743A		2018-04-25	0	t	f	3	195
604	Hijo	hombre	Firas Lamrabet	051032106M		2021-06-16	0	t	f	3	195
605	Esposo	hombre	Rincon Machado Geraldo	Y0343209 V		1977-04-27	0	t	f	3	196
606	Hijo	hombre	Rincon Jesus Gerardo		121912183	2014-08-01	0	t	f	3	196
607	Hijo	hombre	Rincon Angulo Pablo	...............		2021-02-06	0	t	f	3	196
608	Esposa	mujer	Celia Miriam Grajeda Navia	03178596L		1979-10-22	0	t	f	3	197
609	Hijo	hombre	Daniel Grajeda Navia	53756144S		2004-07-18	0	t	f	3	197
610	Hijo	hombre	Eliseo Canaviri Grajeda	...............		2015-08-30	0	t	f	3	197
611	Hija	mujer	Salome Hodaya	...............		2017-05-26	0	t	f	3	197
612	Esposo	hombre	Onofrei Viorel	x02527689N		1964-04-20	0	t	f	3	198
613	Madre	mujer	Rodriquez Primitiva	BFH153641		1956-06-09	0	t	f	3	202
614	Esposo	hombre	Ighiri Rachid	x1329560E		1965-01-31	0	t	f	3	203
615	Hija	mujer	Ighiri Yasmin	002323139R		2006-12-07	0	t	f	3	203
616	Hija	mujer	Ighiri Amira	002323140W		2011-01-03	0	t	f	3	203
617	Hija	mujer	Ighiri Ilham	002323694G		2008-08-30	0	t	f	3	203
618	Hijo	hombre	Ighiri Mohamed	Y7407660H		2019-05-23	0	t	f	3	203
619	Madre	mujer	Youna Zohra		DE9243504	1967-01-01	0	t	f	3	203
620	Padre	hombre	Mcaouri Lahcen	Y1035646Q		1958-01-01	0	t	f	3	203
621	Esposo	hombre	Milton Vargas Melgar	X8437836X		1986-07-07	0	t	f	3	204
622	Hijo	hombre	Aitor Vargas Cuzco	03505411G		2017-12-08	0	t	f	3	204
623	Hija	mujer	Paula Vargas Cuzco	35686026P		2020-12-15	0	t	f	3	204
624	Esposo	hombre	Aklouh Mimoun	X6354938S		1964-01-01	0	t	f	3	205
625	Hijo	hombre	Aklouh Hatim	y3895045D		2014-11-12	0	t	f	3	205
626	Hijo	hombre	Aklouh Adam	Y4269002D		2009-06-19	0	t	f	3	205
627	Hijo	hombre	Aklouh Yanis	...............		2021-12-03	0	t	f	3	205
628	Madre	mujer	Khlifa Fátima	X5826771C		1958-01-01	0	t	f	3	207
629	Hijo	hombre	Nicolás Gutiérrez Colorado	Y6061278X		2008-12-11	0	t	f	3	208
630	Hijo	hombre	Iker Adrián Gutiérrez	Y6061425L		2014-04-29	0	t	f	3	208
631	Esposo	hombre	Stivenson Gutiérrez Yerres	Y6061171H		1988-09-08	0	t	f	3	208
632	Esposo	hombre	Cámara Molina Davis	070079103N		1990-05-14	0	t	f	3	209
633	Hijo	hombre	Cámara Feliz Brady	002350190G		2006-06-19	0	t	f	3	209
634	Hijo	hombre	Cámara Feliz Brais	..........		2019-08-16	0	t	f	3	209
635	Esposa	mujer	Bout Hafida	X9119748H		1976-07-28	0	t	f	3	211
636	Hijo	hombre	Bout Anas	051249361W		2009-10-12	0	t	f	3	211
637	Hijo	hombre	Bout Marouane	051246196B		2011-04-18	0	t	f	3	211
638	Hija	mujer	Bout Soufiane	009230458Y		2015-03-16	0	t	f	3	211
639	Esposa	mujer	Kousar Sajida	Y8850973N		1975-10-07	0	t	f	3	212
640	Hijo	hombre	Muhammad Ehsan	Y8851482S		2001-02-06	0	t	f	3	212
641	Hijo	hombre	Muhannad Zain		AJ5903022	2005-06-18	0	t	f	3	212
642	Hija	mujer	Afzal Malaika		DA1514272	2010-06-20	0	t	f	3	212
643	Hijo	hombre	Afzal Mahnor		CD1516902	2008-08-26	0	t	f	3	212
644	Esposo	hombre	Bennasser Bitane	X3891057D		1976-01-01	0	t	f	3	213
645	Hijo	hombre	Mohamed Reda Hitach	02322111P		2009-08-28	0	t	f	3	213
646	Hija	mujer	Walaa Bitane Hitach	54976415K		2016-11-25	0	t	f	3	213
647	Hijo	hombre	Omar Bitane Hitach	54352786R		2004-11-04	0	t	f	3	213
648	Esposo	hombre	El Amiri Samir	X6876562E		1981-02-10	0	t	f	3	214
649	Hija	mujer	El Amiri Bayari Marwa	055242834P		2011-08-10	0	t	f	3	214
650	Hijo	hombre	El Amiri Bayari Safwan	002354456S		2014-10-21	0	t	f	3	214
651	Hija	mujer	El Amiri Salma	y5504041V		2017-04-02	0	t	f	3	214
652	Hija	mujer	El Amiri Youseef	Y7026948W		2019-01-22	0	t	f	3	214
653	Esposo	hombre	Dominguez Martin Francisco	050881525M		1981-09-08	0	t	f	3	215
654	Hija	mujer	Dominquez Garcia Saray	002353997Q		2007-07-28	0	t	f	3	215
655	Hijo	hombre	Dominquez Garcia Francisco	002354067V		2012-09-03	0	t	f	3	215
656	Hija	mujer	Dominquez Garcia Pilar	...............		2017-08-02	0	t	f	3	215
657	Hija	mujer	Dominquez Garcia Carmen	...............		2019-07-02	0	t	f	3	215
658	Esposo	hombre	Aouladhajali Lahssen	X6521809K		1974-01-01	0	t	f	3	216
659	Hija	mujer	Aoulad Hajali Malak	002324462J		2008-08-09	0	t	f	3	216
660	Hija	mujer	AouladHajali Ali Saidi Dina	004736415W		2015-11-22	0	t	f	3	216
661	Hija	mujer	AouladHajali Ali Saidi Kamal	004736416A		2018-02-26	0	t	f	3	216
662	Esposo	hombre	Gutierrez Romero Igor	Y90000723D		1984-01-09	0	t	f	3	218
663	Hijo	hombre	Gutierrez Jimenez Christopher	Y9000774Z		2010-11-27	0	t	f	3	218
664	Hijo	hombre	Gutierrez Jimenez Thiago Alessandro	Y9000769D		2016-04-28	0	t	f	3	218
666	Hija	mujer	Zamora Alvarado Natalia Gabriela		118050744	2005-03-16	0	t	f	3	219
665	Hija	mujer	Zamora Alvarado Fabiola		118057796	2006-06-23	0	t	f	3	219
667	Madre	mujer	Saldaña Anaya Nelida	x813478G		1952-05-22	0	t	t	3	220
668	Hijo	hombre	Salazar Salas Andrew Gael	002352371T		2018-05-15	0	t	f	3	220
669	Esposa	mujer	Matos de Escalona Milanyela	Y9266118F		1983-03-23	0	t	f	3	227
670	Hijo	hombre	Escalona Matos Andres Manuel	Y9266418F		2014-04-19	0	t	f	3	227
671	Hija	mujer	Carvajal Matos Joliet	y9266407C		2000-10-04	0	t	f	3	227
672	Hija	mujer	Escalona Matos Anyela Yerismar	Y9266412w		2006-12-21	0	t	f	3	227
673	Hijo	hombre	Heredia Lopez Ronaldo Junior		050367259L	2010-06-13	0	t	f	3	228
674	Hijo	hombre	Heredia Lopez Jeremy	...............		2013-11-23	0	t	f	3	228
675	Hija	mujer	Heredia Lopez Juliet	...............		2015-11-19	0	t	f	3	228
676	Hijo	hombre	Lopez Rivera Oscar Andres	...............		2020-07-08	0	t	f	3	228
677	Hijo	hombre	Benya Ahmed		CM4913865	2016-03-18	0	t	f	3	233
678	Hija	mujer	Benyamna Farida		KT6826513	2011-10-07	0	t	f	3	233
679	Hija	mujer	Bebyamna Marwa		YI0386148	2019-09-02	0	t	f	3	233
680	Hijo	hombre	Benyamna Mohammad		ZL8913739	2021-09-17	0	t	f	3	233
681	Esposo	hombre	Afakir Mohammad	X5672059Y		1985-04-26	0	t	f	3	234
682	Hijo	hombre	Landivar Costales Alberto	Y9405631W		2014-03-18	0	t	f	3	235
684	Hija	mujer	Mendez Steicy Montserrath		375501959	2017-07-04	0	t	f	3	238
683	Esposo	hombre	Cruz Ramirez Efren Agustin		296303216	1996-02-21	0	t	f	4	238
685	Esposo	hombre	Fernandez Perez Isaac	071279469P		1976-12-04	0	t	f	3	241
686	Hija	mujer	Fernandez Garcia Joana	051010601M		2000-01-13	0	t	f	3	241
687	Hija	mujer	Fernandez Garcia Andi	006007401P		2008-11-08	0	t	f	3	241
688	Hijo	hombre	Fernandez Garcia Jesus	51033612Q		2020-12-08	0	t	f	3	242
689	Esposo	hombre	Abdennebi Bourbah El Bajji	55515691Q		1959-01-01	0	t	f	3	244
690	Hijo	hombre	Bourbah Chari Bard	04736456C		2018-10-26	0	t	f	3	244
691	Hija	mujer	Bourbah Chari  Safae	04736455L		2015-08-21	0	t	f	3	244
692	Hija	mujer	Bourbah Chaymae	x9705334R		2000-10-28	0	t	f	3	244
693	Hija	mujer	Khadija Bourbah	x9705312w		1997-11-11	0	t	f	3	244
694	Hija	mujer	Salma Bourbah Chari	04736167F		2005-01-08	0	t	f	3	244
695	Esposa	mujer	Carrillo Perez Vanesa	165944368		1988-10-29	0	t	f	3	245
696	Hijo	hombre	Rios Carrillo  Esteban Mathias	167419332		2018-04-25	0	t	f	3	245
697	Hijo	hombre	Rios Carrillo Esteban Isaac	167419329		2021-03-12	0	t	f	3	245
698	Hija	mujer	Garcia Fernandez Adaray	51033610Z		2016-08-10	0	t	f	3	246
699	Esposa	mujer	Fernandez Gabarri Juana	052871026Y		1975-11-23	0	t	f	3	248
700	Hija	mujer	Heredia Mercedes Fernandez	051029609S		2005-03-01	0	t	f	3	248
701	Hija	mujer	Yaret Heredia Fernandez	055616235G		2008-01-27	0	t	f	3	248
702	Hija	mujer	Samara  Heredia Fernandez	00000		2010-09-20	0	t	f	3	248
703	Hija	mujer	Nayara Heredia  Fernadez	051022258R		1996-12-06	0	t	f	3	248
704	Esposo	hombre	Flores Hernandez Luis Joan	002307351Z		1992-02-19	0	t	f	3	249
705	Hijo	hombre	Mark Sanche Matute	0000000		2014-11-29	0	t	f	3	250
706	Hija	mujer	Aroa Sanchez Matuto	0000000		2014-11-29	0	t	f	3	250
707	Esposo	hombre	Moutatahhir Essobti	02322712B		1967-04-20	0	t	f	3	251
708	Hijo	hombre	Moutatahhir Laaouej Marua	02323704Z		2014-12-20	0	t	f	3	251
709	Hijo	hombre	Moutatahhir Laaouej Zakaria	02323105J		2005-04-21	0	t	f	3	251
710	Hijo	hombre	Moutatahhir Mohamed Amin	02323106Z		2009-10-21	0	t	f	3	251
711	Hija	mujer	Moutatahhir Safaa	02323584D		2013-03-05	0	t	f	3	251
712	Hija	mujer	Popo Toloza Laura Sofia	Aw816527		2012-10-03	0	t	f	3	252
713	Hija	mujer	Popo Toloza Laura Sofia	Aw816527		2012-10-03	0	t	f	3	252
714	Esposo	hombre	Popo Popo Alvaro	Aw757296		1974-08-02	0	t	f	3	252
\.


--
-- Data for Name: adra_persona; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".adra_persona (id, nombre_apellido, dni, otros_documentos, fecha_nacimiento, numero_adra, nacionalidad, covid, domicilio, are_acte, ciudad, telefono, email, mensaje, active, created_at, updated_at, sexo, discapacidad, codigo_postal, empadronamiento, libro_familia, fotocopia_dni, prestaciones, nomnia, cert_negativo, aquiler_hipoteca, recibos, modificado_por_id) FROM stdin;
119	Lakchouch Bensaid Bouchra		51014424x	1979-10-25	1	España	f	Cañada real galiana	t	Madrid	632147874			t	2022-11-04 20:41:39.999915+00	2022-11-04 20:41:39.999934+00	mujer	f	28031	t	t	t	t	f	f	f	f	3
142	Abdeljaouad Serrouk	x6450356y		1988-02-24	28	Marruecos	f	Rd.Almendros	f	Arganda  del Rey	602878016		baja	t	2022-11-10 19:46:24.691731+00	2022-11-10 19:46:24.69175+00	hombre	f	28500	t	t	t	f	f	f	f	f	3
120	Fernandez Mendoza Ricardo	00263121 R		1934-03-03	2	Española	f	Camino del molino	t	Arganda	656648797		06/09/2020-fecha alta beneficiario.\r\nLa nieta vive con ellos ,esta añadida como hija	t	2022-11-04 21:03:12.780043+00	2022-11-04 21:03:12.780061+00	hombre	f	28500	t	f	t	t	f	f	f	f	3
152	Jamila Makhchan	x7715564F		1964-01-01	35	Marruecos	f	Calle Canoa	f	Arganda  del Rey	663530495		*Papeles de las hijas ...son mayores de edad ....(certificado de estudiantes )	t	2022-11-11 18:13:41.067502+00	2022-11-11 18:13:41.067524+00	mujer	f	28500	t	f	t	t	f	f	f	t	3
122	Lubna Fouzi Al Ghazali	Y 6943024M		1978-05-02	6	SIRIA	f	C/San Jose	t	Arganda  del Rey	643941084			t	2022-11-05 09:33:35.926518+00	2022-11-05 09:33:35.926539+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
123	Safia Hassani El Mhamdi		X7530651 Z	1984-03-01	7	Marruecos	f	Calle Miquel de Unamuno	t	Arganda  del Rey	602078629			t	2022-11-05 09:49:52.482963+00	2022-11-05 09:49:52.482981+00	mujer	f	28500	t	t	t	t	t	f	f	f	3
143	Ascension Fernandez Vazquez	070061197T		1980-11-20	29	Española	f	C7VELERO	t	Arganda  del Rey	660833054		el marido esta en prision	t	2022-11-10 19:52:26.698563+00	2022-11-10 19:52:26.698581+00	mujer	f	28500	t	t	t	f	f	f	f	f	3
125	Fernandez Vazquez Ricardo	070061198 R		1983-02-26	9	Española	f	Calle Velero	t	Arganda  del Rey	610993710		Adaray es nieto no hijo ...	t	2022-11-05 10:04:47.402693+00	2022-11-05 10:04:47.402713+00	hombre	f	28500	t	t	t	t	f	f	f	f	3
126	Gonzalez Gonzalez Maria	004206640 D		1975-10-24	10	Española	f	Calle Velero	t	Arganda  del Rey	643954610			t	2022-11-05 10:19:59.155162+00	2022-11-05 10:19:59.15518+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
124	Mohammed Hassani		TP 3606364	1985-07-25	8	Marruecos	f	Avenida del Ejercito 43	f	Arganda  del Rey	641633082			t	2022-11-05 10:01:36.394543+00	2022-11-05 10:01:36.394574+00	hombre	f	285000	t	f	t	f	f	f	f	f	3
144	Muñoz Garcia Juaquin	70065846A		1991-01-01	32	Española	f	C/Miquel de servantes	f	villarejo de salvanes	642551879			t	2022-11-10 20:01:27.26441+00	2022-11-10 20:01:27.264447+00	hombre	f	28590	f	f	t	f	f	f	f	f	3
121	Curcan Maria	x5461419T		1955-05-31	3	Rumana	f	Calle Maestro Miquel Chicote	t	Arganda	636277742			t	2022-11-04 21:11:50.068719+00	2022-11-04 21:11:50.068744+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
127	Remedios Heredia Gonzalez	70081253T		1986-11-24	11	Española	f	PZ.DE COLON 10	t	Arganda  del Rey	603604971			t	2022-11-07 19:44:44.132967+00	2022-11-07 19:44:44.132992+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
128	Said El Mankoury El Khiari	02352494P		1977-10-01	13	Española	f	C/Baranquillo 26	t	Arganda  del Rey	634923351		Titulo familia numerosa	t	2022-11-09 19:17:31.025442+00	2022-11-09 19:17:31.025465+00	hombre	f	28500	t	t	t	t	f	f	f	f	3
129	Ahmed Dahbi	x7793653B		1982-04-23	15	Marruecos	f	C/SAN JUAN	t	Campo Real	606548498			t	2022-11-09 19:25:12.765162+00	2022-11-09 19:25:12.765186+00	hombre	f	28510	t	t	t	t	t	f	f	f	3
130	Dehak Ep Echatbi Bouchra		y0657104P	1974-07-14	17	Marruecos	f	C/VELERO	t	Arganda  del Rey	685200467			t	2022-11-09 19:31:57.430742+00	2022-11-09 19:31:57.430763+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
131	Aziza Zine	x4604821Z		1966-10-25	16	Marruecos	f	c/mayor	t	Perales de Tajuña	671826257			t	2022-11-09 19:34:07.669264+00	2022-11-09 19:34:07.669284+00	mujer	f	28540	t	t	t	t	f	f	f	f	3
132	Navarro Cruz Samara	051558717P		1997-01-21	18	Española	f	C/VELERO	t	Arganda  del Rey	611158988			t	2022-11-09 19:44:33.416777+00	2022-11-09 19:44:33.416795+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
133	Lozano Jimenez Soledad	012339654Q		1984-10-09	19	Española	f	AV Londres	t	Arganda  del Rey	605426016			t	2022-11-09 19:52:37.122585+00	2022-11-09 19:52:37.122606+00	mujer	f	28500	t	t	t	t	t	f	f	f	3
134	Halima Debdi	x90115660 M		1983-11-11	20	Marruecos	f	C/DULCINEIA DEL TOBOSA	t	Arganda  del Rey	631062619			t	2022-11-09 19:58:50.0926+00	2022-11-09 19:58:50.092623+00	mujer	f	28500	t	t	t	t	t	f	f	f	3
145	Jamila Naji	x7413163X		1982-09-17	33	Marruecos	f	cm del molino	t	Arganda  del Rey	642519378			t	2022-11-10 20:05:59.982664+00	2022-11-10 20:05:59.982684+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
135	Maria Liliana Durango	AT990816		1985-04-02	21	colombia	f	c/Maestro Miquel Chicote	t	Arganda  del Rey	693928989		*modificar nacionalidad	t	2022-11-09 20:43:36.129935+00	2022-11-09 20:43:36.129953+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
136	Anissa Hadouchene	648228542A		1966-02-20	22	Marruecos	f	c/velero	t	Arganda  del Rey	631653771			t	2022-11-10 12:38:56.448528+00	2022-11-10 12:38:56.44855+00	mujer	f	28500	t	t	t	t	f	t	f	t	3
137	Pilar Silva Vargas	070079834F		1987-11-12	23	Española	f	c/velero	t	Arganda  del Rey	688328929			t	2022-11-10 12:42:36.922651+00	2022-11-10 12:42:36.922679+00	mujer	f	28500	t	t	f	t	f	f	f	f	3
138	Huelves Josefa	00353043Q		1939-11-20	24	Española	f	CM MOLINA	f	Arganda  del Rey	643981018		EL HIJO TIENE ESQUISOFRENIA...LE FALTA POR TRAER EL CARNET DE DISCAPACIDAD	t	2022-11-10 13:05:45.830944+00	2022-11-10 13:05:45.830967+00	mujer	f	28500	t	t	f	f	f	f	f	f	3
139	Garcia Pacheco Susana	051932774Q		1971-06-21	25	Española	f	PZA MARINA	t	Arganda  del Rey	633216882			t	2022-11-10 13:12:08.182921+00	2022-11-10 13:12:08.182944+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
140	Maria Muñoz Muñoz	050983391 E		1978-05-13	26	Española	f	C/CANOA	f	Arganda  del Rey	611143545			t	2022-11-10 13:19:57.780426+00	2022-11-10 13:19:57.78045+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
141	Fernandez Vazquez Rafael	051943638R		1975-06-11	27	Española	f	C/VELERO	t	Arganda  del Rey	651121751		EL Hijo Juan Antonio no tiene dni .	t	2022-11-10 19:40:35.120826+00	2022-11-10 19:40:35.120846+00	hombre	f	28500	t	t	t	t	f	f	f	f	3
146	Abdeslam Mejjaqui	538003550		1956-05-11	36	Marruecos	f	C/cementerio	t	28530	602338229			t	2022-11-10 20:17:48.575256+00	2022-11-10 20:17:48.575275+00	hombre	f	28530	t	t	t	t	f	f	f	f	3
147	Karima Hitach	x7212499k		1984-05-15	38	Marruecos	f	Cañada real de merinas	t	Madrid	612508524			t	2022-11-10 20:22:23.679374+00	2022-11-10 20:22:23.679393+00	mujer	f	28052	t	t	t	t	f	f	f	f	3
148	Mohammed Azzouz	X2699358D		1976-01-01	40	Marruecos	f	CALLE DEL RIO EBRO	t	NAVALCARNERO	600017138			t	2022-11-10 20:33:38.320889+00	2022-11-10 20:33:38.320907+00	hombre	f	28600	t	t	t	t	f	f	f	f	3
149	Y esenia Frias Victoriano	x9848460K		1985-06-02	42	REP.DOMINICANA	f	C/ Cancion del Olivo	t	Madrid	663428033			t	2022-11-10 20:46:48.544827+00	2022-11-10 20:46:48.54485+00	mujer	f	28041	t	f	t	t	f	f	f	f	3
153	Moises Gonzalez Gonzalez	03981775N		1985-11-27	46	Española	f	C/CANOA	t	Arganda  del Rey	643358683			t	2022-11-11 18:19:45.683556+00	2022-11-11 18:19:45.683573+00	hombre	f	28500	t	t	t	t	f	f	f	f	3
150	Zulay Maria Benitez	Y3689582M		1988-05-16	45	REP.DOMINICANA	f	CALLE DE LA COALICION	t	VILLAVERDE BAJO	631009715		*HERMANA DE LA POVEDA\r\n*MADRE SOLTERA	t	2022-11-10 21:02:18.011757+00	2022-11-10 21:02:18.01178+00	mujer	f	28041	t	t	t	f	f	f	f	f	3
151	Nicoleta Curcan	02352607y		1981-02-21	43	Española/rumana	f	C/TRES	f	FUENTIDUEÑA	649002292			t	2022-11-11 18:06:39.217674+00	2022-11-11 18:06:39.217696+00	mujer	f	28597	t	t	t	f	f	f	f	f	3
154	Valentina Valer Csavlovits	y0574716 y		1980-04-13	48	Rumana	f	Calle Palomares	t	Madrid	662424429			t	2022-11-11 18:28:27.345937+00	2022-11-11 18:28:27.345959+00	mujer	f	28021	t	t	t	t	f	f	t	f	3
155	Mirta Iris Rojas	y153933D		1971-01-31	49	HONDURAS	f	PZA MAYOR	f	Morata de Tajuña	686207473		MADRE SOLTERA	t	2022-11-11 18:38:53.565141+00	2022-11-11 18:38:53.565162+00	mujer	f	28530	t	f	t	f	f	f	f	f	3
156	Curcan Corina	x5103215k		1986-06-28	50	Rumana	f	Calle Cruz de Orozco	t	Morata de Tajuña	630754208			t	2022-11-11 18:44:54.73349+00	2022-11-11 18:44:54.733509+00	mujer	f	28530	f	t	f	t	f	f	f	f	3
157	Ana Cecilia Julca Tirado	118465638		1987-09-09	51	Peru	f	Calle de del Manojo De Rosas	f	Madrid	603161417		*hermana Poveda	t	2022-11-11 18:52:01.103557+00	2022-11-11 18:52:01.103578+00	mujer	f	28041	t	f	t	f	f	f	f	f	3
158	Simona Petruta Cojocea	643516970		1979-06-29	53	Rumana	f	C/Santiago Ramon y Cajal	t	Humanes	643516970			t	2022-11-12 14:10:04.622205+00	2022-11-12 14:10:04.622228+00	mujer	f	28970	t	t	t	t	f	f	f	f	3
159	David Lester Rojas	119062724		1983-02-22	54	Peru	f	C/de la hoz	f	Arganda  del Rey	697737790		pendiente  volante y nomina	t	2022-11-12 14:19:47.941992+00	2022-11-12 14:19:47.94201+00	hombre	f	28500	f	t	t	t	f	f	f	f	3
160	Maria del Carmen Iglesia Gonzalez	51511109X		1992-09-20	55	Española	f	C/VELERO	f	Arganda  del Rey	643660603			t	2022-11-12 14:28:08.783274+00	2022-11-12 14:28:08.783295+00	mujer	f	28500	f	t	t	f	f	f	f	f	3
161	Luz Marina Velazquez Suarez	y7567151G		1992-01-12	56	Venezuela	f	C/Santa Ana	t	Arganda  del Rey	684304927			t	2022-11-12 14:34:09.502709+00	2022-11-12 14:34:09.502733+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
162	Badiu Adriana Raluca	y3883416H		1986-07-14	57	Rumana	f	C/Jimenez e Iglesias	t	Getafe	642688312			t	2022-11-12 14:38:59.548227+00	2022-11-12 14:38:59.548249+00	mujer	f	28903	t	t	t	f	f	f	f	f	3
163	Farcas Iosif	x6689184W		1971-11-19	58	Rumana	f	Calle Maestro Miquel Chicote	t	Arganda  del Rey	634032845			t	2022-11-12 14:46:38.755813+00	2022-11-12 14:46:38.755834+00	hombre	f	28500	t	t	t	t	f	f	f	f	3
164	Josefina Romero Feliz	Y3419403K		1965-05-12	60	REP.DOMINICANA	f	Calle Mar C antabrico	t	Arganda  del Rey	665385582			t	2022-11-12 14:50:15.065143+00	2022-11-12 14:50:15.065166+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
165	Khadija Jaki Bahij	02338179E		1966-09-06	61	Española	f	Calle Almendros	f	Morata de Tajuña	605418952			t	2022-11-12 14:53:06.59011+00	2022-11-12 14:53:06.590133+00	mujer	f	28530	t	f	t	f	f	f	f	f	3
166	Rogelio Gaspar Lugo	y7338638L		1970-04-14	62	colombia	f	Calle de la cidra	t	Madrid	603252400		*hermano poveda	t	2022-11-12 14:58:54.003652+00	2022-11-12 14:58:54.003677+00	hombre	f	28027	t	f	t	f	f	f	f	f	3
167	Halima Grat	x3890971 S		1971-09-07	63	Marruecos	f	C/Virgen del Rosario	t	Arganda  del Rey	679326535			t	2022-11-12 15:01:01.382515+00	2022-11-12 15:01:01.382537+00	mujer	f	28500	t	f	t	t	f	f	f	t	3
168	Mahdi Jabir	Y6250476X		1997-02-26	64	Marruecos	f	Calle Miralparque	f	Arganda  del Rey	643091723			t	2022-11-12 15:04:24.698307+00	2022-11-12 15:04:24.698329+00	hombre	f	28500	f	f	t	f	f	f	f	f	3
169	Fatima Karim Touil	70066808E		1953-01-01	68	Española	f	Calle del Ciego	t	Morata de Tajuña	642353697			t	2022-11-12 15:06:58.606326+00	2022-11-12 15:06:58.606344+00	mujer	f	28530	t	f	t	f	f	f	f	f	3
170	Batbouti Zahra	X7492089T		1980-01-01	67	Marruecos	f	Calle Carretera del Poniente	f	Morata de Tajuña	677259111		*alimentos carritas	t	2022-11-12 15:12:03.145318+00	2022-11-12 15:12:03.145342+00	mujer	f	28530	f	f	t	t	f	f	f	f	3
171	Lorena Sosa	X5617294G		1980-08-10	73	Venezuela	f	Avda.Andalucia	t	Arganda  del Rey	632763573			t	2022-11-13 19:27:05.429863+00	2022-11-13 19:27:05.429884+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
172	Nisrin Gbalou	x606047C		1984-08-02	74	Española	f	Calle Jupiter	t	Arganda  del Rey	637154891		*lleva con adra desde 2015\r\nPEDIR CERTIFICADO DE LA TRABAJADORA SOCIAL	t	2022-11-13 19:32:52.777369+00	2022-11-13 19:32:52.777391+00	mujer	f	28500	f	t	f	t	f	f	f	f	3
173	Joselin Rocio Reina	x9418772L		1992-04-28	75	Ecuador	f	Calle Virgen del Carmen	f	Arganda  del Rey	685567150		*poner los dni de los hijos	t	2022-11-13 19:45:28.868714+00	2022-11-13 19:45:28.868735+00	mujer	f	28500	f	f	f	f	f	f	f	f	3
174	Monica Carmen Matasaru	x9279835W		1981-03-06	76	Rumana	f	Calle Maesto Miquel Chicote	f	Arganda  del Rey	642259611		*pendiente traer nomina marido	t	2022-11-14 20:12:23.044643+00	2022-11-14 20:12:23.044666+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
175	Omar El Yaacoubi Tahiri Sanae	002324290W		1997-06-17	77	Marruecos	f	C/Monte Igueldo	t	Arganda  del Rey	631010957			t	2022-11-14 20:16:36.994997+00	2022-11-14 20:16:36.995021+00	hombre	f	28500	t	t	t	f	f	f	f	f	3
176	Abdellatif Mallem	x3842405W		1977-04-21	78	Marruecos	f	Calle Canoa	t	Arganda  del Rey	632508838			t	2022-11-14 20:23:38.219531+00	2022-11-14 20:23:38.219554+00	hombre	f	28500	t	t	t	t	f	f	f	f	3
177	Abdeslam Serroukh	x4178842H		1959-01-01	79	Marruecos	f	C/VELERO	t	Arganda  del Rey	632731956		* mirar el expediente ..los niños son adultos todos	t	2022-11-14 20:32:13.173928+00	2022-11-14 20:32:13.173961+00	hombre	f	28500	t	f	t	t	f	f	f	f	3
178	Nabila El Ahmadi	XD4379039		1989-04-15	80	Marruecos	f	C/Grupo Escolar	t	Arganda  del Rey	632224435		LA HIJA ESTA ESTUDIANDO SEPA	t	2022-11-15 15:29:41.078074+00	2022-11-15 15:29:41.078098+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
179	Rahma Hichou Bajali	002304339S		1953-01-01	83	Española	f	C/VELERO	t	Arganda  del Rey	643837701			t	2022-11-15 15:37:36.915307+00	2022-11-15 15:37:36.915329+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
180	Guerrero Gautier Diego	50842631G		1969-06-08	84	Española	f	Calle Maestro Miquel Chicote	f	Arganda  del Rey	722539492			t	2022-11-15 15:39:32.716811+00	2022-11-15 15:39:32.716835+00	hombre	f	28500	f	f	t	f	f	f	f	t	3
181	Petre Nicoleta	Y1525111H		1987-03-13	86	Rumana	f	PZA.PINTOR GOYA	f	CIEMPOZUELO	666724862			t	2022-11-15 15:42:08.606088+00	2022-11-15 15:42:08.606111+00	mujer	f	28350	t	t	t	t	f	f	f	f	3
182	Alyousif Fatimah	Y7441418N		2001-01-03	88	SIRIA	f	Calle san jose	f	Arganda  del Rey	631735783			t	2022-11-15 15:47:17.577325+00	2022-11-15 15:47:17.57735+00	mujer	f	28500	t	f	t	f	f	f	f	f	3
183	Ion Neacsu	x1826381C		1963-10-14	89	Rumana	f	C/ Villaescusa	t	Nuevo Bastan	685499106			t	2022-11-15 15:51:51.962029+00	2022-11-15 15:51:51.962053+00	hombre	f	28514	t	t	t	t	f	f	f	f	3
184	Fanny Rocio Sangucho Oña		1725474066	1990-03-07	90	Ecuador	f	Calle Benimanent	f	Madrid	722323611			t	2022-11-15 15:57:25.557618+00	2022-11-15 15:57:25.557649+00	mujer	f	28021	t	f	t	f	f	f	f	f	3
185	Salinas Ortiz Almudena	46880216y		1978-11-15	91	Española	f	C/Cerro	t	Azuqueca	642704738		parte medico incapacidad temporal	t	2022-11-15 16:32:23.547447+00	2022-11-15 16:32:23.547474+00	mujer	f	19209	t	t	t	t	f	f	f	f	3
186	Loubna El Faik Dadouche	002352691K		1981-08-20	92	Española	f	Calle Real	f	Arganda  del Rey	631282020			t	2022-11-15 16:37:18.4898+00	2022-11-15 16:37:18.489844+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
187	Paredes Mizaico Elizabeth	054268106		1981-03-27	93	Española	f	Calle Maestro Miquel Chicote	t	Arganda  del Rey	675839704			t	2022-11-16 14:30:01.497357+00	2022-11-16 14:30:01.497381+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
188	Russo Blanco Rafael  Antonio	Y6792633B		1986-09-08	94	Venezuela	f	C/Ayamonte	t	Arganda  del Rey	602625414			t	2022-11-16 14:35:43.726072+00	2022-11-16 14:35:43.726097+00	hombre	f	28500	t	f	t	f	f	f	f	f	3
189	Miguel De La Vela	05391394X		1963-01-26	95	Española	f	AVD.NAPOLES	t	Nuevo Bastan	683427663			t	2022-11-16 14:37:59.632279+00	2022-11-16 14:37:59.632303+00	hombre	f	28514	f	t	t	t	f	f	f	f	3
190	Bushra Sameer Altaleb	Y 7032916J		1989-01-08	96	SIRIA	f	C /Hospital	f	Madrid	672773958			t	2022-11-16 14:43:48.438612+00	2022-11-16 14:43:48.438636+00	mujer	f	28021	f	f	t	f	f	f	f	f	3
191	Jaris Aliht Tarragona Pareja	05978952X		1967-10-02	97	Uruguay	f	Calle	f	Madrid	628265773			t	2022-11-16 16:23:50.144103+00	2022-11-16 16:23:50.144125+00	mujer	f	0	f	f	t	f	f	f	f	f	3
192	Ana Maria Reghin Lupan	x7694764E		1978-09-29	98	Rumana	f	C/Virgen del Pilar	t	Arganda  del Rey	642490531			t	2022-11-16 16:30:58.092536+00	2022-11-16 16:30:58.09256+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
193	Ilie Steblea Gabriela	X09202377P		1969-09-09	99	Rumana	f	C/Villamayor	t	Nuevo Bastan	638250828			t	2022-11-16 16:35:16.585723+00	2022-11-16 16:35:16.585747+00	mujer	f	28514	t	f	t	t	f	f	f	f	3
194	Noelia Francisca	Y4291945K		1982-06-21	100	HONDURAS	f	C/Real	t	Arganda  del Rey	632729723		*madre soltera	t	2022-11-16 16:38:09.553944+00	2022-11-16 16:38:09.553967+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
195	Maria Lamrabet	Y 4410339B		1985-10-18	101	Marruecos	f	C/Virgen de las Mercedes	t	Arganda  del Rey	627118623			t	2022-11-16 16:43:48.546724+00	2022-11-16 16:43:48.546748+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
196	Angulo Romero Marta	121912251		1990-08-08	102	Venezuela	f	C/Siete Vientos	t	Arganda  del Rey	642574334			t	2022-11-16 16:58:58.014021+00	2022-11-16 16:58:58.014047+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
197	Ronal Canaviri Marca	x8823009W		1973-03-06	104	Bolivia	f	Calle de Santa Cristina	f	Madrid	631211287			t	2022-11-16 17:16:34.821804+00	2022-11-16 17:16:34.821846+00	mujer	f	28021	t	t	t	t	f	f	f	f	3
198	Onofrei Mirela	X03491841G		1967-07-22	105	Rumana	f	Avda.Oporto	t	Nuevo Bastan	642350174			t	2022-11-16 17:22:44.582553+00	2022-11-16 17:22:44.582578+00	mujer	f	28514	t	f	t	t	f	f	f	f	3
199	Farida Hadi El Ghazbzouri	45306818S		1996-04-17	106	Española	f	C/SAN JOSE	f	Arganda  del Rey	641274387			t	2022-11-16 17:26:24.348676+00	2022-11-16 17:26:24.348699+00	mujer	f	28500	f	f	t	t	f	f	f	f	3
200	Idram Choaib Lhassan	55296414K		1953-01-01	107	Marruecos	f	C/Alcalde Jose Maria De Las Heras	f	Morata de Tajuña	660676711			t	2022-11-16 17:28:41.546552+00	2022-11-16 17:28:41.546575+00	hombre	f	28530	t	f	t	f	f	f	f	f	3
201	Achraf Benseddik	Y7606301Q		1995-09-12	108	Marruecos	f	C/San Jose	f	Arganda  del Rey	623235914			t	2022-11-16 17:30:23.185098+00	2022-11-16 17:30:23.185126+00	hombre	f	28500	f	f	t	t	f	f	f	f	3
202	Zeballos Rodriquez David	49962685S		1996-09-07	109	Bolivia	f	Calle Maestro Miquel Chicote	f	Arganda  del Rey	692494174			t	2022-11-16 20:28:54.904778+00	2022-11-16 20:28:54.904803+00	hombre	f	28500	t	f	t	f	f	f	f	f	3
203	Mcaouri Kanchil Fatima	x6651677P		1980-10-01	110	Marruecos	f	C/Gran Via	f	Arganda  del Rey	603159512		Los padres viven con ellos	t	2022-11-16 20:34:12.865307+00	2022-11-16 20:34:12.86533+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
204	Jeanneth Alexandra Cuzco Paste	51788632S		1990-09-19	114	Ecuador	f	C/Tordegrillos	t	Madrid	697563112			t	2022-11-16 20:46:53.858086+00	2022-11-16 20:46:53.858109+00	mujer	f	28021	t	f	t	t	f	f	f	f	3
205	Zahrae Fatima El Ahmadi	Y0350710C		1986-11-03	115	Marruecos	f	Avda de Madrid	t	Arganda  del Rey	632814772			t	2022-11-16 20:53:26.670845+00	2022-11-16 20:53:26.670869+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
206	Russi Alvaro de Jesus	Y137949855		1991-11-08	116	Italiana	f	......	f	Arganda  del Rey	612503399			t	2022-11-16 21:04:37.370475+00	2022-11-16 21:04:37.370497+00	hombre	f	28500	t	f	t	f	f	f	f	f	3
207	Islam Moqaddem Khlifa	002353854B		1990-05-05	117	Marruecos	f	C/Solanilla	f	Arganda del Rey	642518663			t	2022-11-17 21:06:48.512235+00	2022-11-17 21:06:48.51226+00	mujer	f	28500	t	f	f	t	f	f	f	f	3
208	Colorado Mosquera Eliana Janeth	X8609746H		1984-07-13	118	Colombia	f	C/Picos de Europa	t	Arganda del Rey	654515628			t	2022-11-17 21:17:11.23688+00	2022-11-17 21:17:11.236903+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
209	Damaris Feliz Ramírez	003239058Z		1987-01-01	119	Española	f	Avda.Ñiño Jesus	t	Arganda del Rey	606032181			t	2022-11-17 21:28:18.340513+00	2022-11-17 21:28:18.340536+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
210	El Mesrare Abdel Ilah		UW5202587	1993-07-18	120	Marruecos	f	C/Misericordia	f	Arganda del Rey	643794103			t	2022-11-17 21:35:57.197732+00	2022-11-17 21:35:57.197755+00	hombre	f	28500	f	f	t	f	f	f	f	f	3
211	Amerzguiou AchahbareJamal	050370640L		1976-01-01	121	Española	f	C/Velero	t	Arganda del Rey	676188507			t	2022-11-17 21:41:14.228672+00	2022-11-17 21:41:14.228701+00	hombre	f	2500	t	f	t	t	f	f	f	f	3
212	Bibi Afzal Mohammad	054934697W		1954-07-16	122	Española	f	C/Maestro Miquel Chicote	t	Arganda  del Rey	623344002			t	2022-11-18 18:08:21.526949+00	2022-11-18 18:08:21.526972+00	hombre	f	28500	t	f	t	t	f	f	f	f	3
213	Hitach El Kanar Rahma	02324824F		1979-05-05	123	Marruecos	f	Calle Cañada Real	t	Madrid	602011971			t	2022-11-18 18:19:35.73747+00	2022-11-18 18:19:35.737495+00	mujer	f	28052	t	t	t	t	f	t	f	f	3
214	Bayari Fatima Ezzahra	X7121620S		1979-10-07	124	Marruecos	f	Calle Doctor Marañon	t	Arganda  del Rey	662175809			t	2022-11-18 18:30:45.656299+00	2022-11-18 18:30:45.656329+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
215	Monica Garcia Jara	052890769S		1984-04-04	125	Española	f	Calle Virgen del Pilar	t	Arganda  del Rey	665525230			t	2022-11-18 18:46:00.206924+00	2022-11-18 18:46:00.206949+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
216	Saidi Zakia	X8607800G		1975-01-01	126	Marruecos	f	Avda.Madrid	t	Arganda  del Rey	678251886			t	2022-11-18 18:56:01.069666+00	2022-11-18 18:56:01.069718+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
217	El Hraquel Mohamed		JN2616970	1995-10-29	127	Marruecos	f	Calle Flor de Lis	f	Arganda  del Rey	632815886			t	2022-11-18 19:07:20.76796+00	2022-11-18 19:07:20.767983+00	hombre	f	28500	f	f	t	f	f	f	f	f	3
218	Jimenez Rausseo Jaynnap del Valle	Y9000698F		1989-05-09	128	Venezuela	f	Calle Carretas	t	Arganda  del Rey	28500			t	2022-11-18 19:11:00.645675+00	2022-11-18 19:11:00.6457+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
219	Rosmar Lisette Alvarado del Zamora		091226716	1981-03-17	129	Venezuela	f	Calle Monte Acho	t	Arganda  del Rey	641316035			t	2022-11-18 19:18:41.03001+00	2022-11-18 19:18:41.030036+00	mujer	f	28500	t	f	t	f	f	f	f	f	3
220	Salas Saldaña Norma Lorena	X6389688N		1983-06-25	130	Peruana	f	C/Leonor de Cortinas	t	Arganda  del Rey	640909714			t	2022-11-18 19:26:03.518024+00	2022-11-18 19:26:03.518055+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
221	Salem Mabrouka	X4354848M		1968-08-14	131	Marruecos	f	Plaza de la Constitucion	t	Arganda  del Rey	631547841			t	2022-11-18 19:33:52.143649+00	2022-11-18 19:33:52.143672+00	hombre	f	28500	t	f	t	t	f	f	f	f	3
222	Gurmouh Yahya		XM0265347	1986-09-18	132	Marruecos	f	Calle Don Diego	f	Arganda  del Rey	612567972			t	2022-11-18 19:36:36.252011+00	2022-11-18 19:36:36.252044+00	hombre	f	28500	t	f	t	f	f	f	f	f	3
223	Sosa Cortez Alfonsina Antonia		1613226074	1956-04-24	136	Venezuela	f	C/Monte Acho	f	Arganda  del Rey	611519756			t	2022-11-18 19:41:31.001508+00	2022-11-18 19:41:31.001532+00	mujer	f	28500	t	f	t	f	f	f	f	f	3
224	Alvarado Touar Haydee Josefina		162316476	1954-12-12	139	Venezuela	f	Calle Monte Acho	f	Arganda  del Rey	0			t	2022-11-18 19:44:48.570429+00	2022-11-18 19:44:48.570458+00	mujer	f	28500	f	f	t	f	f	f	f	f	3
225	Chram  Youssef	DQ78697215		2000-08-27	140	Marruecos	f	Calle Miralparque	f	Arganda  del Rey	625409803			t	2022-11-18 19:48:06.246919+00	2022-11-18 19:48:06.246943+00	hombre	f	28500	f	f	t	f	f	f	f	f	3
226	Mohamed Aynaou	Y8482776E		1994-07-20	141	Marruecos	f	Calle Flor de Lis	f	Arganda  del Rey	672510786			t	2022-11-18 19:50:13.887805+00	2022-11-18 19:50:13.887829+00	hombre	f	28500	f	f	t	f	f	f	f	f	3
227	Andres Mnuel Escalona Madrid	Y9266397X		1985-12-31	142	Venezuela	f	Calle Los Huertos	f	Arganda  del Rey	643909572			t	2022-11-18 19:53:30.230224+00	2022-11-18 19:53:30.230247+00	hombre	f	28500	t	f	t	f	f	f	f	f	3
228	Paula Andrea Lopez	x3314065H		1985-03-02	143	Colombia	f	Calle Puerta del Campo	t	Arganda  del Rey	641633148			t	2022-11-18 20:00:36.991036+00	2022-11-18 20:00:36.99106+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
229	Juan Carlos Caldas Estrada		120377424	1981-10-20	144	Peruana	f	Urb.Gran Habitat	f	Arganda  del Rey	0		+51969288675\r\neste es el telefono de su pais ,,aqui no tiene numero	t	2022-11-18 20:07:35.090477+00	2022-11-18 20:07:35.090499+00	hombre	f	28500	t	t	t	f	f	f	f	f	3
230	Aynaou Salahaddine		FI1570765	1996-11-10	145	Marruecos	f	SIN DOMICILIO FIJO	f	Arganda  del Rey	631815211			t	2022-11-18 20:09:30.932686+00	2022-11-18 20:09:30.932739+00	hombre	f	28500	f	f	t	f	f	f	f	f	3
231	Zohra Bout	X9204049R		1969-12-30	146	Marruecos	f	Calle Zarza	f	Arganda  del Rey	632934759			t	2022-11-18 20:11:48.978562+00	2022-11-18 20:11:48.978587+00	mujer	f	28500	f	f	t	f	f	f	f	f	3
232	Jimenez Goñe Alexis		120719084	1995-03-22	147	Peruana	f	Urb.Gran Habitat	f	Arganda  del Rey	624080497			t	2022-11-19 09:01:54.784186+00	2022-11-19 09:01:54.784212+00	hombre	f	28500	f	f	t	f	f	f	f	f	3
233	Boulercha Amel		DY8049597	1987-09-21	148	Marruecos	f	C/Miralsol	f	Arganda  del Rey	643120216			t	2022-11-19 09:08:35.459084+00	2022-11-19 09:08:35.459109+00	mujer	f	28500	t	f	t	f	f	f	f	f	3
234	Touhou Najat	Y8566516L		1989-10-20	149	Marruecos	f	Avenida de las Yeguas	t	Arganda  del Rey	643829823			t	2022-11-19 09:15:48.114992+00	2022-11-19 09:15:48.115017+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
235	Costales Ramos Veronica		Y7691306M	1985-09-12	150	Peruana	f	URB.Gran Habitat	f	Arganda  del Rey	602462414			t	2022-11-19 09:19:47.473979+00	2022-11-19 09:19:47.474004+00	mujer	f	28500	t	f	t	f	f	f	f	f	3
236	Melissa Yanire Noriega Guevara		120681596	1977-05-30	151	Peruana	f	Paseo de la Estacion	f	Arganda  del Rey	642685126			t	2022-11-19 09:23:19.08654+00	2022-11-19 09:23:19.086565+00	mujer	f	28500	t	f	t	f	f	f	f	f	3
238	Mendez Avila Rosmery Elizabeth		208524940	1991-12-23	153	Guatemala	f	0000000	f	Arganda  del Rey	642368685		sin domicilio (lleva muy poco en españa)	t	2022-11-19 09:38:12.743601+00	2022-11-19 09:38:12.743624+00	mujer	f	28500	f	f	t	f	f	f	f	f	3
239	Yamina Kawache		BH2037190	1995-01-21	154	Marruecos	f	Carretera de Loeches	f	Arganda  del Rey	612421747			t	2022-11-30 17:32:36.428431+00	2022-11-30 17:32:36.428468+00	mujer	f	28500	t	t	t	f	f	f	f	f	3
240	Lorena Jimenez Gonzalez	..................		0001-01-01	155	Española	f	Arganda del REY	f	Arganda del Rey	643493295		pendiente de modificar los datos cuando tengo el expediente	t	2022-11-30 17:44:10.020484+00	2022-11-30 17:44:10.020511+00	mujer	f	28500	f	f	f	f	f	f	f	f	3
241	Garcia Garcia Banesa	050989215D		1980-04-03	156	Española	f	C/Maestro Miquel Chicote	t	Arganda  del Rey	680647520			t	2022-11-30 17:49:35.495252+00	2022-11-30 17:49:35.495279+00	mujer	f	28500	t	t	t	t	f	f	f	f	3
242	Ahinoa Fernandez Garcia	06007400F		2003-04-04	157	Española	f	Calle Maestro Miquel Chicote	f	Arganda  del Rey	643092355			t	2022-11-30 17:57:14.549761+00	2022-11-30 17:57:14.549787+00	mujer	f	28500	t	t	t	t	f	f	f	f	1
243	Eugenio William Gonzalez Aragon		120651040	0001-01-01	158	Peruana	f	Calle Arroyo	t	Moratalaz	633211815			t	2022-12-05 11:02:17.479908+00	2022-12-05 11:02:17.479954+00	hombre	f	28030	t	f	t	f	f	f	f	f	3
244	Zahia Chari	x9705286E		1974-01-04	159	Marruecos	f	Calle Huertarias	t	Morata de Tajuña	722489477			t	2022-12-05 12:19:17.651562+00	2022-12-05 12:19:17.651608+00	mujer	f	28530	t	f	t	f	t	f	f	f	3
247	Alonso Johnson Tocasca		120596045	1983-07-18	162	peru	f	Urb Gran Habitat	f	Arganda del Rey	641933958			t	2022-12-16 18:16:44.168658+00	2022-12-16 18:16:44.168699+00	hombre	f	28500	t	f	t	f	f	f	f	f	3
237	Miquel Angel Rojas Rojas		122039497	1973-01-26	152	Peruana	f	0000000	f	Arganda  del Rey	643299709		no tiene un domicilio fijo	t	2022-11-19 09:31:58.695623+00	2022-11-19 09:31:58.695648+00	hombre	f	28500	f	f	t	f	f	f	f	f	3
246	Fernandez Garcia Llanira	51010600G		1998-11-10	161	Española	f	C/Poyales	t	Morata de Tajuña	624841977		*Madre soltera	t	2022-12-05 14:32:08.748664+00	2022-12-05 14:32:08.748698+00	mujer	f	28530	t	t	t	f	f	f	f	f	1
248	Jose Manuel Heredia	070053799P		1977-03-02	163	Española	f	C/Grupo Escolar	f	Arganda  del Rey	600018931			t	2022-12-16 18:21:24.147032+00	2022-12-16 18:21:24.147059+00	hombre	f	28500	t	f	t	t	f	f	f	f	3
249	Jenifer Iglesia Gonzalez	052019578H		1991-01-25	164	Española	f	Calle Velero	f	Arganda  del Rey	674950765			t	2022-12-16 18:44:30.896257+00	2022-12-16 18:44:30.896292+00	mujer	f	28500	t	f	t	t	f	f	f	f	3
250	Carolina Matuto		x8281141Z	1979-02-06	165	HONDURAS	f	Calle Mayor Alta	f	Perales de Tajuña	623284146			t	2022-12-16 18:49:58.017982+00	2022-12-16 18:49:58.018017+00	mujer	f	28500	t	t	t	f	f	f	f	f	3
251	Maria Laaouej Bouferma	02352277K		1977-06-05	166	Española	f	C/Velero	f	Arganda  del Rey	632238077			t	2022-12-16 18:58:14.589913+00	2022-12-16 18:58:14.589939+00	mujer	f	28500	t	t	t	f	f	f	f	f	3
252	Toloza Carabali Luz Elvira		AW742857	1981-09-11	167	colombia	f	CALLE	f	Arganda  del Rey	624103106			t	2022-12-16 19:12:39.729117+00	2022-12-16 19:12:39.729147+00	mujer	f	28500	f	f	t	f	f	f	f	f	3
253	Mhamdi El Miloud		CJ6264653	1966-01-01	168	Marruecos	f	calle Salsa	f	Arganda  del Rey	111			t	2022-12-16 19:19:42.153213+00	2022-12-16 19:19:42.15324+00	hombre	f	28500	f	f	t	f	f	f	f	f	3
254	Khlifa Houria		SA12800973	1969-04-16	169	Marruecos	f	C/Solanilla	f	Arganda  del Rey	603510038			t	2022-12-16 19:24:20.595394+00	2022-12-16 19:24:20.595427+00	mujer	f	28500	t	f	t	f	f	f	f	f	3
255	Arcenia Pacheco Aguirre		120029539	1980-09-13	170	Peruana	f	sin direccion	f	Arganda  del Rey	645406513		sin papeles	t	2022-12-16 19:28:24.998779+00	2022-12-16 19:28:24.998828+00	mujer	f	28500	f	f	f	f	f	f	f	f	3
245	Marcos Rios		165628459	1991-06-05	160	Venezuela	f	Calle Monte Acho	f	Arganda  del Rey	603023608		*lleva una semana en españa	t	2022-12-05 14:24:00.80882+00	2022-12-05 14:24:00.80886+00	hombre	f	28500	t	f	t	f	f	f	f	f	3
\.


--
-- Data for Name: adra_profile; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".adra_profile (id, date_of_birth, user_id, sexo) FROM stdin;
4	\N	4	hombre
3	1986-06-28	3	mujer
1	\N	1	hombre
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add delegaciones	1	add_delegaciones
2	Can change delegaciones	1	change_delegaciones
3	Can delete delegaciones	1	delete_delegaciones
4	Can view delegaciones	1	view_delegaciones
5	Can add domain	2	add_domain
6	Can change domain	2	change_domain
7	Can delete domain	2	delete_domain
8	Can view domain	2	view_domain
9	Can add beneficiarios globales	3	add_beneficiariosglobales
10	Can change beneficiarios globales	3	change_beneficiariosglobales
11	Can delete beneficiarios globales	3	delete_beneficiariosglobales
12	Can view beneficiarios globales	3	view_beneficiariosglobales
13	Can add profile	4	add_profile
14	Can change profile	4	change_profile
15	Can delete profile	4	delete_profile
16	Can view profile	4	view_profile
17	Can add Beneficiario	5	add_persona
18	Can change Beneficiario	5	change_persona
19	Can delete Beneficiario	5	delete_persona
20	Can view Beneficiario	5	view_persona
21	Can add Familiar del Beneficiario	6	add_hijo
22	Can change Familiar del Beneficiario	6	change_hijo
23	Can delete Familiar del Beneficiario	6	delete_hijo
24	Can view Familiar del Beneficiario	6	view_hijo
25	Can add Almacen Alimento	7	add_almacenalimentos
26	Can change Almacen Alimento	7	change_almacenalimentos
27	Can delete Almacen Alimento	7	delete_almacenalimentos
28	Can view Almacen Alimento	7	view_almacenalimentos
29	Can add Alimento	8	add_alimentos
30	Can change Alimento	8	change_alimentos
31	Can delete Alimento	8	delete_alimentos
32	Can view Alimento	8	view_alimentos
33	Can add content type	9	add_contenttype
34	Can change content type	9	change_contenttype
35	Can delete content type	9	delete_contenttype
36	Can view content type	9	view_contenttype
37	Can add log entry	10	add_logentry
38	Can change log entry	10	change_logentry
39	Can delete log entry	10	delete_logentry
40	Can view log entry	10	view_logentry
41	Can add permission	11	add_permission
42	Can change permission	11	change_permission
43	Can delete permission	11	delete_permission
44	Can view permission	11	view_permission
45	Can add group	12	add_group
46	Can change group	12	change_group
47	Can delete group	12	delete_group
48	Can view group	12	view_group
49	Can add user	13	add_user
50	Can change user	13	change_user
51	Can delete user	13	delete_user
52	Can view user	13	view_user
53	Can add session	14	add_session
54	Can change session	14	change_session
55	Can delete session	14	delete_session
56	Can view session	14	view_session
57	Can add site	15	add_site
58	Can change site	15	change_site
59	Can delete site	15	delete_site
60	Can view site	15	view_site
61	Can add email address	16	add_emailaddress
62	Can change email address	16	change_emailaddress
63	Can delete email address	16	delete_emailaddress
64	Can view email address	16	view_emailaddress
65	Can add email confirmation	17	add_emailconfirmation
66	Can change email confirmation	17	change_emailconfirmation
67	Can delete email confirmation	17	delete_emailconfirmation
68	Can view email confirmation	17	view_emailconfirmation
69	Can add Token	18	add_token
70	Can change Token	18	change_token
71	Can delete Token	18	delete_token
72	Can view Token	18	view_token
73	Can add token	19	add_tokenproxy
74	Can change token	19	change_tokenproxy
75	Can delete token	19	delete_tokenproxy
76	Can view token	19	view_tokenproxy
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4	pbkdf2_sha256$260000$ys1dbEX4doZ2rZyKN4NNyc$QKKTIGGGlfq5+K6M8m9H12viB8WYGiCV38SWY40jQp4=	2022-12-18 09:28:15.146606+00	f	daniel	Daniel	Filip	danielbfilip@gmail.com	f	t	2022-11-19 20:44:08.522649+00
3	pbkdf2_sha256$260000$cznzS5ISNgeJXmrxLCIuHQ$vlEqFnGDqp+L9spDnEe4tRxGeK76tm1GQDzPgbSuWyk=	2022-12-20 16:00:46.335946+00	t	corina	Corina	Corina	sutarjetadevisita@gmail.com	t	t	2022-11-03 19:59:04+00
1	pbkdf2_sha256$260000$fnyNhExmm5DYaQt4jZXN2i$Ob5654erEqkuN4PAuXbvsHqhAVivnLiF9njNw6LoTT8=	2022-12-23 06:35:40.292643+00	t	lucian			amadeuscam@yahoo.es	t	t	2022-11-03 04:52:42.436555+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".authtoken_token (key, created, user_id) FROM stdin;
e4899bc0c13704f4dcd78d8548f4e7f02c557f71	2022-11-03 04:52:42.667345+00	1
86ccd5a4363a97db8e9d9acdc20aec80c209852a	2022-11-03 19:59:04.720927+00	3
7a632ba55f25901c522c3860cda78507b3af6e47	2022-11-19 20:44:08.794407+00	4
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-11-03 05:06:22.378711+00	1	AlmacenAlimentos object (1)	1	[{"added": {}}]	7	1
2	2022-11-04 06:13:44.658+00	95	Abigaila Sephora Tataru	3		5	1
3	2022-11-04 06:13:44.662339+00	13	ACIA ECH CHARKAOUY	3		5	1
4	2022-11-04 06:13:44.666101+00	56	AFIA ABOUSSAID OUASSIMA	3		5	1
5	2022-11-04 06:13:44.669741+00	77	AHMED ENNAMOUTI	3		5	1
6	2022-11-04 06:13:44.673457+00	59	AICHA EL FARSIOUI	3		5	1
7	2022-11-04 06:13:44.682556+00	11	AICHA MOUKHLOUFI	3		5	1
8	2022-11-04 06:13:44.688431+00	100	ALEJANDRINA PORTILLO SORTO	3		5	1
9	2022-11-04 06:13:44.692119+00	10	AMINA EL HADDAD	3		5	1
10	2022-11-04 06:13:44.695743+00	53	AMINA EL METIOUI	3		5	1
11	2022-11-04 06:13:44.699384+00	85	ANA CRESPO VEGA	3		5	1
12	2022-11-04 06:13:44.703146+00	42	ASMAA ZYATE	3		5	1
13	2022-11-04 06:13:44.707041+00	44	ASMAE EL KADDOURI	3		5	1
14	2022-11-04 06:13:44.710689+00	23	ASMA NAJHI	3		5	1
15	2022-11-04 06:13:44.714374+00	33	AUREL BOBOC	3		5	1
16	2022-11-04 06:13:44.71797+00	107	Aurora Florentina Raducan	3		5	1
17	2022-11-04 06:13:49.919997+00	28	AZIZA ZYYANI	3		5	1
18	2022-11-04 06:13:49.926845+00	74	BEATRICE OPPONG	3		5	1
19	2022-11-04 06:13:49.930515+00	32	BOBOC MITA	3		5	1
20	2022-11-04 06:13:49.934269+00	105	BOUCHRA AOUARFAT OUTOUHAMI	3		5	1
21	2022-11-04 06:13:49.938029+00	22	BOUSSABOUN AHIBOUJ MOHAMED	3		5	1
22	2022-11-04 06:13:49.941656+00	110	Cornel Edu	3		5	1
23	2022-11-04 06:13:49.945352+00	84	DINCA ELENA EUGENIA	3		5	1
24	2022-11-04 06:13:49.948796+00	82	DRAGU ILIE	3		5	1
25	2022-11-04 06:13:49.952245+00	99	EDWIM ALEXANDER	3		5	1
26	2022-11-04 06:13:49.955844+00	64	EL AZIZA AL AMRANI	3		5	1
27	2022-11-04 06:13:49.959713+00	3	Elena Felea	3		5	1
28	2022-11-04 06:13:49.963142+00	5	EL FILALI EL KOURCHI HABIBA	3		5	1
29	2022-11-04 06:13:49.966652+00	79	EL HADI JAHJAH	3		5	1
30	2022-11-04 06:13:49.97006+00	80	EL KHAMMARI EL MAJDOUBI RACHIDA	3		5	1
31	2022-11-04 06:13:49.973993+00	20	EL MEBLI ZIYAMI AOUATIF	3		5	1
32	2022-11-04 06:13:55.307024+00	39	EL MOUSSAOUI AIT MHAND MOULOUD	3		5	1
33	2022-11-04 06:13:55.311214+00	87	FAOUZIYA MAKRANE	3		5	1
34	2022-11-04 06:13:55.31607+00	70	FATIMA KAINA	3		5	1
35	2022-11-04 06:13:55.322668+00	61	FATIMA SALHI	3		5	1
36	2022-11-04 06:13:55.326421+00	24	FATIMA ZOHRA AMTOUR	3		5	1
37	2022-11-04 06:13:55.330064+00	60	FATOUM BOUSSAID	3		5	1
38	2022-11-04 06:13:55.333538+00	48	FATYHA RAHMANI	3		5	1
39	2022-11-04 06:13:55.336999+00	72	FAUSTINA AGYEI	3		5	1
40	2022-11-04 06:13:55.340488+00	111	Florin Mitrica	3		5	1
41	2022-11-04 06:13:55.344167+00	26	FRAGA CHIQUITO MARIA JOSE	3		5	1
42	2022-11-04 06:13:55.347725+00	93	GEORGEL RADU	3		5	1
43	2022-11-04 06:13:55.351374+00	109	Giovani Gentile	3		5	1
44	2022-11-04 06:13:55.355007+00	65	HABIBA BOUTASGHOUNTE	3		5	1
45	2022-11-04 06:13:55.358613+00	58	HAJAR AKAZIM	3		5	1
46	2022-11-04 06:13:55.362051+00	36	HAJIBA SETTAR	3		5	1
47	2022-11-04 06:14:00.623084+00	2	HAMID EL MOUKHLOUFI	3		5	1
48	2022-11-04 06:14:00.627149+00	38	HANAN BERROUHOU	3		5	1
49	2022-11-04 06:14:00.630677+00	6	HANANE OKRICH	3		5	1
50	2022-11-04 06:14:00.63448+00	71	HORIA BEN ABDELLAH	3		5	1
51	2022-11-04 06:14:00.638091+00	94	HOURIA ARAZZOUK	3		5	1
52	2022-11-04 06:14:00.641502+00	37	HOUSYNA ELMOALEM	3		5	1
53	2022-11-04 06:14:00.644856+00	104	IBTISSAM MAWHOUB	3		5	1
54	2022-11-04 06:14:00.648575+00	7	IKRAM EL YAAMOURI	3		5	1
55	2022-11-04 06:14:00.652138+00	21	IMANE BAKKALI	3		5	1
56	2022-11-04 06:14:00.655633+00	114	Iulian Catalin zamfir	3		5	1
57	2022-11-04 06:14:00.659017+00	90	JAMILA ADAHCHOUR	3		5	1
58	2022-11-04 06:14:00.662664+00	83	JOSEPH KWATENG	3		5	1
59	2022-11-04 06:14:00.666289+00	45	KARIMA EL BOUTROUKI	3		5	1
60	2022-11-04 06:14:00.670186+00	19	KARIMA SLIMANI	3		5	1
61	2022-11-04 06:14:00.67379+00	55	KHADDOUJ BEL HAJ	3		5	1
62	2022-11-04 06:14:06.820852+00	63	KHADIJA ALOUAT	3		5	1
63	2022-11-04 06:14:06.824959+00	106	KHADIJA NAITBARI BKKA	3		5	1
64	2022-11-04 06:14:06.828471+00	9	KHADIJA SBAA	3		5	1
65	2022-11-04 06:14:06.832215+00	66	LAHCEN DHIKAR	3		5	1
66	2022-11-04 06:14:06.835763+00	91	LAILA SAFFI	3		5	1
67	2022-11-04 06:14:06.83923+00	25	LATIFA FOURSI	3		5	1
68	2022-11-04 06:14:06.843365+00	8	LATIFA RAHMOUNI	3		5	1
69	2022-11-04 06:14:06.846739+00	102	LATIFA SABBAHI	3		5	1
70	2022-11-04 06:14:06.850235+00	41	LILIANA GEORGETA BRINZAN	3		5	1
71	2022-11-04 06:14:06.853767+00	86	LOBNA EL AZAAR	3		5	1
72	2022-11-04 06:14:06.857544+00	108	LOREDANA DUMITRASCU	3		5	1
73	2022-11-04 06:14:06.860818+00	113	Luis Rodriguez Flores	3		5	1
74	2022-11-04 06:14:06.864221+00	101	MAJIDA EL MANSOURI	3		5	1
75	2022-11-04 06:14:06.867547+00	47	MALIKA BOURFAA	3		5	1
76	2022-11-04 06:14:06.870856+00	4	MARIANA VICTORIA ILIE	3		5	1
77	2022-11-04 06:14:12.767088+00	97	MARIAN PIRVU	3		5	1
78	2022-11-04 06:14:12.771244+00	103	MIHAILA IULIAN RADU	3		5	1
79	2022-11-04 06:14:12.774816+00	98	MIÑANA NICOLAS	3		5	1
80	2022-11-04 06:14:12.778487+00	112	Mita Florea	3		5	1
81	2022-11-04 06:14:12.781899+00	75	MOSTAFA BENABDELLAH	3		5	1
82	2022-11-04 06:14:12.785251+00	17	MOUNIRA AGMIR	3		5	1
83	2022-11-04 06:14:12.788743+00	50	NAIMA EL MACHROUHI	3		5	1
84	2022-11-04 06:14:12.792343+00	57	NISRINE CHAIRI	3		5	1
85	2022-11-04 06:14:12.795667+00	96	NORMA VICTORIA GONZALES PAJARES	3		5	1
86	2022-11-04 06:14:12.799211+00	69	OMKELTOUM EL GUARRATI	3		5	1
87	2022-11-04 06:14:12.802608+00	43	PILAR AVOMO NDONG	3		5	1
88	2022-11-04 06:14:12.808731+00	46	RABIA EL FARSIOUI	3		5	1
89	2022-11-04 06:14:12.812102+00	16	RACHIDA AZZOUZ	3		5	1
90	2022-11-04 06:14:12.815619+00	14	RADIA AACHBOUN	3		5	1
91	2022-11-04 06:14:12.81952+00	89	RADIA AKHAZZANE	3		5	1
92	2022-11-04 06:14:19.200024+00	18	RAHMA BEN STAHIR SERROUKH	3		5	1
93	2022-11-04 06:14:19.204918+00	115	Ramona Alupoaiei	3		5	1
94	2022-11-04 06:14:19.208908+00	92	RAMONA NICOLETA POPOVICI	3		5	1
95	2022-11-04 06:14:19.212693+00	76	ROUHAND EL AOUMRANI AHMED	3		5	1
96	2022-11-04 06:14:19.216595+00	52	SABAH EL AMRANI	3		5	1
97	2022-11-04 06:14:19.220293+00	40	SABAH TOUTOUH	3		5	1
98	2022-11-04 06:14:19.224204+00	67	SAIDA BOUJIDA	3		5	1
99	2022-11-04 06:14:19.2277+00	62	SAIDA RIYADI	3		5	1
100	2022-11-04 06:14:19.231506+00	54	SAKINA EL MANSOURI	3		5	1
101	2022-11-04 06:14:19.237906+00	51	SALIMA ZARKAN	3		5	1
102	2022-11-04 06:14:19.241377+00	78	SAMIRA EL KHAMMARI	3		5	1
103	2022-11-04 06:14:19.24534+00	29	SAMIRA FOURSI BOURJAL	3		5	1
104	2022-11-04 06:14:19.248957+00	68	SANAA ANAKAR	3		5	1
105	2022-11-04 06:14:19.252786+00	34	SARRA EL MASOUDI	3		5	1
106	2022-11-04 06:14:19.256455+00	88	SOHAILA ELKHAMLICHI	3		5	1
107	2022-11-04 06:14:24.307354+00	31	SOUAD EL HALOULI	3		5	1
108	2022-11-04 06:14:24.320692+00	12	SOUMIA MASROURI	3		5	1
109	2022-11-04 06:14:24.32521+00	27	TALLEH BAISSA FATIMA	3		5	1
110	2022-11-04 06:14:24.330116+00	116	Viorel Alexandru	3		5	1
111	2022-11-04 06:14:24.336192+00	73	YAA ROSINA AGYEI	3		5	1
112	2022-11-04 06:14:24.345354+00	30	YENZ FRANCISCO LOPEZ ARIAS	3		5	1
113	2022-11-04 06:14:24.350141+00	49	ZAHRA SKHIENE	3		5	1
114	2022-11-04 06:14:24.354264+00	15	ZAKIA EL MAALLIN	3		5	1
115	2022-11-04 06:14:24.358365+00	81	ZAKIA EL MANSOURI	3		5	1
116	2022-11-04 06:14:24.363395+00	35	ZOUHRA BOUZIT	3		5	1
117	2022-11-04 06:17:15.117866+00	2	cati	3		13	1
118	2022-11-07 16:27:46.70616+00	3	corina	2	[{"changed": {"fields": ["Staff status", "Superuser status"]}}]	13	1
119	2022-11-07 17:18:32.974054+00	121	Curcan Maria	2	[{"changed": {"fields": ["Activo?"]}}]	5	1
120	2022-11-07 17:20:20.969938+00	121	Curcan Maria	2	[{"changed": {"fields": ["Activo?"]}}]	5	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".django_content_type (id, app_label, model) FROM stdin;
1	delegaciones	delegaciones
2	delegaciones	domain
3	delegaciones	beneficiariosglobales
4	adra	profile
5	adra	persona
6	adra	hijo
7	adra	almacenalimentos
8	adra	alimentos
9	contenttypes	contenttype
10	admin	logentry
11	auth	permission
12	auth	group
13	auth	user
14	sessions	session
15	sites	site
16	account	emailaddress
17	account	emailconfirmation
18	authtoken	token
19	authtoken	tokenproxy
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-11-02 03:39:11.353395+00
2	auth	0001_initial	2022-11-02 03:39:11.519127+00
3	account	0001_initial	2022-11-02 03:39:11.604871+00
4	account	0002_email_max_length	2022-11-02 03:39:11.634281+00
5	admin	0001_initial	2022-11-02 03:39:11.69131+00
6	admin	0002_logentry_remove_auto_add	2022-11-02 03:39:11.715768+00
7	admin	0003_logentry_add_action_flag_choices	2022-11-02 03:39:11.744458+00
8	adra	0001_initial	2022-11-02 03:39:11.991292+00
9	contenttypes	0002_remove_content_type_name	2022-11-02 03:39:12.059499+00
10	auth	0002_alter_permission_name_max_length	2022-11-02 03:39:12.103857+00
11	auth	0003_alter_user_email_max_length	2022-11-02 03:39:12.149151+00
12	auth	0004_alter_user_username_opts	2022-11-02 03:39:12.188104+00
13	auth	0005_alter_user_last_login_null	2022-11-02 03:39:12.232986+00
14	auth	0006_require_contenttypes_0002	2022-11-02 03:39:12.2495+00
15	auth	0007_alter_validators_add_error_messages	2022-11-02 03:39:12.291189+00
16	auth	0008_alter_user_username_max_length	2022-11-02 03:39:12.345369+00
17	auth	0009_alter_user_last_name_max_length	2022-11-02 03:39:12.393291+00
18	auth	0010_alter_group_name_max_length	2022-11-02 03:39:12.440514+00
19	auth	0011_update_proxy_permissions	2022-11-02 03:39:12.480987+00
20	auth	0012_alter_user_first_name_max_length	2022-11-02 03:39:12.526435+00
21	authtoken	0001_initial	2022-11-02 03:39:12.593452+00
22	authtoken	0002_auto_20160226_1747	2022-11-02 03:39:12.72063+00
23	authtoken	0003_tokenproxy	2022-11-02 03:39:12.737376+00
24	delegaciones	0001_initial	2022-11-02 03:39:12.75698+00
25	delegaciones	0002_alter_delegaciones_ciudad	2022-11-02 03:39:12.774845+00
26	delegaciones	0003_delegaciones_calle	2022-11-02 03:39:12.792925+00
27	delegaciones	0004_profile	2022-11-02 03:39:12.838814+00
28	delegaciones	0005_delete_profile	2022-11-02 03:39:12.853771+00
29	delegaciones	0006_beneficiariosglobales	2022-11-02 03:39:12.869209+00
30	delegaciones	0007_beneficiariosglobales_delegacion_code	2022-11-02 03:39:12.885926+00
31	delegaciones	0008_delegaciones_oar	2022-11-02 03:39:12.902338+00
32	delegaciones	0009_beneficiariosglobales_created_at	2022-11-02 03:39:12.92032+00
33	sessions	0001_initial	2022-11-02 03:39:12.956955+00
34	sites	0001_initial	2022-11-02 03:39:12.976915+00
35	sites	0002_alter_domain_unique	2022-11-02 03:39:13.15701+00
36	adra	0002_auto_20221104_0515	2022-11-04 06:06:56.488964+00
37	adra	0003_alter_hijo_parentesco	2022-11-06 07:01:09.872596+00
38	adra	0004_profile_sexo	2022-11-16 07:03:12.013505+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".django_session (session_key, session_data, expire_date) FROM stdin;
eds5exrja5x2h2ypcj8zunzpvp3r89jj	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1oqTrl:poEV7txGYszLmaP8g_hUKxHkKnvTkyBaPvfwNhsRR9I	2022-11-04 06:38:17.431584+00
yk9j378lciaqjni2yuvx29tqzezqx32e	.eJxljUEOwiAQRe_CumlKawt2pxchwzCkRKSmgNEY7y5tGhPjct7__82LAeKcQ1J3Wpx1ZBRdwXk2hux99U1zpIWNrGMVU5DTtAHlzD_TgBcKawDer7jeHfXW2eNYn8pFITmE5OZw3lc_qgniVDx9i5LISkBurEVTFKZFToOkdhAdHq3kGjlYFH3PtTW6bciKUoFBSJKrNFKM5Y2ix80tTzbK4dA07w81IFfM:1oqpDl:Wr8trUaC9A37yoT6U-WGhMezT_3UOy41EwF5gHaF8tM	2022-11-05 05:26:25.181642+00
ggwak67kmmxzeu4ofgm74lk66j4cft3s	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1oqqVa:KAOZtxUh9AP1pzPVlcE1X_0GBr-9F2PCJvpYvEcnE-A	2022-11-05 06:48:54.642842+00
im71clpoxgyn51ue00hyjtk5ftuziw2o	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1or31W:F8599BT-yMZ_67fUV-x47Tqs5QrQSsMkCNhls5ib8d8	2022-11-05 20:10:42.217103+00
3z0ay3vcooqr951i1retk0acd2h3eey8	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1or3D3:vcGh-yj3cYYWdjKu3mABpH3pQRBg0lLla2PS6HBGB7E	2022-11-05 20:22:37.590541+00
bsml5lzb6mhpe5sf6u152kghyvf7ys1p	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1orODu:b_eD1fzIQE18mhDpUzuCNmQwet6EpC3kjBJ5fesq-nQ	2022-11-06 18:48:54.213825+00
czf58xgzgpyljzmd3tboog5vf6a6wisw	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1oreMO:VPZa3jY5DWIWJ4LaZURQOr0yOOcasBCdg2_iP6g8Ek8	2022-11-07 12:02:44.7274+00
8qno1e2abdggvncyhc3w792i1jk2w22t	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1orhCk:WB_kNhVA14kMdLSVGPkqCiJAzmDfzB1moPnzw4l16To	2022-11-07 15:04:58.358309+00
6zaxdrir1s0fp5nxhi2s3c8m0ap3qhhf	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1os4xY:AbnNPAnDDYEs5FiTvRbSyEH3ggRJjjsvnP0M7r4iYXk	2022-11-08 16:26:52.878033+00
7pbnre5cns80rdnqxqybpt7u4kwspl39	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1os4yt:byUlFf9nuMyzkkzYcCjo6e3X-pGAGmFQ0OpQN3YtTJo	2022-11-08 16:28:15.771449+00
48nj6xravj0cricg34srvzgji870ghn6	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1osGye:KETzHdhLW-JxJFLjlHvST0t5KSJ8XbXXglP487KN_HI	2022-11-09 05:16:48.112239+00
rpq0xowzqil8f7v941uhgktr8nzzmwja	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1osQ9E:sw6AReONIbXaabFU1U4PabNTHUpr-XkA7OXU9T4_Zbs	2022-11-09 15:04:20.417402+00
xrtp2xkcub44ueba53iocqgmbqp3299m	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1osdqX:IKmHIMmrQbkkmgs0kF5U-s2Dz46ZLTRi_iOZ7EB-f6Q	2022-11-10 05:41:57.96644+00
p05yxjhtbtc686uezjhdow7cwoh7pcxt	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1osoHC:bRuYFMdSN4QUjYwAVzViONQhHu3O60iqIwXrlZMA0DY	2022-11-10 16:50:10.293108+00
92c4212p4bxz6kf66fi5gyxlwxh4xgwo	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1osqTN:GXKa4zKHN6E9zwuQzYhK0HNzdCGOMcmLe3MT4oh9rf0	2022-11-10 19:10:53.861929+00
xwmo5bruu9qkrba2rg8ef3p0xucs9mb9	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1osr8h:eIIVrZmDx7grpa3zWXp7smiO4pQvYeLlmQvS41Ds3Tw	2022-11-10 19:53:35.31207+00
4lyby4p9gkrzewvhmoosbds479j4jb5d	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1otCEM:CCFhfGhtyoqv4uh7ph0AjHMJgvspPu1G9RclOQPYqcA	2022-11-11 18:24:50.330444+00
ylqio7msc5sdtau7ornke0i56evlbmbp	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1otDMZ:FmheS7cT_dXFoGIj0ac6A9ClvLJFQptSFXwfwXj5MjE	2022-11-11 19:37:23.024556+00
gtjjs50v1o5r91bffxoztr00qtwykssl	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1otN2P:TJs4Vu52tmleb7Ix5r_z23iAmUD0TqJXDPkHiPh661I	2022-11-12 05:57:13.492565+00
jqni2munb1dot1o233ev6a59mhvae5jk	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1otr8H:p1IbeytQCohnL3uVDpfAu3vISf1scHOmM2w1lR9HY2k	2022-11-13 14:05:17.510017+00
ie4j9cy3zgrs6roakbkr3hrqqw79u7pf	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1otvF6:QwJ8K3CnJbKiUOeLDVHYZ9I3f3cRb0bPmds0nM2Xx94	2022-11-13 18:28:36.26149+00
vxlnbpl3mwgj7hsmsr58f9e1k0a34ndz	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1ouAwg:pFPSS09UyU5xo-pjqR26UB_Uf0RRujSRIKh-68tg6GE	2022-11-14 11:14:38.628173+00
0szs15bkmk45rgmltobqna0lr8vvpi47	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1ouB6W:5a8foYRw2VumbLNu9FoLfbbbOu-ZIbFsiFqRYNnAqAQ	2022-11-14 11:24:48.311121+00
cx27kfueqpxp3jwnm6z5cep2qdz9jnbq	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1ouIX5:2gf3VBd03RM2xxWuf257EWG7Ij6sB7hsPKC2b4gsrnY	2022-11-14 19:20:43.333672+00
d95j5xjjp9pytas920aorbjtjgelhfi8	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1oudIa:HUR-BOF4uWjiCk3SCOlYNwutX9rOgXQEjwIHRS8Nmeg	2022-11-15 17:31:08.681617+00
t9f6t8wf0ck4a7sx2b3i7murxelr4sys	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1oufhw:WfOXJamKaL0oDCTnhB85EEJ3oZSaetbzZHZSQxhbdf4	2022-11-15 20:05:28.671829+00
2r33ye78j6paenqhxiup5lcbdiomh2hn	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1ouy94:CWqUoHL8pBNQhOtofBNuLP1q0WT1Kx33_F8QCLHIPhM	2022-11-16 15:46:42.857286+00
y6hlzncpjwsabuj90gmpppbqrkfcf4fh	e30:1ovCRJ:rBYG-YeH9gBn4K8fjbmfg66bRi0Q29xCi656RXsDHpU	2022-11-17 07:02:29.549583+00
zj7w58gbk92qq0oo5mkb2r94475za12e	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1ovCSB:N5I4x_ZEu2e0-6eeURg28AED5ZrsLPFH30HAvX1ruZM	2022-11-17 07:03:23.754482+00
d2jcheivyxm4o7nplrr18ucj01sc54s8	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1ovJML:xiVIcDIS-nxuaAKiuNrNTrY0BCX1efwlHiEV-yeetZs	2022-11-17 14:25:49.343238+00
l9v179g5ji0hw3jc0mz89icaxynrrrdd	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1ovZCQ:KbYp_xC_btNJTsSzUTgwahGS0CRIjFoV_NYiMO-YKtI	2022-11-18 07:20:38.611082+00
893qbcqqc6o6j5v4wox17pbg9wpdchhv	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1ovkTw:jidtNEpNZuDxMSEJXgWC1_xVhAaVP4bndzggIpXaN3E	2022-11-18 19:23:28.280419+00
8qh5x6tloowi48feaw7o1fuln0n29onh	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1ovm29:KgnoZABRlyVrDU7zms7HQqzeaDJ3v4p2PgMSHDI_SHk	2022-11-18 21:02:53.3582+00
kpukyosqbpyncgg1olq3y4ldr3s5cq67	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1ow5jU:x8-48YWOUWgDHm-RwmGfv1OrOm3wMok3OGtWxZVgHgA	2022-11-19 18:04:56.011611+00
lz59td90idsvebmsu3umfbpqnxo41nn8	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1owGx8:qLx9P7qWdH7Sa-oGdqpXs4b2pDAaBI-32DEnww4lp9k	2022-11-20 06:03:46.192635+00
66r6xoi8sms15w1f4y1sbni8potygsrh	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1owSRg:b76KnaQsYyAINXnnUZSaxFGnnkRdhvrVhbJoy-l56c4	2022-11-20 18:20:04.923545+00
wv0149tmsb1w03g8n1gfix60tlbccvdd	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1owTUE:H06IxmymDsWUeZcuuEI9l-7wo5dqxE01xEAJo0uP0aI	2022-11-20 19:26:46.396178+00
po66tfc6odbiu2p1crsmml8dikd39jvn	.eJxljVEOwiAMQO_C97KAbsD2pxchBdqMiMwMZjTGu7sti4nxs--1ry8Gzo1zKuaOU6CA3uAVQmR9mmOsvnbOOLGeNaxiBuYybMAE_88suAumVUCMK673Rr3t7DrXp2XCVIKDEsZ03q9-UgPkYekcNSfFLRccDsorTUoLLpX0QOgcgbASjroj1-mWhGrIo2qptdbJTradWqMZc17eGHzcwvRkvZYN5-8PvCRWOg:1owUiA:EOy0VDlkAPxKv0DIrJp_eXcJmULbtbPxTTgjfwUdWJA	2022-11-20 20:45:14.451515+00
khcvtl7chna32ha881szrhiciyljv849	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1owgCD:4KMP0GWt3U1Ufzn3XJa9wzkFLP7CcbxWqaMJrPOWKfk	2022-11-21 09:01:01.969504+00
66thprcdpm0fgjpyybay7wxm6iohk30v	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1owyYC:Tcu8YVnzW8gKF9oA8-UDl-nTyZir6cf-Mo-MLYB3Tbk	2022-11-22 04:36:56.411287+00
vgghu3egtgryi6xgyaeimbpnz0r1r8bk	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1oxOmx:Ke7nDx2TrR4a0ke2fcFg1rST2zx-3-Oibwpg0pwM7bA	2022-11-23 08:37:55.695344+00
cku7hzb6udypqdf7dr0081sev8ivwx2c	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1oxit5:5f76LKqu74tqhydG4qw-sGbJ_ihFPjImo-Rnp94iOeI	2022-11-24 06:05:35.227859+00
fvq1crzp576w4bd7uz9ed4fucpiio5ui	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1oxlQ1:dbJkSTkVYu1I8igCX30CLtv-3YVAiIq8KF3B4fmGvHU	2022-11-24 08:47:45.269416+00
sw8my1gd8x9a2dv551khtwukg0uy34r2	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1oyROU:WZ6p6tsYKalHvCDt-70iUUF7DfqpHSPEWv2N-dkcuxg	2022-11-26 05:36:58.787899+00
89riabpgt4nk15k388l2w5kslodrqq4u	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1oyolv:ff5IPEIJi4SvnA3ylKpdjFQyD9rXjdpUFWbNpWFomHU	2022-11-27 06:34:43.798252+00
bf4mot9mwhkkbjexixr9woqq14t92rm4	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1ozjoo:9eQhu-cnfvcKof0C8VYGSbWGJk8v6WpmHG5YcWiyjjE	2022-11-29 19:29:30.080844+00
6tv9suerkgld5ge3m6pvxrdlqpgt7079	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1p0PKv:zrbbFDZs0OJXyV5taScv5cJlWPYdyBBu7zHAoI2V7q8	2022-12-01 15:49:25.893098+00
225pd27lupwvnmsg3ny5nk4469ldaex7	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p0zpi:LN2Xz4ggtSqTbQk7mKY3YgFW82irgbmVsiz9wqIWdDQ	2022-12-03 06:47:38.674433+00
ig85qjj5jeynpgp5nkexczo6n6d09l8d	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p1Mr5:kHYZoV_0XqMzi7qRVY7M3SZSRDZ1l4dQtNL_BeuokwM	2022-12-04 07:22:35.83766+00
149qpnb73pkzw6erjbg0c66678wt0zun	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p1Wbe:SlWptkFDNgfDu5gIh8i6mA8NfQfuYw6icVR-56Fnt4Y	2022-12-04 17:47:18.910028+00
q9prfc61mnf4th1waq1pbjtbdltrikcw	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p1jP4:dXIFZE3RTCy2KdR47Z8sV394wKCK5xwsMtYZVqkiZ9s	2022-12-05 07:27:10.126176+00
gdyx4wauffpyatzcn71z7qa1k7tdmv6o	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p1uAp:fOocer-Hp_6uqJrsDRsut30s6uEbssguaoPmxtsMJZs	2022-12-05 18:57:11.299292+00
4u2a7n34a6anbmdy3nslxrtsqa4c9y29	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p266U:7A7Vdm8bZbWSJR_thrILXAEDTju3bG-MfpqezTy-9Lw	2022-12-06 07:41:30.774924+00
zwhua5eyelpv5nnhcfddfw30cu1yq5mw	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1p28le:qC5ggxQJFomfGGsA4N5ns2uQh3ZjzizDLXS0iyEgkqg	2022-12-06 10:32:10.488001+00
docy0ar82clfqury4siszndvyepw6su9	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p2F9A:apc6U_5zvdoukojqn2AIwAeExZXUxyP1WerRcoRVvKY	2022-12-06 17:20:52.799828+00
dls6tq8b5f71sf4j5uq0plug70woj2ur	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p2ebG:Wk2N3u6Bmgvbwcrz00F60w-fghK6RUeLOfoX1HE3500	2022-12-07 20:31:34.518299+00
7dj4cdg4zngycn6c9ceapmn8xeym6gce	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p2oFP:q9f8eNkMe6sfpyvJilNVuCmMHWMH3SwCqUOCo138WtY	2022-12-08 06:49:39.30497+00
rjberxwmagaz78q60d4htl87jpknj95p	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p320J:s2bMQqDWF7nqZVvXgY6q3hhdTayiL7dmrpA9q_x-8SE	2022-12-08 21:30:59.587319+00
2umqg9hm8l4schlbuy0df54xymf4n4sz	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p3Akj:uG3q-DtCtAX3Wok6mkt7uHtOQMIxASQJNB7UYnoAXEE	2022-12-09 06:51:29.285333+00
gmbpl1nb4jxif1rhzzncqix6j3hyvffd	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p4bX8:sFSG1A7aC4t1pYc76xEYLlIVR-h2JD7BOPmeyeg4JVg	2022-12-13 05:39:22.950055+00
l8d7gdme6deeuk7w936llr7zuhgrc9v3	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p5KdD:9Mxc26aaAYUDGHiRwqxEu-75LblwtolucRfC3ablF_0	2022-12-15 05:48:39.923829+00
btu5dsrzhdvi4w9di1s110mkwtnhc4sh	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p5qPJ:2xJEFVL0gv6WoerKdN73NAyR77htsTm93oAgpeaUsEA	2022-12-16 15:44:25.748563+00
l0mp76r6gtj1rw27zy5yeem25y1g8qbp	.eJxVjU0OwiAQhe_C2jSFWhi7sxchwzCkxIaaQhON8e5S04Uu39_3XsLiVia7ZV5t9GIQnTj9eg7pxmkPcJ53u0GiZUul-XaOODfXqjiVSFjiksZj9YeaME-V0ysC5gBI0odAviK8IskaWGnT0SWAdCQxkOl76YJ3quVgagW1AYYdmjnnemP5cY_rUwygz237_gBLbEY6:1p5tb1:l0Ig9TJ6_qq5R9Zpm2hYiAs8zjnFur4DGBsQ5ynVsw0	2022-12-16 19:08:43.519184+00
l3s7jqm3p61kmu1c2oo9zi23r052qdl0	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p62Tt:CJDMZUYAQ-eX8kXAfCY3YvhvsahlvM85aRfrHEPUA9Q	2022-12-17 04:37:57.958466+00
jeqdp8r201c49v2s7fm5me8vvbc75jj6	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p6QyK:v0cB55Yvq11dUDMlul3rwAYvKHfLG5IHKVfSVcUK3z4	2022-12-18 06:47:00.250921+00
hcf4zk2ezesl4qrextilh2ciaaqdr3fa	.eJxVjU0OwiAQhe_C2jRgCwPd6UWaYWBSYkNNoYnGeHdb04Uu39_3XmLAtY7DWuIypCB60YnTr-eRbjHvAU7TbjdINK-5Nt_OEZfmsqmYayKsac7XY_WHGrGMG6e1kkF6qSSeIYBlsEoaMAE5EjEqb7C1jslZzQo6DhE0a-_JOKMd7NASS9luhvi4p-Upems6Kd8f0aFEpw:1p6pxv:Qib0stxdqR5xh-4Qu2MdQESyyZR1dGgDJiEnPDhPKro	2022-12-19 09:28:15.157886+00
8py1zd2zrb19w7hmf7zvts1d6hgsn1cy	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p6pzG:PiU_tZ6dMSbn1CL_i08sv7MVZAfe_m3Lgpnvc8qjRUY	2022-12-19 09:29:38.062459+00
bu7vghg0ygj4i7kahrcocz7q6jaqf50v	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p6q2f:fF0fMrAfGtwfLxF0mcugyr-liPXPo55nPiVzbHul0CE	2022-12-19 09:33:09.473186+00
d8wt4uhlp1ckow4689vovwpxi0rxlfd1	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p76av:zCLBa2GYuCgJRBQNtQz_If0Hv7Qec8hMOF2DNqRF3qs	2022-12-20 03:13:37.436159+00
fl30dhdls2yohduqzsa7kdnma0z460cb	eyJfcGFzc3dvcmRfcmVzZXRfa2V5IjoiYmdxcGxzLTA5OWFmZGQwODBmODk0NmEzOTZiMDhiOGRlYTY0ODFlIn0:1p7ey3:vA-V0vCG41tlFVl-Hf8eAyy3e4n_Jj3VXRfg3zQyMJI	2022-12-21 15:55:47.421885+00
7o21uyozgzufpqoloaomyi8l7nr0m47h	eyJfcGFzc3dvcmRfcmVzZXRfa2V5IjoiYmdxcGxzLTA5OWFmZGQwODBmODk0NmEzOTZiMDhiOGRlYTY0ODFlIn0:1p7eyR:Zk_CZmNTccnEzY0k10FcfZyoOzAaForre4G4TTITXa4	2022-12-21 15:56:11.57404+00
c84w798e6qyfhky7ws61gs4sdhr3xt1h	.eJxVjUEOwiAQRe_C2jTTAoV2pxchwzBNiQ01QhON8e5S04Uu__sz77-Ew63Mbst8dzGIUUhx-mUe6cppL3BZdtwg0bql0nxvjjo355o4lUhY4poux9efasY8V08H0kofPCpvtDEAfTDeWmUD0xCmjpXEiVrdekLoGGEIWmlFMEhte6V2aeac64zjxy3en2KsHOD9AcXARB8:1p7f2s:6tMUFbcHe-2x6lqt7WQYGqPt55nFs3-q-6Q3yKiDrb0	2022-12-21 16:00:46.345133+00
jkh8co8900n5w58oc1k6olrjr3gyv9gq	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p8ETM:tNoJ5EZF3JgZ_0mhM8ERhwvANPR5mytwQ_iSStpvms4	2022-12-23 05:50:28.690573+00
yvolxqt7kqe0rexp8hsrcdrzhcqbwe9c	.eJxVjEEOwiAQRe_C2hAGhKEu3fcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaIuCtTpd8vEjzLtQO403WbN87QuY9a7og_adD9LeV4P9-9goDZ865AZHSJGCh4IwVQWAW8oIgtm10UojjNa8mhqsFyd82KR4Oy7AFa9P9hAN0A:1p8bee:QRKeFrE-mPiuk3esqhIlYiO3CvhAztk-d1I478y5mXQ	2022-12-24 06:35:40.308437+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: tenant-arganda; Owner: luciancati
--

COPY "tenant-arganda".django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	amadeuscam@yahoo.es	f	f	1
2	iuliacazacu330@gmail.com	t	t	2
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: adra_alimentos; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".adra_alimentos (id, alimento_1, alimento_2, alimento_3, alimento_4, alimento_5, alimento_6, alimento_7, alimento_8, alimento_9, alimento_10, alimento_11, alimento_12, alimento_13, signature, fecha_recogida, created_at, updated_at, modificado_por_id, persona_id) FROM stdin;
1	2	9	3	6	9	3	12	2	4	0	0	36	2	\N	2022-11-20 08:37:00+00	2022-11-20	2022-11-20 08:38:07.981625+00	2	278
2	3	18	6	12	18	3	12	3	4	0	0	36	3	[{"x": [314, 310, 315, 319, 321, 324, 327, 330, 336, 344, 354, 366, 376, 384, 389, 382, 367, 354, 337, 320, 300, 280, 255, 236, 221, 210, 204, 215, 227, 242, 256, 269, 280, 286, 291, 290, 287, 286, 285, 284, 284], "y": [91, 94, 94, 90, 87, 84, 86, 89, 90, 91, 92, 94, 94, 94, 92, 91, 90, 90, 91, 92, 94, 95, 96, 97, 99, 99, 97, 91, 87, 84, 80, 77, 74, 72, 74, 79, 82, 87, 91, 99, 105]}, {"x": [252, 247, 255, 264, 275, 289, 304, 316, 329, 334, 325], "y": [112, 112, 110, 110, 109, 107, 106, 106, 105, 104, 106]}, {"x": [294, 287, 280, 274, 269, 276, 286, 297, 310, 324, 332, 339], "y": [111, 112, 115, 116, 117, 115, 114, 112, 111, 110, 109, 107]}]	2022-11-20 08:39:00+00	2022-11-20	2022-11-20 08:39:55.099404+00	2	240
3	2	9	3	6	9	3	36	2	4	0	0	18	2	[{"x": [426, 420, 410, 395, 376, 357, 340, 326, 321, 331, 347, 361, 374, 382, 387, 379, 371, 367, 365, 377, 389, 395, 392, 389, 397, 405, 399, 391, 386, 382], "y": [119, 119, 117, 117, 116, 115, 115, 115, 115, 115, 114, 112, 111, 109, 109, 111, 114, 115, 119, 117, 116, 114, 112, 115, 116, 115, 116, 119, 121, 124]}]	2022-11-20 08:44:00+00	2022-11-20	2022-11-20 08:45:43.987194+00	2	431
4	3	15	5	10	15	3	60	3	4	0	4	30	3	[{"x": [170, 172, 174, 179, 181, 184, 186], "y": [101, 96, 92, 89, 86, 89, 94]}, {"x": [334, 331, 325, 321, 315, 309, 300, 287, 271, 251, 230, 207, 196, 191, 189, 196, 204, 215, 226, 237, 246, 251, 245, 237, 232, 231, 231, 226, 219, 214], "y": [95, 97, 97, 95, 97, 99, 99, 100, 100, 101, 101, 101, 100, 99, 96, 91, 90, 89, 89, 87, 86, 86, 91, 96, 100, 106, 111, 116, 121, 124]}]	2022-11-20 08:50:00+00	2022-11-20	2022-11-20 08:50:29.94637+00	2	310
5	5	27	9	27	18	5	118	5	5	0	0	54	5	[{"x": [399], "y": [66]}, {"x": [245], "y": [119]}, {"x": [240, 244, 247, 252, 256, 264, 269, 276, 284, 292, 301, 311, 321, 329, 335, 339, 344, 342, 334, 327, 320, 307, 299, 289, 280, 272, 265, 256, 251, 246, 241, 242, 246, 250, 254, 259, 264, 267, 271, 269, 267, 271, 276, 281, 284, 286, 282, 279, 276, 275, 276, 280, 287, 292, 295, 297, 295, 292, 289, 287, 291, 295, 299, 302, 305, 307, 309, 309, 306, 305, 304, 302], "y": [105, 101, 97, 95, 94, 92, 91, 91, 91, 91, 91, 92, 94, 95, 96, 97, 101, 104, 106, 107, 109, 110, 110, 110, 110, 110, 110, 109, 107, 107, 105, 100, 99, 97, 95, 94, 94, 92, 94, 99, 104, 102, 100, 97, 95, 92, 95, 97, 101, 105, 109, 107, 104, 101, 99, 96, 99, 102, 105, 110, 111, 110, 107, 104, 99, 94, 91, 96, 99, 104, 109, 112]}]	2022-11-20 08:54:00+00	2022-11-20	2022-11-20 08:54:49.983997+00	2	225
6	3	18	6	12	18	3	72	3	4	0	4	36	3	[{"x": [302], "y": [101]}, {"x": [307, 311, 319, 332, 346, 361, 376, 390, 401, 407, 401, 386, 364, 336, 294, 256, 220, 186, 160, 141, 131, 139, 145], "y": [99, 100, 100, 100, 101, 101, 101, 102, 104, 105, 106, 106, 107, 109, 110, 111, 114, 116, 119, 120, 120, 119, 119]}, {"x": [271, 266, 261, 267, 276, 284, 286, 282, 284, 289, 294, 291, 289, 295, 305, 316, 330, 336, 340, 339, 334, 326, 317, 304, 294, 285, 276, 269, 262, 259], "y": [110, 110, 109, 111, 110, 109, 106, 107, 110, 110, 109, 107, 110, 111, 111, 109, 104, 99, 92, 86, 81, 76, 72, 72, 75, 81, 89, 99, 107, 114]}]	2022-11-20 08:56:00+00	2022-11-20	2022-11-20 08:56:42.737341+00	2	291
7	3	15	5	10	15	3	60	3	4	0	4	30	3	[{"x": [302, 307, 311], "y": [87, 87, 85]}, {"x": [394, 392, 384, 380, 386, 396, 405, 412, 416, 402, 381, 352, 320, 286, 255, 229, 222, 237], "y": [69, 66, 65, 67, 74, 76, 79, 80, 81, 85, 87, 90, 90, 90, 90, 90, 89, 84]}, {"x": [305, 314, 329, 325, 316, 310, 306], "y": [70, 70, 71, 75, 81, 87, 91]}, {"x": [299, 294, 291, 294, 299, 296, 292, 299, 310, 319, 310, 301, 295], "y": [81, 82, 84, 81, 80, 84, 86, 84, 80, 79, 86, 94, 105]}]	2022-11-20 08:58:00+00	2022-11-20	2022-11-20 08:59:23.232806+00	2	235
8	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [246, 242, 236, 245, 255, 269, 279, 286, 290, 284, 267, 247, 227, 209, 195, 189, 196, 207, 219, 227, 235, 239, 234, 240, 246, 255, 262, 269, 261, 249, 237, 229, 225, 235, 247, 261, 272, 276, 270, 261, 250, 242, 237, 244, 256, 280, 301, 320, 332, 339, 335, 314, 286, 259, 237], "y": [61, 57, 55, 59, 64, 72, 80, 87, 92, 95, 90, 82, 72, 64, 57, 54, 55, 59, 62, 66, 69, 71, 72, 70, 67, 66, 64, 62, 67, 72, 79, 82, 85, 82, 77, 72, 70, 69, 71, 74, 77, 80, 82, 85, 86, 90, 94, 99, 102, 105, 101, 89, 74, 61, 51]}]	2022-11-20 09:00:00+00	2022-11-20	2022-11-20 09:01:19.457748+00	2	245
9	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [254, 252, 254, 256, 260, 266, 275, 286, 302, 325, 346, 364, 375, 374, 352, 299, 244, 196, 166, 159, 180, 244, 309, 370, 402], "y": [101, 95, 90, 82, 76, 71, 69, 67, 69, 71, 75, 80, 84, 89, 94, 100, 105, 110, 114, 112, 107, 97, 89, 82, 79]}]	2022-11-20 09:02:00+00	2022-11-20	2022-11-20 09:03:08.390428+00	2	261
10	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [415, 416, 419, 421, 425, 429, 424, 415, 410, 404, 397, 391, 384, 379, 372, 367, 361, 355, 351, 346, 350, 356, 360, 364, 362, 357, 352, 347, 345, 342, 339, 332, 331, 337, 341, 347, 350, 347, 344, 337, 330, 322, 315, 304, 295, 285, 277, 272, 280, 295, 315, 339, 362, 382, 401, 411], "y": [90, 86, 82, 86, 89, 91, 90, 89, 89, 89, 89, 87, 87, 87, 87, 87, 87, 87, 89, 89, 94, 92, 91, 90, 87, 86, 86, 89, 92, 94, 92, 91, 86, 82, 81, 82, 84, 87, 89, 91, 91, 92, 92, 92, 92, 91, 91, 90, 89, 87, 87, 86, 86, 85, 86, 86]}]	2022-11-20 09:05:00+00	2022-11-20	2022-11-20 09:05:19.248761+00	2	229
11	3	12	4	8	12	3	48	3	4	0	0	24	3	[{"x": [231, 231, 230, 229, 229, 230, 231], "y": [89, 84, 90, 95, 100, 105, 109]}, {"x": [229, 234, 242, 249, 246, 241, 237, 232, 230, 236, 244, 250, 256], "y": [90, 87, 86, 86, 90, 91, 94, 96, 99, 99, 99, 99, 99]}, {"x": [270, 267, 260, 256, 259, 264, 270, 276, 280, 277, 272, 267, 262], "y": [89, 87, 89, 91, 94, 95, 94, 92, 90, 87, 87, 89, 90]}, {"x": [306, 302, 297, 291, 287, 291, 296, 301, 297, 292, 287, 282], "y": [86, 85, 85, 85, 86, 89, 89, 90, 94, 95, 96, 97]}, {"x": [320, 319, 321, 322], "y": [85, 89, 94, 99]}, {"x": [337, 341, 342], "y": [86, 89, 94]}, {"x": [342, 347, 350, 354, 359], "y": [87, 86, 89, 90, 91]}, {"x": [364, 362, 359, 357, 359], "y": [82, 85, 89, 92, 96]}, {"x": [377, 374, 371, 377, 381, 385, 389, 395, 400, 399, 395, 391], "y": [85, 89, 92, 91, 90, 89, 87, 86, 86, 90, 94, 96]}, {"x": [374, 371, 376, 380, 385, 391, 399, 404, 409], "y": [94, 92, 92, 94, 94, 94, 94, 94, 94]}]	2022-11-20 09:08:00+00	2022-11-20	2022-11-20 09:09:13.812416+00	2	296
12	3	15	5	10	15	3	60	3	4	0	4	30	3	[{"x": [116, 122, 127, 136, 141, 146, 151], "y": [85, 84, 82, 81, 80, 80, 80]}, {"x": [144, 141, 137, 135], "y": [80, 82, 87, 90]}, {"x": [119, 127, 132, 139, 146], "y": [96, 94, 94, 92, 91]}, {"x": [150, 154, 159, 161, 169, 172, 176, 180, 182, 187, 192, 199, 202, 199, 206, 212, 219, 226, 232, 235, 240, 247, 256, 270, 286, 297, 286, 272, 264, 276, 297, 326, 346, 356, 339, 302, 262, 220, 185, 162, 154, 159, 184, 212, 242, 264, 270, 256, 224, 174, 140, 119, 112, 126, 151, 180, 205, 221, 225, 221, 212, 206, 204, 204], "y": [89, 90, 87, 90, 89, 87, 86, 84, 89, 89, 89, 87, 85, 87, 89, 87, 87, 85, 82, 84, 84, 81, 81, 80, 80, 80, 81, 82, 84, 82, 81, 80, 80, 81, 85, 90, 94, 99, 101, 102, 101, 96, 85, 76, 69, 65, 64, 64, 67, 74, 77, 79, 77, 70, 62, 55, 51, 50, 52, 59, 67, 75, 82, 87]}, {"x": [207], "y": [111]}]	2022-11-20 09:12:00+00	2022-11-20	2022-11-20 09:12:51.158878+00	2	244
25	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [369, 371, 371, 370, 365, 362, 356, 351, 349, 350, 352, 349, 346, 342, 334, 329, 320, 316, 312, 315, 319, 309, 296, 281, 260, 245, 232, 227, 236, 255, 275, 295, 315, 331, 344, 350, 354, 364, 381, 391, 395, 377, 357, 331, 319], "y": [61, 65, 70, 75, 77, 79, 79, 77, 72, 66, 62, 66, 69, 71, 74, 75, 76, 75, 72, 69, 66, 67, 69, 70, 72, 74, 75, 76, 75, 72, 71, 71, 71, 71, 71, 72, 75, 75, 74, 74, 75, 77, 79, 80, 81]}]	2022-11-20 09:42:00+00	2022-11-20	2022-11-20 09:43:05.846066+00	2	301
13	3	15	5	10	15	3	60	3	4	0	0	30	3	[{"x": [206, 205, 202, 202, 205, 209, 210, 215, 219, 219, 220, 224], "y": [99, 92, 86, 81, 84, 86, 91, 95, 91, 85, 77, 74]}, {"x": [234, 232, 230, 230, 232, 234, 235, 237, 240, 245, 249, 250, 251], "y": [82, 89, 92, 97, 92, 89, 84, 79, 77, 80, 86, 90, 94]}, {"x": [246, 241, 235, 229], "y": [90, 91, 92, 94]}, {"x": [254, 260, 262, 262], "y": [84, 86, 91, 96]}, {"x": [257, 260], "y": [77, 80]}, {"x": [272, 267, 264, 257, 254, 251, 257, 270, 295, 317, 339, 356, 365, 356, 331, 294, 251, 212, 184, 169, 185, 205, 229, 247, 262, 270, 264, 257, 251, 249, 251, 251, 250, 246, 241, 234, 226, 220], "y": [97, 95, 92, 89, 85, 82, 79, 79, 80, 81, 82, 85, 89, 92, 96, 99, 101, 102, 102, 101, 91, 86, 81, 79, 76, 75, 70, 67, 67, 70, 81, 87, 94, 100, 106, 112, 116, 119]}]	2022-11-20 09:14:00+00	2022-11-20	2022-11-20 09:14:45.425747+00	2	430
14	3	15	5	10	15	3	60	3	4	0	4	30	3	[{"x": [190, 191, 192, 194, 196, 199, 201, 204, 206, 207, 209], "y": [115, 111, 106, 101, 105, 110, 107, 105, 99, 95, 92]}, {"x": [225, 219, 216, 211, 210, 211, 214, 216, 221, 225, 227, 224], "y": [99, 101, 104, 109, 114, 107, 104, 101, 100, 101, 105, 107]}, {"x": [226, 220, 216, 209], "y": [107, 107, 109, 110]}, {"x": [234, 234, 232], "y": [102, 107, 110]}, {"x": [235], "y": [95]}, {"x": [241, 237, 234, 225, 220, 226, 246, 274, 307, 325, 329, 316, 289, 254, 210, 182, 166, 175, 195, 217, 241, 252, 257, 255, 250, 244, 240, 241, 242, 241, 236, 230, 222, 216], "y": [111, 109, 106, 104, 100, 96, 96, 96, 97, 100, 104, 106, 107, 110, 112, 114, 114, 109, 106, 102, 100, 97, 96, 90, 87, 85, 87, 91, 96, 102, 109, 114, 117, 122]}]	2022-11-20 09:15:00+00	2022-11-20	2022-11-20 09:16:11.859395+00	2	325
15	2	12	4	8	12	3	48	2	4	0	0	24	2	[{"x": [134, 139, 154, 170, 191, 215, 242, 279, 305, 327, 341, 346, 342, 321, 297, 271, 250, 236, 232, 241, 256, 276, 295, 307, 314, 307, 292, 271, 251, 236, 229, 234], "y": [94, 91, 90, 89, 87, 86, 85, 84, 84, 84, 84, 84, 85, 86, 87, 87, 87, 86, 84, 81, 77, 76, 76, 77, 79, 82, 86, 90, 94, 97, 100, 104]}]	2022-11-20 09:19:00+00	2022-11-20	2022-11-20 09:19:52.301874+00	2	279
16	2	9	3	6	9	3	36	2	4	0	0	18	2	[{"x": [266, 264, 257, 252, 247, 242, 239, 236, 237, 242, 245, 249, 254, 257, 260, 262, 260, 256, 250, 245, 240, 235, 231, 229], "y": [96, 92, 92, 92, 94, 96, 99, 101, 105, 107, 109, 110, 112, 114, 116, 119, 122, 124, 125, 126, 126, 126, 125, 121]}, {"x": [267, 264, 262, 259, 264, 267, 271, 271, 275, 279, 284, 286, 289, 294, 297, 302, 311, 322, 337, 356, 376, 401, 421], "y": [110, 112, 115, 119, 119, 117, 116, 121, 119, 117, 116, 119, 117, 117, 114, 111, 109, 105, 102, 100, 97, 96, 96]}]	2022-11-20 09:22:00+00	2022-11-20	2022-11-20 09:23:32.9227+00	2	448
17	2	9	3	6	9	3	36	2	4	0	0	18	2	[{"x": [204, 204, 201, 204, 207, 215, 224, 232, 240, 245, 242, 235, 226, 219, 212, 209, 216, 224, 229, 227, 224, 221, 220], "y": [140, 145, 147, 142, 137, 134, 129, 126, 126, 129, 134, 139, 142, 145, 146, 144, 139, 135, 132, 137, 141, 146, 150]}]	2022-11-20 09:24:00+00	2022-11-20	2022-11-20 09:25:20.904025+00	2	283
18	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [290, 297, 305, 315, 326, 336, 346, 356, 362, 352, 342, 326, 311, 297, 286, 277, 280, 287, 292, 297, 302, 304, 307, 307, 307, 311], "y": [87, 86, 86, 85, 84, 82, 81, 80, 80, 80, 81, 81, 82, 84, 85, 85, 81, 80, 77, 76, 77, 80, 86, 92, 97, 101]}]	2022-11-20 09:27:00+00	2022-11-20	2022-11-20 09:27:34.066235+00	2	272
19	3	15	5	10	15	3	60	3	4	0	0	30	3	[{"x": [282, 277, 269, 262, 256, 254, 261, 269, 277, 287, 301, 310, 317, 322, 319, 311, 299, 292, 290, 294, 301, 312, 322, 331, 335, 331, 319, 296, 262, 240, 230, 235, 254, 282, 322, 351, 374, 387, 394], "y": [84, 82, 84, 87, 90, 94, 97, 97, 97, 96, 94, 90, 87, 85, 81, 82, 86, 91, 95, 97, 99, 97, 94, 89, 84, 79, 76, 77, 84, 89, 92, 92, 89, 82, 75, 70, 67, 65, 65]}]	2022-11-20 09:29:00+00	2022-11-20	2022-11-20 09:29:14.617536+00	2	304
20	3	15	5	10	15	3	60	3	4	0	0	30	3	[{"x": [269, 265, 260, 255, 251, 252, 259, 265, 271, 279, 289, 295, 301, 306, 301, 292, 281, 269, 255, 242, 236, 246, 257, 275, 285, 302, 315, 324, 329, 324, 312, 301, 290, 280, 272, 267, 276, 287, 301, 315, 325], "y": [81, 80, 80, 80, 81, 85, 86, 87, 87, 87, 87, 87, 86, 85, 82, 81, 81, 80, 81, 82, 85, 87, 89, 90, 90, 90, 90, 89, 87, 85, 84, 84, 84, 84, 84, 85, 85, 85, 85, 85, 86]}]	2022-11-20 09:31:00+00	2022-11-20	2022-11-20 09:31:32.769967+00	2	439
21	3	21	7	14	21	3	84	3	4	0	4	42	3	[{"x": [299, 294, 282, 266, 244, 222, 202, 207, 229, 261, 296, 334, 350, 352, 340, 314, 281, 244, 224, 219, 226, 245, 269, 292, 315, 324, 320, 309, 290, 280, 267, 262, 275, 282, 290], "y": [91, 91, 90, 90, 90, 90, 90, 91, 94, 96, 100, 105, 109, 112, 114, 115, 115, 112, 110, 106, 100, 94, 87, 84, 80, 80, 84, 89, 94, 97, 102, 106, 102, 100, 95]}, {"x": [295], "y": [84]}]	2022-11-20 09:33:00+00	2022-11-20	2022-11-20 09:34:02.055704+00	2	440
22	2	12	4	8	12	3	48	2	4	0	0	24	2	[{"x": [176, 171, 166, 162, 159, 156, 154, 152, 155, 162, 166, 169, 172, 175, 179, 176, 171, 167, 166, 174, 181, 185, 189, 186, 182, 179, 172, 167, 164, 160, 155, 152], "y": [80, 81, 82, 85, 87, 89, 92, 95, 97, 96, 94, 92, 90, 87, 82, 80, 82, 85, 89, 87, 84, 81, 77, 80, 82, 86, 90, 95, 99, 102, 107, 111]}, {"x": [174, 170, 175, 179, 175, 179, 182, 179, 184, 181, 185, 190, 192, 196, 200, 202, 197, 194, 199, 204, 207, 210, 214, 210, 206, 201, 194, 189, 185, 182], "y": [94, 96, 95, 94, 96, 95, 92, 95, 94, 96, 94, 94, 91, 89, 85, 82, 86, 90, 91, 89, 85, 82, 79, 82, 86, 90, 96, 99, 102, 104]}, {"x": [201, 197, 194, 199, 201, 199, 204], "y": [92, 95, 97, 95, 92, 95, 94]}, {"x": [206, 207, 210, 214, 219, 224, 221, 217, 214, 209, 206, 210, 212, 205, 197, 189, 181, 172, 167, 174, 182, 196, 202, 200, 194, 186, 177], "y": [96, 92, 90, 86, 84, 81, 89, 92, 97, 101, 104, 105, 102, 99, 100, 102, 104, 105, 105, 106, 106, 105, 105, 102, 102, 102, 101]}, {"x": [205, 202, 200, 196, 201, 207, 211, 206, 200, 191, 182, 175, 171, 175, 184, 202, 214, 221, 216, 206, 194, 179, 169, 164], "y": [82, 85, 89, 92, 91, 89, 86, 82, 82, 84, 85, 89, 91, 96, 97, 99, 99, 97, 95, 94, 92, 92, 94, 95]}]	2022-11-20 09:35:00+00	2022-11-20	2022-11-20 09:36:03.671416+00	2	443
23	3	15	5	10	15	3	60	3	4	0	4	30	3	[{"x": [144, 140, 136, 132, 130], "y": [75, 81, 85, 90, 94]}, {"x": [135, 137, 144, 149, 155, 162, 167, 170, 172, 169, 167, 166, 169, 172, 177, 182, 186, 181, 184, 189, 196, 197, 192, 191, 194, 199, 204, 209, 215, 219, 221, 216, 212, 215, 222, 226, 231, 235, 239, 236, 239, 245, 249, 254, 257, 260, 261, 262, 265, 270, 275, 280, 284, 282, 284, 290, 295, 300, 304, 306, 297, 289, 285, 290, 301, 316, 337, 354, 366, 374, 369, 346, 319, 286, 250, 216, 185, 154, 140, 134, 147, 172, 197, 224, 247, 262, 270, 250, 231, 217], "y": [89, 86, 87, 89, 89, 87, 85, 82, 79, 82, 87, 91, 94, 92, 90, 87, 85, 90, 94, 92, 87, 82, 82, 87, 89, 91, 91, 90, 87, 85, 82, 84, 89, 92, 94, 92, 90, 87, 84, 87, 91, 91, 89, 87, 85, 82, 87, 92, 94, 95, 92, 91, 87, 91, 95, 96, 96, 94, 91, 87, 87, 89, 90, 92, 94, 95, 97, 99, 100, 101, 101, 101, 101, 100, 100, 99, 99, 97, 95, 92, 87, 85, 82, 81, 80, 79, 79, 85, 90, 94]}, {"x": [260, 255], "y": [72, 74]}]	2022-11-20 09:37:00+00	2022-11-20	2022-11-20 09:37:27.037702+00	2	317
24	3	15	5	10	15	3	60	3	4	0	0	30	3	[{"x": [272, 274, 276, 280, 281, 282], "y": [55, 59, 62, 67, 72, 77]}, {"x": [272, 275, 281, 286, 291, 295, 294, 289, 282, 276, 281, 285, 289, 290, 292], "y": [59, 57, 57, 59, 60, 61, 65, 65, 65, 65, 67, 69, 70, 74, 79]}, {"x": [257, 259, 266, 272, 279, 285, 292, 297, 302, 307, 311, 315, 319, 322, 321, 315, 310, 302, 296, 290, 282, 276, 271, 264, 260, 254, 250, 241, 234, 229], "y": [60, 56, 55, 54, 54, 54, 55, 55, 56, 57, 59, 61, 62, 66, 71, 74, 74, 75, 76, 76, 77, 77, 79, 79, 77, 77, 76, 75, 74, 74]}, {"x": [247, 249, 250, 250], "y": [81, 77, 72, 67]}]	2022-11-20 09:41:00+00	2022-11-20	2022-11-20 09:41:41.280278+00	2	312
26	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [325, 329, 326, 320, 315, 310, 301, 294, 289, 284], "y": [129, 131, 134, 134, 135, 135, 135, 135, 135, 135]}, {"x": [321, 320, 316, 312, 314, 311, 307, 302, 299, 295, 291, 285, 277, 270, 264, 256, 261, 270, 280, 290, 300, 310, 319, 324, 330], "y": [126, 130, 131, 130, 126, 129, 131, 132, 129, 127, 126, 126, 126, 126, 127, 127, 126, 126, 127, 127, 127, 129, 129, 129, 129]}]	2022-11-20 09:46:00+00	2022-11-20	2022-11-20 09:46:30.236128+00	2	303
27	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [315], "y": [82]}, {"x": [332, 322, 311, 297, 280, 262, 249, 240, 249, 264, 282, 300, 316, 307, 289, 267, 250, 240, 247, 264, 282, 300, 314, 316, 312, 304, 296, 291, 290], "y": [84, 84, 85, 85, 86, 87, 87, 89, 89, 89, 87, 87, 87, 91, 94, 95, 95, 94, 86, 81, 77, 74, 74, 77, 85, 94, 104, 110, 115]}]	2022-11-20 09:47:00+00	2022-11-20	2022-11-20 09:48:18.652203+00	2	252
28	2	12	4	8	12	3	48	3	4	0	0	24	2	[{"x": [332, 329, 326, 322, 319, 316, 312, 305, 300, 306, 309, 304, 300, 305, 312, 320, 329, 336, 344, 350, 355, 360, 355, 347, 341, 335, 329, 321, 317, 311, 316, 319, 322, 326, 332, 336, 342, 344, 340, 335, 326, 315, 301, 291, 285, 280], "y": [89, 91, 89, 90, 92, 94, 91, 94, 96, 94, 92, 92, 94, 92, 91, 90, 87, 86, 85, 85, 84, 84, 86, 89, 90, 91, 92, 95, 96, 99, 96, 94, 92, 90, 89, 87, 86, 89, 90, 91, 92, 94, 95, 95, 96, 96]}]	2022-11-20 09:51:00+00	2022-11-20	2022-11-20 09:51:44.510037+00	2	277
29	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [235, 231, 232, 234, 235, 241, 247, 259, 277, 295, 315, 335, 352, 365, 374, 372, 362, 346, 326, 309, 290, 279, 271, 267, 266, 267, 267, 270, 275, 275, 276, 276], "y": [107, 102, 94, 90, 85, 89, 90, 90, 87, 85, 81, 77, 76, 76, 77, 81, 85, 90, 94, 96, 95, 91, 86, 79, 70, 62, 56, 59, 67, 75, 85, 91]}]	2022-11-20 09:52:00+00	2022-11-20	2022-11-20 09:53:07.172852+00	2	247
30	5	24	8	16	24	3	96	5	4	0	4	48	5	[{"x": [347, 351, 342, 332, 321, 307, 292, 276, 260, 241, 231, 220, 214, 210, 216, 220, 225, 230, 234, 239, 242, 246, 251, 259, 264, 270, 274, 277, 275, 275, 277, 282, 286, 289, 289, 286, 279, 275, 277, 281, 287, 292, 296], "y": [44, 42, 42, 42, 44, 44, 45, 45, 46, 47, 47, 49, 49, 50, 51, 50, 49, 47, 46, 44, 47, 46, 45, 46, 45, 44, 41, 37, 32, 37, 40, 45, 50, 54, 60, 62, 62, 59, 54, 50, 46, 45, 42]}, {"x": [290, 294, 291, 287, 290, 296, 301, 304], "y": [44, 41, 39, 41, 44, 42, 41, 44]}, {"x": [309, 306, 301, 300, 306, 310, 314, 316, 319, 319], "y": [42, 39, 40, 44, 45, 44, 42, 37, 34, 39]}, {"x": [327, 330, 335, 336, 331, 327], "y": [39, 42, 41, 37, 35, 37]}, {"x": [344, 341, 346, 349, 347, 352, 356, 360, 365, 367, 362, 357, 361, 365, 369, 372, 375, 380], "y": [37, 40, 39, 36, 39, 40, 41, 40, 40, 37, 37, 39, 40, 37, 39, 42, 44, 44]}]	2022-11-20 09:57:00+00	2022-11-20	2022-11-20 09:57:25.758117+00	2	446
31	3	15	5	10	15	3	60	3	4	0	0	30	3	[{"x": [220, 225, 230, 234, 239, 245, 250, 255, 259, 247, 235, 214, 192, 171, 152, 140, 157, 189, 234, 285, 336, 386, 406, 389, 352, 302, 251, 197, 174, 167, 177, 201, 237, 262, 276, 271, 256, 242, 235, 241, 256, 279, 305, 332, 347, 356, 359, 357, 352, 347, 342], "y": [69, 71, 71, 69, 66, 64, 60, 55, 50, 54, 61, 71, 80, 87, 95, 100, 102, 100, 97, 96, 95, 95, 95, 96, 97, 100, 104, 109, 112, 114, 112, 109, 104, 101, 100, 104, 106, 109, 109, 106, 101, 94, 86, 80, 77, 77, 80, 84, 89, 95, 99]}, {"x": [370], "y": [89]}]	2022-11-20 09:59:00+00	2022-11-20	2022-11-20 09:59:58.024186+00	2	444
32	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [199, 199, 199], "y": [76, 81, 87]}, {"x": [215, 210, 205, 200, 205, 211, 216, 220], "y": [80, 79, 80, 81, 81, 81, 81, 82]}, {"x": [246, 249, 247, 242], "y": [79, 76, 80, 85]}, {"x": [264, 265, 262, 260, 257], "y": [76, 80, 82, 85, 87]}, {"x": [242, 250, 256], "y": [81, 82, 84]}, {"x": [277, 285, 290, 296, 300, 297, 295], "y": [86, 84, 80, 76, 75, 80, 84]}, {"x": [212, 220, 229, 239, 250, 262, 277, 296, 311, 326, 340, 350, 357, 365, 370, 365, 357, 352, 344, 339, 335, 335, 337, 332, 325, 319, 312, 307, 301, 296, 292, 292, 295, 300, 307, 316, 327, 332, 324, 306, 284, 264, 259, 267, 285, 309, 326, 329, 311, 284], "y": [84, 82, 82, 82, 82, 84, 84, 84, 85, 85, 85, 86, 87, 89, 89, 90, 90, 90, 90, 90, 87, 81, 77, 82, 86, 89, 90, 91, 90, 89, 84, 77, 71, 66, 61, 57, 55, 55, 62, 71, 84, 95, 100, 101, 97, 91, 85, 89, 102, 122]}]	2022-11-20 10:00:00+00	2022-11-20	2022-11-20 10:01:10.155981+00	2	286
33	2	9	3	6	9	3	36	2	4	0	0	18	2	[{"x": [184, 187, 189, 191, 190, 189, 189, 189, 189, 186, 189, 191, 192, 194, 199, 204, 207, 210, 215, 220, 225, 232, 240, 247, 254, 256, 257, 261, 262, 264, 270, 275, 284, 290, 297, 304, 309, 311, 316, 325, 332, 347, 355, 354, 344, 329, 317], "y": [44, 40, 44, 51, 60, 64, 69, 74, 79, 84, 77, 74, 67, 64, 60, 61, 64, 67, 72, 74, 75, 74, 71, 66, 59, 54, 50, 52, 56, 60, 65, 66, 65, 62, 60, 56, 52, 49, 50, 47, 45, 37, 31, 27, 25, 22, 22]}, {"x": [282, 261, 235, 207, 186, 170, 159, 156, 160, 169, 181, 199, 219, 247, 269, 286, 300, 311, 320, 326, 322], "y": [22, 24, 29, 35, 42, 51, 62, 71, 79, 84, 86, 86, 85, 80, 75, 70, 62, 55, 47, 41, 39]}]	2022-11-20 10:02:00+00	2022-11-20	2022-11-20 10:02:59.430972+00	2	438
34	3	15	5	10	15	3	60	3	4	0	4	30	3	[{"x": [182, 181, 181, 176, 174, 170, 167, 165, 162, 159, 156, 152, 149, 145, 147, 149, 145, 139, 132, 125, 119, 109, 102, 95, 87, 81, 77, 85, 100, 119, 142, 165, 190, 204, 210, 206, 190, 164, 125, 97, 81, 76, 84, 99, 129], "y": [49, 45, 40, 46, 50, 51, 47, 44, 40, 44, 46, 50, 52, 51, 44, 41, 42, 45, 49, 51, 54, 55, 56, 56, 55, 55, 54, 52, 50, 47, 45, 44, 42, 42, 42, 44, 45, 47, 52, 55, 57, 57, 56, 55, 52]}]	2022-11-20 10:06:00+00	2022-11-20	2022-11-20 10:06:25.394807+00	2	268
35	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [210, 217, 221, 227, 226, 220, 214, 205, 196, 190, 186, 187, 192, 200, 209, 215, 220, 217, 210, 201, 195, 190, 195, 201, 215], "y": [62, 62, 61, 60, 56, 56, 56, 56, 57, 60, 62, 66, 69, 72, 75, 79, 81, 84, 85, 85, 82, 81, 74, 72, 70]}, {"x": [275, 280, 282, 281, 277, 272, 265, 257, 247, 239, 230, 226, 229, 239, 251, 267, 279, 287, 291, 294], "y": [71, 69, 65, 61, 59, 59, 59, 61, 64, 67, 71, 74, 77, 79, 77, 75, 74, 71, 67, 64]}, {"x": [294, 295, 297, 302, 306, 310, 309, 306, 304, 302, 304, 309, 317, 327, 336, 341, 341, 330], "y": [55, 50, 47, 45, 46, 51, 60, 66, 72, 80, 86, 90, 91, 91, 90, 86, 81, 75]}, {"x": [165, 145, 135, 140, 154, 176, 211, 236, 269, 305, 327, 345], "y": [65, 65, 65, 65, 65, 64, 62, 62, 62, 62, 62, 62]}, {"x": [111, 120, 139, 159, 184, 211, 240, 267, 292, 316, 334], "y": [84, 84, 82, 81, 80, 79, 77, 76, 76, 76, 77]}, {"x": [249, 251, 249, 241, 230, 216, 201, 185, 177], "y": [41, 44, 47, 54, 59, 65, 71, 77, 80]}, {"x": [296, 294, 286, 275, 259, 240, 220, 191], "y": [42, 45, 49, 56, 64, 72, 82, 96]}]	2022-11-20 10:18:00+00	2022-11-20	2022-11-20 10:18:55.274737+00	2	295
36	2	12	4	8	12	3	48	2	4	0	0	24	2	\N	2022-11-20 10:19:00+00	2022-11-20	2022-11-20 10:19:58.565266+00	2	449
37	2	12	4	8	12	3	48	2	4	0	0	24	2	[{"x": [385], "y": [117]}, {"x": [374, 369, 359, 352, 346, 341, 349, 356, 362, 366, 355, 341, 321, 300, 279, 252, 234, 221, 212, 207, 212], "y": [36, 36, 36, 36, 36, 36, 40, 41, 42, 44, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46]}, {"x": [225, 227, 226, 222, 221, 222, 225, 234, 241, 237, 230, 222, 219, 216, 221, 225, 230], "y": [44, 41, 45, 44, 40, 32, 29, 26, 27, 34, 35, 37, 39, 41, 45, 46, 47]}, {"x": [239, 235, 236, 242, 249, 251, 247, 250, 254, 257, 259, 260], "y": [47, 46, 42, 40, 41, 45, 47, 42, 36, 31, 26, 22]}, {"x": [262, 264, 261, 260, 260, 260, 262, 265], "y": [22, 25, 34, 39, 44, 49, 52, 55]}, {"x": [272, 274, 279, 281, 287, 291], "y": [47, 44, 40, 37, 31, 25]}, {"x": [286, 286, 286, 286, 289, 295, 300, 306, 312, 316, 311, 305, 299, 310, 324, 339, 351, 356, 344, 324, 299, 271, 241, 222, 211, 205, 211], "y": [22, 31, 36, 42, 45, 45, 42, 39, 34, 31, 29, 29, 30, 32, 34, 34, 34, 34, 34, 34, 34, 34, 34, 35, 35, 35, 35]}]	2022-11-20 10:21:00+00	2022-11-20	2022-11-20 10:21:46.777586+00	2	228
38	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [405, 402, 399, 391, 386], "y": [60, 56, 54, 52, 52]}, {"x": [344, 339, 324, 300, 271, 254, 246, 259, 279, 315, 349, 380, 406, 421, 407, 377, 335, 289, 249, 226, 249, 289, 339, 389, 419], "y": [51, 51, 52, 54, 57, 61, 64, 69, 71, 71, 71, 70, 69, 69, 70, 71, 71, 74, 76, 77, 75, 71, 69, 66, 66]}]	2022-11-20 10:22:00+00	2022-11-20	2022-11-20 10:22:41.278119+00	2	284
39	3	15	5	10	15	3	60	3	4	0	4	30	3	[{"x": [334, 346, 357, 367, 352, 329, 295, 259, 217, 197, 191, 201, 225, 259, 304, 334, 350, 339, 315, 282, 266, 260, 262, 271, 282, 294, 294, 287, 282], "y": [75, 75, 76, 76, 76, 76, 76, 75, 75, 75, 75, 74, 72, 70, 67, 66, 65, 61, 60, 59, 59, 61, 64, 69, 74, 79, 84, 85, 85]}]	2022-11-20 10:24:00+00	2022-11-20	2022-11-20 10:24:22.544152+00	2	281
40	3	15	5	10	15	3	60	3	4	0	0	30	3	[{"x": [159, 157, 152, 146, 141, 139, 132, 126, 120, 124, 134, 142, 147, 135, 117, 100, 85, 76, 82, 95, 107, 117, 124, 121, 116, 111, 106, 109, 115, 120], "y": [76, 79, 81, 81, 79, 76, 79, 80, 80, 79, 77, 76, 76, 77, 80, 82, 84, 85, 84, 81, 79, 76, 74, 71, 71, 70, 70, 75, 77, 79]}, {"x": [129], "y": [82]}, {"x": [136], "y": [87]}]	2022-11-20 10:26:00+00	2022-11-20	2022-11-20 10:26:57.794209+00	2	311
41	2	12	4	8	12	3	48	2	4	0	0	24	2	[{"x": [287, 282, 277, 272, 269, 260, 255, 247, 242, 236, 231, 227, 232, 236, 241, 247, 256, 265, 274, 285, 295, 305, 315, 320, 314, 305, 290, 277, 266, 256, 251, 259, 267, 279, 289, 299, 306, 311, 314, 302, 291, 281, 271, 264, 271, 281, 291, 299, 304, 302, 299, 292, 286, 281], "y": [81, 81, 81, 82, 84, 85, 86, 87, 89, 90, 91, 92, 92, 94, 94, 94, 92, 91, 89, 87, 85, 82, 81, 80, 82, 85, 87, 90, 91, 92, 92, 85, 81, 77, 75, 72, 72, 72, 74, 79, 81, 84, 85, 86, 84, 81, 80, 80, 80, 85, 89, 91, 94, 96]}]	2022-11-20 10:29:00+00	2022-11-20	2022-11-20 10:29:20.865782+00	2	288
42	2	12	4	8	12	3	48	2	4	0	0	24	2	[{"x": [140], "y": [74]}, {"x": [204, 206, 209, 210, 212, 214, 219, 222, 224, 226, 229, 231], "y": [80, 77, 75, 71, 74, 77, 76, 74, 71, 74, 77, 80]}, {"x": [252, 246, 241, 235, 232, 234, 239, 242, 245, 249, 251, 256, 259, 262, 265, 267, 271, 274, 275, 274, 270, 267, 264, 269, 274, 280, 284, 289, 292, 295, 296, 297, 300, 302, 306, 311, 315, 319, 324], "y": [76, 76, 77, 77, 80, 84, 85, 82, 80, 81, 84, 82, 80, 76, 74, 71, 74, 76, 80, 85, 87, 89, 87, 87, 87, 86, 85, 84, 81, 79, 75, 79, 81, 84, 86, 86, 87, 86, 84]}, {"x": [331, 327, 321, 319, 315, 317, 322, 327, 330, 330, 331, 332, 334, 336, 337, 337, 340, 342, 347], "y": [79, 80, 82, 85, 87, 91, 90, 87, 82, 77, 71, 67, 71, 74, 79, 84, 86, 89, 87]}, {"x": [370, 365, 361, 355, 352, 351, 354, 357, 361, 360, 357, 359, 365, 369, 375, 382, 387], "y": [84, 84, 85, 85, 87, 91, 94, 91, 89, 85, 82, 85, 87, 89, 90, 90, 89]}, {"x": [366, 355, 346, 335, 321, 297, 275, 252, 234, 221, 216, 221, 240, 264, 289, 310, 324, 331, 316, 296, 275, 257, 246, 244, 250, 261, 275, 289, 299, 306, 307, 301, 290, 276, 262, 247, 239], "y": [87, 86, 85, 85, 84, 84, 85, 86, 89, 90, 90, 87, 84, 79, 75, 74, 74, 75, 82, 87, 91, 92, 92, 86, 80, 71, 64, 57, 56, 59, 65, 74, 84, 95, 105, 114, 119]}]	2022-11-20 10:32:00+00	2022-11-20	2022-11-20 10:33:28.624967+00	2	324
43	2	9	3	6	9	3	36	2	4	0	0	18	2	[{"x": [315, 312, 309, 305, 305, 301, 297, 295, 291, 292, 287, 284, 279, 275, 271, 266, 264, 262, 264, 271, 275, 279, 282, 284, 285, 286, 289, 290, 292, 290, 287, 285, 282, 284, 281, 279], "y": [97, 99, 101, 102, 97, 99, 101, 104, 105, 100, 102, 100, 100, 102, 101, 104, 107, 110, 106, 102, 101, 100, 97, 100, 105, 109, 105, 101, 96, 99, 101, 105, 102, 97, 101, 105]}]	2022-11-20 10:36:00+00	2022-11-20	2022-11-20 10:36:26.616356+00	2	276
44	3	15	5	10	15	3	60	3	4	0	0	30	3	[{"x": [390, 387, 386, 394, 399, 401, 405, 405, 401, 391, 374, 339, 305, 271, 239, 214, 201, 217, 245, 282, 324, 357, 377, 371, 346, 307, 266, 236, 220, 224, 239, 265, 294, 320, 339, 341, 335, 321, 304, 285], "y": [61, 59, 55, 57, 61, 66, 72, 77, 84, 87, 91, 94, 94, 95, 95, 94, 94, 89, 85, 82, 82, 84, 86, 85, 82, 79, 75, 71, 67, 66, 64, 61, 61, 65, 72, 79, 87, 97, 107, 122]}]	2022-11-20 10:38:00+00	2022-11-20	2022-11-20 10:39:13.095814+00	2	314
45	4	12	4	8	12	6	48	4	8	0	0	24	4	[{"x": [277], "y": [86]}, {"x": [205, 209, 211, 214, 217, 221, 225, 229, 232, 235, 241], "y": [72, 77, 81, 85, 90, 96, 101, 106, 111, 115, 117]}, {"x": [189, 190, 192, 195, 199, 202, 210, 219, 227, 237, 245, 255, 260, 269, 274, 276, 275, 270, 262, 256, 250, 244, 237, 232, 227, 232, 237, 242, 249, 259, 270, 284, 299, 310, 320, 326, 331], "y": [92, 85, 81, 79, 76, 74, 70, 67, 65, 64, 62, 64, 64, 66, 67, 71, 77, 81, 85, 87, 90, 92, 95, 96, 97, 97, 96, 95, 94, 91, 90, 87, 86, 86, 85, 86, 86]}, {"x": [275, 279, 282, 287, 292, 299, 305, 314, 320, 325, 330, 335, 339, 342, 339, 335, 332, 329, 326, 324, 320, 316, 312, 306, 300, 295, 291, 290, 291, 295, 301, 310, 319, 326, 332, 334, 331, 325, 317, 310, 301, 295, 291, 297, 307, 317, 325, 329, 331, 332, 335, 340, 350, 366, 387, 419], "y": [62, 66, 70, 74, 79, 84, 89, 94, 99, 102, 106, 110, 112, 114, 112, 111, 109, 107, 105, 102, 99, 95, 90, 84, 79, 74, 69, 62, 56, 50, 45, 41, 39, 39, 41, 46, 52, 60, 67, 74, 77, 82, 84, 80, 77, 77, 77, 81, 87, 92, 97, 99, 97, 94, 86, 72]}]	2022-11-20 10:40:00+00	2022-11-20	2022-11-20 10:42:25.196159+00	2	227
46	2	12	4	8	12	3	48	2	4	0	0	24	2	[{"x": [246, 247, 250, 252, 254, 257, 260, 265, 270, 275, 279], "y": [101, 97, 92, 89, 85, 79, 76, 71, 66, 61, 57]}, {"x": [275, 279, 281, 284, 286, 286, 285, 282, 279, 275, 272], "y": [61, 62, 65, 67, 72, 79, 85, 89, 96, 100, 104]}, {"x": [232, 227, 232, 237, 242, 249, 255, 262, 270, 280, 287, 292, 297, 301], "y": [91, 91, 90, 89, 89, 87, 86, 86, 85, 85, 84, 84, 84, 85]}, {"x": [285, 291, 301, 306, 314, 320, 326, 332, 339, 344, 350, 355, 355, 351, 346, 341, 335, 327, 317, 310, 301, 292, 285, 277, 270, 265, 260, 265, 270, 276, 285, 292, 304, 312, 321, 329, 335, 340], "y": [72, 70, 70, 70, 69, 69, 69, 69, 69, 69, 69, 70, 75, 77, 80, 84, 86, 90, 94, 96, 99, 101, 104, 106, 107, 109, 110, 110, 110, 110, 109, 109, 107, 106, 105, 104, 104, 102]}, {"x": [219, 225, 230, 235, 241, 249, 257, 266, 276, 290, 301, 312, 324, 334, 345, 352, 359, 362, 362, 356, 350, 340, 327, 311, 294, 275, 249, 230, 212, 197, 187], "y": [97, 97, 96, 96, 96, 96, 96, 95, 95, 95, 94, 94, 94, 94, 95, 96, 97, 99, 104, 107, 110, 112, 114, 114, 115, 114, 112, 110, 109, 107, 106]}]	2022-11-20 10:43:00+00	2022-11-20	2022-11-20 10:43:31.721728+00	2	251
47	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [355, 355, 359, 362, 365, 365, 362, 359, 356, 351, 347, 345, 346, 351, 355, 356, 350, 344, 337, 331, 325, 317, 312, 306, 299, 290, 281, 269, 257, 245, 234, 225, 220, 216, 219, 225, 237, 254, 275, 299, 330, 354, 374, 391, 405, 416, 420], "y": [85, 80, 81, 85, 89, 94, 97, 99, 97, 97, 95, 92, 87, 90, 94, 99, 102, 104, 104, 102, 101, 100, 100, 100, 101, 102, 104, 106, 109, 111, 112, 114, 115, 114, 112, 110, 106, 102, 99, 95, 92, 90, 87, 86, 84, 84, 82]}]	2022-11-20 10:44:00+00	2022-11-20	2022-11-20 10:44:35.480768+00	2	267
48	2	9	3	6	9	3	36	2	4	0	0	18	2	[{"x": [281, 279, 276, 272, 269, 267, 270, 274, 282, 289, 295, 301, 309, 315, 322, 331, 336, 341, 345, 347, 341, 336, 329, 320, 311, 299, 290, 280, 272, 265, 261, 266, 274, 285, 297, 307, 314, 310, 300, 287, 275, 266, 262], "y": [66, 69, 71, 75, 77, 80, 85, 89, 91, 92, 92, 92, 94, 92, 92, 91, 90, 89, 87, 84, 82, 82, 81, 81, 81, 82, 84, 84, 85, 86, 87, 89, 89, 89, 89, 89, 89, 92, 95, 97, 99, 100, 101]}]	2022-11-20 10:46:00+00	2022-11-20	2022-11-20 10:47:06.182126+00	2	231
49	3	15	5	10	15	3	60	3	4	0	0	30	3	[{"x": [375, 367, 360, 349, 337, 324, 306, 290, 275, 259, 244, 230, 214, 204, 196, 192, 195, 206, 219, 234, 251, 267, 282, 300, 310, 314, 309, 305, 300, 297, 299, 304, 301, 306, 310, 314, 319, 326, 330, 335, 340, 344, 347, 352, 355, 351], "y": [85, 85, 86, 86, 87, 87, 87, 87, 89, 90, 91, 92, 95, 97, 99, 100, 104, 106, 106, 106, 105, 105, 102, 101, 100, 99, 99, 97, 96, 94, 97, 94, 97, 97, 96, 95, 95, 95, 94, 91, 90, 92, 95, 94, 91, 96]}, {"x": [352], "y": [89]}]	2022-11-20 10:48:00+00	2022-11-20	2022-11-20 10:48:44.169346+00	2	328
50	3	18	6	12	18	3	72	3	4	0	4	37	3	[{"x": [207, 205, 207, 214, 225, 236, 249, 262, 276, 289, 294, 286, 274, 259, 244, 231, 237, 251, 274, 294, 312, 325, 330, 311, 282, 259, 240, 227, 222, 225, 232, 240, 244, 241, 235, 229, 226, 231, 241, 251, 262, 269, 271, 269, 265, 261, 261], "y": [77, 81, 84, 84, 82, 82, 82, 81, 81, 81, 81, 81, 81, 81, 81, 81, 80, 80, 80, 81, 81, 82, 82, 81, 80, 79, 77, 76, 74, 70, 67, 65, 67, 71, 75, 80, 82, 81, 77, 72, 69, 67, 71, 76, 82, 91, 97]}]	2022-11-20 10:50:00+00	2022-11-20	2022-11-20 10:51:15.426117+00	2	263
51	2	6	2	4	6	3	24	2	4	0	0	12	2	[{"x": [242, 241, 241, 244, 246, 249], "y": [67, 71, 77, 82, 85, 87]}, {"x": [241, 246, 254, 260, 257, 252, 246, 250, 254, 260], "y": [70, 70, 71, 72, 75, 76, 79, 80, 81, 81]}, {"x": [285, 282, 275, 269, 265, 267, 276, 281, 286, 289, 296, 305, 312, 317, 310, 292, 262, 235, 209, 190, 177, 172, 177, 190, 211, 236, 259, 276, 289, 284, 279, 275, 271, 279, 284, 279, 272, 281, 286, 281, 277], "y": [82, 80, 80, 80, 81, 84, 84, 84, 84, 82, 82, 81, 80, 80, 80, 80, 81, 82, 84, 85, 86, 86, 85, 84, 81, 79, 76, 75, 74, 76, 79, 81, 84, 82, 81, 82, 85, 85, 84, 85, 86]}]	2022-11-20 10:52:00+00	2022-11-20	2022-11-20 10:53:36.902178+00	2	239
52	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [294, 297, 300, 302, 304, 307, 311, 319, 325, 330, 326, 334, 342, 354, 367, 376, 380, 375, 365, 346, 329, 311, 295, 279, 265, 251, 239, 234, 236, 242, 251, 260, 266, 270, 267, 262, 259, 256, 255, 257, 260, 265], "y": [81, 77, 74, 71, 74, 76, 77, 76, 75, 74, 77, 80, 80, 80, 79, 79, 77, 77, 79, 80, 81, 82, 84, 84, 85, 85, 84, 82, 74, 67, 61, 55, 51, 49, 52, 59, 65, 71, 76, 80, 82, 80]}, {"x": [251, 245, 255, 266, 274, 280], "y": [72, 74, 72, 71, 70, 69]}]	2022-11-20 10:54:00+00	2022-11-20	2022-11-20 10:54:40.616697+00	2	287
53	2	6	2	4	6	3	24	2	4	0	0	12	2	[{"x": [254, 254, 254, 252, 252, 254, 257, 262, 267, 271, 269, 264, 261, 266, 269, 267, 261, 255, 250], "y": [75, 81, 86, 89, 82, 79, 75, 72, 71, 72, 75, 77, 79, 80, 84, 89, 90, 90, 89]}, {"x": [280, 277, 275, 272, 270, 265, 260, 255, 247, 242, 245, 251, 255, 259, 265, 269, 270, 272, 280, 284], "y": [70, 72, 75, 77, 80, 82, 85, 86, 87, 85, 82, 81, 82, 84, 86, 85, 80, 85, 86, 85]}, {"x": [280, 271], "y": [76, 76]}, {"x": [275, 282, 286, 289, 286, 284, 282, 285, 289, 299, 307, 312, 305, 299, 305, 315, 327, 346, 364, 381, 397], "y": [81, 77, 74, 71, 74, 79, 84, 86, 85, 81, 77, 75, 80, 85, 86, 85, 81, 77, 75, 72, 71]}]	2022-11-20 10:56:00+00	2022-11-20	2022-11-20 10:56:36.364495+00	2	264
54	3	15	5	10	15	3	60	3	4	0	0	30	3	[{"x": [337, 335, 331, 327, 325, 325, 321, 317, 306, 301, 295, 290, 286, 282, 277, 272, 264, 259, 252, 245, 255, 262, 271, 281, 291, 301, 307, 312, 317, 316, 319, 324, 327, 331, 335, 325, 319, 311, 304, 296, 291, 287, 289, 292, 295, 300, 291, 282, 274, 265, 256, 249, 244, 239], "y": [86, 90, 92, 94, 91, 86, 87, 89, 91, 91, 91, 91, 90, 89, 86, 85, 85, 86, 87, 87, 86, 85, 84, 84, 82, 84, 84, 85, 89, 94, 92, 90, 87, 85, 84, 86, 89, 91, 92, 94, 95, 94, 89, 85, 82, 77, 80, 84, 86, 90, 91, 94, 95, 95]}]	2022-11-20 10:58:00+00	2022-11-20	2022-11-20 10:58:55.418118+00	2	275
55	2	12	4	8	12	3	48	2	4	0	0	24	2	[{"x": [255, 252, 251, 249, 247, 249, 251, 252, 254, 254, 251, 254, 259, 265, 274, 284, 290, 292, 290, 284, 279, 272, 266], "y": [61, 66, 71, 79, 85, 82, 74, 65, 56, 51, 49, 52, 55, 57, 61, 65, 67, 70, 77, 82, 86, 89, 90]}, {"x": [244, 240, 236, 241, 245, 249, 251, 255, 261, 266, 269, 270, 266, 269, 274, 280, 286, 294, 297, 305, 311, 319, 326, 334, 339, 341, 340, 336, 329, 324, 316, 310, 304, 300, 304, 317, 332, 349, 360, 364, 361, 347, 330, 309, 289, 272, 261, 254, 251, 255, 260, 267, 274, 286, 295], "y": [84, 82, 81, 77, 76, 75, 80, 81, 80, 77, 74, 70, 75, 81, 82, 82, 81, 76, 72, 76, 79, 79, 77, 74, 67, 55, 47, 42, 42, 44, 46, 50, 54, 59, 67, 71, 72, 72, 74, 75, 77, 84, 89, 95, 100, 104, 105, 104, 99, 91, 86, 84, 84, 85, 85]}, {"x": [347, 337, 329], "y": [87, 84, 81]}, {"x": [250, 257, 266, 275, 286, 299, 307, 317, 327, 340], "y": [87, 82, 80, 76, 74, 72, 72, 72, 72, 72]}]	2022-11-20 11:05:00+00	2022-11-20	2022-11-20 11:05:22.82281+00	2	450
56	2	12	4	12	12	3	48	2	4	0	0	24	2	[{"x": [271, 277, 285, 294, 302, 312, 320, 326, 332, 339, 345, 350, 357, 362, 367, 374, 382, 389, 394, 400, 392, 387, 380, 371, 361, 351, 337, 326, 315, 302, 292, 284, 277, 279, 285, 292, 300, 310, 315, 319, 314, 307, 301, 299, 307, 320, 331, 342, 352, 359, 360, 355, 346, 339, 332, 341, 356, 374, 386, 389, 381, 367], "y": [109, 109, 109, 109, 109, 107, 107, 106, 106, 105, 105, 105, 104, 104, 102, 102, 101, 101, 101, 101, 104, 104, 105, 106, 107, 109, 111, 114, 115, 116, 117, 117, 116, 111, 107, 102, 99, 95, 94, 92, 99, 104, 111, 115, 112, 106, 101, 96, 94, 92, 97, 102, 109, 114, 116, 112, 105, 100, 99, 101, 106, 114]}]	2022-11-20 11:06:00+00	2022-11-20	2022-11-20 11:06:55.118647+00	2	237
57	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [292, 299, 304, 297, 289, 276, 266, 256, 247, 242, 249, 260, 276, 295, 315, 335, 356, 370, 379, 381, 377, 360, 339, 311, 284, 259, 242, 237, 246, 266, 292, 320, 344, 361, 352, 334, 309, 284, 264, 252, 259, 279, 310, 344, 370], "y": [79, 79, 80, 81, 81, 82, 82, 81, 81, 80, 76, 74, 74, 72, 74, 75, 77, 80, 82, 86, 89, 91, 92, 92, 92, 92, 91, 90, 87, 85, 82, 80, 80, 80, 80, 81, 81, 81, 80, 79, 77, 74, 72, 72, 75]}]	2022-11-20 11:08:00+00	2022-11-20	2022-11-20 11:08:27.100281+00	2	271
58	3	15	5	10	15	3	60	3	4	0	0	30	3	[{"x": [285, 285], "y": [79, 84]}, {"x": [284, 285, 289, 294, 299, 296, 290, 296, 302, 297, 292, 286], "y": [81, 77, 75, 75, 77, 80, 81, 80, 81, 84, 86, 86]}, {"x": [307, 305, 307, 314, 319], "y": [77, 80, 84, 82, 81]}, {"x": [307, 311, 316], "y": [79, 77, 76]}, {"x": [304, 311, 316], "y": [81, 80, 79]}, {"x": [326, 330, 329, 329, 330, 332, 335, 339, 342, 347, 354, 362, 369, 366, 354, 330, 302, 275, 254, 242, 249, 267, 296, 330, 361, 386, 391, 382, 360, 334, 311, 296, 306, 320, 329, 326, 315, 309, 305, 310], "y": [75, 74, 79, 84, 80, 75, 79, 82, 84, 82, 81, 80, 77, 75, 76, 79, 81, 84, 87, 89, 89, 86, 82, 80, 79, 76, 75, 74, 74, 74, 74, 72, 70, 69, 67, 70, 74, 77, 80, 81]}]	2022-11-20 11:09:00+00	2022-11-20	2022-11-20 11:10:01.360974+00	2	241
59	3	18	6	12	18	3	72	3	4	0	0	36	3	[{"x": [314, 315, 311, 306, 302, 299, 295, 290, 286, 291, 297, 304, 309, 304, 292, 270, 247, 226, 209, 199, 195, 210, 231, 259, 289, 315, 335, 346, 331, 307, 279, 250, 224, 214, 215, 226, 244, 265, 289, 301, 307, 300, 285, 256, 231, 210, 197, 192, 205, 226, 254, 286, 322, 359, 391, 407, 414], "y": [70, 65, 69, 71, 75, 79, 81, 84, 85, 79, 75, 72, 70, 71, 76, 84, 91, 97, 101, 104, 105, 102, 99, 94, 91, 90, 90, 90, 94, 95, 96, 96, 94, 91, 86, 79, 70, 62, 55, 52, 52, 61, 69, 80, 87, 95, 100, 102, 102, 99, 96, 94, 91, 90, 90, 90, 91]}]	2022-11-20 11:11:00+00	2022-11-20	2022-11-20 11:11:53.543728+00	2	238
110	2	3	5	2	10	4	15	2	4	0	0	30	3	[{"x": [327, 330, 335, 337, 339, 337, 335, 330, 325, 320, 314, 306, 300, 294, 287, 284, 285, 279, 264, 246, 227, 209, 191, 177, 195, 219, 245, 280, 305, 321, 326, 319, 301, 274, 244, 230, 245, 262, 284, 295, 301, 304, 302, 296], "y": [62, 64, 67, 74, 79, 86, 89, 90, 92, 94, 94, 94, 92, 91, 89, 86, 82, 87, 89, 89, 90, 91, 91, 92, 90, 89, 87, 86, 86, 86, 85, 84, 81, 80, 77, 77, 74, 71, 69, 70, 72, 77, 86, 96]}]	2022-12-18 10:18:00+00	2022-12-18	2022-12-18 10:18:40.093503+00	1	314
60	3	15	5	10	15	3	60	3	4	0	0	30	3	[{"x": [355, 352, 351, 349, 346, 342, 347, 354, 360, 369, 377, 385, 392, 396, 389, 379, 369, 359, 347, 337, 326, 314, 305, 299, 292, 287, 284, 290, 292, 286, 276, 272, 269, 276, 266, 250, 231, 207, 194, 184, 181, 185, 189, 191, 186, 184, 182, 184, 192, 199, 204, 207, 201, 199, 207, 217, 227, 235, 239, 235, 229, 224, 220, 216, 211], "y": [104, 101, 97, 91, 87, 86, 86, 86, 87, 87, 89, 90, 90, 91, 92, 92, 92, 92, 92, 92, 91, 91, 90, 89, 87, 87, 85, 86, 89, 91, 90, 89, 87, 89, 91, 91, 91, 91, 90, 89, 86, 79, 75, 72, 76, 80, 85, 89, 86, 81, 77, 75, 79, 82, 82, 79, 75, 71, 69, 77, 85, 94, 105, 117, 132]}]	2022-11-20 11:13:00+00	2022-11-20	2022-11-20 11:13:29.967174+00	2	265
61	2	9	3	6	9	3	36	2	4	0	0	18	2	[{"x": [280, 292, 305, 320, 334, 344, 350, 349, 344, 339, 334, 331, 334, 337, 344, 349, 355, 361, 357, 355, 362, 370, 379, 382], "y": [106, 102, 96, 89, 79, 69, 60, 56, 60, 67, 76, 84, 87, 89, 87, 85, 79, 74, 81, 89, 94, 91, 86, 81]}, {"x": [386, 386, 380, 369, 355, 345, 341, 344, 339], "y": [62, 56, 56, 60, 65, 69, 70, 67, 69]}, {"x": [390, 387, 382, 375, 369, 366, 366, 370, 376, 384, 392, 400, 409, 421, 431, 437, 426, 402, 366, 316, 284, 267, 271, 297, 342, 397, 421], "y": [67, 70, 71, 72, 76, 81, 86, 90, 90, 89, 84, 79, 71, 60, 52, 49, 47, 51, 57, 69, 76, 81, 82, 76, 66, 55, 47]}]	2022-11-20 11:15:00+00	2022-11-20	2022-11-20 11:15:36.005128+00	2	282
62	3	15	5	10	15	3	60	3	4	0	0	30	3	[{"x": [269, 274, 277, 279, 282, 285, 286, 289, 291, 294, 296, 300, 305, 312, 322, 330, 340, 347, 351, 341, 325, 305, 286, 272, 264, 259, 260, 267, 276, 284, 287, 292, 291, 287, 299, 315, 334, 349, 356, 334, 304, 271, 241, 222, 217, 230, 254, 286, 319, 345, 371], "y": [90, 87, 80, 76, 71, 65, 61, 64, 70, 76, 81, 86, 89, 89, 86, 82, 77, 74, 72, 79, 85, 92, 100, 104, 104, 99, 92, 85, 77, 72, 70, 72, 76, 79, 84, 82, 80, 79, 77, 80, 84, 89, 94, 95, 92, 87, 81, 76, 74, 75, 77]}]	2022-11-20 11:17:00+00	2022-11-20	2022-11-20 11:18:00.909267+00	2	293
63	2	12	4	8	12	3	12	2	4	0	0	24	2	[{"x": [205, 205, 204], "y": [71, 79, 89]}, {"x": [204, 202, 201, 199], "y": [89, 92, 96, 101]}, {"x": [182, 187, 194, 200, 207, 215, 220, 222, 221, 217, 214], "y": [76, 70, 66, 64, 62, 64, 66, 70, 76, 81, 84]}, {"x": [212, 201, 194, 187, 186], "y": [85, 89, 90, 90, 86]}, {"x": [194, 205, 212, 217, 221, 225, 230, 237, 241], "y": [70, 70, 72, 75, 79, 81, 82, 80, 76]}, {"x": [294, 286], "y": [89, 90]}, {"x": [286, 182, 200, 244, 286], "y": [90, 90, 87, 84, 80]}, {"x": [327], "y": [81]}]	2022-11-20 11:20:00+00	2022-11-20	2022-11-20 11:21:09.127943+00	2	315
64	2	6	2	4	6	3	12	2	4	0	0	24	2	[{"x": [260, 262, 265, 269, 275, 280, 287, 291, 294, 287, 280, 271, 262, 254, 244, 239, 242, 254], "y": [84, 79, 76, 75, 72, 74, 74, 72, 74, 79, 84, 90, 96, 101, 106, 109, 106, 100]}, {"x": [257, 265, 376, 391, 410, 422, 416, 397, 374, 347, 319, 281, 256, 239, 231, 232], "y": [99, 95, 67, 65, 62, 61, 61, 62, 64, 65, 67, 71, 74, 75, 74, 70]}, {"x": [289, 297, 301, 295], "y": [51, 49, 47, 45]}, {"x": [327, 331, 341, 347, 352, 344, 327, 312, 301, 296, 304, 301, 299, 304, 315, 332, 355, 375, 390, 397, 401, 406, 410, 412], "y": [70, 72, 77, 80, 81, 81, 87, 94, 101, 105, 104, 110, 114, 116, 112, 105, 97, 90, 86, 84, 81, 77, 72, 67]}, {"x": [417, 412], "y": [60, 67]}, {"x": [396, 391, 399], "y": [105, 110, 107]}, {"x": [422, 422], "y": [54, 49]}]	2022-11-20 11:23:00+00	2022-11-20	2022-11-20 11:24:00.062995+00	2	305
65	2	3	1	2	3	3	12	2	4	0	0	6	2	[{"x": [250, 252, 246, 239, 229, 221, 216, 220, 224, 230, 235, 242], "y": [84, 81, 77, 77, 79, 81, 86, 94, 96, 96, 96, 95]}, {"x": [246, 247, 251, 254, 260, 262, 267, 270, 270, 269, 267, 270, 272, 275, 276, 280, 287, 291, 294, 297, 301, 306, 300, 289, 274, 260, 254, 259, 279, 302, 325, 339, 335], "y": [92, 87, 89, 92, 91, 95, 94, 92, 87, 82, 79, 81, 84, 87, 91, 90, 91, 90, 94, 96, 97, 99, 96, 94, 92, 92, 92, 94, 95, 95, 95, 95, 94]}, {"x": [252, 256, 257, 257, 255, 254, 254, 245, 235, 222, 207, 199, 192, 197, 211, 237, 264, 290, 311, 329, 339], "y": [71, 75, 82, 87, 92, 96, 101, 99, 96, 95, 92, 90, 89, 85, 84, 86, 89, 90, 92, 94, 94]}]	2022-11-20 11:29:00+00	2022-11-20	2022-11-20 11:29:39.08192+00	2	385
66	3	18	6	12	18	3	12	3	4	12	12	36	3	[{"x": [257, 261, 266, 271, 260, 245, 231, 217, 206, 204, 209, 219, 229, 236, 241, 237, 241, 246, 251, 257, 264, 269, 264, 254, 245, 236, 232, 236, 242, 249, 254, 257, 261, 265, 270, 275, 281, 287, 294, 301, 310, 320, 329, 332, 330, 322, 309, 294, 281, 289, 301, 316, 334, 344, 350, 344, 331, 307, 286, 265, 245, 230, 219, 215, 220, 232, 249, 269, 289, 304], "y": [59, 57, 56, 52, 52, 56, 61, 67, 74, 79, 81, 81, 77, 72, 69, 70, 71, 70, 67, 66, 64, 62, 69, 75, 80, 84, 86, 81, 76, 72, 72, 74, 75, 76, 76, 76, 75, 75, 75, 74, 74, 71, 67, 64, 60, 56, 55, 55, 56, 60, 62, 65, 67, 69, 70, 71, 71, 71, 71, 72, 72, 72, 72, 74, 74, 75, 76, 79, 80, 81]}, {"x": [335, 339], "y": [91, 95]}]	2022-11-20 11:35:00+00	2022-11-20	2022-11-20 11:35:53.919784+00	2	316
67	3	3	3	6	6	6	12	3	4	0	0	18	2	[{"x": [290, 285, 281, 275, 267, 264, 257, 259, 266, 271, 276, 281, 286, 294, 290, 286, 279, 272, 267, 262, 256], "y": [56, 55, 52, 52, 52, 54, 56, 61, 64, 65, 65, 66, 67, 70, 75, 77, 79, 79, 79, 80, 80]}, {"x": [266, 269, 271, 274, 275, 275, 274, 271, 267, 265, 261, 257, 257, 260, 264, 265, 266, 269, 267, 274, 284, 287, 291, 294, 299, 302, 307, 314, 320, 325], "y": [96, 94, 89, 84, 75, 67, 59, 52, 46, 42, 40, 45, 50, 59, 66, 76, 82, 86, 80, 80, 80, 77, 75, 72, 75, 80, 82, 84, 82, 81]}]	2022-11-20 11:37:00+00	2022-11-20	2022-11-20 11:38:02.858476+00	2	318
68	2	3	6	2	12	4	18	2	4	0	0	36	3	[{"x": [256, 257, 256, 255, 256, 259, 267, 272, 279, 286, 292, 299, 305, 310, 315, 307, 297, 285, 272, 260, 246, 230, 217, 205, 195, 187, 186, 191, 199, 206, 212, 217, 222, 225, 226, 225, 224, 224, 224, 221], "y": [156, 152, 147, 142, 149, 151, 152, 151, 151, 150, 149, 147, 146, 146, 147, 149, 150, 151, 152, 154, 155, 156, 157, 157, 159, 159, 155, 152, 150, 146, 144, 142, 140, 142, 146, 152, 156, 162, 167, 170]}, {"x": [209, 215, 221, 229, 239, 247, 259, 266, 272, 276], "y": [174, 172, 171, 171, 170, 169, 169, 167, 167, 169]}, {"x": [224, 219, 227, 236, 245, 254, 261, 267, 272], "y": [179, 179, 177, 177, 176, 175, 174, 174, 172]}]	2022-12-18 08:45:00+00	2022-12-18	2022-12-18 08:46:11.577038+00	1	240
69	2	3	6	2	12	4	18	2	4	0	4	36	3	[{"x": [284, 287, 292, 297, 304, 310, 317, 322, 315, 304, 284, 262, 240, 217, 196, 177, 161, 154], "y": [47, 49, 49, 49, 50, 51, 52, 52, 54, 54, 54, 54, 54, 55, 55, 56, 57, 59]}, {"x": [261, 265, 270, 274, 272, 277, 280, 280, 285, 289, 291, 292, 291, 286, 279, 269, 259, 250, 245, 249, 254, 260, 264, 269, 271, 271, 265], "y": [52, 54, 52, 49, 52, 52, 50, 55, 54, 47, 44, 40, 36, 36, 39, 41, 46, 54, 60, 66, 67, 69, 67, 66, 62, 57, 59]}, {"x": [312, 307, 300, 292, 287, 292, 300, 309, 316, 309, 284, 259, 234, 216, 209, 220, 232, 241, 246, 245], "y": [46, 45, 45, 46, 47, 47, 47, 47, 47, 47, 49, 49, 50, 50, 51, 49, 47, 47, 49, 54]}]	2022-12-18 08:47:00+00	2022-12-18	2022-12-18 08:47:49.945779+00	1	291
70	2	3	3	2	6	4	9	2	4	0	4	18	2	[{"x": [287, 280, 272, 261, 250, 237, 224, 212, 202, 196, 204, 214, 225, 237, 242, 239, 231, 222, 234, 244, 252, 247, 244, 255, 264, 271, 275, 271, 265, 260], "y": [44, 42, 42, 42, 42, 42, 42, 42, 42, 42, 41, 40, 40, 39, 39, 41, 42, 45, 42, 39, 37, 42, 44, 41, 40, 39, 41, 46, 50, 55]}]	2022-12-18 08:53:00+00	2022-12-18	2022-12-18 08:53:38.307722+00	1	431
71	2	3	2	2	4	4	6	2	4	0	0	12	2	[{"x": [277, 282, 287, 276, 265, 251, 236, 217, 204, 194, 189, 202, 217, 232, 244, 250, 246, 240, 234, 237, 246, 254, 257, 255, 249, 244, 241, 246, 255, 266, 272, 267, 257, 251], "y": [62, 64, 64, 64, 62, 62, 64, 64, 65, 65, 65, 62, 61, 60, 59, 57, 61, 64, 64, 62, 60, 59, 57, 60, 65, 67, 70, 70, 67, 62, 60, 65, 70, 74]}]	2022-12-18 08:55:00+00	2022-12-18	2022-12-18 08:55:56.099627+00	1	270
72	2	3	3	2	6	4	9	2	4	0	0	18	2	[{"x": [275, 274, 271, 267, 261, 257, 254, 260, 265, 272, 280, 286, 291, 296, 301, 306, 312, 301, 295, 290, 284, 289, 294, 299, 295, 287, 280, 275, 270, 279, 285, 292, 300, 305, 310, 306, 297, 292, 289, 295, 302, 311, 316, 306, 296, 285, 280, 286, 296, 307, 312, 304, 297], "y": [70, 65, 62, 61, 60, 59, 57, 56, 55, 55, 55, 55, 55, 56, 56, 57, 59, 59, 59, 59, 59, 60, 61, 62, 64, 64, 64, 64, 64, 65, 65, 66, 66, 66, 66, 65, 64, 64, 62, 62, 62, 62, 62, 61, 59, 57, 56, 55, 56, 57, 57, 57, 57]}]	2022-12-18 08:57:00+00	2022-12-18	2022-12-18 08:57:46.897487+00	1	278
73	2	3	6	2	12	4	18	2	4	0	4	36	3	[{"x": [172, 174, 175, 179, 181, 185, 184, 181, 186, 189, 187, 191, 187, 184, 190, 197, 201, 205, 211, 226, 239, 251, 264, 272, 280, 285, 277, 264, 246, 226, 207, 199, 206, 214, 220, 215, 212, 210, 212, 207, 200, 194, 190], "y": [87, 84, 80, 76, 72, 70, 75, 79, 75, 72, 76, 75, 74, 76, 77, 75, 76, 77, 77, 76, 75, 74, 72, 71, 71, 71, 71, 74, 76, 79, 80, 81, 74, 70, 66, 67, 69, 66, 62, 67, 74, 80, 85]}]	2022-12-18 08:59:00+00	2022-12-18	2022-12-18 08:59:22.512785+00	1	310
74	2	3	5	2	10	4	15	2	4	0	4	30	3	[{"x": [162, 166, 170, 176, 182, 189, 194, 199], "y": [66, 65, 64, 64, 64, 64, 64, 64]}, {"x": [186, 184, 181, 177], "y": [64, 69, 71, 72]}, {"x": [165, 172, 177, 182, 187], "y": [76, 75, 75, 75, 74]}, {"x": [195, 194, 199, 205, 210, 214, 221, 225, 232, 239, 235, 230, 226, 231, 236, 241, 249, 256, 261, 270, 284, 300, 322, 335, 340, 317, 302, 286, 276, 287, 301, 314, 320, 315, 295, 269, 239, 209, 185, 169, 175, 191, 209, 219, 211, 199, 190, 186, 194, 207, 220, 229, 230, 224, 217, 211], "y": [71, 75, 72, 72, 71, 74, 74, 72, 72, 71, 70, 70, 71, 74, 74, 72, 74, 74, 72, 72, 72, 72, 71, 71, 71, 70, 69, 67, 69, 70, 71, 74, 75, 76, 75, 74, 72, 72, 72, 72, 70, 67, 65, 64, 64, 64, 62, 61, 59, 56, 55, 55, 61, 66, 70, 75]}, {"x": [214], "y": [82]}]	2022-12-18 09:00:00+00	2022-12-18	2022-12-18 09:01:06.626238+00	1	244
75	2	3	5	2	10	4	15	2	4	0	4	30	3	[{"x": [309, 309, 310, 312, 320, 329, 337, 344, 340, 320, 295, 264, 224, 197, 182, 200], "y": [76, 71, 75, 80, 84, 86, 89, 90, 92, 95, 96, 97, 99, 99, 97, 90]}, {"x": [246, 260, 290, 297, 295, 287, 279], "y": [84, 84, 85, 89, 95, 100, 102]}, {"x": [280, 272, 269, 270, 272, 279, 284, 275, 266], "y": [87, 84, 86, 91, 87, 86, 86, 100, 110]}]	2022-12-18 09:03:00+00	2022-12-18	2022-12-18 09:03:38.600535+00	1	235
76	2	3	6	2	12	4	36	2	4	0	0	36	3	[{"x": [167, 171, 179, 189, 202, 220, 240, 262, 275, 282, 275, 261, 241, 217, 200, 187, 182, 189, 195, 199, 202, 207, 211, 211, 210, 217, 220, 225, 230, 227, 225, 222, 220, 226, 231, 237, 242, 246, 249, 249, 244, 240, 229, 221, 215, 226, 247, 270, 287, 295], "y": [72, 71, 72, 74, 77, 84, 90, 99, 104, 106, 105, 101, 96, 90, 85, 82, 81, 81, 84, 85, 87, 86, 82, 90, 95, 91, 86, 82, 81, 89, 92, 96, 99, 99, 97, 94, 91, 89, 87, 82, 79, 77, 74, 72, 71, 72, 79, 87, 94, 99]}]	2022-12-18 09:06:00+00	2022-12-18	2022-12-18 09:06:22.565676+00	1	245
77	2	3	6	2	12	4	18	2	4	0	0	36	3	[{"x": [195, 192, 190, 189, 186, 181, 177, 174, 179, 194, 212, 235, 262, 287, 304, 301, 272], "y": [111, 106, 101, 96, 91, 85, 82, 80, 86, 91, 95, 97, 99, 100, 101, 105, 110]}, {"x": [152, 137, 140, 175, 234, 295, 344, 377], "y": [121, 120, 111, 99, 89, 81, 76, 75]}]	2022-12-18 09:07:00+00	2022-12-18	2022-12-18 09:07:58.621144+00	1	261
78	2	3	5	2	10	4	15	2	4	0	4	30	3	[{"x": [175, 175, 179, 184, 185, 186, 186, 181, 177, 174, 174, 175, 177, 182, 185, 187, 186, 189, 192, 194, 196, 197, 201, 202, 205, 205, 204, 202, 200, 199, 200, 201, 204, 206, 209, 212, 216, 220, 222, 221, 219, 217, 220, 224, 229, 234, 239, 240, 239, 236, 231, 226, 221, 217, 220, 224, 227, 230, 232, 235, 235, 231, 226, 216, 205, 191, 179, 166, 156, 150, 159, 172, 191, 209, 225, 240, 245, 232, 214, 194, 171, 161, 180, 200, 222, 236, 241, 236, 222, 206, 194, 186, 194, 200], "y": [117, 112, 107, 100, 96, 92, 87, 87, 89, 96, 101, 109, 112, 111, 107, 104, 109, 112, 110, 114, 111, 107, 102, 96, 90, 85, 79, 76, 82, 89, 96, 104, 109, 112, 114, 112, 109, 104, 100, 104, 107, 111, 114, 112, 109, 102, 92, 86, 80, 75, 71, 67, 65, 69, 74, 80, 90, 97, 104, 114, 120, 125, 129, 129, 127, 124, 119, 115, 111, 106, 102, 101, 101, 102, 102, 104, 105, 106, 107, 109, 110, 111, 109, 107, 106, 109, 111, 115, 119, 124, 126, 127, 125, 122]}]	2022-12-18 09:09:00+00	2022-12-18	2022-12-18 09:09:44.306335+00	1	325
79	2	3	5	2	10	4	15	2	4	0	0	30	3	[{"x": [162, 161, 161, 165, 167, 170, 172, 172, 175, 179, 184], "y": [114, 109, 104, 105, 109, 111, 107, 101, 97, 92, 91]}, {"x": [191, 187, 185, 182, 181, 184, 186, 187, 190, 194, 196, 197, 199], "y": [100, 97, 101, 106, 111, 109, 104, 100, 97, 96, 100, 105, 109]}, {"x": [195, 190, 184, 181, 177], "y": [105, 106, 107, 109, 110]}, {"x": [209, 205, 206, 209, 207], "y": [101, 104, 109, 114, 117]}, {"x": [209, 210], "y": [95, 99]}, {"x": [217, 219, 219, 217, 215, 222, 236, 255, 275, 295, 301, 295, 274, 242, 206, 174, 152, 144, 151, 169, 191, 214, 236, 247, 252, 242, 236, 229, 226, 229, 231, 231, 230, 221, 214, 204], "y": [116, 112, 106, 102, 99, 97, 100, 102, 106, 110, 114, 116, 116, 116, 116, 115, 114, 111, 107, 104, 101, 99, 97, 96, 94, 89, 87, 86, 91, 97, 104, 112, 120, 129, 134, 139]}]	2022-12-18 09:10:00+00	2022-12-18	2022-12-18 09:10:51.343891+00	1	430
80	2	3	4	2	8	4	12	2	4	0	0	24	3	[{"x": [190, 190, 189, 187, 187], "y": [70, 75, 79, 82, 89]}, {"x": [189, 192, 197, 201, 199, 194, 189, 185, 189, 195, 201, 205], "y": [72, 70, 70, 71, 76, 79, 80, 81, 84, 84, 84, 82]}, {"x": [221, 217, 212, 209, 207, 210, 217, 224, 229, 227, 220, 212, 207], "y": [75, 74, 74, 77, 80, 84, 84, 82, 80, 76, 74, 75, 76]}, {"x": [244, 247, 240, 235, 239, 244, 250, 254, 256, 251, 246], "y": [75, 72, 72, 74, 75, 76, 79, 80, 84, 86, 86]}, {"x": [266, 264, 262, 261], "y": [75, 79, 82, 86]}, {"x": [279, 277, 276, 275, 277], "y": [74, 77, 81, 86, 89]}, {"x": [282, 286, 287], "y": [76, 77, 81]}, {"x": [297, 295, 294], "y": [77, 80, 84]}, {"x": [306, 304, 301, 306, 314, 320, 317, 314], "y": [79, 84, 86, 85, 82, 80, 85, 87]}, {"x": [305, 310, 316], "y": [85, 87, 86]}]	2022-12-18 09:14:00+00	2022-12-18	2022-12-18 09:14:47.634287+00	1	296
81	2	3	5	2	10	4	15	2	4	0	0	30	3	[{"x": [241, 239, 236, 230, 235, 240, 246, 252, 257, 260, 255, 249, 237, 230, 225, 221, 231, 239, 246, 254, 257, 246, 239, 231, 224], "y": [100, 104, 102, 104, 105, 105, 105, 104, 104, 102, 100, 100, 100, 100, 101, 102, 102, 102, 102, 102, 100, 99, 99, 99, 100]}, {"x": [224, 236, 247, 255, 259, 249, 241, 232, 226, 221, 226, 235], "y": [100, 99, 99, 99, 97, 99, 99, 100, 100, 100, 100, 100]}, {"x": [229, 222], "y": [100, 100]}, {"x": [226, 235, 239], "y": [101, 101, 102]}]	2022-12-18 09:15:00+00	2022-12-18	2022-12-18 09:16:07.516455+00	1	439
82	2	3	6	2	12	4	18	2	4	0	0	24	3	[{"x": [374], "y": [59]}, {"x": [292, 295, 296, 301, 304, 305, 300, 295, 286, 281, 276, 271, 267, 260, 254, 249, 246, 242, 240, 242, 245, 250, 254, 260, 256, 251, 245, 239, 232, 226, 221, 217, 219, 224, 232, 239, 244, 250, 254, 251, 245, 237, 229, 221, 216, 222, 232, 247, 262, 276, 290, 300, 307], "y": [92, 89, 85, 85, 87, 91, 92, 91, 91, 90, 90, 90, 89, 87, 87, 87, 90, 92, 96, 99, 97, 96, 95, 92, 91, 92, 94, 95, 96, 96, 96, 95, 91, 87, 86, 85, 85, 86, 87, 91, 92, 94, 95, 95, 95, 94, 92, 91, 90, 89, 89, 89, 87]}]	2022-12-18 09:18:00+00	2022-12-18	2022-12-18 09:18:26.605305+00	1	229
108	2	3	4	2	8	4	12	2	4	0	0	24	3	[{"x": [177, 175, 172, 170, 167, 174, 181, 189, 199, 207, 215, 207, 200, 190, 180, 172, 167, 162, 157, 152, 146, 141, 146, 157, 175, 187, 197, 202, 195, 186, 179, 175, 181, 190, 202, 214, 217, 214, 210, 207, 211, 219, 229, 237, 242, 240, 232, 224, 215], "y": [91, 99, 101, 104, 109, 109, 107, 105, 101, 99, 96, 100, 102, 105, 106, 106, 106, 105, 104, 102, 102, 102, 101, 97, 91, 87, 86, 86, 94, 100, 106, 107, 106, 102, 99, 95, 99, 104, 106, 109, 107, 104, 99, 94, 92, 95, 100, 106, 110]}]	2022-12-18 10:14:00+00	2022-12-18	2022-12-18 10:15:46.825302+00	1	288
83	2	3	3	2	6	4	9	2	4	4	4	18	2	[{"x": [211, 211, 214, 216, 217, 219, 222, 225, 227, 230, 234, 235, 237, 241, 245, 249, 252, 250, 245, 236, 226, 215, 210, 207, 216, 225, 236, 244, 250, 255, 259, 262, 269, 274, 277, 280, 279, 279, 277], "y": [99, 104, 97, 91, 87, 82, 74, 70, 67, 64, 66, 70, 75, 80, 84, 89, 94, 100, 102, 102, 102, 100, 99, 97, 96, 96, 100, 102, 105, 105, 104, 101, 94, 87, 82, 80, 89, 94, 97]}, {"x": [277, 279, 282, 284, 282], "y": [84, 81, 76, 79, 84]}, {"x": [280, 284, 287, 291, 294, 297, 297, 297, 301, 306, 316, 324, 327, 327, 329, 334, 341, 350, 361, 371, 377, 374, 361, 339, 310, 279, 240, 214, 194, 185, 191, 211, 231, 255, 279, 302, 322, 337, 321, 300, 274, 242, 227, 221, 239, 271], "y": [101, 100, 95, 91, 87, 90, 97, 104, 102, 99, 91, 86, 90, 96, 102, 106, 107, 106, 104, 100, 95, 92, 90, 87, 86, 86, 89, 91, 94, 96, 100, 101, 102, 104, 105, 105, 105, 105, 104, 101, 100, 100, 99, 99, 99, 96]}]	2022-12-18 09:19:00+00	2022-12-18	2022-12-18 09:20:06.638774+00	1	451
84	2	3	3	2	6	4	9	2	4	0	0	18	2	[{"x": [192, 194, 190, 184, 180, 175, 170, 166, 165, 166, 169, 177, 182, 189, 195, 200, 206, 210, 209, 205, 202, 205, 209, 217, 225, 232, 237, 234, 231, 229, 232, 239, 246, 255, 264, 271, 276, 279, 277, 272, 264, 251, 235, 211, 194, 177, 162, 149, 140, 135, 135, 139, 146, 157, 171, 190, 205, 217, 230, 241, 250, 257, 260, 252, 244, 234, 224, 214], "y": [74, 71, 69, 71, 75, 77, 82, 87, 92, 99, 102, 101, 97, 94, 90, 86, 81, 77, 81, 86, 91, 94, 92, 89, 84, 80, 77, 84, 87, 91, 95, 95, 92, 89, 85, 79, 74, 66, 61, 57, 55, 54, 54, 57, 61, 66, 74, 80, 87, 96, 101, 106, 109, 110, 110, 107, 104, 100, 96, 91, 85, 79, 74, 70, 70, 70, 70, 70]}]	2022-12-18 09:21:00+00	2022-12-18	2022-12-18 09:22:17.493711+00	1	438
85	2	3	5	2	10	4	15	2	4	0	0	30	3	[{"x": [186, 181, 174, 167, 162, 172, 182, 194, 204, 209, 196, 187, 191, 204, 221, 242, 256, 261, 255, 239, 214, 185, 174, 189, 214, 242, 267, 285, 296], "y": [77, 77, 79, 81, 85, 87, 87, 85, 82, 82, 86, 90, 95, 95, 92, 87, 82, 77, 74, 71, 71, 74, 75, 76, 75, 75, 75, 75, 76]}]	2022-12-18 09:23:00+00	2022-12-18	2022-12-18 09:24:00.284357+00	1	304
86	2	3	3	2	6	4	9	2	4	0	0	18	2	[{"x": [202, 200, 197, 192, 187, 182, 181, 184, 187, 191, 194, 199, 202, 201, 199, 195, 191, 186, 182, 177, 175, 176], "y": [100, 97, 95, 95, 96, 99, 104, 107, 110, 111, 114, 115, 117, 121, 124, 126, 127, 127, 126, 126, 122, 117]}, {"x": [209, 205, 206, 210, 214, 219, 224, 225, 227, 232, 237, 232, 240, 247, 259, 272, 294], "y": [116, 117, 121, 122, 120, 121, 120, 116, 119, 119, 117, 116, 114, 112, 109, 105, 99]}]	2022-12-18 09:27:00+00	2022-12-18	2022-12-18 09:27:59.259215+00	1	448
87	2	3	4	2	8	4	12	2	4	0	0	24	3	[{"x": [167, 165, 162, 160, 159, 157], "y": [64, 67, 72, 76, 80, 85]}, {"x": [154, 156, 161, 164, 169, 175, 176, 174, 172, 167, 160], "y": [64, 60, 59, 57, 57, 59, 64, 67, 70, 72, 71]}, {"x": [197], "y": [72]}, {"x": [197, 205, 211, 215, 211, 206, 202, 197, 196, 201, 207, 205, 199, 195, 191, 186, 182, 184, 191, 199, 209, 214, 219, 215, 207, 200, 191, 180, 167, 154, 140, 131, 126, 125, 127, 135, 142, 150, 154, 155, 164, 182, 207, 235, 260, 274, 270, 249, 217, 184, 160, 151, 162, 181], "y": [71, 70, 69, 67, 64, 64, 66, 69, 74, 75, 75, 72, 74, 75, 76, 79, 82, 85, 87, 89, 87, 86, 85, 81, 80, 81, 84, 86, 89, 91, 94, 94, 91, 86, 81, 76, 76, 77, 80, 84, 87, 87, 85, 82, 81, 80, 81, 85, 90, 94, 97, 99, 99, 96]}]	2022-12-18 09:32:00+00	2022-12-18	2022-12-18 09:32:31.834795+00	1	449
88	2	3	7	2	14	4	21	2	4	0	4	42	4	[{"x": [274, 269, 262, 250, 234, 206, 184, 161, 142, 130, 125, 130, 144, 164, 186, 210, 232, 246, 254, 256, 252, 241, 226, 205, 187, 174, 165, 159, 157, 160, 165, 170, 176, 185, 196, 211, 224, 234, 242, 246, 245, 236, 226, 217, 207, 200, 195, 192, 192, 195, 197, 199, 200], "y": [76, 74, 74, 75, 76, 79, 81, 84, 86, 87, 87, 84, 77, 70, 64, 57, 52, 51, 54, 57, 64, 72, 81, 92, 97, 100, 100, 96, 90, 79, 70, 62, 57, 54, 52, 54, 57, 62, 70, 77, 85, 95, 101, 106, 107, 107, 105, 99, 91, 84, 76, 71, 67]}, {"x": [201, 205], "y": [65, 69]}]	2022-12-18 09:34:00+00	2022-12-18	2022-12-18 09:35:07.814387+00	1	440
89	2	3	4	2	8	4	12	2	4	0	0	24	3	[{"x": [117, 124, 130, 139, 150, 164, 187, 209, 234, 259, 282, 301, 316, 325, 312, 294, 270, 245, 221, 214, 216, 227, 245, 260, 269, 264, 252, 237, 227, 235, 247, 259, 264, 264, 257, 244, 229, 220], "y": [91, 89, 87, 86, 85, 85, 82, 81, 81, 80, 81, 82, 84, 85, 86, 86, 86, 85, 82, 80, 77, 74, 70, 70, 71, 74, 76, 80, 82, 84, 85, 86, 90, 95, 101, 111, 119, 125]}]	2022-12-18 09:37:00+00	2022-12-18	2022-12-18 09:37:21.408825+00	1	279
90	2	3	3	2	6	4	9	2	4	0	0	18	2	[{"x": [170, 174, 182, 189, 196, 200, 202, 196, 192, 186, 186, 189, 192, 195, 197, 200, 200, 197, 196, 194, 192, 192], "y": [142, 141, 140, 139, 139, 140, 145, 149, 150, 149, 140, 135, 130, 125, 122, 125, 130, 136, 142, 147, 155, 162]}]	2022-12-18 09:38:00+00	2022-12-18	2022-12-18 09:39:07.331709+00	1	283
91	2	3	6	2	12	4	18	2	4	0	0	36	3	[{"x": [277, 272, 262, 245, 230, 215, 205, 199, 207, 221, 240, 256, 265, 254, 236, 216, 197, 185, 179, 191, 205, 221, 231, 219, 204, 191, 184, 179, 176, 179, 189, 202, 214, 224, 229, 230, 229, 227, 224, 216, 211, 209, 211], "y": [81, 80, 81, 85, 87, 91, 94, 96, 97, 97, 97, 99, 100, 107, 111, 115, 119, 121, 121, 114, 110, 106, 104, 106, 110, 112, 114, 114, 111, 106, 96, 87, 79, 72, 69, 74, 81, 91, 101, 112, 122, 129, 132]}]	2022-12-18 09:40:00+00	2022-12-18	2022-12-18 09:41:22.9175+00	1	252
92	2	3	6	2	12	4	18	2	4	0	0	36	3	[{"x": [272, 277, 280, 277, 274, 267, 261, 254, 249, 244, 239], "y": [102, 102, 104, 107, 109, 109, 109, 109, 109, 109, 109]}, {"x": [271, 269, 266, 264, 267, 264, 259, 255, 251, 245, 242, 246, 241, 236, 227, 220, 212, 206, 202, 214, 222, 231, 240, 249, 259, 265, 271, 276, 281, 286, 289], "y": [99, 102, 104, 101, 97, 100, 102, 104, 105, 105, 102, 100, 99, 100, 100, 100, 100, 100, 99, 97, 97, 97, 99, 99, 100, 101, 102, 102, 102, 102, 104]}]	2022-12-18 09:42:00+00	2022-12-18	2022-12-18 09:42:38.415066+00	1	303
93	2	3	6	2	12	4	18	2	4	0	0	36	3	[{"x": [270, 272, 272, 270, 266, 262, 257, 255, 257, 254, 250, 245, 240, 235, 231, 234, 237, 241, 237, 234, 227, 221, 212, 204, 194, 187, 182, 189, 200, 211, 222, 235, 246, 257, 269, 276, 282, 287, 291], "y": [81, 84, 89, 92, 95, 96, 96, 92, 87, 90, 92, 94, 95, 95, 92, 89, 86, 85, 87, 89, 90, 91, 92, 94, 94, 95, 94, 94, 92, 92, 92, 92, 91, 91, 91, 91, 91, 91, 92]}]	2022-12-18 09:44:00+00	2022-12-18	2022-12-18 09:44:24.985853+00	1	301
94	2	3	5	2	10	4	15	2	4	0	0	30	3	[{"x": [237, 235, 232, 231, 231, 234], "y": [64, 69, 74, 79, 84, 87]}, {"x": [236, 234, 237, 244, 250, 256, 260, 262, 259, 252, 245, 239, 235, 231, 235, 240, 244, 245, 246, 249, 250, 252], "y": [71, 67, 65, 65, 66, 66, 67, 71, 75, 76, 77, 77, 76, 75, 77, 79, 82, 86, 90, 95, 99, 102]}, {"x": [216, 216, 221, 226, 234, 237, 241, 249, 254, 261, 266, 271, 276, 280, 284, 287, 286, 284, 280, 272, 266, 261, 255, 247, 239, 232, 226, 219, 212, 206, 200, 194, 187, 182, 175], "y": [70, 65, 62, 62, 62, 64, 65, 66, 67, 69, 70, 71, 72, 74, 76, 80, 86, 89, 90, 94, 95, 96, 97, 99, 99, 99, 99, 97, 97, 97, 96, 96, 96, 96, 96]}, {"x": [190, 189, 191, 194, 195, 196], "y": [105, 101, 97, 91, 87, 82]}]	2022-12-18 09:45:00+00	2022-12-18	2022-12-18 09:46:11.532063+00	1	312
109	2	3	4	2	8	4	12	2	4	0	0	24	3	[{"x": [317, 316, 319, 322, 324, 324, 321, 315, 310, 301, 294, 287, 282, 277, 274, 281, 270, 254, 231, 205, 179, 155, 139, 144, 162, 175, 226, 272, 304, 326, 334, 326, 304, 260, 226, 206, 199, 201, 211, 234, 255, 274, 286, 291, 289, 279, 269, 262], "y": [60, 56, 60, 65, 71, 79, 85, 90, 91, 92, 94, 92, 91, 91, 89, 90, 95, 96, 96, 96, 96, 95, 95, 91, 89, 87, 82, 81, 82, 82, 82, 81, 79, 76, 75, 75, 75, 72, 70, 65, 64, 64, 66, 70, 76, 90, 102, 111]}]	2022-12-18 10:16:00+00	2022-12-18	2022-12-18 10:17:05.742362+00	1	251
95	2	3	5	2	10	4	15	2	4	0	4	30	3	[{"x": [157, 152, 149, 146, 144, 146, 151, 156, 161, 165, 171, 175, 179, 175, 172, 171, 177, 180, 181, 189, 197, 201, 202, 196, 190, 189, 194, 199, 202, 207, 211, 214, 211, 209, 211, 217, 221, 224, 225, 229, 235, 237, 240, 242, 244, 241, 240, 247, 252, 262, 271, 281, 291, 300, 306, 304, 292, 276, 254, 230, 206, 179, 160, 146, 139, 150, 166, 186, 204, 219, 227, 232], "y": [90, 91, 94, 96, 99, 96, 96, 96, 96, 95, 92, 90, 89, 92, 95, 100, 99, 96, 100, 102, 101, 99, 94, 91, 92, 96, 99, 99, 97, 96, 95, 92, 95, 99, 102, 99, 96, 94, 99, 101, 100, 97, 95, 92, 95, 99, 104, 102, 102, 102, 102, 104, 105, 106, 107, 110, 110, 110, 110, 109, 107, 106, 106, 106, 106, 105, 104, 102, 101, 100, 100, 100]}, {"x": [231], "y": [87]}]	2022-12-18 09:47:00+00	2022-12-18	2022-12-18 09:47:18.428799+00	1	317
96	2	3	6	2	12	4	18	2	4	0	0	36	3	[{"x": [192, 196, 200, 197, 192, 187, 181, 175, 171, 175, 181, 190, 202, 209, 212, 207, 200, 187, 179, 172, 169, 176, 185, 197, 209, 219, 227, 235, 242, 247, 252, 257, 262, 265, 259, 249, 235, 219, 201, 182, 172, 167, 171, 176, 180, 185, 202, 235, 307], "y": [71, 70, 67, 65, 65, 65, 66, 69, 71, 77, 80, 82, 86, 89, 92, 94, 94, 94, 92, 91, 89, 85, 82, 81, 81, 82, 84, 86, 89, 91, 91, 91, 90, 86, 77, 74, 71, 69, 69, 70, 71, 72, 77, 81, 84, 85, 81, 77, 74]}]	2022-12-18 09:48:00+00	2022-12-18	2022-12-18 09:48:44.860366+00	1	295
97	2	3	2	2	4	4	6	2	4	0	0	12	2	[{"x": [156, 157, 156, 156], "y": [81, 86, 90, 95]}, {"x": [162, 165, 169, 176, 182, 186, 182, 175, 170, 165, 159, 164, 167, 174, 181], "y": [84, 82, 84, 85, 86, 87, 90, 91, 91, 92, 92, 92, 94, 94, 94]}, {"x": [211, 205, 199, 192, 200, 209, 217, 226, 235, 242, 247, 249, 242, 232, 219, 204, 189, 175, 167, 162, 162, 167, 175, 182, 189, 195, 194, 191, 194, 202, 206, 210, 210, 214, 219, 226, 231], "y": [94, 92, 92, 94, 96, 96, 96, 96, 96, 96, 96, 99, 100, 100, 101, 101, 101, 100, 99, 97, 92, 90, 87, 85, 84, 85, 91, 95, 97, 94, 90, 87, 94, 99, 101, 102, 102]}]	2022-12-18 09:51:00+00	2022-12-18	2022-12-18 09:51:51.573521+00	1	239
98	2	3	6	2	12	4	18	2	4	0	4	36	3	[{"x": [184, 182, 189, 197, 210, 222, 235, 246, 255, 242, 230, 214, 196, 186, 196, 211, 224, 234, 226, 212, 195, 184, 179, 184, 190, 196, 202, 206, 205, 204, 205], "y": [111, 114, 114, 114, 114, 114, 114, 114, 114, 114, 114, 114, 114, 114, 114, 114, 112, 112, 114, 114, 112, 111, 110, 106, 105, 104, 104, 107, 111, 116, 125]}]	2022-12-18 09:53:00+00	2022-12-18	2022-12-18 09:54:17.206474+00	1	263
99	2	3	5	2	10	4	15	2	4	0	0	30	3	[{"x": [157, 165, 169, 172, 177, 181, 185, 189, 192, 195, 187, 179, 166, 152, 137, 121, 111, 106, 119, 141, 176, 231, 277, 317, 347, 364, 347, 316, 272, 225, 182, 147, 135, 151, 174, 196, 211, 219, 216, 207, 197, 191, 199, 212, 229, 245, 259, 267, 274, 272, 269, 262, 257, 254, 254], "y": [97, 97, 96, 94, 91, 87, 85, 81, 79, 76, 79, 82, 87, 94, 100, 106, 111, 115, 120, 121, 122, 124, 125, 127, 127, 129, 129, 129, 129, 129, 130, 131, 132, 131, 131, 130, 131, 132, 134, 135, 136, 135, 127, 121, 114, 107, 104, 101, 104, 109, 116, 124, 131, 137, 144]}, {"x": [294, 291], "y": [132, 135]}]	2022-12-18 09:55:00+00	2022-12-18	2022-12-18 09:56:00.797413+00	1	444
100	2	3	6	2	12	4	18	2	4	0	0	36	3	[{"x": [165, 164, 165, 167], "y": [77, 72, 76, 80]}, {"x": [176, 170, 167, 177, 181, 186], "y": [76, 77, 79, 79, 80, 80]}, {"x": [197, 199, 196, 194, 192], "y": [71, 74, 77, 81, 84]}, {"x": [214, 216, 214, 212], "y": [71, 74, 77, 81]}, {"x": [195, 199, 204, 210, 217], "y": [75, 76, 77, 77, 77]}, {"x": [231, 237, 242, 247, 251, 251, 249, 244, 242], "y": [80, 76, 71, 67, 65, 70, 75, 79, 82]}, {"x": [239, 235, 246, 255, 264, 270, 275], "y": [76, 77, 76, 75, 75, 74, 74]}, {"x": [177, 170, 180, 192, 209, 227, 249, 270, 290, 311, 324, 331, 335, 331, 326, 320, 312, 310, 311, 312, 307, 300, 294, 290, 289, 282, 271, 256, 242, 234, 237, 247, 261, 275, 287, 281, 265, 247, 236, 232, 232], "y": [87, 86, 85, 85, 84, 82, 81, 80, 79, 79, 79, 80, 81, 82, 84, 84, 82, 75, 71, 67, 70, 75, 80, 82, 77, 77, 81, 87, 92, 95, 87, 80, 69, 59, 51, 59, 71, 85, 97, 105, 110]}]	2022-12-18 09:58:00+00	2022-12-18	2022-12-18 09:58:30.45882+00	1	286
101	2	3	6	2	12	4	18	2	4	0	0	36	3	[{"x": [296, 292, 289, 282, 277, 270, 261, 251, 241, 225, 211, 197, 185, 176, 174, 185, 200, 219, 240, 261, 282, 291, 281, 261, 227, 201, 186, 200, 227, 264, 315, 350], "y": [96, 94, 91, 89, 89, 87, 86, 85, 85, 86, 87, 89, 92, 96, 100, 104, 105, 104, 102, 101, 100, 99, 100, 101, 104, 105, 106, 104, 101, 99, 99, 99]}]	2022-12-18 10:00:00+00	2022-12-18	2022-12-18 10:00:26.483172+00	1	284
102	2	3	5	2	10	4	15	2	4	0	4	30	3	[{"x": [247, 239, 230, 219, 199, 182, 169, 161, 176, 200, 239, 271, 300, 317, 322, 314, 281, 246, 214, 194, 190, 200, 227, 252, 272, 282, 279, 269, 259, 252, 249, 250], "y": [97, 97, 97, 97, 97, 97, 97, 97, 97, 97, 100, 101, 104, 105, 105, 102, 99, 95, 92, 91, 89, 87, 85, 84, 84, 84, 87, 90, 94, 97, 102, 109]}]	2022-12-18 10:01:00+00	2022-12-18	2022-12-18 10:02:06.727018+00	1	281
103	2	3	6	2	12	4	18	2	4	0	0	36	3	[{"x": [270, 271, 267, 262, 260, 254, 249, 242, 237, 247, 255, 261, 251, 239, 224, 209, 197, 191, 195, 204, 216, 227, 239, 245, 239, 237, 239], "y": [97, 102, 104, 104, 101, 102, 104, 104, 104, 102, 102, 102, 102, 102, 104, 104, 104, 105, 104, 102, 101, 99, 97, 95, 97, 100, 106]}, {"x": [245], "y": [107]}]	2022-12-18 10:04:00+00	2022-12-18	2022-12-18 10:04:19.300679+00	1	311
104	2	3	6	2	12	4	18	2	4	0	0	36	3	[{"x": [222, 224, 229, 234, 239, 244, 252, 259, 264, 270, 274, 279, 284, 285, 280, 271, 257, 244, 230, 217, 207, 200, 195, 204, 216, 231, 249, 264, 277, 281, 277, 265, 247, 229, 206, 196, 200, 216, 236, 259, 280, 290, 284, 267, 240, 219, 206, 214, 235, 271, 289], "y": [102, 99, 96, 95, 94, 92, 92, 92, 94, 96, 99, 101, 105, 110, 112, 114, 114, 114, 114, 112, 111, 109, 107, 102, 101, 100, 100, 100, 101, 102, 104, 105, 105, 105, 105, 104, 101, 99, 97, 97, 97, 99, 102, 104, 105, 106, 106, 105, 104, 102, 102]}]	2022-12-18 10:05:00+00	2022-12-18	2022-12-18 10:05:44.651613+00	1	271
105	2	3	6	2	12	4	18	2	4	0	0	36	3	[{"x": [202, 209, 214, 220, 229, 237, 247, 256, 264, 271, 279, 285, 282, 274, 259, 240, 216, 200, 187, 180, 176, 181, 187, 194, 201, 207, 211, 211, 210, 211, 215, 219], "y": [84, 84, 82, 82, 81, 80, 79, 77, 76, 75, 75, 74, 72, 72, 72, 72, 75, 76, 76, 76, 75, 72, 71, 70, 69, 67, 69, 75, 79, 86, 89, 90]}]	2022-12-18 10:07:00+00	2022-12-18	2022-12-18 10:08:15.469861+00	1	272
106	2	3	5	2	10	4	15	2	4	0	4	30	3	[{"x": [304, 304, 306, 307, 309, 306, 304, 301, 297, 292, 287, 285, 284, 285, 286, 284, 281, 279, 275, 272, 267, 265, 264, 264, 262, 262, 259, 255, 251, 246, 240, 234, 225, 214, 204, 195, 190, 201, 224, 245, 267, 290, 309, 321, 307, 282, 254, 229, 212, 204], "y": [120, 114, 110, 105, 101, 104, 107, 111, 115, 120, 117, 110, 106, 99, 94, 101, 105, 109, 111, 114, 114, 110, 105, 100, 95, 90, 95, 100, 106, 111, 114, 116, 117, 116, 115, 114, 112, 107, 105, 104, 102, 102, 101, 101, 106, 110, 115, 119, 120, 121]}]	2022-12-18 10:10:00+00	2022-12-18	2022-12-18 10:10:57.346585+00	1	268
107	2	3	6	2	12	4	18	2	4	0	0	36	3	[{"x": [281, 285, 287, 284, 280, 277, 275, 276, 271, 267, 271, 266, 256, 246, 232, 217, 204, 194, 186, 192, 204, 220, 237, 259, 275, 286, 294, 299], "y": [92, 94, 97, 100, 101, 99, 96, 101, 104, 102, 101, 104, 107, 110, 114, 117, 120, 122, 124, 120, 115, 110, 105, 99, 95, 92, 90, 89]}]	2022-12-18 10:12:00+00	2022-12-18	2022-12-18 10:12:31.633862+00	1	267
111	2	3	3	2	6	4	9	2	4	0	0	18	2	[{"x": [264, 262, 259, 256, 255, 251, 247, 245, 240, 237, 234, 232, 229, 224, 220, 219, 222, 226, 231, 234, 237, 240, 242, 244, 244, 242, 240, 237, 242, 244, 242, 241, 239, 240, 239], "y": [121, 125, 122, 120, 116, 119, 117, 120, 119, 117, 119, 122, 124, 122, 120, 125, 129, 131, 131, 129, 125, 122, 117, 112, 117, 120, 124, 122, 125, 129, 125, 121, 117, 122, 126]}]	2022-12-18 10:19:00+00	2022-12-18	2022-12-18 10:20:03.790436+00	1	276
112	2	3	4	2	8	4	12	2	4	0	0	24	3	[{"x": [165, 161, 157, 154, 151, 147, 145, 149, 152, 157, 160, 162, 164, 161, 157, 155], "y": [76, 77, 80, 84, 87, 91, 94, 95, 92, 89, 86, 82, 77, 75, 77, 85]}, {"x": [155, 160, 167, 171], "y": [85, 86, 81, 76]}, {"x": [177, 175, 172, 169, 165, 161, 156, 151, 147, 144], "y": [69, 72, 77, 82, 89, 96, 102, 107, 111, 114]}, {"x": [162, 160, 165, 167, 165, 170, 167, 171, 174, 172, 175, 179, 185, 189, 190, 192, 194, 190, 187, 187, 192, 196, 199, 201, 204, 200, 196, 192, 190, 186, 184, 181], "y": [90, 94, 92, 89, 92, 91, 95, 94, 91, 94, 92, 94, 89, 85, 81, 77, 74, 79, 85, 90, 87, 85, 82, 79, 74, 77, 85, 91, 97, 102, 106, 110]}, {"x": [192, 190, 195, 197, 196, 200, 202, 200], "y": [94, 97, 95, 92, 96, 95, 92, 96]}, {"x": [211, 207, 207, 209, 210, 212, 219, 219, 216, 214, 210, 209, 205, 204, 200, 195, 189, 180, 171, 162, 155, 151, 154, 160, 170, 182, 191, 195, 191, 185, 177, 169, 161, 157, 162], "y": [97, 96, 90, 85, 80, 76, 79, 84, 89, 96, 101, 105, 106, 102, 99, 96, 95, 96, 99, 101, 104, 105, 107, 107, 107, 106, 105, 104, 101, 101, 100, 99, 97, 96, 92]}, {"x": [201, 196, 192, 195, 199, 204, 210, 214, 212, 205, 194, 181, 167, 156, 145, 141, 144, 151, 164, 187, 206, 219, 225, 219, 202, 185, 169, 154, 141, 132], "y": [79, 80, 84, 89, 90, 91, 90, 87, 81, 79, 77, 76, 77, 80, 85, 89, 94, 96, 99, 101, 100, 99, 96, 92, 92, 91, 91, 91, 91, 92]}]	2022-12-18 10:22:00+00	2022-12-18	2022-12-18 10:22:22.751314+00	1	443
113	2	3	3	2	6	4	9	2	4	0	0	18	2	[{"x": [132, 135, 136, 137, 137, 136, 134, 130, 132, 137, 141, 144, 149, 154, 159, 160, 160, 160, 162, 165, 169, 175, 180, 179, 179, 177, 176, 180, 182, 187, 191, 195, 199, 196, 192, 191, 195, 199, 202, 204, 206, 211, 214, 215, 212, 215, 217, 220, 219, 214, 214, 215, 217, 221, 224, 226, 229, 235, 240, 239, 236, 232, 227, 231, 239, 234, 230, 227, 235, 241, 249, 255, 259, 257, 251, 250, 255, 260, 264, 267, 270, 272, 275, 280, 284, 289, 290, 285, 281, 286, 290, 295, 299, 297, 289, 284, 285, 286, 289, 292, 294, 297, 300, 304, 299, 290, 276, 260, 241, 222, 206, 191, 182, 190, 206, 222, 240, 257, 272, 286, 301], "y": [136, 134, 130, 126, 121, 117, 112, 114, 119, 117, 114, 120, 124, 125, 121, 115, 107, 112, 117, 120, 121, 121, 117, 110, 105, 102, 109, 116, 119, 120, 119, 117, 112, 109, 111, 115, 116, 115, 112, 115, 119, 119, 116, 111, 114, 116, 119, 121, 125, 127, 117, 110, 106, 105, 107, 111, 115, 119, 119, 114, 112, 110, 110, 109, 107, 110, 111, 114, 115, 114, 112, 110, 109, 106, 110, 115, 116, 116, 115, 112, 110, 104, 101, 102, 104, 110, 114, 114, 112, 110, 111, 111, 112, 116, 117, 114, 102, 97, 95, 101, 107, 112, 116, 119, 124, 122, 121, 120, 119, 117, 116, 116, 115, 115, 114, 114, 114, 114, 114, 114, 115]}, {"x": [309], "y": [120]}]	2022-12-18 10:24:00+00	2022-12-18	2022-12-18 10:25:09.36407+00	1	454
114	2	3	5	2	10	4	15	2	4	0	0	30	3	[{"x": [232, 235, 236, 239, 241, 245, 250, 254, 255, 255, 257, 260, 266, 272, 281, 289, 296, 300, 292, 280, 265, 247, 226, 212, 202, 196, 194, 204, 219, 232, 247, 262, 274, 280, 275, 262, 246, 229, 215, 205, 202, 207, 220, 237, 255, 269, 275, 276, 269, 256, 245, 240], "y": [87, 82, 77, 74, 70, 66, 62, 61, 66, 75, 79, 82, 86, 87, 87, 87, 87, 86, 86, 86, 89, 91, 94, 95, 95, 95, 92, 87, 82, 80, 77, 76, 75, 75, 76, 79, 81, 85, 87, 89, 87, 84, 79, 74, 71, 71, 74, 79, 86, 96, 107, 115]}]	2022-12-18 10:26:00+00	2022-12-18	2022-12-18 10:26:58.264341+00	1	293
115	2	3	4	2	8	4	12	2	4	0	0	24	3	[{"x": [196, 194, 194, 196, 197, 199, 200, 200, 197, 195], "y": [77, 80, 85, 90, 96, 99, 106, 112, 115, 119]}, {"x": [196, 202, 210, 216, 224, 231, 240, 250, 261, 269, 276, 280, 280, 276, 269, 260, 251, 241, 230, 222, 214, 206, 200, 195, 190, 199, 210, 222, 240, 254, 265, 272, 275, 266, 260, 255, 250, 247, 246, 247, 254, 260, 267, 274, 277, 272, 265, 259, 252, 255, 262, 271, 285, 295, 301, 304, 300, 295], "y": [80, 80, 80, 80, 80, 81, 81, 82, 84, 85, 87, 89, 94, 95, 95, 96, 96, 96, 96, 97, 97, 97, 99, 99, 99, 96, 94, 91, 87, 84, 80, 76, 74, 70, 71, 75, 81, 87, 92, 96, 94, 89, 82, 77, 72, 76, 81, 86, 92, 96, 96, 92, 86, 82, 80, 82, 85, 90]}]	2022-12-18 10:27:00+00	2022-12-18	2022-12-18 10:28:07.646921+00	1	237
116	2	3	2	2	4	4	6	2	4	0	0	12	3	[{"x": [169, 167, 166, 170, 172, 174, 179, 177, 174, 176, 182, 179, 175, 172], "y": [84, 89, 94, 90, 85, 81, 82, 87, 89, 86, 87, 92, 94, 90]}, {"x": [184, 191, 187, 182, 179, 175, 171, 175, 182, 187, 192, 190, 196, 201, 204, 199, 196, 197, 202, 205, 211, 216, 224, 235, 254, 270, 291], "y": [80, 79, 82, 87, 90, 92, 91, 89, 90, 91, 92, 87, 87, 84, 77, 79, 82, 89, 89, 87, 89, 89, 89, 86, 82, 80, 80]}]	2022-12-18 10:29:00+00	2022-12-18	2022-12-18 10:30:38.258798+00	1	264
117	2	3	5	2	10	4	15	2	4	0	0	30	3	[{"x": [185, 184, 182, 184], "y": [72, 76, 79, 82]}, {"x": [185, 184, 190, 194, 201, 200, 196, 192, 201, 199, 195, 189, 185], "y": [76, 72, 71, 70, 70, 74, 75, 76, 76, 79, 80, 81, 82]}, {"x": [212, 207, 205, 207, 214], "y": [71, 72, 76, 80, 80]}, {"x": [206, 214, 219, 224], "y": [72, 71, 71, 71]}, {"x": [206, 212, 219], "y": [76, 75, 74]}, {"x": [226, 231, 227, 222, 229, 235, 230, 224, 220, 229, 241, 255, 265, 250, 229, 206, 189, 179, 192, 211, 232, 252, 265, 256, 236, 212, 191, 180, 191, 211, 230, 241, 231, 211, 200, 195, 206, 217, 225], "y": [70, 70, 75, 80, 76, 71, 72, 75, 76, 80, 80, 80, 79, 80, 81, 82, 85, 85, 79, 75, 72, 71, 70, 71, 72, 74, 75, 75, 70, 67, 65, 65, 69, 72, 75, 77, 80, 80, 81]}]	2022-12-18 10:32:00+00	2022-12-18	2022-12-18 10:32:38.597204+00	1	241
118	2	3	6	2	12	4	18	2	4	0	0	36	3	[{"x": [259, 261, 264, 266, 265, 270, 274, 279, 282, 290, 299, 310, 322, 334, 344, 335, 321, 296, 275, 254, 232, 214, 196, 181, 170, 166, 172, 180, 192, 204, 212, 220, 225, 219, 212, 206, 204, 202, 205], "y": [109, 105, 101, 97, 101, 101, 100, 99, 104, 105, 106, 106, 106, 106, 106, 106, 106, 107, 107, 107, 109, 109, 109, 109, 107, 106, 100, 96, 89, 84, 79, 75, 72, 79, 84, 91, 96, 100, 104]}, {"x": [187, 192, 200, 210, 221, 234], "y": [89, 90, 90, 90, 90, 91]}]	2022-12-18 10:34:00+00	2022-12-18	2022-12-18 10:34:53.273264+00	1	287
119	2	3	5	2	10	4	15	2	4	0	0	30	3	[{"x": [271, 269, 265, 261, 257, 251, 247, 249, 244, 240, 231, 222, 219, 211, 206, 196, 187, 179, 170, 162, 175, 189, 205, 224, 246, 264, 285, 291, 300, 306, 302, 295, 286, 277, 270, 264, 267, 272, 279, 284, 272, 260, 250, 239, 229, 219, 212, 207, 210, 215, 221, 226, 232, 236, 226, 214, 194, 176, 161, 149, 140, 136], "y": [121, 125, 126, 129, 130, 130, 126, 122, 121, 122, 124, 124, 122, 121, 120, 119, 117, 117, 116, 116, 117, 119, 120, 121, 124, 126, 127, 129, 129, 129, 130, 131, 131, 131, 131, 131, 126, 122, 120, 116, 119, 122, 125, 127, 130, 131, 131, 131, 126, 124, 121, 119, 116, 115, 116, 120, 122, 125, 127, 130, 130, 131]}]	2022-12-18 10:36:00+00	2022-12-18	2022-12-18 10:36:55.883685+00	1	275
120	2	3	6	2	12	4	18	2	4	0	0	36	3	[{"x": [260, 264, 257, 255, 251, 249, 245, 241, 246, 251, 255, 257, 261, 257, 249, 232, 210, 186, 167, 172, 190, 212, 239, 271, 290, 301, 294, 277, 247, 222, 205, 196, 206, 222, 247, 267, 284, 295, 301, 300, 290, 272, 251, 226, 202, 177, 165, 161, 172], "y": [96, 94, 97, 100, 105, 109, 111, 114, 109, 104, 99, 95, 94, 95, 97, 101, 104, 105, 107, 109, 109, 109, 109, 110, 111, 112, 112, 112, 111, 110, 109, 106, 97, 91, 84, 79, 75, 74, 75, 79, 84, 90, 97, 104, 110, 116, 120, 121, 119]}]	2022-12-18 10:39:00+00	2022-12-18	2022-12-18 10:39:43.84769+00	1	238
121	2	3	3	2	6	4	9	2	4	0	0	18	2	[{"x": [177, 180, 186, 196, 205, 215, 221, 225, 226, 226, 222, 220, 217, 216, 219, 222, 227, 232, 239, 244, 249, 251, 252, 254, 255, 257, 261, 264], "y": [130, 127, 124, 116, 110, 100, 91, 82, 76, 71, 81, 92, 105, 115, 121, 124, 124, 120, 115, 106, 100, 97, 101, 106, 111, 114, 115, 112]}, {"x": [269, 267, 257, 247, 241, 237], "y": [90, 87, 87, 89, 90, 89]}, {"x": [284, 277, 267, 255, 245, 241, 244, 251, 262, 276, 295, 309, 321, 327, 329, 325, 320, 314, 310, 311, 317, 325, 335, 339, 329, 309, 277, 224, 179, 147, 137, 147, 177, 226, 262, 282, 259, 224, 187, 175, 179, 195, 217, 237], "y": [95, 95, 95, 96, 100, 105, 110, 114, 115, 115, 110, 105, 97, 89, 80, 72, 70, 69, 71, 76, 84, 92, 100, 102, 100, 95, 90, 89, 92, 99, 105, 107, 107, 102, 97, 92, 92, 100, 116, 130, 140, 147, 154, 159]}]	2022-12-18 10:43:00+00	2022-12-18	2022-12-18 10:43:17.530875+00	1	282
122	2	3	5	2	10	4	15	2	4	0	0	30	3	[{"x": [330, 319, 310, 300, 286, 270, 250, 226, 209, 195, 186, 181, 191, 206, 224, 245, 266, 287, 306, 315, 307, 295, 280, 262, 252, 247, 250, 256, 264, 265, 262, 265, 270, 274, 275, 281, 286, 291, 289, 292, 297, 301], "y": [99, 99, 97, 97, 99, 99, 100, 102, 104, 106, 107, 109, 111, 111, 111, 112, 112, 112, 112, 112, 111, 109, 107, 105, 102, 100, 106, 107, 104, 100, 102, 105, 104, 102, 106, 106, 105, 102, 106, 109, 107, 106]}, {"x": [305], "y": [100]}]	2022-12-18 10:44:00+00	2022-12-18	2022-12-18 10:44:39.088459+00	1	328
123	2	3	4	2	8	4	12	2	4	0	0	24	3	[{"x": [167, 169, 171, 174, 176, 179, 180, 182, 184, 185, 189], "y": [94, 91, 87, 89, 92, 94, 90, 87, 91, 95, 97]}, {"x": [201, 197, 192, 187, 190, 195, 199, 204, 209, 212, 216, 219, 224, 225, 222, 220, 222, 226, 229, 232, 234, 237, 240, 244, 247], "y": [95, 94, 95, 97, 99, 99, 96, 99, 99, 96, 94, 90, 92, 96, 100, 104, 100, 99, 97, 94, 91, 94, 96, 99, 101]}, {"x": [239, 237], "y": [84, 87]}, {"x": [221, 217, 219], "y": [86, 87, 91]}, {"x": [256, 252, 249, 251, 254, 257, 259, 259, 259, 260, 262, 265, 267, 271], "y": [96, 97, 99, 102, 104, 101, 97, 92, 87, 92, 95, 97, 100, 102]}, {"x": [274, 282, 279, 276, 272, 274, 279, 282, 286, 290, 294], "y": [102, 99, 97, 99, 100, 104, 102, 99, 101, 102, 104]}, {"x": [302, 292, 281, 269, 252, 236, 220, 201, 190, 199, 212, 231, 244, 250, 242, 229, 210, 197, 189, 192, 204, 222, 236, 246, 252, 247, 237, 222, 212, 205], "y": [97, 99, 99, 100, 100, 100, 100, 100, 99, 96, 95, 95, 96, 99, 104, 105, 107, 107, 106, 99, 92, 84, 77, 74, 72, 77, 84, 94, 100, 105]}, {"x": [204, 199, 194, 191], "y": [106, 110, 112, 115]}]	2022-12-18 10:48:00+00	2022-12-18	2022-12-18 10:48:37.38904+00	1	324
124	2	3	5	2	10	4	15	2	4	0	4	24	3	[{"x": [285, 287, 289, 289, 287, 284, 284, 286, 290, 299, 306, 312, 320, 329, 339, 351, 359, 364, 354, 337, 314, 281, 256, 239, 229, 236, 250, 259, 264, 265, 262, 260, 257, 257, 260, 265, 269, 272, 274, 271, 267, 262, 261, 265, 275, 285, 296, 309, 320, 332, 342, 350, 334, 316, 295, 269, 247, 230, 215, 206], "y": [97, 94, 87, 80, 77, 81, 90, 95, 97, 97, 96, 94, 91, 89, 86, 84, 84, 84, 87, 89, 91, 94, 94, 95, 95, 96, 100, 105, 110, 115, 120, 124, 121, 115, 104, 91, 80, 71, 67, 76, 84, 90, 94, 95, 91, 87, 84, 81, 77, 76, 75, 75, 76, 77, 79, 79, 80, 80, 81, 81]}]	2022-12-18 10:50:00+00	2022-12-18	2022-12-18 10:50:57.901363+00	1	277
125	2	3	3	2	6	4	9	2	4	0	0	18	2	[{"x": [217, 214, 209, 205, 204, 209, 216, 221, 227, 234, 240, 246, 255, 260, 265, 270, 275, 279, 275, 266, 262, 257, 251, 245, 239, 229, 221, 212, 204, 196, 191, 197, 209, 222, 235, 247, 251, 240, 226, 212, 200, 195, 202, 214, 220], "y": [86, 89, 91, 95, 99, 102, 106, 107, 110, 110, 111, 112, 112, 111, 111, 110, 109, 106, 104, 102, 101, 100, 99, 97, 97, 96, 95, 95, 95, 95, 96, 102, 105, 107, 110, 111, 112, 111, 110, 109, 107, 107, 107, 109, 109]}]	2022-12-18 10:51:00+00	2022-12-18	2022-12-18 10:51:49.896458+00	1	231
126	2	3	5	2	10	4	15	2	4	0	4	30	3	[{"x": [302, 296, 292, 297, 306, 315, 324, 332, 339, 345, 340, 331, 319, 305, 285, 270, 255, 241, 230, 220, 212, 207, 211, 206, 201, 196, 191, 184, 180, 175, 179, 182, 186, 190, 185, 184, 186, 191, 195, 197, 199, 194, 200, 209, 215, 220, 224, 220, 217, 216, 217, 221], "y": [110, 106, 105, 105, 105, 106, 107, 109, 110, 111, 111, 111, 111, 110, 109, 109, 107, 106, 106, 105, 105, 104, 105, 107, 106, 105, 105, 105, 104, 105, 104, 100, 96, 91, 95, 99, 104, 106, 105, 102, 99, 99, 96, 92, 89, 86, 85, 89, 96, 105, 116, 131]}]	2022-12-18 10:53:00+00	2022-12-18	2022-12-18 10:53:52.494735+00	1	265
127	2	3	2	2	4	4	6	2	4	0	0	12	2	[{"x": [159, 164, 170, 174, 177, 180, 177, 169, 164, 157, 152, 147, 142, 137, 134, 132, 131, 134, 139, 145, 149, 154, 159, 165, 169, 172, 171, 175, 179, 187, 192, 195, 199, 197, 199, 205, 209, 214, 219, 224, 229, 232, 241, 251, 264, 270, 272, 264, 254, 245, 234, 226, 219, 212, 206, 201, 195, 190], "y": [70, 71, 70, 69, 66, 64, 59, 57, 59, 60, 61, 62, 65, 69, 71, 74, 79, 82, 85, 85, 84, 82, 81, 77, 76, 72, 77, 80, 79, 76, 75, 72, 71, 76, 79, 80, 79, 77, 76, 74, 72, 70, 69, 65, 61, 59, 56, 57, 60, 64, 70, 75, 80, 85, 90, 94, 96, 99]}, {"x": [177, 179, 184, 192, 199, 204, 209, 214, 219, 222, 215, 209, 202, 194, 186, 181, 177], "y": [66, 69, 70, 71, 70, 69, 66, 64, 62, 60, 62, 65, 69, 74, 79, 81, 84]}, {"x": [204, 199, 195, 186, 176, 166, 157, 150], "y": [55, 57, 61, 67, 74, 80, 85, 90]}]	2022-12-18 10:55:00+00	2022-12-18	2022-12-18 10:58:49.0975+00	1	455
128	2	3	2	2	4	4	6	2	4	0	0	12	2	[{"x": [192, 190, 192, 195, 199, 206, 215, 220, 226, 224, 216, 205, 199, 189, 180, 172, 167], "y": [81, 77, 74, 72, 71, 72, 72, 71, 71, 75, 80, 85, 89, 94, 99, 104, 107]}, {"x": [167, 171, 182], "y": [107, 105, 100]}, {"x": [245, 250, 271, 290, 307, 320, 310, 297, 282, 261, 226, 205, 197], "y": [79, 77, 72, 70, 67, 66, 67, 69, 71, 74, 77, 79, 79]}, {"x": [266, 261, 255], "y": [50, 49, 49]}, {"x": [292, 296, 291, 280, 276, 264, 229], "y": [75, 76, 79, 84, 85, 89, 101]}, {"x": [227, 221, 225], "y": [101, 104, 101]}, {"x": [247, 251, 241], "y": [95, 94, 102]}, {"x": [241, 255, 252, 244, 234, 230], "y": [102, 102, 104, 110, 116, 120]}, {"x": [310, 315], "y": [71, 70]}, {"x": [310], "y": [105]}]	2022-12-18 11:01:00+00	2022-12-18	2022-12-18 11:01:44.573607+00	1	305
129	2	3	4	2	8	4	12	2	4	0	0	24	3	[{"x": [211, 210, 209, 206, 204, 200, 199, 197, 200, 204, 210, 220, 226, 231, 232, 231, 229, 224, 215, 206, 199, 194, 192, 195, 205, 210], "y": [80, 85, 90, 95, 100, 96, 90, 85, 79, 74, 71, 70, 71, 74, 79, 85, 89, 91, 92, 92, 90, 87, 84, 80, 79, 79]}, {"x": [226, 222, 215, 217, 221, 224, 222, 224, 229, 236, 239, 242, 249, 261, 269, 256, 237, 210, 196, 207, 231, 257, 281, 286], "y": [84, 91, 95, 91, 86, 84, 87, 90, 91, 87, 85, 89, 91, 94, 95, 95, 95, 95, 95, 92, 91, 91, 91, 91]}]	2022-12-18 11:03:00+00	2022-12-18	2022-12-18 11:04:01.838+00	1	315
130	2	3	1	2	2	4	3	2	4	0	0	6	2	[{"x": [201, 197, 200, 194, 187, 181, 177, 180, 185, 190, 195, 200, 202], "y": [84, 85, 82, 81, 84, 86, 92, 97, 99, 99, 97, 95, 92]}, {"x": [200, 199, 199, 197, 196, 194], "y": [80, 84, 90, 94, 99, 104]}, {"x": [205, 204], "y": [69, 65]}, {"x": [177, 184, 189, 186, 189, 194, 199, 200, 196, 191, 195, 204, 209, 206, 210, 216, 214, 220, 224, 221, 217, 222], "y": [102, 100, 96, 101, 104, 104, 101, 97, 95, 95, 96, 95, 92, 95, 96, 95, 99, 100, 99, 94, 95, 95]}, {"x": [234, 230, 230, 234, 239, 244, 240, 236, 241, 246, 250, 254, 247, 249, 254, 259, 264, 266, 266, 269, 275, 280, 275, 271, 274, 281, 287, 291], "y": [82, 87, 94, 96, 96, 95, 92, 94, 95, 95, 94, 92, 92, 96, 96, 95, 91, 85, 90, 92, 92, 92, 90, 91, 94, 94, 94, 95]}, {"x": [187, 194, 201, 210, 222, 237, 260, 277, 291, 299], "y": [102, 101, 100, 99, 97, 96, 95, 95, 96, 96]}]	2022-12-18 11:04:00+00	2022-12-18	2022-12-18 11:04:57.514492+00	1	385
131	2	3	2	2	4	4	6	2	4	0	0	12	2	[{"x": [165, 162, 160, 156, 154, 151, 150, 151, 154, 156, 160, 165, 169, 169, 170, 171], "y": [80, 82, 87, 92, 95, 99, 95, 91, 89, 85, 82, 77, 80, 87, 91, 95]}, {"x": [155, 150, 157, 164, 170, 175], "y": [92, 92, 91, 91, 91, 90]}, {"x": [190], "y": [92]}, {"x": [211, 207, 202, 200, 206, 215, 219, 221, 217, 219, 227, 231, 236], "y": [89, 87, 90, 95, 97, 96, 95, 92, 94, 97, 96, 94, 96]}, {"x": [256, 262, 255, 250, 256, 262, 265, 264, 256, 242, 236], "y": [91, 87, 87, 89, 92, 94, 96, 100, 102, 106, 106]}, {"x": [295, 295, 294, 290, 286, 282, 280, 276, 281, 287, 294, 304, 311, 317, 322, 324, 334, 345, 355, 361, 352, 335, 327, 332, 345, 361, 376, 381, 372, 366, 357, 340, 319, 294, 267, 246, 237, 249, 271, 301, 330, 350, 355, 341, 314, 282, 251, 229, 221, 236, 264, 297, 325, 334, 317, 265], "y": [62, 67, 74, 81, 89, 95, 100, 102, 99, 96, 95, 92, 92, 92, 95, 101, 101, 99, 94, 90, 89, 91, 94, 95, 94, 91, 89, 86, 81, 80, 77, 75, 75, 77, 82, 89, 92, 94, 91, 87, 84, 79, 75, 71, 70, 72, 79, 85, 89, 87, 84, 79, 75, 74, 75, 86]}]	2022-12-18 11:05:00+00	2022-12-18	2022-12-18 11:07:12.432163+00	1	308
\.


--
-- Data for Name: adra_almacenalimentos; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".adra_almacenalimentos (id, alimento_1, alimento_2, alimento_3, alimento_4, alimento_5, alimento_6, alimento_7, alimento_8, alimento_9, alimento_10, alimento_11, alimento_12, alimento_13, created_at, updated_at, alimento_1_caducidad, alimento_2_caducidad, alimento_3_caducidad, alimento_4_caducidad, alimento_5_caducidad, alimento_6_caducidad, alimento_7_caducidad, alimento_8_caducidad, alimento_9_caducidad, alimento_10_caducidad, alimento_11_caducidad, alimento_12_caducidad, alimento_13_caducidad, modificado_por_id) FROM stdin;
1	637	921	2091	325	1643	565	-2986	1056	635	164	56	3869	1381	2022-11-04 07:30:24.491442+00	2022-11-04 07:30:24.491465+00	2023-10-28	2027-08-27	2028-12-31	2024-08-30	2024-10-30	2024-01-20	2026-04-27	2025-12-31	2025-09-09	2024-08-31	2024-08-30	2023-02-23	2024-02-19	1
\.


--
-- Data for Name: adra_hijo; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".adra_hijo (id, parentesco, sexo, nombre_apellido, dni, otros_documentos, fecha_nacimiento, edad, active, discapacidad, modificado_por_id, persona_id) FROM stdin;
539	hijo	hombre	ALAA EL MOUKHLOUFI	X6628212-A		2005-01-09	0	t	f	1	225
544	hijo	hombre	SAID MOUKHALOUFI	Y4481195-G		2015-11-12	0	t	f	1	225
545	hijo	hombre	KHALID EL MOUKHALOUFI	Y4481112-J		2015-11-12	0	t	f	1	225
546	hijo	hombre	darius catalin felea	y1827202g		2009-12-03	0	t	f	1	226
547	hijo	hombre	erik gabriel felea	0		2011-12-17	0	t	f	1	226
548	esposo	hombre	ILIE PETRE	X7499791-C		1943-07-23	0	t	f	1	227
549	esposo	hombre	REGRAGUI LAGUOUAITE	X9534976-G		1979-04-06	0	t	f	1	228
551	esposo	hombre	JAMAL EL BOUKADDID	X1338882-Y		1969-12-31	0	t	f	1	229
552	hijo	hombre	ILIAS EL BOUKADDID	X7743751-L		2003-05-10	0	t	f	1	229
555	hijo	hombre	YASIR EL BOUKADDIDI	Y5028417-X		2016-06-24	0	t	f	1	229
556	esposo	hombre	EL HASSAN BELHAJ	X3056883-E		1979-03-23	0	t	f	1	230
557	hijo	hombre	HAMZA BELHAJ	Y2790977-X		2011-09-09	0	t	f	1	230
559	hijo	hombre	ILYAS BELHAJ	Y3917663-H		2014-12-24	0	t	f	1	230
560	esposo	hombre	HASSAN ARHARBI	X4283997-V		1970-12-31	0	t	f	1	231
562	esposo	hombre	MUSTAPHA SBAA	X6687154-L		1984-12-31	0	t	f	1	232
564	esposo	hombre	RACHID EL HADDAD	X1380564-N		1964-12-31	0	t	f	1	234
565	esposo	hombre	EL HOUCINE BEROUZ	X7587409-P		1974-08-21	0	t	f	1	235
566	hijo	hombre	ADAM BEROUZ	Y1294592-M		2010-05-12	0	t	f	1	235
567	hijo	hombre	HAROUN BEROUZ	Y5465018-W		2017-03-10	0	t	f	1	235
568	hijo	hombre	HAMZA BEROUZ	Y0280511-V		2000-09-12	0	t	f	1	235
569	esposo	hombre	MOHAMED CHERGUI	X6636684-B		1980-10-21	0	t	f	1	236
570	hijo	hombre	MOHAMED ALI CHERGUI	Y1276215-M		2010-05-01	0	t	f	1	236
572	esposo	hombre	FARID BENSADDIK	X4119272-H		1983-02-27	0	t	f	1	237
573	hijo	hombre	MOHAMED BEN SADDIK	Y4268846-Z		2015-04-01	0	t	f	1	237
575	esposo	hombre	FOURSI BOURJAL BOUCHTA	51023868-R		1977-04-04	0	t	f	1	238
578	hijo	hombre	FOURSI EL MAALLIR MOHAMED	54643571-X		2014-02-03	0	t	f	1	238
579	hijo	hombre	FOURSI EL MAALLIR MOUSTAPHA	54643572-B		2016-09-22	0	t	f	1	238
581	esposo	hombre	MOHAMMED LAACHIR	Y1366440-X		1971-12-27	0	t	f	1	240
582	hijo	hombre	HAMZA LAACHIR	X5741844-D		2002-07-06	0	t	f	1	240
584	hijo	hombre	MORAD LAACHIR	Y0491550-P		2009-02-22	0	t	f	1	240
585	hijo	hombre	KARAM LAACHIR	Y2038602-B		2011-07-13	0	t	f	1	240
628	esposo	hombre	FIKIRI AGMIR	X7157783-E		1982-08-19	0	t	f	1	257
629	hijo	hombre	YOUNES AGMIR	X3206626-A		2013-09-29	0	t	f	1	257
630	hijo	hombre	ADAM AGMIR	X4648324-G		2016-02-21	0	t	f	1	257
631	hijo	hombre	ZAKARIA AGMIIR	----------------		2018-11-12	0	t	f	1	257
632	esposo	hombre	SALHI EL MESSAOUDI HASSAN	54003918X		1978-10-21	0	t	f	1	258
633	hijo	hombre	SALHI BOUZIT YOUSSEF	54003919B		2009-10-25	0	t	f	1	258
635	hijo	hombre	SALHI BOUZIT FIRAS	54642354N		2016-05-08	0	t	f	1	258
636	esposo	hombre	ALI BEROUZ	X6433296-N		1970-02-25	0	f	f	1	259
637	hijo	hombre	OUSSAMA BEROUZ	X9124679-G		2006-05-27	0	f	f	1	259
639	hijo	hombre	WALID BEROUZ	Y5331003-P		2016-12-17	0	f	f	1	259
640	esposo	hombre	NABIL MOUSTIR	Y0535536-H		1983-03-10	0	t	f	1	260
644	esposo	hombre	AHATRI EL KOBBI	09128915-P		1968-03-13	0	t	f	1	261
645	hijo	hombre	AHATRI BERROUHOU MOHAMED	54643270-P		2001-09-02	20	t	f	1	261
650	hijo	hombre	EL MOUSSAOUI ABDOSSALAM	54643890-F		2002-09-13	0	t	f	1	262
651	hijo	hombre	EL MOUSSAOUI SALMA	48148612-K		2008-02-18	0	t	f	1	262
653	esposo	hombre	AYAD ECHAARA	X4989304Y		1976-01-01	0	t	f	1	263
655	hijo	hombre	ANAS ECHAARA TOUTOUH	09149503B		2009-06-07	0	t	f	1	263
656	hijo	hombre	MOHAMED ECHAARA	Y4917936K		2016-07-01	0	t	f	1	263
659	esposo	hombre	HASSANE KOURICHE	X2505048-A		1972-12-31	0	t	f	1	265
660	hijo	hombre	RAYAN KOURICHE	Y1116614-R		2010-02-18	0	t	f	1	265
661	hijo	hombre	MOHAMED KOURICHE	Y3563434-N		2014-05-07	0	t	f	1	265
663	hijo	hombre	AVOMO LUIS MARIO	54003301-Z		2007-12-20	0	f	f	1	266
666	hijo	hombre	AVOMO DONATO LUIS	09248873-K		2016-01-31	0	f	f	1	266
667	esposo	hombre	MOHAMED EL HARTI	X2608464-B		1972-12-31	0	t	f	1	267
669	hijo	hombre	AHAS EL HARTI	Y2026902-B		2011-08-27	0	t	f	1	267
670	hijo	hombre	CHAIMAE EL HARTI	Y3931857-K		2015-01-23	0	t	f	1	267
672	esposo	hombre	MOHAMED EL ABDELLAOUI	X4568657-Y		1981-01-19	0	t	f	1	268
674	hijo	hombre	AYOUB EL ABDELLAOUI	Y2784425-J		2012-10-28	0	t	f	1	268
675	hijo	hombre	SOFIAN EL ABDELLAOUI	Y4849798-D		2016-05-21	0	t	f	1	268
676	esposo	hombre	BELHAJ AFALIR OMAR	51428496-J		1953-03-04	0	t	f	1	269
714	esposo	hombre	SAAID BELMAKI	X5434447-F		1974-11-23	0	t	f	1	281
715	hijo	hombre	ILYAS BELMAKI	Y2474145-A		2012-04-25	0	t	f	1	281
716	hijo	hombre	SAAD BELMAKI	Y5378553-V		2017-02-01	0	t	f	1	281
717	hijo	hombre	Ismael Belmaki	x000000x		2020-02-24	0	t	f	1	281
718	esposo	hombre	KAHLA AZZEDDINE	3432120-pasaporte		1976-01-22	0	t	f	1	282
720	esposo	hombre	AFIA BOUSSAID MOSTAPHA	53756076-Q		1953-12-31	0	t	f	1	283
722	esposo	hombre	ABDELMALIK BAHTIT	X7645332-V		1983-07-22	0	t	f	1	284
723	hijo	hombre	MOHAMED BAHTIT	Y0290517-H		2005-07-24	0	t	f	1	284
725	hijo	hombre	ELYAS BAHTIT	Y2719440-A		2012-09-29	0	t	f	1	284
726	hijo	hombre	ANAS BAHTIT	Y4337063-J		2015-07-30	0	t	f	1	284
727	esposo	hombre	EL BOUKRI CHIKH KHAMD  AMAR	54642011-Z		1964-02-13	0	f	f	1	285
731	esposo	hombre	IBRAHIM OUALD OMAR	K4222828-M		1974-12-31	0	t	f	1	286
732	hijo	hombre	HICHAM OUALD OMAR	Y0623184-J		2006-06-18	0	t	f	1	286
733	hijo	hombre	AIMAN OUALD OMAR	X9148293-C		2007-08-13	0	t	f	1	286
736	esposo	hombre	SAID SABBAHI	X6458923-V		1979-08-19	0	t	f	1	287
737	hijo	hombre	YASIN SABBAHI	Y1445353-R		2010-07-19	0	t	f	1	287
741	esposo	hombre	MOUMAN ABABOU	X2964388-X		1969-12-31	0	t	f	1	288
743	hijo	hombre	AYOUB ABABOU	X6961170-J		1997-01-01	0	t	f	1	288
745	hijo	hombre	HICHAM DHIKAR	X8879466-V		2007-05-28	0	t	f	1	289
746	hijo	hombre	YOUSSEF DHIKAR	X0762496-Z		2009-07-28	0	t	f	1	289
748	esposo	hombre	OMAR ESSADDIKI	X1321335-P		1963-02-28	0	t	f	1	290
749	hijo	hombre	OMAR ESSADDIKI	X6968877-Q		2005-02-02	0	t	f	1	290
750	hijo	hombre	Adel essaddiki	X2499735-a		1997-06-18	0	t	f	1	290
752	esposo	hombre	LAHCEN KHALIL	X8162331-E		1972-11-09	0	t	f	1	291
754	hijo	hombre	AHMED KHALIL	09245785-S		2010-04-03	0	t	f	1	291
755	hijo	hombre	ADAM KHALIL	Y2506730-C		2012-06-18	0	t	f	1	291
756	hijo	hombre	ISMAEL KHALIL	Y8978213Q		2021-08-18	0	t	f	1	291
757	esposo	hombre	AHMED RAMDAN	X6523682-D		1957-12-31	0	t	f	1	292
759	hijo	hombre	MOHAMED RAMDAN	X8582099-V		2000-01-08	0	t	f	1	292
760	esposo	hombre	BOUJAMA BENABDELLAH	X1538663-D		1979-08-19	0	t	f	1	293
762	hijo	hombre	AYOUB BEN ABDELLAH	X9073242-H		2007-01-04	0	t	f	1	293
763	hijo	hombre	MOHAMED BEN ABDELLAH	Y2787087-F		2012-06-21	0	t	f	1	293
764	hijo	hombre	SAMIR BENABDELLAH	X9536286-A		2007-09-05	0	t	f	1	294
767	hijo	hombre	ESRAE BENABDELLAH	Y6080375-V		2017-12-02	0	t	f	1	294
768	esposo	hombre	SOLOMON GYESIE	X5167336-H		1971-01-04	0	t	f	1	295
803	hijo	hombre	EL HBIL EL KHAMMARI HAKIM	54003267-A		2009-03-25	0	t	f	1	303
804	hijo	hombre	EL HBIL EL KHAMMARI YASIN	53755957-N		2000-07-27	0	t	f	1	303
805	esposo	hombre	ABDELMAJID SABBAHI	X1396736-S		1970-12-31	0	t	f	1	304
807	hijo	hombre	ADAM SABBAHI	Y1824253-E		2011-01-15	0	t	f	1	304
808	hijo	hombre	ELIAS SABBAHI	Y3135103-Q		2013-06-13	0	t	f	1	304
809	esposo	hombre	DRAGU ILEANA	053327318		1960-06-30	0	t	f	1	305
811	hijo	hombre	JACK LIGHT YAW KWATENG	Y2611529-P		2011-12-14	0	f	f	1	306
812	hijo	hombre	BARUCH AKWASI KWATENG	Y4887466-A		2016-04-02	0	f	f	1	306
813	esposo	hombre	SEBASTIAN DINCA	X4636620-G		1984-11-08	0	t	f	1	307
814	hijo	hombre	DAVID SEBASTIAN DINCA	Y2209335-S		2011-01-02	0	t	f	1	307
815	hijo	hombre	UNAI CRESPO CASTRO	54646271L		2011-03-09	0	t	f	1	308
816	esposo	hombre	OTMAN BOUZAMMOUR	X4747570-W		1978-08-24	0	t	f	1	309
821	esposo	hombre	NOURDDIN AMAZDAR	X3777965-P		1973-03-06	0	t	f	1	310
824	hijo	hombre	KHALID AMAZDAR	Y4696232-Z		2009-04-27	0	t	f	1	310
825	esposo	hombre	ABDELGHANI EL KHAMLICHI	X3905682-Y		1977-06-30	0	t	f	1	311
827	hijo	hombre	ABDELMALEK EL KHAMLICH	Y5599666-P		2011-05-26	0	t	f	1	311
829	esposo	hombre	ABDELFATAH ABABOU	X3261848-B		1969-12-31	0	t	f	1	312
831	hijo	hombre	ANWAR ABABOU	X7966933-D		2006-04-10	0	t	f	1	312
832	hijo	hombre	BADR ABABOU	Y5573743-Y		2017-05-25	0	t	f	1	312
833	esposo	hombre	MIMOUN AKKOUH	X2956123-W		1962-02-19	0	t	f	1	313
834	esposo	hombre	ABDELLAH ENASSIRI	X4714905C		1979-12-31	0	t	f	1	314
835	hijo	hombre	MOHAMED ENASSIRI SALFI	54642148-J		2009-10-13	0	t	f	1	314
836	hijo	hombre	AKRAN ENASSIRI	Y-2833352L		2013-01-28	0	t	f	1	314
838	hijo	hombre	RUBEN MIHAI PETRE POPOVICI	Y0248782-M		2007-04-29	0	t	f	1	315
840	esposo	hombre	BENIAMIN PETRE	X8641068-Z		1984-06-22	0	t	f	1	315
842	hijo	hombre	HAROLD  EDWARD RADU	Y3385751G		2013-07-23	0	t	f	1	316
846	esposo	hombre	MOHAMMED ABALHASAIN	X7194808-V		1978-01-01	0	t	f	1	317
847	hijo	hombre	MOHAMMED YASSINE  ABALHSAIN	Y3679533-F		2014-07-10	0	t	f	1	317
849	hijo	hombre	Abalhsain Adam	SM5769526		2021-04-02	0	t	f	1	317
851	hijo	hombre	ANDRES FELIPE SOSA QUICENO	AV887533		2006-10-10	0	f	f	1	322
852	hijo	hombre	RODRIGUEZ PORTILLO JUAN LUIS	F415599		2007-07-17	0	f	f	1	323
853	esposo	hombre	yassir el yahiai	x4199340T		1976-01-23	0	t	f	1	324
854	hijo	hombre	nizar el yahiai	x8453726F		2006-09-14	0	t	f	1	324
892	hijo	hombre	Roberto Ionut Zamfir	x9155629l		2002-12-30	0	t	f	1	337
897	hijo	hombre	Andrei Alexandru	x9214450y		1999-02-16	0	t	f	1	339
899	esposo	hombre	Alexandru Bilti	x9223842z		1968-03-14	0	t	f	1	340
900	hijo	hombre	Reinaldo Enrique	y3061261k		2020-01-01	0	t	f	1	341
901	hijo	hombre	Gutierez Pizarro	0000000		2020-01-01	0	t	f	1	341
903	hijo	hombre	Adelina Estera Ciocan	x9100557q		2001-07-07	0	t	f	1	342
904	hijo	hombre	Emanuel David Ciocan	x9100513n		1999-09-19	0	t	f	1	342
907	hijo	hombre	Catalin Truica	y0846903b		1993-10-31	0	t	f	1	343
910	esposo	hombre	Sandu Serbanescu	x09273733h		1975-12-10	0	t	f	1	345
911	hijo	hombre	Razvan Florin Serbanescu	y2343382h		2005-02-11	0	t	f	1	345
916	hijo	hombre	Avram Ioan Antonio	y0220482w		2004-02-21	0	t	f	1	348
919	hijo	hombre	Matei Ruben Darius	y5361671v		2020-01-01	0	t	f	1	351
927	esposo	hombre	Cojocaru ilie Iulian	x6859004j		1984-09-11	0	t	f	1	357
928	hijo	hombre	Cojocaru Luis Iulian	y4101979n		2014-12-07	0	t	f	1	357
930	hijo	hombre	Garcia Arana Wilson Joez	50480384f		2020-01-01	0	t	f	1	359
931	hijo	hombre	Garcia Arana Elias Alexander	5099900g		2020-01-01	0	t	f	1	359
932	hijo	hombre	Garcia Arana Emanuel Ezequel	50497588f		2020-01-01	0	t	f	1	359
933	esposo	hombre	Angelica Felicita	x5558185m		1980-03-30	0	t	f	1	360
935	esposo	hombre	Gheorghe Sareanu	1540206038621		2020-01-01	0	t	f	1	361
937	hijo	hombre	Constantin Nicloas Gabriel	0000000		2013-07-06	0	t	f	1	362
938	hijo	hombre	Constantin Eric Andrei	0000000		2017-11-30	0	t	f	1	362
939	esposo	hombre	Romeo Dobrin	x6339753x		1980-03-12	0	t	f	1	363
940	hijo	hombre	Roberto Dobrin	y5266219s		2015-12-18	0	t	f	1	363
942	esposo	hombre	Vas Mihai Viorel	j132197		1956-08-16	0	t	f	1	364
945	hijo	hombre	Alberto Fabian	0000000		2005-04-04	0	t	f	1	365
946	hijo	hombre	Dario Valentin	0000000		2009-09-29	0	t	f	1	365
949	hijo	hombre	Antemiuc Vasile	X5837500P		1983-12-23	0	t	f	1	372
953	hijo	hombre	Clever Yapo			1999-08-30	0	t	f	1	375
955	hijo	hombre	Bogdan Lucas Ribca	Y1188728X		2005-06-12	0	t	f	1	380
958	hijo	hombre	Alex Geiszheimer	Y0494671R		1995-01-23	0	t	f	1	389
961	hijo	hombre	Sebastian Ștefan Iulian Luca	Y3077516 S		2020-01-01	0	t	f	1	393
962	esposo	hombre	Jonathan Abel Zambrean	088382945		2020-01-01	0	t	f	1	393
963	esposo	hombre	Filiuta Solomon	X3025675 W		2020-01-01	0	t	f	1	395
964	esposo	hombre	Emanuel Dragoș	AR887631		2020-01-01	0	t	f	1	396
965	hijo	hombre	David Gabriel Odica	Y 7279973 G		2020-01-01	0	t	f	1	396
966	esposo	hombre	Gigel Grigore	X6442957 J		2020-01-01	0	t	f	1	397
969	hijo	hombre	Iosef Benabdelah	Xxxxxxx		2020-01-01	0	t	f	1	400
970	hijo	hombre	Ali Benabdelah	Xxxxxxx		2020-01-01	0	t	f	1	400
972	hijo	hombre	Mohamed Benabdelah	Xxxxxxxx		2020-01-01	0	t	f	1	400
974	hijo	hombre	David Alexander Neacsu	Y7015810L		2020-01-01	0	t	f	1	401
975	hijo	hombre	Nathan Gabriel Neacsu	Y7015875S		2020-01-01	0	t	f	1	401
977	hijo	hombre	Alfred Matthew	Y4145429S		2020-01-01	0	t	f	1	402
980	hijo	hombre	Silviu Madalin Danilencu	Y 2599721 E		2020-01-01	0	t	f	1	403
982	hijo	hombre	Ángel Vladut	Y2394484Z		2020-01-01	0	t	f	1	403
983	hijo	hombre	Cristian Claudiu Halit	X7712528 F		2020-01-01	0	t	f	1	404
987	hijo	hombre	Răzvan Gheorghe	Xxxxxx		2007-01-14	0	t	f	1	405
992	hijo	hombre	Felix Arturo Mejia Najera	Xxxxxx		2020-01-01	0	t	f	1	406
995	hijo	hombre	Aron Rayón Calero	55127902		2020-01-01	0	t	f	1	407
998	esposo	hombre	Dinu Eugen	Y1444956 X		2020-01-01	0	t	f	1	409
1001	hijo	hombre	Alex Tarnaru	Y5427358 P		2006-03-27	0	t	f	1	412
1006	hijo	hombre	Alexandru Nicolae Vaslui	X7537087-X		1981-04-23	0	t	f	1	415
1008	hijo	hombre	Mohora Denis	Y3577348B		2007-08-06	0	t	f	1	416
1009	hijo	hombre	Mohora Denis	Y3577348B		2007-08-06	0	t	f	1	416
1010	hijo	hombre	Mohora Eduard	Y3577293W		2008-09-14	0	t	f	1	416
1012	hijo	hombre	Ichim Denis	Y 5995107X		2008-01-16	0	t	f	1	417
1014	esposo	hombre	Petrea Valentin	Y5852637W		1982-06-10	0	t	f	1	418
1016	hijo	hombre	Sergiu Acatrinei	X7397638X		2004-05-20	0	t	f	1	419
1017	hijo	hombre	Radu Acatrinei	Y5049317A		2010-05-17	0	t	f	1	419
1018	hijo	hombre	Richard David Avila Ivascu	Y5204765V		2020-08-01	0	t	f	1	420
1019	hijo	hombre	Teddy Jonathan Avila Ivascu	Y5204787Q		2020-08-01	0	t	f	1	420
1023	esposo	hombre	Ștefan Badea	Y5619035B		2020-08-01	0	t	f	1	423
1024	hijo	hombre	Gabriel Alexandru Badea	Y5619141W		2020-08-01	0	t	f	1	423
1027	hijo	hombre	Elias Talea	W1234567w		2020-08-01	0	t	f	1	425
1031	esposo	hombre	MAHOMED EL SOUINI	YD0470279		1980-04-02	0	t	f	1	427
1032	hijo	hombre	FARIS EL SOUINI	SC8285158		2010-12-10	0	t	f	1	427
1033	hijo	hombre	AKRAM EL SOUINI	RG8537102		2015-09-13	0	t	f	1	427
1035	hijo	hombre	menor 1	x000000x		2002-04-24	0	t	f	1	429
1038	esposo	hombre	Ridouan mahrach	X6572783-g		1983-12-06	0	t	f	1	430
1040	hijo	hombre	Mountasir mahrach	Y1820503-k		2010-10-19	0	t	f	1	430
1041	hijo	hombre	Yasir mahrach	Y1820388-k		2010-10-19	0	t	f	1	430
1044	esposo	hombre	Abdelkhaliq es sabbar el morabet	54642986t		1966-01-01	0	t	f	1	433
1047	hijo	hombre	Catalin fatulescu	x7274455s		1995-02-20	0	t	f	1	437
1048	hijo	hombre	David Clemente Gonzalvez	53444166		1995-07-19	0	t	f	1	438
1050	esposo	hombre	abdelkader salami	x1896122w		1962-07-09	0	t	f	1	439
1051	hijo	hombre	siham salami el mansouri	70844393t		2003-03-02	0	t	f	1	439
1052	hijo	hombre	menor	70844395w		2005-11-17	0	t	f	1	439
1053	hijo	hombre	menor	70843222w		2009-12-14	0	t	f	1	439
1054	esposo	hombre	YOUSSEF HAMZA	X4202155D		1978-10-20	0	t	f	1	440
1055	hijo	hombre	HAMZA ALAMALNI ANOUAR	54011709G		2007-05-08	0	t	f	1	440
1058	hijo	hombre	HARON HAMZA	HARON HAMZA		2018-11-14	0	t	f	1	440
1059	hijo	hombre	HAMZA TASNIM	Y8621029E		2020-12-28	0	t	f	1	440
1062	hijo	hombre	Matías Andiel Zambrano Montilla		147536349	2016-12-07	0	t	f	1	443
1063	esposo	hombre	Azzouz El Aissoui	Y0552035A		1978-12-19	0	t	f	1	444
538	esposa	mujer	HAYAT KAOURICHE	X6251112-B		1975-11-30	0	t	f	1	225
540	hija	mujer	KHADIJA EL MOUKHLOUFI	X8394209-Z		2006-10-22	0	t	f	1	225
541	hija	mujer	ASMAA EL MOUKHLOUFI	Y0118347-A		2008-07-26	0	t	f	1	225
542	hija	mujer	CHAIMAA EL MOUKHALOUFI	X1828436-L		2011-04-17	0	t	f	1	225
543	hija	mujer	FATIMA EL MOUKHALOUFI	Y3285768-W		2013-11-08	0	t	f	1	225
550	hija	mujer	LAGUOUAITE EL FILALI NADA	54642058-S		2008-05-14	0	t	f	1	228
553	hija	mujer	SORAYA EL BOUKADDIDI	X7743759-G		2005-07-31	0	t	f	1	229
554	hija	mujer	SARA EL BOUKADDIDI	Y1576394-B		2010-09-24	0	t	f	1	229
558	hija	mujer	NISRIN BELHAJ	Y2790909-B		2012-08-07	0	t	f	1	230
561	hija	mujer	ARHARBI RAHMOUNI CHAIMA	51025857-N		2008-09-12	0	t	f	1	231
563	hija	mujer	FARAH SBAA	Y3281196-F		2005-07-20	0	t	f	1	232
571	hija	mujer	HIBA CHERGUI	Y2622959-F		2012-07-11	0	t	f	1	236
574	hija	mujer	NORA BEN SADDIK	Y5305542-P		2016-09-20	0	t	f	1	237
576	hija	mujer	FOURSI EL MAALLIR YOSRA	51023873-Y		2006-09-12	0	t	f	1	238
577	hija	mujer	FOURSI EL MAALLIR KAUTAR	51023871-G		2009-09-02	0	t	f	1	238
580	hija	mujer	IMANE METAICH	Y3447622-M		2002-12-17	0	t	f	1	239
583	hija	mujer	DINA LAACHIR	X6228156-D		2004-09-05	0	t	f	1	240
587	hija	mujer	MARIAM AKHNIKH	Y5157800H		2016-02-03	0	t	f	1	241
588	hija	mujer	NOHA AKHNIKH	Y2327903H		2010-01-17	0	t	f	1	241
589	hija	mujer	AUCHA AKHNIKH	Y5157815X		2016-02-03	0	t	f	1	241
594	hija	mujer	YASIR EL JOURTBI	Y4525276V		2015-10-16	2	t	f	1	244
595	hija	mujer	Jana	x000000x		2020-06-10	0	t	f	1	244
596	esposa	mujer	IKRAM EL BOUHLALI	X7672806Y		1983-06-09	0	t	f	1	245
597	hija	mujer	IMAN BOUSSABOUN	X9851814V		2008-02-17	0	t	f	1	245
600	hija	mujer	YOSRA BOUSSABOUN	Y3435847Y		2014-03-25	0	t	f	1	245
605	hija	mujer	KHADIJA MAHRACH	Y3418094D		2002-03-07	0	t	f	1	247
609	hija	mujer	FATIMA BOURJAL	X8691830S		2006-07-27	0	t	f	1	248
610	hija	mujer	SARA BOURJAL	X9882200C		2008-03-17	0	t	f	1	248
614	hija	mujer	DIB TALLEH ISRAE	54643584T		2017-03-25	0	t	f	1	250
619	hija	mujer	FAIRUZ EL MAKHFADI	X5144443-X		2003-05-20	0	t	f	1	252
620	hija	mujer	NORA EL MAKHFADI	X9516480-T		2007-08-28	0	t	f	1	252
622	hija	mujer	MARYAM EL MAKHFADI	MARYAM EL MAKHFADI		2013-11-09	0	t	f	1	252
623	esposa	mujer	MIRTHA ELENA PEROZO DE  LOPEZ	070584538-pasaporte		1001-01-01	0	f	f	1	253
625	hija	mujer	MARSO EL HALOULI RIHAB	54011820T		2009-02-07	0	t	f	1	254
626	hija	mujer	MARSO SARA	Y2641740-C		2012-08-03	0	t	f	1	254
627	esposa	mujer	BOBOC FLOAREA	TR365330 -dni rumano		1958-07-26	0	t	f	1	256
634	hija	mujer	SALHI BOUZIT ROMAYSA	54007459D		2012-07-31	0	t	f	1	258
638	hija	mujer	MARUA BEROUZ	Y1707236-Y		2010-12-18	0	f	f	1	259
641	hija	mujer	HIBA MOUSTIR	Y1539417-H		2010-08-22	0	t	f	1	260
642	hija	mujer	KHADIJA MOUSTIR	Y3465694-E		2014-02-24	0	t	f	1	260
643	hija	mujer	RANIA MOSTIR	Y4939332-G		2016-05-25	0	t	f	1	260
646	hija	mujer	AHATRI BERROUHOU RIHAB	54643415-S		2006-05-05	0	t	f	1	261
647	hija	mujer	AHATRI BERROUHOU HALA	54644452-V		2008-10-25	0	t	f	1	261
648	hija	mujer	AHATRI BERROUHOU HOR	54644450-S		2012-01-24	0	t	f	1	261
649	esposa	mujer	ELKHADIRI OUARDIA	X4298960-F		1976-03-09	0	t	f	1	262
652	hija	mujer	EL MOUSSAOUI DINA	54004570-H		2010-07-12	0	t	f	1	262
654	hija	mujer	HAJAR ECHAARA TOUTOUH	09820133F		2011-09-28	0	t	f	1	263
657	hija	mujer	Amira Echaara		Xxxxx	2022-07-31	0	t	f	1	263
658	hija	mujer	LORENA GEORGEANA  BRINZAN	Y2049381-A		2010-05-21	0	t	f	1	264
662	hija	mujer	noura zyate kouriche	06341988z		2020-05-17	0	t	f	1	265
664	hija	mujer	AVOMO LUISA LETICIA	54004777-H		2010-10-14	0	f	f	1	266
665	hija	mujer	AVOMO SOL PILAR	09248871-L		2016-01-31	0	f	f	1	266
668	hija	mujer	MIRIAM EL HARTI	Y0972588-R		2009-12-06	0	t	f	1	267
671	hija	mujer	AYA EL HARTI	Y7081220v		2019-02-19	0	t	f	1	267
673	hija	mujer	RANIA EL ABDELLAOUI	X9945196-L		2008-03-29	0	t	f	1	268
677	hija	mujer	BELHAJ EL FARSIOUI MARWA	53823265-E		2002-04-26	0	t	f	1	269
681	hija	mujer	KAOUTAR EL MORABIT	X9187827-V		2007-03-21	0	t	f	1	271
689	hija	mujer	NAJOUA BELHARTI	X7790854-H		2000-08-18	0	t	f	1	272
692	hija	mujer	SALMA EL HADDAD	Y2024096-H		2011-06-27	0	t	f	1	274
693	hija	mujer	MARWA EL HADDAD	Y2869984-N		2012-11-25	0	t	f	1	274
695	hija	mujer	NORA EL HADDAD	Y4619836-R		2016-01-07	0	t	f	1	274
697	hija	mujer	SUKAINA JAHA	54645776-F		2019-10-06	0	t	f	1	275
698	hija	mujer	EL AMRANI JAHA	54011085-R		2015-02-24	0	t	f	1	275
701	hija	mujer	MERIEM EL KOURTBI	X602532Z		2000-01-02	0	t	f	1	276
703	hija	mujer	MAFSA EL ABDALLAOUI	Y1647701-H		2010-11-12	0	t	f	1	277
704	hija	mujer	ALAE EL ABDALLAOUI	Y3468002-F		2014-03-15	0	t	f	1	277
708	hija	mujer	SOUKAINA EL AFIFA	54006626-G		2008-01-07	0	t	f	1	279
713	hija	mujer	HAROUN CHAIRI NOOR	09125616-K		2010-05-04	0	t	f	1	280
719	hija	mujer	KAHLA FELLA	PV8726904-pasaporte		2014-04-14	0	t	f	1	282
721	hija	mujer	AFIA BOUSSAID OMAYMA	53823409-M		2003-05-07	0	t	f	1	283
724	hija	mujer	CHAYMAE BAHTIT	Y0290528-Y		2007-12-03	0	t	f	1	284
728	hija	mujer	MARIAM EL BOUKRI RIYADI	54009555-N		2006-02-23	0	f	f	1	285
729	hija	mujer	MARWA EL BOUKRI RIYADI	54009570-G		2007-05-24	0	f	f	1	285
730	hija	mujer	RINAD EL BOUKRI RIYADI	72298286-V		2015-07-05	0	f	f	1	285
734	hija	mujer	DINA OUALD OMAR	Y0754652-J		2009-08-13	0	t	f	1	286
735	hija	mujer	RODAINA OUALD OMAR	Y4464327-H		2015-10-29	0	t	f	1	286
1065	hijo	hombre	Moussa Elaissaoui	Y3457197N		2004-06-09	0	t	f	1	444
1067	hijo	hombre	Tasnim El Khobzi		D08243241	2020-10-05	0	t	f	1	446
1070	hijo	hombre	Youssef El Khobzi		QN2319631	2019-11-28	0	t	f	1	446
1072	esposo	hombre	Mahomed El Khobzi		PI0953829	1977-01-01	0	t	f	1	446
738	hija	mujer	YASMIN SABBAHI	Y3195241-A		2013-09-17	0	t	f	1	287
739	hija	mujer	NIHAD SABBAHI	Y4308660-S		2015-07-25	0	t	f	1	287
740	hija	mujer	HIND SABBAHI	Y6305643-T		2018-04-09	0	t	f	1	287
742	hija	mujer	ZAKIA ABABOU	X6961143-D		1994-02-13	0	t	f	1	288
744	esposa	mujer	FATNA EL FILALI	X7365575-D		1980-12-31	0	t	f	1	289
747	hija	mujer	SAFAE DHIKAR	Y3902846-J		2014-12-08	0	t	f	1	289
751	hija	mujer	Yasmina essaddiki	X3305556-l		2000-07-19	0	t	f	1	290
753	hija	mujer	DOUAA KHALIL	Y0815298-R		2004-07-22	0	t	f	1	291
758	hija	mujer	LAMIS RAMDAN	Y2619545-C		2012-07-30	0	t	f	1	292
761	hija	mujer	AIYA BEN ABDELLAH	X6212243-N		2004-08-16	0	t	f	1	293
765	hija	mujer	KALAK BENABDELLAH	Y2511448-T		2012-04-11	0	t	f	1	294
766	hija	mujer	DUMAIMA BENABDELLAH	Y4474269-R		2013-11-13	0	t	f	1	294
769	hija	mujer	PATIENCE GYESIE	Y3260757-S		2008-07-06	0	t	f	1	295
772	hija	mujer	Godiva kyera gyesie	Y7204801l		2018-06-09	0	t	f	1	295
774	hija	mujer	ALICE MPREGO OSEI	H2721154-pasaporte		2001-11-17	0	t	f	1	296
777	hija	mujer	APPIAH OPPONG CHELSEA  ASAMOAH	54698973-M		2010-01-04	0	f	f	1	297
779	hija	mujer	ISABEL ASAMOAH APPIAH	Y5181402-E		2016-09-30	0	f	f	1	297
783	hija	mujer	ASMAE RAOUHAND	51528835-A		2001-05-13	0	f	f	1	299
784	hija	mujer	MIRIAM ROUHAND	51528836-G		2004-05-06	0	f	f	1	299
785	hija	mujer	FIRDAOUS ROUHAND	51223213-M		2009-07-21	0	f	f	1	299
786	hija	mujer	HASNAA ROUHAND	51749809-Q		2013-09-13	0	f	f	1	299
787	esposa	mujer	AMINA EL KHADIRI	X9763240-Q		1963-12-31	0	f	f	1	300
788	hija	mujer	FADOUA ENNAMOUTI	X9763320-G		2002-08-15	0	f	f	1	300
789	hija	mujer	NADA ENNAMOUTI	X9763339-T		2006-09-19	0	f	f	1	300
790	hija	mujer	ADHAM ENNAMOUTI	X9763347-P		2006-09-19	0	f	f	1	300
795	hija	mujer	AMIRA EL GHARIB	Y2830929-B		2012-11-05	0	t	f	1	301
797	hija	mujer	NAOUL JAHJAH	X5998552-Z		2001-09-20	0	f	f	1	302
798	hija	mujer	LOUBNA JAHJAH KALLOUH	09249826-P		2006-02-16	0	f	f	1	302
799	hija	mujer	SANAA JAHJAH KALLOUH	09249828-X		2007-01-21	0	f	f	1	302
801	hija	mujer	EL HBIL EL KHAMMARI  SOHAILA	53823034-K		2003-01-01	0	t	f	1	303
802	hija	mujer	EL HBI EL KHAMMARI NISRIN	53822380-B		2005-10-31	0	t	f	1	303
806	hija	mujer	NABILA SABBAHI EL MANSOURI	Y0135100-N		2008-07-16	0	t	f	1	304
810	esposa	mujer	FELICIA EBI OSIFOH	52048362-Y		1976-08-28	0	f	f	1	306
817	hija	mujer	FADOUA BOUZAMOUR	X7512178-X		2002-02-19	0	t	f	1	309
818	hija	mujer	ROMAISSAE BOUZAMMOUR	X7512222-P		2004-06-04	0	t	f	1	309
819	hija	mujer	FIRDAUS BOUZAMMOUR	X9304737-H		2007-09-02	0	t	f	1	309
820	hija	mujer	MOHAMED AKRAM BOUZAMMOUR	Y2909039-A		2013-04-25	0	t	f	1	309
822	hija	mujer	HAJAR AMAZDAR	Y4696195-T		2007-10-02	0	t	f	1	310
823	hija	mujer	AICHA AMAZDAR	Y5937617-C		2017-10-05	0	t	f	1	310
826	hija	mujer	MALAK EL KHAMLICHI	Y5599708-G		2009-09-04	0	t	f	1	311
828	hija	mujer	TASNIM EL KHAMLICHI	Y8548244A		2019-07-05	2	t	f	1	311
830	hija	mujer	SARA ABABOU	Y0229848.T		2008-08-12	0	t	f	1	312
837	hija	mujer	AYA ENASSIRI	Y7029002D		2019-01-11	0	t	f	1	314
839	hija	mujer	REBECA PALOMA PETRE POPOVICI	Y1940404-T		2009-11-03	0	t	f	1	315
841	esposa	mujer	ALINA RADU	X3779328Z		1986-05-19	0	t	f	1	316
843	hija	mujer	MARTHA LORENA RADU	Y5101032Z		2016-09-21	0	t	f	1	316
844	hija	mujer	AINOHA SARA RADU	Y5100999G		2016-09-21	0	t	f	1	316
845	hija	mujer	AMIRA NAOMI RADU	------		2019-03-15	0	t	f	1	316
848	hija	mujer	AYA ABALHSAIN	Y5411298-X		2017-02-24	0	t	f	1	317
850	esposa	mujer	DIANA MARIA	Y7235170M		1982-12-30	0	f	f	1	322
855	hija	mujer	Israe el yahiai	y1164544E		2009-01-27	0	t	f	1	324
857	hija	mujer	SALMA AKHNIKH	Y5729521M		2017-07-08	0	t	f	1	325
858	hija	mujer	HAFSA AKHNIKH	Y4467680J		2015-10-22	0	t	f	1	325
859	hija	mujer	AKHINIKH BASMA	Y8507593		2020-11-06	0	t	f	1	325
861	hija	mujer	AYA HAMOUCH	Y1467713M		2010-08-01	0	t	f	1	327
865	hija	mujer	IRIKRIKEN OUTOUHAMI MIRIAM	54003707Y		2001-06-17	0	t	f	1	328
870	hija	mujer	Anelysse Dumitrascu	y4493218k		2015-02-03	0	t	f	1	331
872	hija	mujer	Iulisca Leordan	x6870418l		1969-06-28	0	t	f	1	331
873	esposa	mujer	Sue Ruiz	y7727136r		2020-01-01	0	t	f	1	332
874	hija	mujer	Nathasha gentile	y781618h		2020-01-01	0	t	f	1	332
876	hija	mujer	Andreea gentile	y78164015a		2020-01-01	0	t	f	1	332
877	esposa	mujer	Tatiana Edu	x8829801d		2020-01-01	0	t	f	1	333
880	esposa	mujer	Cristinera Gina Mitrica	x9102921-g		2020-01-01	0	t	f	1	334
881	esposa	mujer	Curca Marian	rk105151		1957-09-12	0	t	f	1	335
883	hija	mujer	Curca Adriana Cristina	rx632408		1989-06-28	0	t	f	1	335
884	hija	mujer	Curca Maria Carmen	rx774394		1989-06-28	0	t	f	1	335
888	esposa	mujer	Marta Flores	00000000		1976-06-06	0	t	f	1	336
889	hija	mujer	Marilin Flores	0000000		2012-06-09	0	t	f	1	336
890	hija	mujer	Angela Gisele Flores	0000000		2004-06-10	0	t	f	1	336
891	esposa	mujer	Elena Magdalena Zamfir	x8775483v		1978-03-22	0	t	f	1	337
893	hija	mujer	Eva Mihaela Zamfir	y0789443m		2009-07-04	0	t	f	1	337
894	hija	mujer	Miriam Alupoaiei	y2574888y		2006-10-10	0	t	f	1	338
895	hija	mujer	Martina Alupoaiei	0000000		2018-06-06	0	t	f	1	338
896	esposa	mujer	Ester Alexandru	x6586633p		1972-05-21	0	t	f	1	339
898	hija	mujer	Rahela Alexandru	x9214372c		1995-01-04	0	t	f	1	339
902	esposa	mujer	Lucica Mirela Ciocan	x9100702q		1974-08-14	0	t	f	1	342
905	esposa	mujer	Maria Andrei	x2656587h		1955-11-26	0	t	f	1	343
906	hija	mujer	Ramona Elisa Truica	x3341328a		1989-12-29	0	t	f	1	343
908	hija	mujer	Mara Truica	y777762t		2019-09-04	0	t	f	1	343
909	esposa	mujer	Bran Mariana	x9306478b		2020-01-01	0	t	f	1	344
912	hija	mujer	Alexandra Serbanescu	y4485641b		2015-07-28	0	t	f	1	345
913	esposa	mujer	Leonor Perez zazo	b00356092		1974-02-17	0	t	f	1	346
914	hija	mujer	Niña karla merary parada perez	0000000		2019-12-30	0	t	f	1	346
915	esposa	mujer	Avram Corina	x9139209		1981-07-09	0	t	f	1	348
917	esposa	mujer	Beregheanu Vali Ionela	x9080262t		1984-08-04	0	t	f	1	350
918	esposa	mujer	Matei Adriana	x9211496l		2020-01-01	0	t	f	1	351
920	esposa	mujer	Platica Luminita	y0916258k		2020-01-01	0	t	f	1	352
921	hija	mujer	Platica Marta Amalia	y5406695f		2020-01-01	0	t	f	1	352
922	esposa	mujer	Coca Marioara	x9360205x		2020-01-01	0	t	f	1	353
923	hija	mujer	Coca Luciana	x9361633n		2020-01-01	0	t	f	1	353
924	esposa	mujer	Damiela Giorgiana Draghici	x9128987b		2020-01-01	0	t	f	1	354
925	hija	mujer	Ainara Delia Draghici	y0452789h		2020-01-01	0	t	f	1	354
926	esposa	mujer	Inacualada Serana Barasa	7508446g		2020-01-01	0	t	f	1	355
929	esposa	mujer	Arana Avila Alexandra	51557432b		2020-01-01	0	t	f	1	359
934	hija	mujer	Sheila Tipanluisa	49273450k		2008-03-19	0	t	f	1	360
936	esposa	mujer	Constantin Ana-Maria	x9288920w		1985-08-25	0	t	f	1	362
941	hija	mujer	Rebeca Dobrin	y5266235p		2010-10-21	0	t	f	1	363
943	esposa	mujer	Banciu Stefania	0000000		1976-03-11	0	t	f	1	365
944	hija	mujer	Andrea Nicole	0000000		2003-05-20	0	t	f	1	365
947	esposa	mujer	Stoica victoria	X9076039D		1961-07-14	0	t	f	1	368
948	esposa	mujer	Turcios Rodriguez Josselin isamar	G. 118325		1990-02-11	0	t	f	1	370
950	esposa	mujer	Begonia Hidazgo  Torillas	06275773 Q		1988-10-18	0	t	f	1	374
951	esposa	mujer	Begonia Hidazgo  Torillas	06275773 Q		1988-10-18	0	t	f	1	374
952	esposa	mujer	Rocio Niquinga			1962-08-01	0	t	f	1	375
954	esposa	mujer	Matei Adriana Camelia	Y5159949 M		1973-07-15	0	t	f	1	377
956	esposa	mujer	Marcela Angel	X4294173G		1976-06-19	0	t	f	1	387
957	hija	mujer	Esther Dayana Lotco	Y2466173N		2005-12-20	0	t	f	1	389
959	esposa	mujer	Zoita Tudor	Y1921901N		2020-01-01	0	t	f	1	392
960	hija	mujer	Laura Alexandra	Y 1408969 A		2020-01-01	0	t	f	1	393
967	esposa	mujer	Pricop Gabriela	Xxxxxxx		2020-01-01	0	t	f	1	398
968	esposa	mujer	Radia Jaja	Xxxxxxxx		2020-01-01	0	t	f	1	400
971	hija	mujer	Iosara Benabdelah	Xxxxxx		2020-01-01	0	t	f	1	400
973	esposa	mujer	Gabriela Alina Neacsu	X3013325A		2020-01-01	0	t	f	1	401
976	esposa	mujer	Eliza Abigail Avram	X9448454P		2020-01-01	0	t	f	1	402
978	hija	mujer	Jessica Avram	Xxxxxx		2020-01-01	0	t	f	1	402
979	esposa	mujer	María Danilencu	Y0235149 B		2020-01-01	0	t	f	1	403
981	hija	mujer	Laura Elena Danilencu	Y2599739 V		2020-01-01	0	t	f	1	403
984	hija	mujer	Jessica Maria Halit	Y04341265		2020-01-01	0	t	f	1	404
985	esposa	mujer	Geta Rozaloa Kraiczar	X6454619Z		2020-01-01	0	t	f	1	404
986	esposa	mujer	Daniela Gheorghe	X8855300		1976-04-12	0	t	f	1	405
988	hija	mujer	Raluca Gheorghe	Xxxxxx		2010-04-07	0	t	f	1	405
989	esposa	mujer	Fabiola Nafera de Ignocentis	Xxxxxxxx		2020-01-01	0	t	f	1	406
990	hija	mujer	Ivana Fabiola Mejia Najera	Xxxxx		2020-01-01	0	t	f	1	406
991	hija	mujer	Anna Victoria Mejia Najera	Xxxxxx		2020-01-01	0	t	f	1	406
993	esposa	mujer	Alicia Cazero Domínguez	50965369 Z		2020-01-01	0	t	f	1	407
994	hija	mujer	Marta Rayón Calero	54397933 N		2020-01-01	0	t	f	1	407
996	hija	mujer	Ariazana Rayon Cazero	51027799 E		2020-01-01	0	t	f	1	407
997	hija	mujer	Noelia Iuliana Basascu Stan	X1646579 T		2020-01-01	0	t	f	1	408
999	hija	mujer	Dinu Denisa Rebeca	Y1444843C		2020-01-01	0	t	f	1	409
1000	esposa	mujer	Laura Tarnaru	X 9232368 p		2020-02-14	0	t	f	1	412
1002	esposa	mujer	Laura Tarnaru	X 9232368 p		1985-02-07	0	t	f	1	412
1003	esposa	mujer	Mariana Truică	TR536329		1974-04-08	0	t	f	1	413
1004	esposa	mujer	Toți gheorghita Alina	Y05664785		1989-08-06	0	t	f	1	414
1005	hija	mujer	Pena Lenuta	Tr 442656		1959-01-24	0	t	f	1	414
1007	esposa	mujer	Mohora Magdalena	Y3577161P		1979-11-02	0	t	f	1	416
1011	esposa	mujer	Ichim Angela	X8801142P		1979-03-11	0	t	f	1	417
1013	hija	mujer	Ichim Sofia	Y5995114V		2011-11-07	0	t	f	1	417
1015	esposa	mujer	Doina Acatrinei	X3536009N		2020-08-01	0	t	f	1	419
1020	esposa	mujer	Dorina Dragnuta	Y 1374452D		2020-08-01	0	t	f	1	421
1021	esposa	mujer	Nicoleta Popa	X8297558		1986-01-30	0	t	f	1	422
1022	hija	mujer	Alexia Mitu Luiza	Y3923326T		2012-12-09	0	t	f	1	422
1025	hija	mujer	Diana Elena Badea	Y5618914M		2020-08-01	0	t	f	1	423
1026	esposa	mujer	Maria Talea	X8919824C		2020-08-01	0	t	f	1	425
1028	hija	mujer	Lara Talea	1234567		2020-08-01	0	t	f	1	425
1029	esposa	mujer	Cati Gabriela	X9063843A		1987-06-26	0	t	f	1	426
1030	hija	mujer	Cati Thias Kayla			2018-05-26	0	t	f	1	426
1034	hija	mujer	sabrin el jaouhari	y2991034		2013-12-05	0	t	f	1	428
1036	hija	mujer	menor 2	x00000x		2013-01-15	0	t	f	1	429
1037	hija	mujer	menor 3	x000000x		2016-06-15	0	t	f	1	429
1039	hija	mujer	Safae mahrach	Y5668678-c		2017-06-14	0	t	f	1	430
1042	hija	mujer	FATIMA EZZAHRAE BOURFAA	Y0216099M		2004-09-30	0	t	f	1	431
1043	hija	mujer	DINA JAOUHARI	Y2773644L		2012-02-10	0	t	f	1	431
1045	hija	mujer	Nisrin es sabbar el sabar	09245700-e		2006-11-01	0	t	f	1	433
1046	hija	mujer	Aya Bakouk hadhoum	00000000		2020-07-18	0	t	f	1	434
1049	hija	mujer	Ana Do Nascimento Goncalves		01699332	1942-01-02	0	t	f	1	438
1056	hija	mujer	HAMZA ALAMALNI YUSRA	54011729R		2010-02-20	0	t	f	1	440
1057	hija	mujer	HAMZA ALAMALMI iman	54649190V		2014-05-22	0	t	f	1	440
1060	esposa	mujer	Osdali Carolina Montilla Jaimes		125715283	1987-01-27	0	t	f	1	443
1061	hija	mujer	Hacziel Annahi Zambrano Montilla		126393343	2013-09-25	0	t	f	1	443
1066	hija	mujer	Ilaf El Aissaoui		Y6202553L	2017-12-19	0	t	f	1	444
1068	hija	mujer	Alar El Khobzi		HY3619409	2006-05-29	0	t	f	1	446
1069	hija	mujer	Maryam El Khobzi		FJ9768715	2010-04-01	0	t	f	1	446
1071	hija	mujer	Chaymae El Khobzi		HI3480896	2005-01-04	0	t	f	1	446
586	esposo	hombre	ABDELOUAHED AKHNIKH	X6339908G		1979-12-19	0	t	f	1	241
590	esposo	hombre	BOUKHIAR EL OUARET	X1429400L		1958-12-31	0	t	f	1	242
591	hijo	hombre	BADRDIN EL OUARET	X7835605N		2006-05-15	0	t	f	1	242
592	esposo	hombre	MOHAMED EL KOURTBI	X6025156F		1988-10-09	0	t	f	1	244
593	hijo	hombre	ILYAS EL KOURTBI	Y3115938G		2013-06-28	0	t	f	1	244
598	hijo	hombre	ANAS BOUSSABOUN	X8436645S		2006-09-26	0	t	f	1	245
599	hijo	hombre	CAOTAR BOUSSABOUN	Y2684453E		2012-08-15	0	t	f	1	245
601	hijo	hombre	YOUSSEF EL HADRI	Y3641216P		2014-07-06	0	t	f	1	246
602	hijo	hombre	REDA EL HADRI	Y0879002W		2009-09-21	0	t	f	1	246
603	esposo	hombre	EL HOSSAIN MAHRACH	X5464179T		1971-12-19	0	t	f	1	247
604	hijo	hombre	MOHAMMED MAHRACH	Y3418042A		2000-06-26	0	t	f	1	247
606	hijo	hombre	ABDELLAH MAHRACH	Y3418064W		2013-07-08	0	t	f	1	247
607	hijo	hombre	AFNAN MAHRACH	Y6209930-J		2018-03-17	0	t	f	1	247
608	esposo	hombre	MOHAMED BOURJAL	X6451813Z		1980-12-19	0	t	f	1	248
611	hijo	hombre	YOUSSEF BOURJAL	Y0652071N		2009-04-09	0	t	f	1	248
612	esposo	hombre	SAMIR DIB	Y0021206Z		1983-12-27	0	t	f	1	250
613	hijo	hombre	DIB TALLEH ANOUAR	09247792K		2009-06-12	0	t	f	1	250
615	esposo	hombre	MHAMMED BOUIKRAT	X2718743M		1972-03-26	0	t	f	1	251
616	hijo	hombre	ADAM BOUIKRAT	Y2250080G		2011-11-10	0	t	f	1	251
617	hijo	hombre	SOUFIANE BOUIKRAT	Y4586877R		2016-01-11	0	t	f	1	251
618	esposo	hombre	SAMIR EL MAKHFADI	X6424114-F		1978-03-02	0	t	f	1	252
621	hijo	hombre	AHMED EL MAKHFADI	X2160587-G		2011-07-09	0	t	f	1	252
624	esposo	hombre	HASSAN MARSO	X8690446-B		1967-08-14	0	t	f	1	254
678	hijo	hombre	BELHAJ EL FARSIOUI AMIN	53823266-T		2004-05-16	0	t	f	1	269
679	esposo	hombre	LARBI BOURFAA	X0872253-R		1953-12-31	0	t	f	1	270
680	esposo	hombre	MOHAMED EL MORABIT	X3052368-S		1974-12-02	0	t	f	1	271
682	hijo	hombre	MOHAMMED EL MORABIT	Y0395781-B		2008-11-19	0	t	f	1	271
683	hijo	hombre	TAOFIK EL MORABIT	Y1690211-R		2010-10-22	0	t	f	1	271
684	hijo	hombre	MAROUN EL MORABIT	Y4137357-Q		2015-03-31	0	t	f	1	271
685	esposo	hombre	ABDESLAM BELHARTI	X3782861-M		1966-12-31	0	t	f	1	272
686	hijo	hombre	AHMED BELHARTI	X7790867-P		2002-12-09	0	t	f	1	272
687	hijo	hombre	MOHAMED BELHARTI	X0700325-N		2005-11-13	0	t	f	1	272
688	hijo	hombre	ILIAS BELHARTI	Y3192338-K		2013-09-07	0	t	f	1	272
690	hijo	hombre	AZADD EL MANKKOURI	X6227125		1996-03-31	0	t	f	1	273
691	esposo	hombre	REDOUAN EL HADDAD	X5269923-W		1984-10-23	0	t	f	1	274
694	hijo	hombre	MOHAMED REDA EL HADDAD	Y3724740-L		2014-08-07	0	t	f	1	274
696	esposo	hombre	JAHA EL AMRANI YOUNESS	49817126-T		1982-08-02	0	t	f	1	275
699	hijo	hombre	El amrani ilias jaha	54011085r		2015-02-24	0	t	f	1	275
700	esposo	hombre	EL AIACHI EL KOURTBI	X4296802-B		1961-12-31	0	t	f	1	276
702	esposo	hombre	FOUAD EL ABDALLAOUI	X2779665-T		1984-01-14	0	t	f	1	277
705	esposo	hombre	AHMED BENABDELLAH	X0105392-Y		1949-12-31	0	t	f	1	278
706	hijo	hombre	ABDELHAKIM BENABDELLAH	X2430592-K		1985-03-04	0	t	f	1	278
707	esposo	hombre	ABDELAZIZ EL AFIFA	Y1572231-B		1974-07-23	0	t	f	1	279
709	hijo	hombre	RAYAN EL AFIFA	54011831-B		2015-11-08	0	t	f	1	279
710	esposo	hombre	HAROUN EL HADDOUTI  MOHAMED	09125236-D		1973-12-16	0	t	f	1	280
711	hijo	hombre	HAROUN CHAIRI HAMED	54002013-Z		2003-08-01	0	t	f	1	280
712	hijo	hombre	HAROUN CHAIRI YASSIR	09125618-T		2005-12-26	0	t	f	1	280
770	hijo	hombre	RICHMOND GYESIE	Y4216435-C		2015-04-12	0	t	f	1	295
771	hijo	hombre	REMOND GYESIE	Y4216543-J		2015-04-12	0	t	f	1	295
773	esposo	hombre	PETER OSEI	Y0616489-B		1979-03-05	0	t	f	1	296
775	hijo	hombre	DAVID HSOAH OSEI	H2721153-pasaporte		2005-04-20	0	t	f	1	296
776	esposo	hombre	PATRICK APPIAH	X6759929-E		1972-07-20	0	f	f	1	297
778	hijo	hombre	APPIAH OPPONG RONARD  ASAMOAH	54698976-P		2011-06-28	0	f	f	1	297
780	esposo	hombre	RADIA JAHJAH	X6105283-W		1968-12-31	0	f	f	1	298
781	hijo	hombre	MOHAMED REDA BENABDELLAH	X7544677-X		2005-12-09	0	f	f	1	298
782	esposo	hombre	SAIDA ANANNAZ EP ROUHAND	K3622330-Z		1972-12-31	0	f	f	1	299
791	esposo	hombre	MOHAMMED EL GHARIB	X5313186-W		1967-01-25	0	t	f	1	301
792	hijo	hombre	YUNES EL GHARIB	X7009081-S		2005-04-01	0	t	f	1	301
793	hijo	hombre	HAMZA EL GHARIB	X9919998-Y		2008-04-02	0	t	f	1	301
794	hijo	hombre	ZAKARIA EL GHARIB	Y1436017-A		2010-01-22	0	t	f	1	301
796	esposo	hombre	ALIA KALLOUH	X5998580-L		1966-11-09	0	f	f	1	302
800	esposo	hombre	EL HBIL BELHADAJ BOUSELHAR	53755758-C		1964-06-14	0	t	f	1	303
856	esposo	hombre	MAHOMED SADEK AKHNIKH	X6374844A		1979-12-31	0	t	f	1	325
860	esposo	hombre	NORDINE HAMDOUCH	X3918129X		1978-02-06	0	t	f	1	327
862	hijo	hombre	ADAM HAMDOUCH	X9781341K		2008-03-24	0	t	f	1	327
863	hijo	hombre	ISMAEL HAMDOUCH	Y6004487Y		2017-11-04	0	t	f	1	327
864	esposo	hombre	IRIKRIKEN BELALI MOHAMMED ALI	53756853B		1974-01-19	0	t	f	1	328
866	hijo	hombre	IRIKRIKEN OUTOUHAMI ISMAEL	54003706M		2004-10-23	0	t	f	1	328
867	hijo	hombre	RAYAN IRIKRIKEN OUTOUHAMI	54647307C		2018-10-10	0	t	f	1	328
868	hijo	hombre	Eduardo Dumitrascu	y4493223a		2009-05-10	0	t	f	1	331
869	hijo	hombre	Kevin Dumitrascu	y4493217c		2012-06-10	0	t	f	1	331
871	hijo	hombre	Alexandru Leordan	x6770177n		1962-03-24	0	t	f	1	331
875	hijo	hombre	Giancarlo gentile	y7816273j		2020-01-01	0	t	f	1	332
878	hijo	hombre	Aitor Edu	y2894419-k		2020-01-01	0	t	f	1	333
879	hijo	hombre	Erik EDU	Y0522082L		2020-01-01	0	t	f	1	333
882	hijo	hombre	Golpea Mihai Alex	rx881951		1986-06-01	0	t	f	1	335
885	hijo	hombre	Curca Proaño Nicloas	y5101530y		2013-02-12	0	t	f	1	335
886	hijo	hombre	Covaci Robert Valentin	rd982357		1999-12-16	0	t	f	1	335
887	hijo	hombre	Curca Golpea Antony	y5155586n		2014-07-02	0	t	f	1	335
1064	hijo	hombre	Mohammedtaha	Y3457174N		2011-04-27	0	t	f	1	444
1073	Constantinescu	hombre	Bogdan Ionut	Y7165062R		1990-05-23	0	t	f	2	451
1074	Constantinescu	mujer	Tania Aishs		6220830807881	2022-08-30	0	t	f	2	451
1075	Badea	hombre	Gabriel Alexandru	Y5619141W		2012-02-14	0	t	f	2	452
1076	Badea	hombre	Stefan	Y5619035		2010-03-16	0	t	f	2	452
1077	Badea	mujer	Diana Elena	Y5618914 M		2014-09-10	0	t	f	2	452
1078	Niema	hombre	Elabdellaoui	Y9358581X		2021-12-25	0	t	f	2	268
1079	Bourfoa	hombre	Bilal	Xxxxx		2022-11-12	0	t	f	2	431
1080	Rayan	hombre	Rayan Berouz	X7587409P		2022-11-09	0	t	f	2	235
1081	Ibrahima	hombre	Balade Ibrahima		000787607	2013-03-05	0	t	f	2	448
1082	Llacza Estrada	mujer	Briana Dorie		118095927	2005-10-15	0	t	f	2	454
1083	Allacza Estrada	hombre	Branco Gadiel		220056783	2007-01-10	0	t	f	2	454
\.


--
-- Data for Name: adra_persona; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".adra_persona (id, nombre_apellido, dni, otros_documentos, fecha_nacimiento, numero_adra, nacionalidad, covid, domicilio, are_acte, ciudad, telefono, email, mensaje, active, created_at, updated_at, sexo, discapacidad, codigo_postal, empadronamiento, libro_familia, fotocopia_dni, prestaciones, nomnia, cert_negativo, aquiler_hipoteca, recibos, modificado_por_id) FROM stdin;
225	HAMID EL MOUKHLOUFI	X3996311-S		1989-08-24	207	Marruecos	f	COLNA CIUDAD JARDIN DEL ROSARIO 9, 3IZQ	f	Torrejon de ardoz	615763836		y	t	2022-11-04 06:55:28.240553+00	2022-11-04 06:55:28.240582+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
226	Elena Felea	X9843656-R		1986-11-04	208	Rumana	f	CALLE HOSPITAL 4 , 1B	f	Torrejon de ardoz	653061231		Fotocopias pasaporte niños y facturas luz o agua	t	2022-11-04 06:55:28.351468+00	2022-11-04 06:55:28.35149+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
227	MARIANA VICTORIA ILIE	X6477872-Z		1949-02-16	205	Rumana	f	CALLE GRANADA 5, BAJO B	f	Torrejon de ardoz	0		comunicar a carmen perona,falta papeles	t	2022-11-04 06:55:28.385179+00	2022-11-04 06:55:28.385202+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
228	EL FILALI EL KOURCHI HABIBA	09129847-C		1971-07-24	204	Española	f	COL CIUDAD JARDIN DEL ROSARIO 30 4A	f	Torrejon de ardoz	604249332			t	2022-11-04 06:55:28.409635+00	2022-11-04 06:55:28.409659+00	mujer	f	28850	t	t	t	t	f	f	f	t	1
229	HANANE OKRICH	X7743747-S		1977-02-01	203	Marruecos	f	CALLE CEMENTO 6, 4B	f	Torrejon de ardoz	632743452		Tiene un contrato de arrendamiento....faltan facturas y ingresos.....	t	2022-11-04 06:55:28.442574+00	2022-11-04 06:55:28.442596+00	mujer	f	28850	t	t	t	f	f	f	f	f	1
230	IKRAM EL YAAMOURI	X8881214-V		1981-01-01	201	Marruecos	f	CALLE GUADALAJARA 5, 1D	f	Torrejon de ardoz	602398767		acte 2020.nu avem nimic	t	2022-11-04 06:55:28.508252+00	2022-11-04 06:55:28.508276+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
231	LATIFA RAHMOUNI	X6329284-Y		1969-12-31	200	Marruecos	f	CALLE CANTO 5, BAJO DERECHA	f	Torrejon de ardoz	643617707		Falta empataronamiento....PHOTO NIE MARIDO,FACTURAS.....	t	2022-11-04 06:55:28.565385+00	2022-11-04 06:55:28.565408+00	mujer	f	28850	f	t	t	t	f	f	f	f	1
232	KHADIJA SBAA	Y3281136-Q		1965-03-12	199	Marruecos	f	CALLE BELGRADO 3, 2D	f	Torrejon de ardoz	603194639			t	2022-11-04 06:55:28.599245+00	2022-11-04 06:55:28.599266+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
233	AMINA EL HADDAD	X8089538-R		1998-07-26	197	Marruecos	f	CALLE MAESTRO CHAPI 1, 4B	f	Torrejon de ardoz	0		acte 2020 ,nu avem nimic	t	2022-11-04 06:55:28.632438+00	2022-11-04 06:55:28.632459+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
234	AICHA MOUKHLOUFI	X8089475-F		1957-12-31	196	Marruecos	f	CALLE MAESTRO CHAPI 1 4B	f	Torrejon de ardoz	602146389		Sacar papelito de entrega y completar con 2021	t	2022-11-04 06:55:28.645878+00	2022-11-04 06:55:28.645901+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
236	ACIA ECH CHARKAOUY	Y0411680-V		1980-12-31	192	Marruecos	f	CALLE CHILE 5, 3D	f	Torrejon de ardoz	602149933		nada	t	2022-11-04 06:55:28.7239+00	2022-11-04 06:55:28.723922+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
237	RADIA AACHBOUN	X7664452-B		1983-02-19	191	Marruecos	f	CALLE CANTO 3, 3B	f	Torrejon de ardoz	662434781			t	2022-11-04 06:55:28.771205+00	2022-11-04 06:55:28.771227+00	mujer	f	28850	t	t	t	t	f	f	t	t	1
238	ZAKIA EL MAALLIN	X6162645-W		1986-04-24	190	Marruecos	f	CALLE SEGOVIA 6, 4C	f	Torrejon de ardoz	602827678		Faltan facturas	t	2022-11-04 06:55:28.819163+00	2022-11-04 06:55:28.819185+00	mujer	f	28850	t	t	t	f	t	t	t	f	1
239	RACHIDA AZZOUZ	X9990995-W		1975-12-06	189	Marruecos	f	CALLE HAYA (LA) 7 4A	f	Torrejon de ardoz	643840816			t	2022-11-04 06:55:28.881715+00	2022-11-04 06:55:28.881737+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
240	MOUNIRA AGMIR	X5741828-Q		1979-03-07	188	Marruecos	f	CALLE MAESTRO TURINA 6 4A	f	Torrejon de ardoz	603270949		Vida laboral....lo tiene....pero no tiene ingresos y facturas.......	t	2022-11-04 06:55:28.905031+00	2022-11-04 06:55:28.90506+00	mujer	f	28850	t	t	t	f	f	f	f	f	1
241	RAHMA BEN STAHIR SERROUKH	Y2327957A		1987-02-21	187	Marruecos	f	CALLE ROSAS 3 BAJO B	f	Torrejon de ardoz	642607119		revisar documentacion ( 4-9-22)	t	2022-11-04 06:55:28.967692+00	2022-11-04 06:55:28.967715+00	mujer	f	28850	t	t	t	f	f	t	f	t	1
242	KARIMA SLIMANI	X6924456F		1963-12-31	186	Marruecos	f	CALLE BRUSELAS 7 BAJO C	f	Torrejon de ardoz	654180297		acte 2020,nu avem nimic	t	2022-11-04 06:55:29.022583+00	2022-11-04 06:55:29.022605+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
243	EL MEBLI ZIYAMI AOUATIF	50743252P		1968-12-17	185	Maruecos	f	CALLE GRANADOS 43 4DR	f	Torrejon de ardoz	642002611		acte 2020,nu avem nimic	t	2022-11-04 06:55:29.057744+00	2022-11-04 06:55:29.057773+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
244	IMANE BAKKALI	X6198271R		1994-07-10	184	Marruecos	f	AVENIDA CARMEN LAFORET 15 5C	f	Torrejon de ardoz	602368067		FALTAN FACTURAS	t	2022-11-04 06:55:29.072207+00	2022-11-04 06:55:29.072223+00	mujer	t	28850	t	t	t	f	t	f	f	f	1
245	BOUSSABOUN AHIBOUJ MOHAMED	54962138G		1959-12-31	182	Espanola	f	COL CIUDAD JARDIN DEL ROSARIO 20 5DR	f	Torrejon de ardoz	600815200		el padre ha fallecido,FALTAN FACTURAS	t	2022-11-04 06:55:29.129077+00	2022-11-04 06:55:29.1291+00	hombre	f	28850	t	t	t	t	f	f	f	f	1
246	ASMA NAJHI	X4853480C		1987-07-19	181	Marruecos	f	CALLE VIENA 4 2C	f	Torrejon de ardoz	671471687		acte 2020	t	2022-11-04 06:55:29.19373+00	2022-11-04 06:55:29.193753+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
247	FATIMA ZOHRA AMTOUR	Y3418014K		1981-11-13	179	Marruecos	f	CALLE SEGOVIA 12 3D	f	Torrejon de ardoz	603339752		Faltan hojas del libro de fam....falta una Photocopia nie de MOHAMMED MAHRACH	t	2022-11-04 06:55:29.228154+00	2022-11-04 06:55:29.228176+00	mujer	f	28850	t	t	t	t	f	t	t	t	1
248	LATIFA FOURSI	55216900h		1974-12-22	178	Marruecos	f	PLAZA GRANDE 5 3A	f	Torrejon de ardoz	650742586		Falta DNI de todos + alquiler + faltura luz o agua o gas	t	2022-11-04 06:55:29.292771+00	2022-11-04 06:55:29.292796+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
249	FRAGA CHIQUITO MARIA JOSE	54705775E		1971-12-16	177	Española	f	CALLE LIBERTAD 47 IZQ 1B	f	Torrejon de ardoz	680705157		acte 2020,nu avem nimic	t	2022-11-04 06:55:29.348235+00	2022-11-04 06:55:29.348258+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
250	TALLEH BAISSA FATIMA	09129291Q		1989-03-25	176	Española	f	CALLE SOLANA 4 4IZQ	f	Torrejon de ardoz	648611430		y	t	2022-11-04 06:55:29.36465+00	2022-11-04 06:55:29.364672+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
251	AZIZA ZYYANI	X2685010-J		1972-06-30	175	Marruecos	f	CALLE CANTO 7 1IZQ	f	Torrejon de ardoz	671222344			t	2022-11-04 06:55:29.417857+00	2022-11-04 06:55:29.417881+00	mujer	f	28850	t	t	t	t	f	f	f	t	1
252	SAMIRA FOURSI BOURJAL	03509761-F		1980-01-19	173	Marruecos	f	AVENIDA FRONTERAS 21 3IZQ	f	Torrejon de ardoz	632043251		FALTAN FACTURAS.....	t	2022-11-04 06:55:29.471509+00	2022-11-04 06:55:29.47153+00	mujer	f	28850	t	t	t	f	t	t	f	f	1
253	YENZ FRANCISCO LOPEZ ARIAS	141478612		1963-12-16	172	Venezolana	f	------	f	Torrejon de ardoz	0		falta datos de este persona,y la de sus familiar la fecha de nacimiento	f	2022-11-04 06:55:29.54194+00	2022-11-04 06:55:29.541962+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
254	SOUAD EL HALOULI	X4974350-W		1967-09-03	171	Marruecos	f	CALLE RONDA DEL PONIENTE 26, 2D	f	Torrejon de ardoz	610637397		acte 2020	t	2022-11-04 06:55:29.565137+00	2022-11-04 06:55:29.565159+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
255	BOBOC MITA	Y2010710-H		1926-06-13	168	Rumana	f	CALLE LISBOA 1 3D	f	Torrejon de ardoz	0		acte 2020 ,nu avem nimic	t	2022-11-04 06:55:29.607876+00	2022-11-04 06:55:29.607899+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
256	AUREL BOBOC	X6869082-V		1955-06-09	167	Rumana	f	CALLE LONDRES 16 1B	f	Torrejon de ardoz	0		acte 2020,nu avem nimic	t	2022-11-04 06:55:29.620428+00	2022-11-04 06:55:29.620445+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
257	SARRA EL MASOUDI	Y2388035-M		1994-05-20	164	Marruecos	f	C/ ENMEDIO 49 1A	f	Torrejon de ardoz	632334387			t	2022-11-04 06:55:29.643249+00	2022-11-04 06:55:29.643271+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
258	ZOUHRA BOUZIT	X9646321-Y		1985-05-25	162	Marruecos	f	CALLE CRUZ 19 3 5A	f	Torrejon de ardoz	0		acte 2020,nu avem nimic	t	2022-11-04 06:55:29.701618+00	2022-11-04 06:55:29.701641+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
259	HAJIBA SETTAR	X9124623-V		1982-03-02	158	Marruecos	f	CALLE CANILLAS 2 P2 4	f	Torrejon de ardoz	653132785		actualizare acte	f	2022-11-04 06:55:29.758862+00	2022-11-04 06:55:29.758884+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
260	HOUSYNA ELMOALEM	X6431332-A		1977-11-10	157	Marruecos	f	CALLE QUINTANILLA 2 P5 IZQ	f	Torrejon de ardoz	0		acte 2020,nu avem nimic	t	2022-11-04 06:55:29.813327+00	2022-11-04 06:55:29.813348+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
261	HANAN BERROUHOU	X7672470-S		1973-06-12	156	Marruecos	f	CALLE OPTICA 6, 3B	f	Torrejon de ardoz	631247102		Falta recibo agua o luz  parapapeles con Fecha de 2021	t	2022-11-04 06:55:29.868711+00	2022-11-04 06:55:29.868735+00	mujer	f	28850	t	t	t	t	t	t	t	f	1
262	EL MOUSSAOUI AIT MHAND MOULOUD	53826702-D		1965-12-31	155	ESPAÑOLA	f	AVENIDA CARMEN LAFORET 14, PORTAL 1, 8B	f	Torrejon de ardoz	0		falta numero de telefono	t	2022-11-04 06:55:29.936564+00	2022-11-04 06:55:29.936588+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
263	SABAH TOUTOUH	X9719063-E		1979-11-01	153	Maruecos	f	CALLE COPENHAGUE 10, 3A	f	Torrejon de ardoz	602321666			t	2022-11-04 06:55:29.991133+00	2022-11-04 06:55:29.991155+00	hombre	f	28850	t	t	t	t	t	f	f	t	1
264	LILIANA GEORGETA BRINZAN	X9062451-Z		1978-11-30	144	RUMANIA	f	AVENIDA DE LA CONSTITUCION 131, 1F	f	Torrejon de ardoz	664350603			t	2022-11-04 06:55:30.095694+00	2022-11-04 06:55:30.095716+00	mujer	f	28850	t	t	t	t	f	f	t	t	1
265	ASMAA ZYATE	X9398731-B		1986-12-06	143	Marruecos	f	CALLE BRILLANTE 1, BAJO CD	f	Torrejon de ardoz	640286822		Falta copie Nie de los hijos.....y tiene un contrato de arrendamiento de viviend- no se para qué sirve ???FALTAN FACTURAS Y INGRESOS....	t	2022-11-04 06:55:30.128811+00	2022-11-04 06:55:30.128833+00	mujer	f	28850	t	t	t	f	f	f	f	f	1
266	PILAR AVOMO NDONG	Y0481657-M		1982-02-10	142	GUINEA ECUATORIAL	f	avenida. CONSITUCION 22, 3D	f	Torrejon de ardoz	612432299		preguntar si AVOMO SOL PILAR,AVOMO DONATO LUIS sunt gemeni	f	2022-11-04 06:55:30.200631+00	2022-11-04 06:55:30.200653+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
267	ASMAE EL KADDOURI	X9259841H		1987-11-21	141	Marruecos	f	CALLE GUADALAJARA 3, 4C	f	Torrejon de ardoz	616746917			t	2022-11-04 06:55:30.265585+00	2022-11-04 06:55:30.265607+00	mujer	f	28850	t	t	t	t	f	f	f	t	1
269	RABIA EL FARSIOUI	X1911463W		1970-09-19	137	Marruecos	f	CALLE MAESTRO BARBIERI 7, 4A	f	Torrejon de ardoz	692938386		acte 2020	t	2022-11-04 06:55:30.391151+00	2022-11-04 06:55:30.391174+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
270	MALIKA BOURFAA	X6266269-L		1953-12-31	136	Marruecos	f	CALLE TORREJON 6, 1B	f	Torrejon de ardoz	631755693		Falta recibo de alquiler,	t	2022-11-04 06:55:30.43777+00	2022-11-04 06:55:30.437793+00	mujer	f	28850	t	f	t	f	f	t	f	t	1
271	FATYHA RAHMANI	X7784589-D		1982-07-31	135	Marruecos	f	CALLE HORTENSIAS 13, 3C	f	Torrejon de ardoz	604361732			t	2022-11-04 06:55:30.460731+00	2022-11-04 06:55:30.460753+00	mujer	f	28850	t	t	t	t	f	t	t	t	1
272	ZAHRA SKHIENE	X7790781-Z		1974-12-31	134	Marruecos	f	COL CIUDAD JARDIN DEL ROSARIO 9, 5IZ	f	Torrejon de ardoz	615050607		Faltan hojas del libro de fam.....	t	2022-11-04 06:55:30.527101+00	2022-11-04 06:55:30.527123+00	mujer	f	28850	t	t	t	t	f	t	f	t	1
273	NAIMA EL MACHROUHI	X6226710-N		1960-12-31	133	Marruecos	f	CALLE ZARAGOZA 13, 1B	f	Torrejon de ardoz	631468391		Falta luz	t	2022-11-04 06:55:30.594469+00	2022-11-04 06:55:30.594493+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
274	SALIMA ZARKAN	X4236266-B		1990-12-27	132	Marruecos	f	CALLE ARROYO 3, 2B	f	Torrejon de ardoz	602146389		Ocupa	t	2022-11-04 06:55:30.619423+00	2022-11-04 06:55:30.619446+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
275	SABAH EL AMRANI	Y1726896-R		1989-09-24	131	Marruecos	f	CALLE ALICANTE 10, 4D	f	Torrejon de ardoz	632448231			t	2022-11-04 06:55:30.686562+00	2022-11-04 06:55:30.686584+00	mujer	f	28850	t	t	t	f	f	f	t	t	1
276	AMINA EL METIOUI	X6025137-B		1969-12-31	128	Marruecos	f	CALLE RONDA DEL PONIENTE 9, 1C	f	Torrejon de ardoz	631121209		Falta empadronamiento actualizado.....tengo de 2020,faltan muchas cosas.....	t	2022-11-04 06:55:30.740764+00	2022-11-04 06:55:30.740785+00	mujer	t	28850	f	f	t	f	f	t	f	t	1
277	SAKINA EL MANSOURI	Y0355993-J		1988-02-05	127	Marruecos	f	CALLE QUINTANILLA 4, 1B	f	Torrejon de ardoz	722285615		falta nomina (revisar)	t	2022-11-04 06:55:30.774207+00	2022-11-04 06:55:30.77423+00	mujer	f	28850	t	t	t	f	f	f	t	t	1
278	KHADDOUJ BEL HAJ	X2749254-H		1950-12-31	126	Marruecos	f	CALLE MESTRO BARBIERI 1, 2A	f	Torrejon de ardoz	631199210		FALTAN FACTURAS.....	t	2022-11-04 06:55:30.821798+00	2022-11-04 06:55:30.821821+00	mujer	f	28850	t	f	t	t	f	f	f	f	1
279	AFIA ABOUSSAID OUASSIMA	50646150N		1965-03-04	124	Marruecos	f	CALLE MARQUESAS 6, 2G	f	Torrejon de ardoz	655325445			t	2022-11-04 06:55:30.859873+00	2022-11-04 06:55:30.859899+00	mujer	f	28850	t	t	t	f	t	f	f	t	1
280	NISRINE CHAIRI	X5313692-W		1981-05-10	122	Marruecos	f	CALLE RIO TOROTE 26, 3C	f	Torrejon de ardoz	676907822		acte 2020	t	2022-11-04 06:55:30.903924+00	2022-11-04 06:55:30.903946+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
281	HAJAR AKAZIM	Y0273393Y		1991-03-19	121	Marruecos	f	CALLE JUAN RAMON JIMENEZ 7, 5B	f	Torrejon de ardoz	602575828		vida laboral,ultima nominal de el o certifacado negativo	t	2022-11-04 06:55:30.958257+00	2022-11-04 06:55:30.958302+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
282	AICHA EL FARSIOUI	X3734165-T		1974-01-07	120	Marruecos	f	CALLE MAESTRO CHUECA 8, 3B	f	Torrejon de ardoz	631180588		FALTA NIE ESPOSO	t	2022-11-04 06:55:31.016404+00	2022-11-04 06:55:31.016425+00	mujer	f	28850	t	f	t	t	f	f	t	t	1
283	FATOUM BOUSSAID	X2326896-D		1965-04-02	119	Marruecos	f	CALLE CANCANA 32, 3D	f	Torrejon de ardoz	655325445			t	2022-11-04 06:55:31.051194+00	2022-11-04 06:55:31.051217+00	mujer	f	28850	t	t	t	t	f	t	t	t	1
284	FATIMA SALHI	Y0290502-A		1984-11-21	118	Marruecos	f	CALLE SEGOVIA 19,2B	f	Torrejon de ardoz	603274091			t	2022-11-04 06:55:31.08726+00	2022-11-04 06:55:31.087284+00	mujer	f	28850	t	t	t	t	f	f	t	t	1
285	SAIDA RIYADI	X3360197-N		1978-12-27	110	Marruecos	f	CALLE HORTENCIAS 11, 1A	f	Torrejon de ardoz	605349941		nada	f	2022-11-04 06:55:31.15874+00	2022-11-04 06:55:31.158765+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
286	KHADIJA ALOUAT	X7615513-Y		1985-09-30	108	Marruecos	f	CALLE SAN FELIPE 5, 1A	f	Torrejon de ardoz	672914278		revisar documentacion (dice que lo tiene todo)4-9-22	t	2022-11-04 06:55:31.217816+00	2022-11-04 06:55:31.217841+00	mujer	f	28850	t	t	t	t	f	f	t	t	1
287	EL AZIZA AL AMRANI	X9645766-A		1983-06-09	107	Marruecos	f	TRAvesia  MANUEL SANDOVAL 1, 2E	f	Torrejon de ardoz	689289276		FALTA NIE ESPOSO -FOTOCOPIE	t	2022-11-04 06:55:31.284468+00	2022-11-04 06:55:31.28449+00	mujer	f	28850	t	t	t	t	f	t	t	t	1
288	HABIBA BOUTASGHOUNTE	X6961108-C		1968-12-31	106	Marruecos	f	CALLE ESTOCOLMO 9, 4-3	f	Torrejon de ardoz	672899236		revisar documentacion (dice que tiene todo) 4-9-22	t	2022-11-04 06:55:31.362757+00	2022-11-04 06:55:31.362824+00	mujer	f	28850	t	f	t	t	f	t	f	t	1
289	LAHCEN DHIKAR	X3139107-K		1973-10-14	102	Marruecos	f	CALLE MAESTRO BARBIERI 3, 4C	f	Torrejon de ardoz	602691629		y	t	2022-11-04 06:55:31.407126+00	2022-11-04 06:55:31.40716+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
290	SAIDA BOUJIDA	X2280778-Y		1973-05-19	98	Marruecos	f	CALLE LIBERTAD 47, 2A-IZQ	f	Torrejon de ardoz	604399572		Hacer hoja de entrega de la ultima entrega	t	2022-11-04 06:55:31.462399+00	2022-11-04 06:55:31.462423+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
291	SANAA ANAKAR	Y0185277-A		1981-06-19	89	Marruecos	f	CALLE DUBLIN 4, 4-4	f	Torrejon de ardoz	632979580			t	2022-11-04 06:55:31.521704+00	2022-11-04 06:55:31.521731+00	mujer	f	28850	t	t	t	f	t	f	f	t	1
292	OMKELTOUM EL GUARRATI	X8582085-A		1970-07-31	87	Marruecos	f	CALLE LISBOA 27 4º 3	f	Torrejon de ardoz	632051625		Falta nomina o prestacion, envian vida laboral pero no nos interesa. Tambien adjuntan dni del abuelo. Hay que explicarles que no se puede añadir a la unidad familiar	t	2022-11-04 06:55:31.588698+00	2022-11-04 06:55:31.588721+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
293	FATIMA KAINA	X5934241-B		1983-04-24	86	Marruecos	f	CALLE FUENTES 1, 4A	f	Torrejon de ardoz	632011813			t	2022-11-04 06:55:31.637313+00	2022-11-04 06:55:31.637336+00	mujer	f	28850	t	t	t	f	t	t	t	t	1
294	HORIA BEN ABDELLAH	X8231122-C		1985-08-24	82	Marruecos	f	CALLE NAPOLES 1, 4A	f	Torrejon de ardoz	633363405			t	2022-11-04 06:55:31.696366+00	2022-11-04 06:55:31.69639+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
295	FAUSTINA AGYEI	Y3260740-K		1980-03-16	81	GHANA	f	CALLE SAN FELIPE 5, 5C	f	Torrejon de ardoz	631080645		revisar documentacion (dice que tiene todo)4-9-22	t	2022-11-04 06:55:31.760433+00	2022-11-04 06:55:31.760455+00	mujer	f	28850	t	f	f	f	t	f	f	t	1
296	YAA ROSINA AGYEI	Y1123338-D		1974-07-18	80	GHANA	f	CALLE SAN FELIPE 7, BAJO A	f	Torrejon de ardoz	631387647		y	t	2022-11-04 06:55:31.828275+00	2022-11-04 06:55:31.828298+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
297	BEATRICE OPPONG	Y0231244-Q		1979-10-13	73	GHANA	f	CALLE CADIZ 2, BAJO C	f	Torrejon de ardoz	632764349		i se  poate recomanda sa ia de la ai lor ,care au centru propiu aici in torrejon	f	2022-11-04 06:55:31.880539+00	2022-11-04 06:55:31.880561+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
298	MOSTAFA BENABDELLAH	X1357646-W		1961-12-31	65	Marruecos	f	CALLE DE LA TIA PEPA 6, 1A	f	Torrejon de ardoz	654209095		nu i se mai da este din paracuellos 20-12-2018	f	2022-11-04 06:55:31.936722+00	2022-11-04 06:55:31.936744+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
299	ROUHAND EL AOUMRANI AHMED	51528834-W		1961-12-31	63	Española	f	CALLE NORTE 8, BAJO	f	Torrejon de ardoz	699688484		nu i se mai da este din ajalvir 20-12-2018	f	2022-11-04 06:55:31.970676+00	2022-11-04 06:55:31.970699+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
340	Elena Bilti	x7511829y		1961-05-04	247	Rumana	t	c/enmedio nr 49 5c	f	Torrejon de ardoz	663329065			f	2022-11-04 06:55:33.868079+00	2022-11-04 06:55:33.868102+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
300	AHMED ENNAMOUTI	X1310352-L		1956-12-31	58	Marruecos	f	CALLE REAL 46, BAJO 1	f	Torrejon de ardoz	664664668		nu i se mai da este din ajalvir 20-12-2018	f	2022-11-04 06:55:32.04229+00	2022-11-04 06:55:32.042312+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
301	SAMIRA EL KHAMMARI	54648509A		1975-09-19	57	Marruecos	f	PUERTO DE SOMOSIERRA 4, 3C	f	Torrejon de ardoz	617285809			t	2022-11-04 06:55:32.099407+00	2022-11-04 06:55:32.09943+00	mujer	f	28850	t	t	t	f	f	f	t	t	1
302	EL HADI JAHJAH	X1380607D		1956-12-31	56	Marruecos	f	CALLE NORTE 2 , BAJO	f	Torrejon de ardoz	0		nu are telefon ,si nu i se mai da 20-12-2018	f	2022-11-04 06:55:32.167695+00	2022-11-04 06:55:32.167719+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
303	EL KHAMMARI EL MAJDOUBI RACHIDA	X09125296T		1968-12-28	54	Española	f	CALLE MAESTRO BARBIERI 16, 2B	f	Torrejon de ardoz	603297705			t	2022-11-04 06:55:32.223053+00	2022-11-04 06:55:32.223077+00	mujer	f	28850	f	t	t	t	t	f	f	t	1
304	ZAKIA EL MANSOURI	X2874623-Z		1986-08-04	49	Marruecos	f	CALLE CORDOBA 2, 2C	f	Torrejon de ardoz	698643007			t	2022-11-04 06:55:32.289286+00	2022-11-04 06:55:32.289308+00	mujer	f	28850	t	t	t	t	t	f	t	f	1
305	DRAGU ILIE	X8503333-A		1960-05-25	31	Rumana	f	calle manuel sandoval nr 18 1d	f	Torrejon de ardoz	664665165		trebuie facuta fisa pentruca nu avem impresora si trebuie sa semneze.	t	2022-11-04 06:55:32.347371+00	2022-11-04 06:55:32.347394+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
306	JOSEPH KWATENG	X6855810-Q		1982-11-22	27	NIGERIANA	f	CALLE MIÑO 14, AC	f	Torrejon de ardoz	0		TELEFONO? si nu i se mai da este din coslada	f	2022-11-04 06:55:32.372473+00	2022-11-04 06:55:32.372495+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
307	DINCA ELENA EUGENIA	X8999455-S		1976-03-10	9	Rumana	f	CALLE RINCON 4, 2A	f	Torrejon de ardoz	0		acte 2020	t	2022-11-04 06:55:32.419276+00	2022-11-04 06:55:32.419317+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
308	ANA CRESPO VEGA	9012836X		1974-06-25	209	Española	f	calle madrid nr 4	f	Torrejon de ardoz	628125211		acte 2020,nu avem nimic	t	2022-11-04 06:55:32.452899+00	2022-11-04 06:55:32.452921+00	mujer	t	28850	f	f	f	f	f	f	f	f	1
309	LOBNA EL AZAAR	X75121366-Z		1982-12-06	180	MARUECOS	f	CALLE PUERTO DE SOMOSIERRA 2 PO3 C	f	Torrejon de ardoz	631569661		Y	t	2022-11-04 06:55:32.477143+00	2022-11-04 06:55:32.477166+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
310	FAOUZIYA MAKRANE	Y4696158-D		1985-11-14	210	MARRUECOS	f	CALLE SALAMANCA 3, 3IZQ	f	Torrejon de ardoz	675202181			t	2022-11-04 06:55:32.544902+00	2022-11-04 06:55:32.544925+00	mujer	f	28850	t	t	t	f	f	f	t	f	1
311	SOHAILA ELKHAMLICHI	Y5599602-J		1987-12-09	211	MARRUECOS-MAR	f	CALLE MADRID 16, 2A.	f	Torrejon de ardoz	631085094			t	2022-11-04 06:55:32.600567+00	2022-11-04 06:55:32.600589+00	mujer	f	28850	t	t	t	t	f	f	t	t	1
312	RADIA AKHAZZANE	X6034452--B		1984-12-31	212	MARRUECOS-MAR	f	CALLE ARGANDA 1, 4-1.	f	Torrejon de ardoz	626116831		Falta parte principal de libro de familia	t	2022-11-04 06:55:32.658587+00	2022-11-04 06:55:32.658609+00	mujer	f	28850	t	t	t	f	f	f	t	t	1
313	JAMILA ADAHCHOUR	X8791477-A		1961-12-31	213	MARUECOS	f	COL CIUDAD JARDIN DEL ROSARIO 21, 2º DERECHA	f	Torrejon de ardoz	617216176		acte 2020	t	2022-11-04 06:55:32.721443+00	2022-11-04 06:55:32.721466+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
314	LAILA SAFFI	X6525968.-V		1984-07-26	129	MARRUECOS	f	CALLE SLAMNCVA 7 0P 2 IZ	f	Torrejon de ardoz	631049455		Falta nie del marido	t	2022-11-04 06:55:32.746799+00	2022-11-04 06:55:32.746822+00	mujer	f	28850	t	t	t	f	t	f	f	t	1
315	RAMONA NICOLETA POPOVICI	X6692914-Y		1981-05-16	23	Rumana	f	c/forja 5 piso 03 puerta D	f	Torrejon de ardoz	642725308		Falta empadronamiento	t	2022-11-04 06:55:32.81031+00	2022-11-04 06:55:32.810332+00	mujer	t	28850	f	t	t	t	f	f	t	t	1
316	GEORGEL RADU	X6780349-H		1981-02-15	215	Rumana	f	calle/maunuel sandoval  nr 22 piso 1D	f	Torrejon de ardoz	642843531		falta vida laboral de alina ,ultima nomina o sino  certificat negativ,fotocopia de los niños	t	2022-11-04 06:55:32.857409+00	2022-11-04 06:55:32.857433+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
317	HOURIA ARAZZOUK	X8557195-E		1991-09-09	214	MARRUECOS	f	CALLE ROSAS  3 P03 B	f	Torrejon de ardoz	602085764			t	2022-11-04 06:55:32.930881+00	2022-11-04 06:55:32.930905+00	mujer	f	28850	t	t	t	t	f	f	f	t	1
318	Abigaila Sephora Tataru	y1658526x		2000-11-21	216	Rumana	f	calle/pesquera nr 4 d	f	Torrejon de ardoz	642864152		acte 2020	t	2022-11-04 06:55:32.996212+00	2022-11-04 06:55:32.996239+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
319	NORMA VICTORIA GONZALES PAJARES	50908315-T		1962-09-07	217	Peru	f	c/pamplona 5 iz p03 0003	f	Torrejon de ardoz	0		acte 2020,nu avem nimic	t	2022-11-04 06:55:33.010975+00	2022-11-04 06:55:33.011+00	mujer	t	28850	f	f	f	f	f	f	f	f	1
320	MARIAN PIRVU	y1882395-c		1977-07-05	218	Rumana	f	----------	f	Torrejon de ardoz	604155846		duerme en la calle	t	2022-11-04 06:55:33.024481+00	2022-11-04 06:55:33.024503+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
321	MIÑANA NICOLAS	03137807D		1986-03-12	219	Española	f	-----------------	f	Torrejon de ardoz	633480798		dureme en la calle	t	2022-11-04 06:55:33.037458+00	2022-11-04 06:55:33.037478+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
322	EDWIM ALEXANDER	Y7235151		1979-07-06	220	COLOMBIA	f	calle/pozo de la nieves nr7 p04 pA	f	Torrejon de ardoz	643960637		falta	f	2022-11-04 06:55:33.050675+00	2022-11-04 06:55:33.050695+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
323	ALEJANDRINA PORTILLO SORTO	F415597		1968-02-24	221	HONDURAS	f	CALLE/BADALONA 27 P2	f	Torrejon de ardoz	632142446		NADA	f	2022-11-04 06:55:33.086092+00	2022-11-04 06:55:33.086114+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
325	LATIFA SABBAHI	X7805187E		1992-03-09	223	MARUECOS	f	CALLE/PUERTO DE LOS LEONES 2 PBJ A	f	Torrejon de ardoz	664128450			t	2022-11-04 06:55:33.156031+00	2022-11-04 06:55:33.156054+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
326	MIHAILA IULIAN RADU	053450022		1981-01-11	224	Rumana	f	-----------	f	Torrejon de ardoz	1		duerme en la calle	t	2022-11-04 06:55:33.21102+00	2022-11-04 06:55:33.211059+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
327	IBTISSAM MAWHOUB	X9993183-M		1988-10-19	225	MARUECOS	f	CALLE ATENAS NR 5 P4 PD	f	Torrejon de ardoz	642144729		NEW	t	2022-11-04 06:55:33.22479+00	2022-11-04 06:55:33.224806+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
328	BOUCHRA AOUARFAT OUTOUHAMI	54011252F		1979-05-04	226	MARUECOS	f	calle puerto de los leones 4 portal 4 b	f	Torrejon de ardoz	632748695		Tengo sólo la primera página del libro de familia......	t	2022-11-04 06:55:33.278046+00	2022-11-04 06:55:33.278068+00	mujer	f	28850	t	f	t	t	f	f	t	t	1
329	KHADIJA NAITBARI BKKA	53756846G		1949-09-12	227	MARUECOS	f	c/londres 60B P06 A	f	Torrejon de ardoz	643585427		FALTAN INGRESOS!!!!	t	2022-11-04 06:55:33.333763+00	2022-11-04 06:55:33.333801+00	mujer	f	28850	t	f	t	f	f	f	t	t	1
330	Aurora Florentina Raducan	Y6313412H		1964-03-05	249	Rumana	t	Calle Pamplona nr5 ESC. Izq  tercero -6	f	Torrejon de ardoz	642170761			f	2022-11-04 06:55:33.347009+00	2022-11-04 06:55:33.347028+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
331	LOREDANA DUMITRASCU	X7792871B		1990-09-07	246	Rumana	t	calle dalias 169	f	Torrejon de ardoz	643360643			f	2022-11-04 06:55:33.365438+00	2022-11-04 06:55:33.365458+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
332	Giovani Gentile	000000		2020-01-01	333	Peru	t	calle democracia nr 10 p 2b	f	Torrejon de ardoz	600286391		dni no valido y fecha de nacimiento	f	2022-11-04 06:55:33.43132+00	2022-11-04 06:55:33.431342+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
333	Cornel Edu	x8829799f		1975-05-24	245	Rumana	t	urbanicacion de las flores nr 29 mejorada del campo	f	Torrejon de ardoz	600391671			f	2022-11-04 06:55:33.485934+00	2022-11-04 06:55:33.485955+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
334	Florin Mitrica	x9102926d		1978-05-09	244	Rumana	t	c begoña nr 1 p 4 iz	f	Torrejon de ardoz	603122131		din coslada	f	2022-11-04 06:55:33.540975+00	2022-11-04 06:55:33.540998+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
335	Mita Florea	rx740328		1962-08-22	241	Rumana	t	c/fernando roncero nr 6 2 c	f	Torrejon de ardoz	674028736		mostoles	f	2022-11-04 06:55:33.564344+00	2022-11-04 06:55:33.564366+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
336	Luis Rodriguez Flores	y6884400p		1983-09-06	240	Española	t	c/gerardo diego nr 3 2izq	f	Torrejon de ardoz	643689225		madrid	f	2022-11-04 06:55:33.685605+00	2022-11-04 06:55:33.685628+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
337	Iulian Catalin zamfir	x4967475g		1977-03-09	237	Rumana	t	c/oneca 16 p4b	f	Torrejon de ardoz	640762743		coslada-madrid	f	2022-11-04 06:55:33.739237+00	2022-11-04 06:55:33.739259+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
338	Ramona Alupoaiei	x6581006q		1982-03-02	292	Rumana	t	c/laguna nr 17 1izq	f	Torrejon de ardoz	689493377	licaramona82@gmail.com	guadalix de la sierra	f	2022-11-04 06:55:33.783785+00	2022-11-04 06:55:33.783807+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
339	Viorel Alexandru	x6640597		1972-10-27	291	Rumana	t	c/rolyal 6 2d	f	Torrejon de ardoz	617288998		guadaliz de la sierra	f	2022-11-04 06:55:33.822626+00	2022-11-04 06:55:33.822648+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
341	Junior Enrique Quintero Barrios	y7122747y		1989-09-18	248	Venezuela	t	c/flores nr 4 1d	f	Torrejon de ardoz	643967300		madrid	f	2022-11-04 06:55:33.89152+00	2022-11-04 06:55:33.891541+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
342	Ciocan  Mugurel	x6975307m		1973-01-18	315	Rumana	t	c/forja nr 5 bajo b	f	Torrejon de ardoz	678112831			f	2022-11-04 06:55:33.927789+00	2022-11-04 06:55:33.927815+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
343	Eremia Andrei	x3367787n		1954-11-01	270	Rumana	t	c/doctor marañom 7 4d	f	Torrejon de ardoz	666966644		coslada	f	2022-11-04 06:55:33.97244+00	2022-11-04 06:55:33.972463+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
344	Bran Mihai Mircea	y0136869t		2020-01-01	269	Rumana	t	c/manuel maria de zulieta nr 4 6c	f	Torrejon de ardoz	672513351		coslada 28821	f	2022-11-04 06:55:34.028911+00	2022-11-04 06:55:34.028934+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
345	Serbanescu Stefania	x9273663v		1986-03-25	266	Rumana	t	av.de la constitucion nr 70 2a	f	Torrejon de ardoz	643417020		coslada	f	2022-11-04 06:55:34.052523+00	2022-11-04 06:55:34.052545+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
346	Efren Parada Cardoza	y7130307e		1974-11-11	280	Española	t	av.clara campoamor nr 8 p1 a	f	Torrejon de ardoz	0		loeches	f	2022-11-04 06:55:34.098304+00	2022-11-04 06:55:34.098326+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
347	Luca Olga	y1783948j		1954-10-15	281	Rumana	t	C/via computense nr 73	f	Torrejon de ardoz	642944669		alcala de henares	f	2022-11-04 06:55:34.134379+00	2022-11-04 06:55:34.134406+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
348	Constantin Avram	x9139236w		1976-04-28	282	Rumana	t	c/libertad 45 4a	f	Torrejon de ardoz	642297147			f	2022-11-04 06:55:34.148788+00	2022-11-04 06:55:34.148841+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
349	Fouad lamart slimart	x2852017v		1975-02-20	283	Maruecos	t	vive en la calle	f	Torrejon de ardoz	602391392		sin hogar	f	2022-11-04 06:55:34.182921+00	2022-11-04 06:55:34.182994+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
350	Radu Marin	x6853446k		1983-10-13	284	Rumana	t	av carmen larofet nr 9 4c	f	Torrejon de ardoz	644663852			f	2022-11-04 06:55:34.196969+00	2022-11-04 06:55:34.196986+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
351	Matei Marinez Danut	x9210713h		1973-02-04	285	Rumana	t	C/abad juan catazan nr 40 3a	f	Torrejon de ardoz	642401105			f	2022-11-04 06:55:34.22066+00	2022-11-04 06:55:34.220682+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
352	Iulian Platica	x6729693p		1976-03-20	286	Rumana	t	c/rioja nr 3 primero b	f	Torrejon de ardoz	672502443			f	2022-11-04 06:55:34.256705+00	2022-11-04 06:55:34.256729+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
353	Coca Vasile	x6814648r		1963-12-02	287	Rumana	t	C/pajaritos nr 16	f	Torrejon de ardoz	642709195			f	2022-11-04 06:55:34.291801+00	2022-11-04 06:55:34.291823+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
354	Ovidiu Ceica	y0155951w		1988-06-20	339	Rumana	t	c/veredillas nr 15 primero a	f	Torrejon de ardoz	642881012			f	2022-11-04 06:55:34.326103+00	2022-11-04 06:55:34.326125+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
355	Juan Carlos Alonso de la Morena	51361312n		1963-06-09	338	Española	t	c/sierra morena nr 6	f	Torrejon de ardoz	673253628		pioz guadalajara	f	2022-11-04 06:55:34.360265+00	2022-11-04 06:55:34.360287+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
356	Raul Anton Mojoatca	x8775584a		1983-08-30	268	Rumana	t	c/ronda del poniente 4 1b	f	Torrejon de ardoz	644043472			f	2022-11-04 06:55:34.383415+00	2022-11-04 06:55:34.383436+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
357	Maria Cojocaru	x9113672z		2020-01-01	253	Rumana	t	c/rivas nr 3 4b	f	Torrejon de ardoz	642118035		coslada	f	2022-11-04 06:55:34.400166+00	2022-11-04 06:55:34.400186+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
358	Ion Gabriela	x8567152c		1972-10-16	252	Rumana	t	AV.ESPAÑA 23 3D	f	Torrejon de ardoz	643165178		coslada	f	2022-11-04 06:55:34.435025+00	2022-11-04 06:55:34.435047+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
359	Garcia Ruiz Wilson Vicente	51557436s		1964-01-09	401	Ecuador	t	c/travecia de la primavera 1 p 1b	f	Torrejon de ardoz	0		aranjuez,falta hoja de entrega	f	2022-11-04 06:55:34.448269+00	2022-11-04 06:55:34.448304+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
360	Tipanluisa Mata Freddy	49309529s		1980-03-14	251	Ecuador	t	c/virgen deñ pilar 5 bajo a	f	Torrejon de ardoz	688408781			f	2022-11-04 06:55:34.503087+00	2022-11-04 06:55:34.503108+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
361	Petruta Sareanu	y479228p		1959-07-17	235	Rumana	t	c/pamplona nr 5 p1	f	Torrejon de ardoz	643373222		falta fecha nacimiento marido	f	2022-11-04 06:55:34.537298+00	2022-11-04 06:55:34.53732+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
362	Constantin Viorel Florin	x5637897e		1981-04-06	234	Rumana	t	C/mercedes isquerdo nr 6 3-2	f	Torrejon de ardoz	678213092			f	2022-11-04 06:55:34.560684+00	2022-11-04 06:55:34.560704+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
363	Simona Dobrin	x6629030q		1979-07-19	233	Rumana	t	c/manuel de la falla nr 38 4a	f	Torrejon de ardoz	643049567		san fernando de henares	f	2022-11-04 06:55:34.606937+00	2022-11-04 06:55:34.606962+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
364	Radoi Grigorita	x6037155t		1962-07-15	232	Rumana	t	c/unamundo nr 12 2d	f	Torrejon de ardoz	622527859		coslada 28821	f	2022-11-04 06:55:34.650821+00	2022-11-04 06:55:34.650844+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
365	Munteanu Albert Octavian	x4274646g		1978-11-15	230	Rumana	f	paso de cegama nr 20 4a	f	Torrejon de ardoz	670893966		Falta agencia tributaria	t	2022-11-04 06:55:34.674422+00	2022-11-04 06:55:34.674445+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
366	Cati Eugenia	x6724425f		1966-05-21	229	Rumana	t	c/lisboa 5 4b	f	Torrejon de ardoz	642733251			f	2022-11-04 06:55:34.729537+00	2022-11-04 06:55:34.729559+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
367	Steliana Dobre	x6820629w		1963-03-24	228	Rumana	t	av.guadalajara	f	Torrejon de ardoz	625384551		coslada	f	2022-11-04 06:55:34.742179+00	2022-11-04 06:55:34.742197+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
368	Stoica Tudor	X9076026L		1958-11-02	300	Rumana	t	Calle/San Valentin nr6/piso3a	f	Torrejon de ardoz	664523553		Ciudad Madrid	f	2022-11-04 06:55:34.755377+00	2022-11-04 06:55:34.755393+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
369	Rece Ion	TR643230		1964-03-23	312	Rumana	t	C/Vic Alvaro nr 16 Piso 2a	f	Torrejon de ardoz	642961670		Vicalvaro	f	2022-11-04 06:55:34.780121+00	2022-11-04 06:55:34.780143+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
370	Turcios Cruz Josue Ariel	G. 118392		1989-02-11	309	Honduras	t	La imagini nr16 Piso 4a	f	Torrejon de ardoz	644651939		Madrid	f	2022-11-04 06:55:34.792731+00	2022-11-04 06:55:34.792749+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
371	Strătilă Alin	SV055321863		1980-10-14	288	Rumana	t	C/Rioja nr 3	f	Torrejon de ardoz	642079097			f	2022-11-04 06:55:34.816731+00	2022-11-04 06:55:34.816754+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
372	Dumitrean Iosif	XB565077		1989-03-16	238	Rumana	t	C/San cipriano nr 67 p31	f	Torrejon de ardoz	677347531		Madrid	f	2022-11-04 06:55:34.830262+00	2022-11-04 06:55:34.830282+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
373	Munteanu Letiția	X6602617F		1957-06-12	316	Rumana	t	Calle Pamplona,nr 5 ,portal 5,et 5,ap.7	f	Torrejon de ardoz	642279172			f	2022-11-04 06:55:34.85552+00	2022-11-04 06:55:34.855543+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
374	Javier Argumenez Patiñio	06271943 G		1985-07-18	317	Español	t	Calle Princesa de Eboli nr 2 Madrid	f	Torrejon de ardoz	618294714			f	2022-11-04 06:55:34.868111+00	2022-11-04 06:55:34.868128+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
375	Mario Rodrigo Yapo Maila	X5637918 C		1969-05-01	242	Ecuador	t	Calle Cabilas ,nr 22,Pj B Madrid código postal 28850	f	Torrejon de ardoz	663260550			f	2022-11-04 06:55:34.901377+00	2022-11-04 06:55:34.901399+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
376	Doinita Paraschiva Olar	X6596688N		1959-06-23	318	Rumana	t	Calle Ferocaril ,nr 27,piso 2C	f	Torrejon de ardoz	643127240			f	2022-11-04 06:55:34.936696+00	2022-11-04 06:55:34.936718+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
377	Matei Ionez	Y6195289T		1973-04-23	278	Rumana	t	Calle Abad Juan Catazan,nr 40	f	Torrejon de ardoz	642979570			f	2022-11-04 06:55:34.950307+00	2022-11-04 06:55:34.950326+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
378	Dincă Doina	X4266987 G		1965-09-13	301	Rumana	t	Calle Rincon nr4,piso2A	f	Torrejon de ardoz	642237319			f	2022-11-04 06:55:34.975775+00	2022-11-04 06:55:34.975798+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
379	Nechifor Mihaita	X8531260P		1973-03-27	297	Rumana	t	Calle Océano Atlantico nr 23,portal 6,2B	f	Torrejon de ardoz	642771001			f	2022-11-04 06:55:34.988543+00	2022-11-04 06:55:34.98856+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
380	Larisa Ribca	X9798462 W		1977-09-15	267	Rumana	t	Calle Peru ,nr 3,5 C Coslada	f	Torrejon de ardoz	647240479			f	2022-11-04 06:55:35.012695+00	2022-11-04 06:55:35.012718+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
381	Constanța Costoiu	X9284310 S		1966-01-22	304	Rumana	t	Calle Plaza de San Pedro y San Pablo nr 4,4A,Coslada	f	Torrejon de ardoz	642503382		Coslada	f	2022-11-04 06:55:35.0491+00	2022-11-04 06:55:35.049122+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
382	Renata Da Silva Colmero	6A074325		1987-06-08	308	Brasil	t	Calle Alonso Sánchez  ,nr 2,4 D,Alcalá de Hernares	f	Torrejon de ardoz	644939476		Alcala de Henares	f	2022-11-04 06:55:35.072464+00	2022-11-04 06:55:35.072482+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
383	Rotaru Elena	X5211836J		1959-03-31	313	Rumana	t	Avenida de la Constitucion nr 88,2 A,Coslada	f	Torrejon de ardoz	642797905		Coslada	f	2022-11-04 06:55:35.099211+00	2022-11-04 06:55:35.099231+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
384	Cimpoeru Cornelia	KT846017		1945-02-06	299	Rumana	t	Calle Hinojo nr 50,mejorada de-l Campo	f	Torrejon de ardoz	628134082		Mejorada del Campo	f	2022-11-04 06:55:35.12048+00	2022-11-04 06:55:35.120497+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
386	Consuelo Cervera	50770018W		1958-12-25	295	Española	t	Calle Alcuñesa, nr 6,2 C,Torrejon de Ardoz	f	Torrejon de ardoz	632770495			f	2022-11-04 06:55:35.149066+00	2022-11-04 06:55:35.149086+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
387	Stanciulesc Pompiliu	X4105533D		1979-03-26	310	Rumana	t	Calle del Aeropuerto nr 2,Coslada	f	Torrejon de ardoz	661046039		Coslada	f	2022-11-04 06:55:35.161192+00	2022-11-04 06:55:35.161208+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
388	Ebuka Cyprian Ikebude	A09092566		1983-04-08	279	Nigeria	t	Calle Luis Grasset nr 5,Coslada	f	Torrejon de ardoz	641844581		Coslada	f	2022-11-04 06:55:35.185431+00	2022-11-04 06:55:35.185452+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
389	Daniela Laura Anuta	X5580373K		1969-06-27	271	Rumana	t	Calle Cadete Julio Llompart,nr 7,3-6,Madrid	f	Torrejon de ardoz	642733930		Madrid	f	2022-11-04 06:55:35.197762+00	2022-11-04 06:55:35.197798+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
390	Siteavu Eugen	058746638		1967-02-10	319	Rumano	t	Calle Fleming nr 41,Coslada	f	Torrejon de ardoz	642360530		Coslada	f	2022-11-04 06:55:35.234592+00	2022-11-04 06:55:35.234615+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
391	Stanciu Nicoleta	X2631464B		1974-05-14	276	Rumana	t	Calle Virgen del M-ar nr9,2E,Coslada	f	Torrejon de ardoz	642773429			f	2022-11-04 06:55:35.247603+00	2022-11-04 06:55:35.24762+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
392	Hriscu Mihai	X6293062 D		1970-07-06	320	Rumana	t	Calle Dr Fleming,Coslada	f	Torrejon de ardoz	643032141		Coslada,adresa incompleta	f	2022-11-04 06:55:35.261073+00	2022-11-04 06:55:35.26109+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
393	Roman Ileana	X9143766B		1960-10-26	298	Rumana	t	Calle Turin,nr 3,8A,Torrejon de Ardoz	f	Torrejon de ardoz	642083842		Faltan datos ,fechas nacimiento.....de los 3	f	2022-11-04 06:55:35.284334+00	2022-11-04 06:55:35.284357+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
394	Pacescu Florin	Xxxxxxx		2020-01-01	305	Rumana	t	Calle San Pedro y San Pablo,Coslada	f	Torrejon de ardoz	642804916		Coslada,faltan datos :fecha nacimieto,Nie,-apare cu 3 pers dar nu avem nici un nume ale celor 2?????	f	2022-11-04 06:55:35.333823+00	2022-11-04 06:55:35.333846+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
395	Filiuta Mariana	X3492966W		1964-07-24	321	Rumana	t	Calle Virgen de Loreto ,nr 20,Torrejon de Ardoz	f	Torrejon de ardoz	642104344		Falta fecha nacimiento Filiuta Solomonn	f	2022-11-04 06:55:35.34725+00	2022-11-04 06:55:35.347267+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
396	Evelina Odica	X5130001N		1988-05-01	322	Rumana	t	Calle Virgen de Loreto,nr 20,Torrejon de Ardoz	f	Torrejon de ardoz	643941135		Faltan datos-fechas de nacimiento	f	2022-11-04 06:55:35.370522+00	2022-11-04 06:55:35.370542+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
397	Amalia Grigore	X5329228 J		2020-01-01	275	Rumana	t	Calle Turin ,nr7edificiu Malaga 3D,Torrejon de Ardoz	f	Torrejon de ardoz	600695931		Falta fecha nacimiento de los 2	f	2022-11-04 06:55:35.403302+00	2022-11-04 06:55:35.403322+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
398	Vasile Urse	X5507599L		2020-01-01	265	Rumana	t	Calle Hospital ,nr 24,1B,Torrejon de Ardoz	f	Torrejon de ardoz	642550445		Faltan datos :fecha de nacimiento ,Nie	f	2022-11-04 06:55:35.429932+00	2022-11-04 06:55:35.429952+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
399	Antemiuc Vasile	Xxxxxxx		2020-01-01	239	Rumana	t	Calle San Cipriano,nr 67,K3.1	f	Torrejon de ardoz	677347531		Faltan datos:fecha nacimiento ,Nie,esta apuntado con 1 pers mas,pero no tenemos ningún dato sobre la persona	f	2022-11-04 06:55:35.46147+00	2022-11-04 06:55:35.461491+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
400	Mustafá Benabdellah	X1357646W		2020-01-01	323	Marroquí	t	Calle de la tía Pepa,6,1A	f	Torrejon de ardoz	654209095		Paraquellos de Jarama,faltan datos :fechas nacimientos,Nie,para toda la familia	f	2022-11-04 06:55:35.474248+00	2022-11-04 06:55:35.474265+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
401	Daniel Neacsu	X9078417H		1986-11-02	324	Rumana	t	Calle Plaza Rivas nr 2,1A Coslada	f	Torrejon de ardoz	642756791		Coslada faltan las fechas de nacimientos	f	2022-11-04 06:55:35.538073+00	2022-11-04 06:55:35.538097+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
402	Ionut Avram	X8503785H		2020-01-01	264	Rumana	t	Calle Sierra de Gredos nr 28,Guadalaja	f	Torrejon de ardoz	663307830		Guadalajara,faltan datos:fechas de nacimientos y un Nie	f	2022-11-04 06:55:35.581922+00	2022-11-04 06:55:35.581944+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
403	Gheorghiță Danilencu	Y0235190 Y		1972-02-07	325	Rumana	t	Calle Villar Don Diego,nr 18,3B,vicalcaro	f	Torrejon de ardoz	643603579		Vicalcaro,faltan las fechas de nacimientos	f	2022-11-04 06:55:35.628949+00	2022-11-04 06:55:35.628972+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
404	Constantín Halit	X5667414F		1976-03-29	311	Rumana	t	Calle Estación ,nr 22,1F,Meco	f	Torrejon de ardoz	642560522		Meco,faltan fechas nacimiento y comprobar si están correctos los familiares por los nombres .....hija,mujer????falta la última letra de Nie de Jessica	f	2022-11-04 06:55:35.682377+00	2022-11-04 06:55:35.682399+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
405	Florin Gheorghe	X3149035 J		2020-01-01	326	Rumana	t	Calle Hinojo nr 50,Mejorada del campo	f	Torrejon de ardoz	649604554		Mejorada del Campo,faltan datos:nie,fechas nacimiento	f	2022-11-04 06:55:35.726231+00	2022-11-04 06:55:35.726254+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
406	Felix Ivan Mejia Marder	F209697		1983-12-07	327	Honduras	t	Calle Arachaveleta ,nr 16.5D,Madrid	f	Torrejon de ardoz	643251820		Faltan datos Nie,fechas nacimiento de los 4	f	2022-11-04 06:55:35.771134+00	2022-11-04 06:55:35.771156+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
407	Oscar Rayon Ramiro	47020040 J		2020-01-01	274	Español	t	Calle Teína Sorrapea nr 48	f	Torrejon de ardoz	699730721		Faltan fechas nacimientos	f	2022-11-04 06:55:35.827399+00	2022-11-04 06:55:35.827423+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
408	Stan Mihaela	X4233391 B		1978-12-19	277	Rumana	t	Calle Lugo nr 7,6 D Alcala de Henares	f	Torrejon de ardoz	677487490		hay que hacer fisa en papel. no tiene y apuntar alimentos de 3 personas recogidas del 04/04/2021	f	2022-11-04 06:55:35.882965+00	2022-11-04 06:55:35.882988+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
409	Dinu Mihaela	Y1444824 R		1968-01-20	328	Rumana	t	Calle Guadalajara nr 3,2C	f	Torrejon de ardoz	677641487		Faltan fechas nacimento	f	2022-11-04 06:55:35.906184+00	2022-11-04 06:55:35.906205+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
410	Luis Jefry Jaramillo Marin	Xxxxxx		2020-01-01	296	Español	t	Plaza casa Grande nr 3 portal 1	f	Torrejon de ardoz	602527488		Mejorada del campo ,figurează cu 5 pers dar nu avem nici o informație a celor 4.....lipsesc f multe date	f	2022-11-04 06:55:35.939351+00	2022-11-04 06:55:35.939374+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
411	Esther Gonzales Rodriguez	Xxxxx		2020-01-01	329	Española	t	Av Constitución nr 38,4 B	f	Torrejon de ardoz	655444684		Lipsesc f multe date ,figureaza cu 3 pers dar nu avem nici o data a celor 2.....	f	2022-11-04 06:55:35.953648+00	2022-11-04 06:55:35.953667+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
412	Tarnaru Dumitru	X9031596W		1980-04-12	330	Rumana	t	Calle Las Cursa nr 5 Segundo C	f	Torrejon de ardoz	686319374			f	2022-11-04 06:55:35.967075+00	2022-11-04 06:55:35.967094+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
413	Emanuel Truica	TR648028		1969-03-25	331	Rumana	t	C/via himena87 Madrid 3D	f	Torrejon de ardoz	642948056			f	2022-11-04 06:55:36.024661+00	2022-11-04 06:55:36.024684+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
414	Alexandru Togoi	Y2282620 E		1987-11-19	263	Rumana	t	Cmarmolinanr 18  Madrid 2B	f	Torrejon de ardoz	642545572			f	2022-11-04 06:55:36.048104+00	2022-11-04 06:55:36.048123+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
415	Steliana Vasui	X5526523 Z		1956-08-01	262	Rumana	f	C/Rise de peloche nr 1 Piso 1B madrid	f	Torrejon de ardoz	642406963			t	2022-11-04 06:55:36.081673+00	2022-11-04 06:55:36.081695+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
416	Mohora Claudiu	X9335475 M		1975-11-02	231	Rumana	t	C /Solana 49 portal1 piso2B	f	Torrejon de ardoz	642624364			f	2022-11-04 06:55:36.106133+00	2022-11-04 06:55:36.106154+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
417	Ichim Adrian Cristian	X7124894T		1980-05-10	334	Rumana	t	C/libertad49 piso4c	f	Torrejon de ardoz	642470293			f	2022-11-04 06:55:36.160498+00	2022-11-04 06:55:36.160521+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
418	Petrea Ecaterina Giorgiana	Y5530382		1989-03-31	335	Rumana	t	C/Libertad 45 piso4A	f	Torrejon de ardoz	642978027			f	2022-11-04 06:55:36.20345+00	2022-11-04 06:55:36.203472+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
419	Acatrinei Constantin	X2999851F		2020-08-01	261	Rumana	t	C/conquistadores5 piso1c /Coslada	f	Torrejon de ardoz	642036024		Falta fecha de nacimiento	f	2022-11-04 06:55:36.226892+00	2022-11-04 06:55:36.226912+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
420	Estera Violeta Ivascu	X4250589M		2020-08-01	302	Rumana	t	C/San Felipe nr 6 piso2c	f	Torrejon de ardoz	671846310		Falta fecha de nacimiento	f	2022-11-04 06:55:36.272208+00	2022-11-04 06:55:36.272231+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
421	Marius Sandel Stan	Y6243838L		2020-08-01	260	Rumana	t	C/isleta nr 20 Coslada	f	Torrejon de ardoz	643456681		Falta fecha de nacimiento	f	2022-11-04 06:55:36.306118+00	2022-11-04 06:55:36.30614+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
422	Munteanu Gabriel Corneliu	Y0741107S		1985-04-29	236	Rumana	f	C/Eugenia de Montijo nr1 piso2E  San Fernando  de Henares....	f	Torrejon de ardoz	642028132			t	2022-11-04 06:55:36.32974+00	2022-11-04 06:55:36.329762+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
423	Ana Maria Badea	Y1646902R		1988-05-27	294	Rumana	t	Falta	f	Torrejon de ardoz	643257756		Falta la direccion	f	2022-11-04 06:55:36.364683+00	2022-11-04 06:55:36.364713+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
424	Ion Emilia Rebeca	X9217888V		1980-06-07	303	Rumana	t	c/plaza de comunist nr 6 Piso 24 Coslada	f	Torrejon de ardoz	663385428			f	2022-11-04 06:55:36.410648+00	2022-11-04 06:55:36.410692+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
425	Talea Valentin	X5610972F		2020-08-01	243	Rumana	t	Loeches	f	Torrejon de ardoz	665860057		Falta fecha de nacimiento. Direccion 0	f	2022-11-04 06:55:36.424631+00	2022-11-04 06:55:36.424647+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
426	Cati Lucian	x8731368q		1990-01-27	345	Rumana	t	c/ saenz de oiza 12 Illescas	f	Torrejon de ardoz	604150313	amadeuscam@gmail.com	nada	f	2022-11-04 06:55:36.472045+00	2022-11-04 06:55:36.472069+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
427	Hafsa khalifa	ds1452094		1989-05-19	346	Maruecos	f	maestro barberi	f	Torrejon de ardoz	631553825			t	2022-11-04 06:55:36.506594+00	2022-11-04 06:55:36.506618+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
428	Aziza el gouad	x4651607h		1980-07-15	347	Maruecos	f	av.virgen de loreto	f	Torrejon de ardoz	633648197		Trebuie făcătură  hoja de entrega  ,si añadirle  a telegrams	t	2022-11-04 06:55:36.553155+00	2022-11-04 06:55:36.553177+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
429	Soumaya ouahabi chriaa	48226864g		1979-06-09	402	Marruecos	f	calle segovia 16 4d	f	Torrejon de ardoz	685191634			t	2022-11-04 06:55:36.583987+00	2022-11-04 06:55:36.58401+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
430	Naima   Sabbahi	x7805179z		1990-12-25	403	Marruecos	f	calle puerto de los leones  8 p02 d	f	Torrejon de ardoz	664196720			t	2022-11-04 06:55:36.627818+00	2022-11-04 06:55:36.627841+00	mujer	f	28850	t	t	t	t	f	f	f	t	1
431	Karima bourfaa	X6323867v		1981-06-14	404	Marruecos	f	Calle canto nr 5 por 1 dh	f	Torrejon de ardoz	602847644		Ficha nueva	t	2022-11-04 06:55:36.683464+00	2022-11-04 06:55:36.683487+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
432	Said el bakri	X1319087z		1970-01-01	405	Marruecos	f	Calle margaritas nr 4 pbj b	f	Torrejon de ardoz	602514392		Ficha nueva	t	2022-11-04 06:55:36.718132+00	2022-11-04 06:55:36.718155+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
433	Fatima zouhra essabar oulad hahamouch	09145398t		1973-07-06	406	Marruecos	f	Calle  ronda del saliente	f	Torrejon de ardoz	632721248			t	2022-11-04 06:55:36.732238+00	2022-11-04 06:55:36.73226+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
434	Bakouk Hadhoum	x6040298s		1988-09-14	407	Maruecos	f	callle ciudad real nr 19 1d	f	Torrejon de ardoz	608704362		nueva	t	2022-11-04 06:55:36.765635+00	2022-11-04 06:55:36.765656+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
435	Do Nacimiento machado Jose	76901658p		1987-04-25	408	Española	f	-----	f	Torrejon de ardoz	692007981		ocupa	t	2022-11-04 06:55:36.790231+00	2022-11-04 06:55:36.790255+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
436	Lydia Abena Yeboaa	G1358473		1970-05-20	409	Ghana	f	Calle Guadalajara n9 1C	f	Torrejon de ardoz	642054472			t	2022-11-04 06:55:36.803846+00	2022-11-04 06:55:36.803862+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
437	Hinta Jenica	x6481964n		1968-05-17	410	Rumana	f	calle/castroviejo nr 1 4a	f	Torrejon de ardoz	642749056		ficha nueva,coslada	t	2022-11-04 06:55:36.81762+00	2022-11-04 06:55:36.817638+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
438	goncalves silva lourdes prazeres	53439490W		1964-01-01	411	ESPAÑOLA	f	calle soria  5	f	Torrejon de ardoz	606889740		Son 3 familiares	t	2022-11-04 06:55:36.84106+00	2022-11-04 06:55:36.84108+00	mujer	f	28850	t	t	f	f	t	f	f	t	1
439	malika el mansouri	x2540300l		1976-01-12	412	Maruecos	f	calle  maestro turina 4 2b	f	Torrejon de ardoz	631328219			t	2022-11-04 06:55:36.875151+00	2022-11-04 06:55:36.875174+00	mujer	f	28850	t	t	t	t	f	t	t	t	1
440	ALAMALNI JAMILA	X6294706C		1987-01-01	413	Marruecos	f	calle av.constitucion 24 p3b	f	Torrejon de ardoz	631629522			t	2022-11-04 06:55:36.929651+00	2022-11-04 06:55:36.929691+00	mujer	f	28850	t	t	t	t	f	f	f	t	1
441	Iermina	X5678976X		2021-11-14	414	Rumana	f	Avenida de la constitucion	f	Torrejon de ardoz	642720402			t	2022-11-04 06:55:37.006279+00	2022-11-04 06:55:37.006301+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
442	DORA MERCEDES DE LA CRUZ BENUI	116517544		1966-09-17	415	Peruana	f	Calle lisboa 33, 4,3	f	Torrejon de ardoz	640603771		Faltan acte	t	2022-11-04 06:55:37.03787+00	2022-11-04 06:55:37.037894+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
443	Zambrano Roa Andy Osmel	Y6879029l		1985-08-14	416	Venezuela	f	Calle mercurio nr 6 3d	f	Torrejon de ardoz	631752943		Ficha nueva ,5 personas	t	2022-11-04 06:55:37.053031+00	2022-11-04 06:55:37.053053+00	hombre	f	28850	t	f	t	f	f	f	f	f	1
444	El abrouj faiza	Y3457153z		1974-06-24	417	Maruecos	f	Calle pesquera 20 p3 b	f	Torrejon de ardoz	662422707			t	2022-11-04 06:55:37.098368+00	2022-11-04 06:55:37.098395+00	mujer	f	28850	t	f	t	f	f	f	t	t	1
445	Ana Agustina Zambrano Roa	126274794	126274794	1960-02-06	418	Venezuela	f	Calle Mercurio,número 6,piso P 03, puerta derecha,Torrejon de Ardoz	f	Torrejon de Ardoz	77777777		Faltan varias ......	t	2022-11-04 06:55:37.156392+00	2022-11-04 06:55:37.15642+00	mujer	f	28850	f	f	f	f	f	f	f	f	1
446	El ezz fadoua	Tr8525175	Tr8525175	1997-06-06	419	Maruecos	f	Calle ortencias nr 5 3b	t	Torrejon de ardoz	653099931		Alta nueva	t	2022-11-04 06:55:37.169236+00	2022-11-04 06:55:37.169253+00	mujer	f	28850	t	t	t	f	f	f	t	t	1
448	Blade amadou	X3996484g		1968-01-01	420	Ginea	f	Calle Zaragoza  7 p01 a	f	Torrejon de ardoz	632355778		Alta nueva	t	2022-11-20 09:14:19.964738+00	2022-11-20 09:14:19.964761+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
268	KARIMA EL BOUTROUKI	X7992352-J		1982-03-19	140	MARRUECOS	f	CALLE ZARAGOZA 13, 2A	f	Torrejon de ardoz	642065395		Faltan facturas....tiene un ingreso -pago de 285,60??\r\n1 bebe de 1 año	t	2022-11-04 06:55:30.33562+00	2022-11-04 06:55:30.335642+00	mujer	f	28850	t	t	t	f	t	f	f	f	2
449	Eugenia Paraniuc	058286450		1978-12-04	421	Rumana	f	Torrejon de ardoz	f	Torrejon de ardoz	697590845		traer papeles	t	2022-11-20 10:16:07.354896+00	2022-11-20 10:16:07.354921+00	mujer	f	28850	f	f	f	f	f	f	f	f	2
324	MAJIDA EL MANSOURI	X3269326Z		1969-05-12	222	MARUECOS	f	av/constitucion 18 pbj b	f	Torrejon de ardoz	603260175		y	t	2022-11-04 06:55:33.111788+00	2022-11-04 06:55:33.111811+00	mujer	f	28850	f	f	f	f	f	f	f	f	2
385	Iordache Crina	X6502853 V		1964-03-12	293	Rumana	f	Calle Cordoba nr 2,B.D.,Torrejon de Ardoz	f	Torrejon de ardoz	642139285			t	2022-11-04 06:55:35.135702+00	2022-11-04 06:55:35.135718+00	mujer	f	28850	f	f	f	f	f	f	f	f	2
453	Ion Bogdan		GZ 717035	1980-12-18	425	Rumana	f	Torrejon de Ardoz	f	Torrejon de Ardoz	56555555		Faltan papeles........	t	2022-12-18 08:58:05.724782+00	2022-12-18 08:58:05.724809+00	hombre	f	0	f	f	f	f	f	f	f	f	2
235	SOUMIA MASROURI	Y0280496-W		1981-07-07	195	Marruecos	f	CALLE ESTAÑO 4, BAJO C	f	Torrejon de ardoz	673295142		añadir niño	t	2022-11-04 06:55:28.66929+00	2022-11-04 06:55:28.66931+00	mujer	f	28850	t	t	t	f	t	f	t	t	1
450	Constantin Daniel		MM666312	1978-02-17	422	Rumana	f	C/ Milan  25 10B	f	Torrejon de ardoz	642904294			t	2022-11-20 11:02:16.298678+00	2022-11-20 11:02:16.298701+00	hombre	f	28850	f	f	f	f	f	f	f	f	1
451	Asavei Dina Tatiana	Y7561169		1994-02-27	423	Rumana	f	Calle Teruel 10,P 04D Torrejon de Ardoz	f	Torrejon de Ardoz	7777777		Faltan traer más papeles	t	2022-12-18 07:56:23.772484+00	2022-12-18 07:56:23.772523+00	mujer	f	0	t	f	f	t	f	f	f	f	2
452	Badea Ana Maria	Y1646902 R		1988-05-27	424	Rumana	f	Crta de Loeches 21,P02A Torrejon de Ardoz	f	Torrejon de Ardoz	777777		Faltan papeles	t	2022-12-18 08:31:13.08582+00	2022-12-18 08:31:13.085871+00	mujer	f	0	f	f	t	f	f	f	f	f	2
454	Milagros del Carmen		118095926	1986-07-15	426	Peruana	f	Calle Lisabona 33	f	Torrejon de Ardoz	640603770			t	2022-12-18 10:11:56.523228+00	2022-12-18 10:11:56.523252+00	mujer	f	0	f	f	f	t	t	f	f	t	2
455	Rojas Raymundo Lucero		122289140	1993-12-17	427	Perunana	f	Calle Abedul nr 6 Torrejon de Ardoz	f	Torrejon de Ardoz	111111122		Faltan papeles	t	2022-12-18 10:44:18.197904+00	2022-12-18 10:44:18.197944+00	mujer	f	0	f	f	f	f	f	f	f	f	2
\.


--
-- Data for Name: adra_profile; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".adra_profile (id, date_of_birth, user_id, sexo) FROM stdin;
2	\N	2	mujer
1	\N	1	hombre
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add delegaciones	1	add_delegaciones
2	Can change delegaciones	1	change_delegaciones
3	Can delete delegaciones	1	delete_delegaciones
4	Can view delegaciones	1	view_delegaciones
5	Can add domain	2	add_domain
6	Can change domain	2	change_domain
7	Can delete domain	2	delete_domain
8	Can view domain	2	view_domain
9	Can add beneficiarios globales	3	add_beneficiariosglobales
10	Can change beneficiarios globales	3	change_beneficiariosglobales
11	Can delete beneficiarios globales	3	delete_beneficiariosglobales
12	Can view beneficiarios globales	3	view_beneficiariosglobales
13	Can add profile	4	add_profile
14	Can change profile	4	change_profile
15	Can delete profile	4	delete_profile
16	Can view profile	4	view_profile
17	Can add Beneficiario	5	add_persona
18	Can change Beneficiario	5	change_persona
19	Can delete Beneficiario	5	delete_persona
20	Can view Beneficiario	5	view_persona
21	Can add Familiar del Beneficiario	6	add_hijo
22	Can change Familiar del Beneficiario	6	change_hijo
23	Can delete Familiar del Beneficiario	6	delete_hijo
24	Can view Familiar del Beneficiario	6	view_hijo
25	Can add Almacen Alimento	7	add_almacenalimentos
26	Can change Almacen Alimento	7	change_almacenalimentos
27	Can delete Almacen Alimento	7	delete_almacenalimentos
28	Can view Almacen Alimento	7	view_almacenalimentos
29	Can add Alimento	8	add_alimentos
30	Can change Alimento	8	change_alimentos
31	Can delete Alimento	8	delete_alimentos
32	Can view Alimento	8	view_alimentos
33	Can add content type	9	add_contenttype
34	Can change content type	9	change_contenttype
35	Can delete content type	9	delete_contenttype
36	Can view content type	9	view_contenttype
37	Can add log entry	10	add_logentry
38	Can change log entry	10	change_logentry
39	Can delete log entry	10	delete_logentry
40	Can view log entry	10	view_logentry
41	Can add permission	11	add_permission
42	Can change permission	11	change_permission
43	Can delete permission	11	delete_permission
44	Can view permission	11	view_permission
45	Can add group	12	add_group
46	Can change group	12	change_group
47	Can delete group	12	delete_group
48	Can view group	12	view_group
49	Can add user	13	add_user
50	Can change user	13	change_user
51	Can delete user	13	delete_user
52	Can view user	13	view_user
53	Can add session	14	add_session
54	Can change session	14	change_session
55	Can delete session	14	delete_session
56	Can view session	14	view_session
57	Can add site	15	add_site
58	Can change site	15	change_site
59	Can delete site	15	delete_site
60	Can view site	15	view_site
61	Can add email address	16	add_emailaddress
62	Can change email address	16	change_emailaddress
63	Can delete email address	16	delete_emailaddress
64	Can view email address	16	view_emailaddress
65	Can add email confirmation	17	add_emailconfirmation
66	Can change email confirmation	17	change_emailconfirmation
67	Can delete email confirmation	17	delete_emailconfirmation
68	Can view email confirmation	17	view_emailconfirmation
69	Can add Token	18	add_token
70	Can change Token	18	change_token
71	Can delete Token	18	delete_token
72	Can view Token	18	view_token
73	Can add token	19	add_tokenproxy
74	Can change token	19	change_tokenproxy
75	Can delete token	19	delete_tokenproxy
76	Can view token	19	view_tokenproxy
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$260000$p1HegVhYskYOYKm2ndrQu1$YABUwNwnMRYXvWGLKELWRdoeJB1egL3PQt4YbD0Rl/I=	2022-12-18 07:48:28.482527+00	t	iulia	Iulia	Cazacu	iuliacazacu330@gmail.com	t	t	2022-11-07 06:09:42+00
1	pbkdf2_sha256$260000$jZXf8vGMLOu1GRQa0rnhlO$iAIRz27v7io/4aFBGGqhez5caj8feyalPjP74bQrxjc=	2022-12-23 06:37:15.83588+00	t	lucian			amadeuscam@yahoo.es	t	t	2022-11-03 05:26:22.811192+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".authtoken_token (key, created, user_id) FROM stdin;
78b8996dd032e1aa59f1c51049645df9ee3359da	2022-11-03 05:26:23.02687+00	1
642b1232825ba2c93fe823974b082b737bc98bac	2022-11-07 06:09:42.273551+00	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-11-04 07:30:24.498369+00	1	AlmacenAlimentos object (1)	1	[{"added": {}}]	7	1
2	2022-11-08 05:21:05.53063+00	2	iulia	2	[{"changed": {"fields": ["Staff status", "Superuser status"]}}]	13	1
3	2022-11-20 11:27:16.15892+00	385	Iordache Crina	2	[{"changed": {"fields": ["Activo?"]}}]	5	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".django_content_type (id, app_label, model) FROM stdin;
1	delegaciones	delegaciones
2	delegaciones	domain
3	delegaciones	beneficiariosglobales
4	adra	profile
5	adra	persona
6	adra	hijo
7	adra	almacenalimentos
8	adra	alimentos
9	contenttypes	contenttype
10	admin	logentry
11	auth	permission
12	auth	group
13	auth	user
14	sessions	session
15	sites	site
16	account	emailaddress
17	account	emailconfirmation
18	authtoken	token
19	authtoken	tokenproxy
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-11-03 05:21:42.841609+00
2	auth	0001_initial	2022-11-03 05:21:43.015052+00
3	account	0001_initial	2022-11-03 05:21:43.096546+00
4	account	0002_email_max_length	2022-11-03 05:21:43.119767+00
5	admin	0001_initial	2022-11-03 05:21:43.172987+00
6	admin	0002_logentry_remove_auto_add	2022-11-03 05:21:43.201843+00
7	admin	0003_logentry_add_action_flag_choices	2022-11-03 05:21:43.225113+00
8	adra	0001_initial	2022-11-03 05:21:43.414396+00
9	contenttypes	0002_remove_content_type_name	2022-11-03 05:21:43.457482+00
10	auth	0002_alter_permission_name_max_length	2022-11-03 05:21:43.491608+00
11	auth	0003_alter_user_email_max_length	2022-11-03 05:21:43.523638+00
12	auth	0004_alter_user_username_opts	2022-11-03 05:21:43.55795+00
13	auth	0005_alter_user_last_login_null	2022-11-03 05:21:43.590213+00
14	auth	0006_require_contenttypes_0002	2022-11-03 05:21:43.605982+00
15	auth	0007_alter_validators_add_error_messages	2022-11-03 05:21:43.636902+00
16	auth	0008_alter_user_username_max_length	2022-11-03 05:21:43.671968+00
17	auth	0009_alter_user_last_name_max_length	2022-11-03 05:21:43.703034+00
18	auth	0010_alter_group_name_max_length	2022-11-03 05:21:43.739763+00
19	auth	0011_update_proxy_permissions	2022-11-03 05:21:43.772426+00
20	auth	0012_alter_user_first_name_max_length	2022-11-03 05:21:43.804488+00
21	authtoken	0001_initial	2022-11-03 05:21:43.855745+00
22	authtoken	0002_auto_20160226_1747	2022-11-03 05:21:43.925833+00
23	authtoken	0003_tokenproxy	2022-11-03 05:21:43.942199+00
24	delegaciones	0001_initial	2022-11-03 05:21:43.96177+00
25	delegaciones	0002_alter_delegaciones_ciudad	2022-11-03 05:21:43.980083+00
26	delegaciones	0003_delegaciones_calle	2022-11-03 05:21:43.997724+00
27	delegaciones	0004_profile	2022-11-03 05:21:44.03005+00
28	delegaciones	0005_delete_profile	2022-11-03 05:21:44.046914+00
29	delegaciones	0006_beneficiariosglobales	2022-11-03 05:21:44.063566+00
30	delegaciones	0007_beneficiariosglobales_delegacion_code	2022-11-03 05:21:44.080578+00
31	delegaciones	0008_delegaciones_oar	2022-11-03 05:21:44.098374+00
32	delegaciones	0009_beneficiariosglobales_created_at	2022-11-03 05:21:44.116119+00
33	sessions	0001_initial	2022-11-03 05:21:44.159489+00
34	sites	0001_initial	2022-11-03 05:21:44.185388+00
35	sites	0002_alter_domain_unique	2022-11-03 05:21:44.219226+00
36	adra	0002_auto_20221104_0515	2022-11-04 06:06:56.862805+00
37	adra	0003_alter_hijo_parentesco	2022-11-06 07:01:10.577548+00
38	adra	0004_profile_sexo	2022-11-16 07:03:10.166473+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".django_session (session_key, session_data, expire_date) FROM stdin;
k13xwhyosxr50y5kuqlp33yzxs4hftyc	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1oqr8Y:EGDSHF4cEW9lE13v5asduxDOW73ePrzyu29eE0CqXVs	2022-11-05 07:29:10.430559+00
lymdnrvqnhkxvwnmbe5kykvv5742iljb	.eJxVjssOgjAURP-layV9t7h07zc0t723gCgYCjHG-O9CwobtnDmT-bLwglLe44RhokJz6OnDLixS0z-e56Qyl7wWInlvpfZSGDQeuVPcJY3ITizAMrdhKTSFDldTHLMIqadhA3iHoRmrNA7z1MVqq1Q7LdVtRHpc9-5hoIXSbodkIpnBgI1SaO44OnIJhK7ROgsmG5PRR84xgVJZGKmiddrFVSGjIvv9Ac3CS88:1ora09:akeMYukbPkGK_MPqyWV5sbbtjbkLrub9x8wAbn3O06U	2022-11-07 07:23:29.162055+00
h8014663qyezs881t98i40jltv39wz03	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1ortj7:bH8pJhQCLnP2R4AmytorI5UuVHEKWnLmwmKqtHiVZ-w	2022-11-08 04:27:13.491418+00
45bg87vcwfelg0dr90guk7a1mm4plv5t	.eJxVTksOgyAQvQvrxgwI42fXXoSMA0ZSg41A0qbp3avGRbt8__cWlkqebEl-tcGJXihx-eUG4ruPu0DzvNMVMS8l5urwnHKqrhvyMQemHJZ4O1N_VROlaetpnXGqdoNCcKgck-6gJhw8qE5LzaYeFUrZ4tgYAGpYo0cEQ4ydbNTxL_mUthnrn4-wvkTfogb4fAGe90NU:1orvLp:PYZK-_1S-aJPAkq19A1tztQ5jTryKBMxI71Q59RS68A	2022-11-08 06:11:17.526438+00
oca54qzzif0dplu93enr9cfpkukccipg	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1osH2U:IQoPFlNfaJdMwJqDlXojcm8NkslS7Zdhp1cnvAnYbu8	2022-11-09 05:20:46.73388+00
ettl5b0nmcz5ew3xutjh88m6k0kapdqu	.eJxljt0KwyAMRt_F61LUavpzt72IpJpSmbOj1rEx9u5rSxmMXeacL1_yYmjtlONi7jT7wZMzdEUfWBdzCMXX5kQz65hkBTOYl3EHxrt_1qO9UNwEhrDh8ugo98yhU3laJ4qLt7j4KZ6PrZ-qEdO49jROO1m5XgJ3IJ1F1fIKoScuWyWU1dUgQYgGhlpzjrVVQABco4VW1HL_L1FK6xlDj5ufn6xrQHH-_gCH3FTl:1osH5i:HUxQ2nU4gLa4ahKf-ibFZ6DlWWIfyFXznSg6tAHBZx0	2022-11-09 05:24:06.043484+00
oxomj6ltyqdh5ftajz6g1inxp75j82qv	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1oudVE:D0e95xMx3fbYCj--pAiMJ6gfPsdloF4gpM5hF9_dAeA	2022-11-15 17:44:12.895033+00
dq9439vkdbhwr0ecfk83h3szhktw79zh	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1ovCiW:jvfiC1Ax8l51_Qj1lYiVx0QCLuwR1OsOwyBoembiw8o	2022-11-17 07:20:16.086832+00
it5ffg8xtjepul0f8eoi2nh1y2660jgr	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1ovZRC:bmPNUlubVUkoTtE3BB-Ri0-c9cjZR1EwlH-9TJhInQg	2022-11-18 07:35:54.179672+00
4gb6niefs0c8jflns5zt5gg0csdpen4l	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1owGyi:ZSV3jSLQJ0nq-3RofyWOvD7xcw_AQ9M3Ep-_fCeaar0	2022-11-20 06:05:24.107742+00
3oo14jnoudf6iqmqvr3acemvxvxt994o	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1owfEQ:J5Wwgkwf0NGHZcpGHpEXGbE29HFW5LdcMqN-YBIOKJ4	2022-11-21 07:59:14.450401+00
9r4pexv87zle4y90mkyn8dxls7nmthhr	.eJxVTksOgyAQvQvrxgwI42fXXoSMA0ZSg41A0qbp3avGRbt8__cWlkqebEl-tcGJXihx-eUG4ruPu0DzvNMVMS8l5urwnHKqrhvyMQemHJZ4O1N_VROlaetpnXGqdoNCcKgck-6gJhw8qE5LzaYeFUrZ4tgYAGpYo0cEQ4ydbNTxL_mUthnrn4-wvkTfogb4fAGe90NU:1owfXm:nZSmNCEd62K0NCPGDJpGugirsOrXJmwYWprgisofy7M	2022-11-21 08:19:14.966327+00
t4xfyie3wlk5udmd0c49h5aj23qu28va	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1oxBJN:3YiF-sAJKUUHC8dh7RfXApYGX1HqFT4prtW6ODnI1SA	2022-11-22 18:14:29.417884+00
p2jbz94otx0dk1fn9lw0vhea2jvy8q52	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1oxokr:nQdEQV7aIYPpLHra6_XbPRgxerapdWtHRNm4qIC9buk	2022-11-24 12:21:29.693091+00
oxk7ty2dcz7cyz1u5xkkp9pwdogcq5qt	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1oxp3W:8ulw0Ouji3Jv12G3Vsx_rn_57TEQ5jhWnHLJbxjf3Fo	2022-11-24 12:40:46.503126+00
jitkc2b8gxdca7z877lrry2upfhp0n8j	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1oyRaJ:Zsdh8wbURDy1QBPo0KSR_NCCx1zUJLnwppxldT17e6U	2022-11-26 05:49:11.8156+00
n24ltx2o3urm538n0n7krp4prnso10nv	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1oycvb:jnAnIvSQ0CTQ__DBvcBLamW_STFjw36n6rM19BhcPxY	2022-11-26 17:55:55.291421+00
am8kk4dziv6mut6f5obop3umfhmbrllq	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1ozv3x:SQ5fl-nJx9osstCp5V5ig-jXIFyj0g-emdmUGVW-BRQ	2022-11-30 07:29:53.179954+00
mwjm5oh8qj8truufpxh5us381p0tj0lp	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1p1jRd:zCSRBRl4YFgQySR0DqdzGqSuui7Q29mBp1VyoW8tLGY	2022-12-05 07:29:49.540096+00
gqr9v7eaw7c31pclmrdkym7wa4vir1ph	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1p26CL:cQwbaGfJ7AeZjtiPKYZhLzP3Zg0hhM-k841rzht_jB4	2022-12-06 07:47:33.883261+00
9f7rjhfmugnv38l0edus73o94rh5mqz4	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1p39ai:1CJH-tCJ8-PnfjZrFmrCQPBo_IDQFzP5WQa9Xt9Y4nQ	2022-12-09 05:37:04.648947+00
03fs2cyv9dwksbm41gcu8qxz0cttbt0o	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1p6ap7:NyR7KOhcbIn_12rr8dAcHkIO-_hw-WBrdwm4d7b470g	2022-12-18 17:18:09.428317+00
nn3h9z8wcml0xk61vzv7gpm7huk0enom	.eJxVTksOgyAQvQvrxgwI42fXXoSMA0ZSg41A0qbp3avGRbt8__cWlkqebEl-tcGJXihx-eUG4ruPu0DzvNMVMS8l5urwnHKqrhvyMQemHJZ4O1N_VROlaetpnXGqdoNCcKgck-6gJhw8qE5LzaYeFUrZ4tgYAGpYo0cEQ4ydbNTxL_mUthnrn4-wvkTfogb4fAGe90NU:1p6oPM:1XLlfTvXUxCFthZaN20jWwaZG1q3jn-_5WzhXmqZA2I	2022-12-19 07:48:28.496033+00
7o8ie5vdi5t3szz1jdslxk97eyvmrp1r	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1p6oxn:ESxRIDr8y-QjpbAOGlGuH3daDqcDgUMrX7EEXh13kRY	2022-12-19 08:24:03.95765+00
813wa1nr94clkfzpszcod9t81loq0g4z	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1p76Zh:HT6z1B5a6qlw9G51QVM4ghQ16U3wBSu5C1JMgMhFI1I	2022-12-20 03:12:21.577954+00
3xhr07r2w6bfbnhcqh9lu6awb0tvee00	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1p7VUl:YM3H3yFEIN0PkM0d8mC9irOt5vYmp4EIBigMJBhgwl0	2022-12-21 05:48:55.57958+00
3fvfgg09h4ylz2nrcs7qz7rvfwzw4q9a	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1p7VUl:YM3H3yFEIN0PkM0d8mC9irOt5vYmp4EIBigMJBhgwl0	2022-12-21 05:48:55.828244+00
g4aw8g4b3dk8vt8q5gemke7iiab6pvfd	.eJxVjDsOwjAQBe_iGln-rQ2U9DmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVVaHH63QjTM7cd8APbfZJpass8ktwVedAuh4nz63a4fwcVe91qMimbgoCejHYqKA45JNTuwj54hAJQ-ExKcUJriwZjyQcXaEsyWBKfL_U7OEk:1p8bgB:tqzXJu3bheISkCQuRyE_59VqOf72s-hbu29OlvYYL6o	2022-12-24 06:37:15.850531+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: tenant-torrejon; Owner: luciancati
--

COPY "tenant-torrejon".django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: adra_alimentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.adra_alimentos_id_seq', 1, false);


--
-- Name: adra_almacenalimentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.adra_almacenalimentos_id_seq', 1, false);


--
-- Name: adra_hijo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.adra_hijo_id_seq', 1, false);


--
-- Name: adra_persona_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.adra_persona_id_seq', 1, false);


--
-- Name: adra_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.adra_profile_id_seq', 1, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: delegaciones_beneficiariosglobales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.delegaciones_beneficiariosglobales_id_seq', 708, true);


--
-- Name: delegaciones_delegaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.delegaciones_delegaciones_id_seq', 3, true);


--
-- Name: delegaciones_domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.delegaciones_domain_id_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 230, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 43, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luciancati
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".account_emailaddress_id_seq', 3, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".account_emailconfirmation_id_seq', 1, false);


--
-- Name: adra_alimentos_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".adra_alimentos_id_seq', 137, true);


--
-- Name: adra_almacenalimentos_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".adra_almacenalimentos_id_seq', 1, true);


--
-- Name: adra_hijo_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".adra_hijo_id_seq', 714, true);


--
-- Name: adra_persona_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".adra_persona_id_seq', 255, true);


--
-- Name: adra_profile_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".adra_profile_id_seq', 4, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".auth_permission_id_seq', 76, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".django_admin_log_id_seq', 120, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".django_migrations_id_seq', 38, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: tenant-arganda; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-arganda".django_site_id_seq', 1, true);


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".account_emailaddress_id_seq', 2, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".account_emailconfirmation_id_seq', 1, false);


--
-- Name: adra_alimentos_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".adra_alimentos_id_seq', 131, true);


--
-- Name: adra_almacenalimentos_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".adra_almacenalimentos_id_seq', 1, true);


--
-- Name: adra_hijo_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".adra_hijo_id_seq', 1083, true);


--
-- Name: adra_persona_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".adra_persona_id_seq', 455, true);


--
-- Name: adra_profile_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".adra_profile_id_seq', 2, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".auth_permission_id_seq', 76, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".django_admin_log_id_seq', 3, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".django_migrations_id_seq', 38, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: tenant-torrejon; Owner: luciancati
--

SELECT pg_catalog.setval('"tenant-torrejon".django_site_id_seq', 1, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: adra_alimentos adra_alimentos_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_alimentos
    ADD CONSTRAINT adra_alimentos_pkey PRIMARY KEY (id);


--
-- Name: adra_almacenalimentos adra_almacenalimentos_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_almacenalimentos
    ADD CONSTRAINT adra_almacenalimentos_pkey PRIMARY KEY (id);


--
-- Name: adra_hijo adra_hijo_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_hijo
    ADD CONSTRAINT adra_hijo_pkey PRIMARY KEY (id);


--
-- Name: adra_persona adra_persona_nombre_apellido_key; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_persona
    ADD CONSTRAINT adra_persona_nombre_apellido_key UNIQUE (nombre_apellido);


--
-- Name: adra_persona adra_persona_numero_adra_key; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_persona
    ADD CONSTRAINT adra_persona_numero_adra_key UNIQUE (numero_adra);


--
-- Name: adra_persona adra_persona_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_persona
    ADD CONSTRAINT adra_persona_pkey PRIMARY KEY (id);


--
-- Name: adra_persona adra_persona_telefono_61905781_uniq; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_persona
    ADD CONSTRAINT adra_persona_telefono_61905781_uniq UNIQUE (telefono);


--
-- Name: adra_profile adra_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_profile
    ADD CONSTRAINT adra_profile_pkey PRIMARY KEY (id);


--
-- Name: adra_profile adra_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_profile
    ADD CONSTRAINT adra_profile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: delegaciones_beneficiariosglobales delegaciones_beneficiariosglobales_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.delegaciones_beneficiariosglobales
    ADD CONSTRAINT delegaciones_beneficiariosglobales_pkey PRIMARY KEY (id);


--
-- Name: delegaciones_delegaciones delegaciones_delegaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.delegaciones_delegaciones
    ADD CONSTRAINT delegaciones_delegaciones_pkey PRIMARY KEY (id);


--
-- Name: delegaciones_delegaciones delegaciones_delegaciones_schema_name_key; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.delegaciones_delegaciones
    ADD CONSTRAINT delegaciones_delegaciones_schema_name_key UNIQUE (schema_name);


--
-- Name: delegaciones_domain delegaciones_domain_domain_key; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.delegaciones_domain
    ADD CONSTRAINT delegaciones_domain_domain_key UNIQUE (domain);


--
-- Name: delegaciones_domain delegaciones_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.delegaciones_domain
    ADD CONSTRAINT delegaciones_domain_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: adra_alimentos adra_alimentos_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_alimentos
    ADD CONSTRAINT adra_alimentos_pkey PRIMARY KEY (id);


--
-- Name: adra_almacenalimentos adra_almacenalimentos_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_almacenalimentos
    ADD CONSTRAINT adra_almacenalimentos_pkey PRIMARY KEY (id);


--
-- Name: adra_hijo adra_hijo_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_hijo
    ADD CONSTRAINT adra_hijo_pkey PRIMARY KEY (id);


--
-- Name: adra_persona adra_persona_nombre_apellido_key; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_persona
    ADD CONSTRAINT adra_persona_nombre_apellido_key UNIQUE (nombre_apellido);


--
-- Name: adra_persona adra_persona_numero_adra_key; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_persona
    ADD CONSTRAINT adra_persona_numero_adra_key UNIQUE (numero_adra);


--
-- Name: adra_persona adra_persona_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_persona
    ADD CONSTRAINT adra_persona_pkey PRIMARY KEY (id);


--
-- Name: adra_profile adra_profile_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_profile
    ADD CONSTRAINT adra_profile_pkey PRIMARY KEY (id);


--
-- Name: adra_profile adra_profile_user_id_key; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_profile
    ADD CONSTRAINT adra_profile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: adra_alimentos adra_alimentos_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_alimentos
    ADD CONSTRAINT adra_alimentos_pkey PRIMARY KEY (id);


--
-- Name: adra_almacenalimentos adra_almacenalimentos_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_almacenalimentos
    ADD CONSTRAINT adra_almacenalimentos_pkey PRIMARY KEY (id);


--
-- Name: adra_hijo adra_hijo_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_hijo
    ADD CONSTRAINT adra_hijo_pkey PRIMARY KEY (id);


--
-- Name: adra_persona adra_persona_nombre_apellido_key; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_persona
    ADD CONSTRAINT adra_persona_nombre_apellido_key UNIQUE (nombre_apellido);


--
-- Name: adra_persona adra_persona_numero_adra_key; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_persona
    ADD CONSTRAINT adra_persona_numero_adra_key UNIQUE (numero_adra);


--
-- Name: adra_persona adra_persona_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_persona
    ADD CONSTRAINT adra_persona_pkey PRIMARY KEY (id);


--
-- Name: adra_profile adra_profile_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_profile
    ADD CONSTRAINT adra_profile_pkey PRIMARY KEY (id);


--
-- Name: adra_profile adra_profile_user_id_key; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_profile
    ADD CONSTRAINT adra_profile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: adra_alimentos_modificado_por_id_ecaf5c77; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX adra_alimentos_modificado_por_id_ecaf5c77 ON public.adra_alimentos USING btree (modificado_por_id);


--
-- Name: adra_alimentos_persona_id_ddaadebe; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX adra_alimentos_persona_id_ddaadebe ON public.adra_alimentos USING btree (persona_id);


--
-- Name: adra_almacenalimentos_modificado_por_id_fc61102c; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX adra_almacenalimentos_modificado_por_id_fc61102c ON public.adra_almacenalimentos USING btree (modificado_por_id);


--
-- Name: adra_hijo_modificado_por_id_df895617; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX adra_hijo_modificado_por_id_df895617 ON public.adra_hijo USING btree (modificado_por_id);


--
-- Name: adra_hijo_persona_id_ed597e01; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX adra_hijo_persona_id_ed597e01 ON public.adra_hijo USING btree (persona_id);


--
-- Name: adra_persona_modificado_por_id_e73d987a; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX adra_persona_modificado_por_id_e73d987a ON public.adra_persona USING btree (modificado_por_id);


--
-- Name: adra_persona_nombre_apellido_b2419d58_like; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX adra_persona_nombre_apellido_b2419d58_like ON public.adra_persona USING btree (nombre_apellido varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: delegaciones_delegaciones_schema_name_82622ec3_like; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX delegaciones_delegaciones_schema_name_82622ec3_like ON public.delegaciones_delegaciones USING btree (schema_name varchar_pattern_ops);


--
-- Name: delegaciones_domain_domain_fa026534_like; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX delegaciones_domain_domain_fa026534_like ON public.delegaciones_domain USING btree (domain varchar_pattern_ops);


--
-- Name: delegaciones_domain_is_primary_3344dc29; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX delegaciones_domain_is_primary_3344dc29 ON public.delegaciones_domain USING btree (is_primary);


--
-- Name: delegaciones_domain_tenant_id_7bea4e46; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX delegaciones_domain_tenant_id_7bea4e46 ON public.delegaciones_domain USING btree (tenant_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: luciancati
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON "tenant-arganda".account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON "tenant-arganda".account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON "tenant-arganda".account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON "tenant-arganda".account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: adra_alimentos_modificado_por_id_ecaf5c77; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX adra_alimentos_modificado_por_id_ecaf5c77 ON "tenant-arganda".adra_alimentos USING btree (modificado_por_id);


--
-- Name: adra_alimentos_persona_id_ddaadebe; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX adra_alimentos_persona_id_ddaadebe ON "tenant-arganda".adra_alimentos USING btree (persona_id);


--
-- Name: adra_almacenalimentos_modificado_por_id_fc61102c; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX adra_almacenalimentos_modificado_por_id_fc61102c ON "tenant-arganda".adra_almacenalimentos USING btree (modificado_por_id);


--
-- Name: adra_hijo_modificado_por_id_df895617; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX adra_hijo_modificado_por_id_df895617 ON "tenant-arganda".adra_hijo USING btree (modificado_por_id);


--
-- Name: adra_hijo_persona_id_ed597e01; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX adra_hijo_persona_id_ed597e01 ON "tenant-arganda".adra_hijo USING btree (persona_id);


--
-- Name: adra_persona_modificado_por_id_e73d987a; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX adra_persona_modificado_por_id_e73d987a ON "tenant-arganda".adra_persona USING btree (modificado_por_id);


--
-- Name: adra_persona_nombre_apellido_b2419d58_like; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX adra_persona_nombre_apellido_b2419d58_like ON "tenant-arganda".adra_persona USING btree (nombre_apellido varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX auth_group_name_a6ea08ec_like ON "tenant-arganda".auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON "tenant-arganda".auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON "tenant-arganda".auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON "tenant-arganda".auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX auth_user_groups_group_id_97559544 ON "tenant-arganda".auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON "tenant-arganda".auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON "tenant-arganda".auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON "tenant-arganda".auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX auth_user_username_6821ab7c_like ON "tenant-arganda".auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON "tenant-arganda".authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON "tenant-arganda".django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON "tenant-arganda".django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX django_session_expire_date_a5c62663 ON "tenant-arganda".django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX django_session_session_key_c0390e0f_like ON "tenant-arganda".django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: tenant-arganda; Owner: luciancati
--

CREATE INDEX django_site_domain_a2e37b91_like ON "tenant-arganda".django_site USING btree (domain varchar_pattern_ops);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON "tenant-torrejon".account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON "tenant-torrejon".account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON "tenant-torrejon".account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON "tenant-torrejon".account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: adra_alimentos_modificado_por_id_ecaf5c77; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX adra_alimentos_modificado_por_id_ecaf5c77 ON "tenant-torrejon".adra_alimentos USING btree (modificado_por_id);


--
-- Name: adra_alimentos_persona_id_ddaadebe; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX adra_alimentos_persona_id_ddaadebe ON "tenant-torrejon".adra_alimentos USING btree (persona_id);


--
-- Name: adra_almacenalimentos_modificado_por_id_fc61102c; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX adra_almacenalimentos_modificado_por_id_fc61102c ON "tenant-torrejon".adra_almacenalimentos USING btree (modificado_por_id);


--
-- Name: adra_hijo_modificado_por_id_df895617; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX adra_hijo_modificado_por_id_df895617 ON "tenant-torrejon".adra_hijo USING btree (modificado_por_id);


--
-- Name: adra_hijo_persona_id_ed597e01; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX adra_hijo_persona_id_ed597e01 ON "tenant-torrejon".adra_hijo USING btree (persona_id);


--
-- Name: adra_persona_modificado_por_id_e73d987a; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX adra_persona_modificado_por_id_e73d987a ON "tenant-torrejon".adra_persona USING btree (modificado_por_id);


--
-- Name: adra_persona_nombre_apellido_b2419d58_like; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX adra_persona_nombre_apellido_b2419d58_like ON "tenant-torrejon".adra_persona USING btree (nombre_apellido varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX auth_group_name_a6ea08ec_like ON "tenant-torrejon".auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON "tenant-torrejon".auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON "tenant-torrejon".auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON "tenant-torrejon".auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX auth_user_groups_group_id_97559544 ON "tenant-torrejon".auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON "tenant-torrejon".auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON "tenant-torrejon".auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON "tenant-torrejon".auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX auth_user_username_6821ab7c_like ON "tenant-torrejon".auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON "tenant-torrejon".authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON "tenant-torrejon".django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON "tenant-torrejon".django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX django_session_expire_date_a5c62663 ON "tenant-torrejon".django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX django_session_session_key_c0390e0f_like ON "tenant-torrejon".django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: tenant-torrejon; Owner: luciancati
--

CREATE INDEX django_site_domain_a2e37b91_like ON "tenant-torrejon".django_site USING btree (domain varchar_pattern_ops);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_alimentos adra_alimentos_modificado_por_id_ecaf5c77_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_alimentos
    ADD CONSTRAINT adra_alimentos_modificado_por_id_ecaf5c77_fk_auth_user_id FOREIGN KEY (modificado_por_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_alimentos adra_alimentos_persona_id_ddaadebe_fk_adra_persona_id; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_alimentos
    ADD CONSTRAINT adra_alimentos_persona_id_ddaadebe_fk_adra_persona_id FOREIGN KEY (persona_id) REFERENCES public.adra_persona(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_almacenalimentos adra_almacenalimento_modificado_por_id_fc61102c_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_almacenalimentos
    ADD CONSTRAINT adra_almacenalimento_modificado_por_id_fc61102c_fk_auth_user FOREIGN KEY (modificado_por_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_hijo adra_hijo_modificado_por_id_df895617_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_hijo
    ADD CONSTRAINT adra_hijo_modificado_por_id_df895617_fk_auth_user_id FOREIGN KEY (modificado_por_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_hijo adra_hijo_persona_id_ed597e01_fk_adra_persona_id; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_hijo
    ADD CONSTRAINT adra_hijo_persona_id_ed597e01_fk_adra_persona_id FOREIGN KEY (persona_id) REFERENCES public.adra_persona(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_persona adra_persona_modificado_por_id_e73d987a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_persona
    ADD CONSTRAINT adra_persona_modificado_por_id_e73d987a_fk_auth_user_id FOREIGN KEY (modificado_por_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_profile adra_profile_user_id_a37d642c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.adra_profile
    ADD CONSTRAINT adra_profile_user_id_a37d642c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: delegaciones_domain delegaciones_domain_tenant_id_7bea4e46_fk_delegacio; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.delegaciones_domain
    ADD CONSTRAINT delegaciones_domain_tenant_id_7bea4e46_fk_delegacio FOREIGN KEY (tenant_id) REFERENCES public.delegaciones_delegaciones(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: luciancati
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "tenant-arganda".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES "tenant-arganda".account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_alimentos adra_alimentos_modificado_por_id_ecaf5c77_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_alimentos
    ADD CONSTRAINT adra_alimentos_modificado_por_id_ecaf5c77_fk_auth_user_id FOREIGN KEY (modificado_por_id) REFERENCES "tenant-arganda".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_alimentos adra_alimentos_persona_id_ddaadebe_fk_adra_persona_id; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_alimentos
    ADD CONSTRAINT adra_alimentos_persona_id_ddaadebe_fk_adra_persona_id FOREIGN KEY (persona_id) REFERENCES "tenant-arganda".adra_persona(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_almacenalimentos adra_almacenalimento_modificado_por_id_fc61102c_fk_auth_user; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_almacenalimentos
    ADD CONSTRAINT adra_almacenalimento_modificado_por_id_fc61102c_fk_auth_user FOREIGN KEY (modificado_por_id) REFERENCES "tenant-arganda".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_hijo adra_hijo_modificado_por_id_df895617_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_hijo
    ADD CONSTRAINT adra_hijo_modificado_por_id_df895617_fk_auth_user_id FOREIGN KEY (modificado_por_id) REFERENCES "tenant-arganda".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_hijo adra_hijo_persona_id_ed597e01_fk_adra_persona_id; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_hijo
    ADD CONSTRAINT adra_hijo_persona_id_ed597e01_fk_adra_persona_id FOREIGN KEY (persona_id) REFERENCES "tenant-arganda".adra_persona(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_persona adra_persona_modificado_por_id_e73d987a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_persona
    ADD CONSTRAINT adra_persona_modificado_por_id_e73d987a_fk_auth_user_id FOREIGN KEY (modificado_por_id) REFERENCES "tenant-arganda".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_profile adra_profile_user_id_a37d642c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".adra_profile
    ADD CONSTRAINT adra_profile_user_id_a37d642c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "tenant-arganda".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES "tenant-arganda".auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES "tenant-arganda".auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES "tenant-arganda".django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES "tenant-arganda".auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "tenant-arganda".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES "tenant-arganda".auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "tenant-arganda".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "tenant-arganda".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES "tenant-arganda".django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-arganda; Owner: luciancati
--

ALTER TABLE ONLY "tenant-arganda".django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "tenant-arganda".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "tenant-torrejon".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES "tenant-torrejon".account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_alimentos adra_alimentos_modificado_por_id_ecaf5c77_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_alimentos
    ADD CONSTRAINT adra_alimentos_modificado_por_id_ecaf5c77_fk_auth_user_id FOREIGN KEY (modificado_por_id) REFERENCES "tenant-torrejon".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_alimentos adra_alimentos_persona_id_ddaadebe_fk_adra_persona_id; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_alimentos
    ADD CONSTRAINT adra_alimentos_persona_id_ddaadebe_fk_adra_persona_id FOREIGN KEY (persona_id) REFERENCES "tenant-torrejon".adra_persona(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_almacenalimentos adra_almacenalimento_modificado_por_id_fc61102c_fk_auth_user; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_almacenalimentos
    ADD CONSTRAINT adra_almacenalimento_modificado_por_id_fc61102c_fk_auth_user FOREIGN KEY (modificado_por_id) REFERENCES "tenant-torrejon".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_hijo adra_hijo_modificado_por_id_df895617_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_hijo
    ADD CONSTRAINT adra_hijo_modificado_por_id_df895617_fk_auth_user_id FOREIGN KEY (modificado_por_id) REFERENCES "tenant-torrejon".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_hijo adra_hijo_persona_id_ed597e01_fk_adra_persona_id; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_hijo
    ADD CONSTRAINT adra_hijo_persona_id_ed597e01_fk_adra_persona_id FOREIGN KEY (persona_id) REFERENCES "tenant-torrejon".adra_persona(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_persona adra_persona_modificado_por_id_e73d987a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_persona
    ADD CONSTRAINT adra_persona_modificado_por_id_e73d987a_fk_auth_user_id FOREIGN KEY (modificado_por_id) REFERENCES "tenant-torrejon".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adra_profile adra_profile_user_id_a37d642c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".adra_profile
    ADD CONSTRAINT adra_profile_user_id_a37d642c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "tenant-torrejon".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES "tenant-torrejon".auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES "tenant-torrejon".auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES "tenant-torrejon".django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES "tenant-torrejon".auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "tenant-torrejon".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES "tenant-torrejon".auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "tenant-torrejon".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "tenant-torrejon".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES "tenant-torrejon".django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: tenant-torrejon; Owner: luciancati
--

ALTER TABLE ONLY "tenant-torrejon".django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "tenant-torrejon".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

