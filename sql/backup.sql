--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)

-- Started on 2025-02-05 20:42:07 CET

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
-- TOC entry 15 (class 2615 OID 16488)
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- TOC entry 13 (class 2615 OID 16388)
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- TOC entry 23 (class 2615 OID 16618)
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- TOC entry 22 (class 2615 OID 16607)
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- TOC entry 12 (class 2615 OID 16386)
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- TOC entry 17 (class 2615 OID 16645)
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA pgsodium;


ALTER SCHEMA pgsodium OWNER TO supabase_admin;

--
-- TOC entry 6 (class 3079 OID 16646)
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- TOC entry 4769 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- TOC entry 16 (class 2615 OID 16599)
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- TOC entry 14 (class 2615 OID 16536)
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- TOC entry 20 (class 2615 OID 16949)
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- TOC entry 8 (class 3079 OID 16982)
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- TOC entry 4773 (class 0 OID 0)
-- Dependencies: 8
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- TOC entry 2 (class 3079 OID 16389)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- TOC entry 4774 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- TOC entry 4 (class 3079 OID 16434)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- TOC entry 4775 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 5 (class 3079 OID 16471)
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- TOC entry 4776 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- TOC entry 7 (class 3079 OID 16950)
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- TOC entry 4777 (class 0 OID 0)
-- Dependencies: 7
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- TOC entry 3 (class 3079 OID 16423)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- TOC entry 4778 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- TOC entry 1439 (class 1247 OID 28724)
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- TOC entry 1463 (class 1247 OID 28865)
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- TOC entry 1436 (class 1247 OID 28718)
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- TOC entry 1433 (class 1247 OID 28712)
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1469 (class 1247 OID 28907)
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1499 (class 1247 OID 29074)
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- TOC entry 1484 (class 1247 OID 29034)
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- TOC entry 1487 (class 1247 OID 29049)
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- TOC entry 1505 (class 1247 OID 29116)
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- TOC entry 1502 (class 1247 OID 29087)
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- TOC entry 391 (class 1255 OID 16534)
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- TOC entry 4779 (class 0 OID 0)
-- Dependencies: 391
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- TOC entry 595 (class 1255 OID 28694)
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- TOC entry 390 (class 1255 OID 16533)
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- TOC entry 4782 (class 0 OID 0)
-- Dependencies: 390
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- TOC entry 389 (class 1255 OID 16532)
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- TOC entry 4784 (class 0 OID 0)
-- Dependencies: 389
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- TOC entry 594 (class 1255 OID 16591)
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- TOC entry 4801 (class 0 OID 0)
-- Dependencies: 594
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- TOC entry 414 (class 1255 OID 16612)
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- TOC entry 4803 (class 0 OID 0)
-- Dependencies: 414
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- TOC entry 585 (class 1255 OID 16593)
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- TOC entry 4805 (class 0 OID 0)
-- Dependencies: 585
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- TOC entry 584 (class 1255 OID 16603)
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- TOC entry 412 (class 1255 OID 16604)
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- TOC entry 586 (class 1255 OID 16614)
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 586
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- TOC entry 374 (class 1255 OID 16387)
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: postgres
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO postgres;

--
-- TOC entry 609 (class 1255 OID 29109)
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- TOC entry 616 (class 1255 OID 29187)
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- TOC entry 608 (class 1255 OID 29121)
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- TOC entry 602 (class 1255 OID 29071)
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- TOC entry 611 (class 1255 OID 29066)
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- TOC entry 613 (class 1255 OID 29117)
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- TOC entry 614 (class 1255 OID 29128)
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- TOC entry 610 (class 1255 OID 29065)
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- TOC entry 617 (class 1255 OID 29186)
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      PERFORM pg_notify(
          'realtime:system',
          jsonb_build_object(
              'error', SQLERRM,
              'function', 'realtime.send',
              'event', event,
              'topic', topic,
              'private', private
          )::text
      );
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- TOC entry 612 (class 1255 OID 29063)
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- TOC entry 607 (class 1255 OID 29098)
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- TOC entry 615 (class 1255 OID 29180)
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- TOC entry 601 (class 1255 OID 28972)
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- TOC entry 598 (class 1255 OID 28946)
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 597 (class 1255 OID 28945)
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 596 (class 1255 OID 28944)
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 599 (class 1255 OID 28958)
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- TOC entry 604 (class 1255 OID 29011)
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- TOC entry 603 (class 1255 OID 28974)
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- TOC entry 606 (class 1255 OID 29027)
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- TOC entry 605 (class 1255 OID 28961)
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- TOC entry 600 (class 1255 OID 28962)
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- TOC entry 551 (class 1255 OID 16974)
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: supabase_admin
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;


ALTER FUNCTION vault.secrets_encrypt_secret_secret() OWNER TO supabase_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 247 (class 1259 OID 16519)
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- TOC entry 277 (class 1259 OID 28869)
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 277
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- TOC entry 268 (class 1259 OID 28666)
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- TOC entry 246 (class 1259 OID 16512)
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- TOC entry 272 (class 1259 OID 28756)
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- TOC entry 271 (class 1259 OID 28744)
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- TOC entry 270 (class 1259 OID 28731)
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- TOC entry 278 (class 1259 OID 28919)
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- TOC entry 245 (class 1259 OID 16501)
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- TOC entry 244 (class 1259 OID 16500)
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 244
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- TOC entry 275 (class 1259 OID 28798)
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 275
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- TOC entry 276 (class 1259 OID 28816)
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 276
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- TOC entry 248 (class 1259 OID 16527)
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- TOC entry 269 (class 1259 OID 28696)
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 269
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- TOC entry 274 (class 1259 OID 28783)
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- TOC entry 273 (class 1259 OID 28774)
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 273
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- TOC entry 243 (class 1259 OID 16489)
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- TOC entry 317 (class 1259 OID 29458)
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_permissions OWNER TO postgres;

--
-- TOC entry 316 (class 1259 OID 29457)
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 316
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- TOC entry 355 (class 1259 OID 29677)
-- Name: admin_permissions_role_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.admin_permissions_role_lnk OWNER TO postgres;

--
-- TOC entry 354 (class 1259 OID 29676)
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 354
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNED BY public.admin_permissions_role_lnk.id;


--
-- TOC entry 321 (class 1259 OID 29482)
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_roles OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 29481)
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_roles_id_seq OWNER TO postgres;

--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 320
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- TOC entry 319 (class 1259 OID 29470)
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    document_id character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- TOC entry 318 (class 1259 OID 29469)
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_id_seq OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 318
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- TOC entry 357 (class 1259 OID 29689)
-- Name: admin_users_roles_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users_roles_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_ord double precision,
    user_ord double precision
);


ALTER TABLE public.admin_users_roles_lnk OWNER TO postgres;

--
-- TOC entry 356 (class 1259 OID 29688)
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_roles_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 356
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNED BY public.admin_users_roles_lnk.id;


--
-- TOC entry 367 (class 1259 OID 34919)
-- Name: components_bloc_contenu_contenus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_bloc_contenu_contenus (
    id integer NOT NULL,
    contenu text
);


ALTER TABLE public.components_bloc_contenu_contenus OWNER TO postgres;

--
-- TOC entry 366 (class 1259 OID 34918)
-- Name: components_bloc_contenu_contenus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_bloc_contenu_contenus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_bloc_contenu_contenus_id_seq OWNER TO postgres;

--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 366
-- Name: components_bloc_contenu_contenus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_bloc_contenu_contenus_id_seq OWNED BY public.components_bloc_contenu_contenus.id;


--
-- TOC entry 371 (class 1259 OID 34986)
-- Name: components_bloc_contenu_rich_contenus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_bloc_contenu_rich_contenus (
    id integer NOT NULL,
    rich_contenu jsonb
);


ALTER TABLE public.components_bloc_contenu_rich_contenus OWNER TO postgres;

--
-- TOC entry 370 (class 1259 OID 34985)
-- Name: components_bloc_contenu_rich_contenus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_bloc_contenu_rich_contenus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_bloc_contenu_rich_contenus_id_seq OWNER TO postgres;

--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 370
-- Name: components_bloc_contenu_rich_contenus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_bloc_contenu_rich_contenus_id_seq OWNED BY public.components_bloc_contenu_rich_contenus.id;


--
-- TOC entry 373 (class 1259 OID 35038)
-- Name: components_bloc_image_image_avants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_bloc_image_image_avants (
    id integer NOT NULL
);


ALTER TABLE public.components_bloc_image_image_avants OWNER TO postgres;

--
-- TOC entry 372 (class 1259 OID 35037)
-- Name: components_bloc_image_image_avants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_bloc_image_image_avants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_bloc_image_image_avants_id_seq OWNER TO postgres;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 372
-- Name: components_bloc_image_image_avants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_bloc_image_image_avants_id_seq OWNED BY public.components_bloc_image_image_avants.id;


--
-- TOC entry 369 (class 1259 OID 34949)
-- Name: components_bloc_image_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_bloc_image_images (
    id integer NOT NULL
);


ALTER TABLE public.components_bloc_image_images OWNER TO postgres;

--
-- TOC entry 368 (class 1259 OID 34948)
-- Name: components_bloc_image_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_bloc_image_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_bloc_image_images_id_seq OWNER TO postgres;

--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 368
-- Name: components_bloc_image_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_bloc_image_images_id_seq OWNED BY public.components_bloc_image_images.id;


--
-- TOC entry 365 (class 1259 OID 34910)
-- Name: components_bloc_titre_bloc_titres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_bloc_titre_bloc_titres (
    id integer NOT NULL,
    titre character varying(255)
);


ALTER TABLE public.components_bloc_titre_bloc_titres OWNER TO postgres;

--
-- TOC entry 364 (class 1259 OID 34909)
-- Name: components_bloc_titre_bloc_titres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_bloc_titre_bloc_titres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_bloc_titre_bloc_titres_id_seq OWNER TO postgres;

--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 364
-- Name: components_bloc_titre_bloc_titres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_bloc_titre_bloc_titres_id_seq OWNED BY public.components_bloc_titre_bloc_titres.id;


--
-- TOC entry 297 (class 1259 OID 29328)
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.files OWNER TO postgres;

--
-- TOC entry 339 (class 1259 OID 29582)
-- Name: files_folder_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_folder_lnk (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_ord double precision
);


ALTER TABLE public.files_folder_lnk OWNER TO postgres;

--
-- TOC entry 338 (class 1259 OID 29581)
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_folder_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_folder_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 338
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_folder_lnk_id_seq OWNED BY public.files_folder_lnk.id;


--
-- TOC entry 296 (class 1259 OID 29327)
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_id_seq OWNER TO postgres;

--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 296
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- TOC entry 337 (class 1259 OID 29570)
-- Name: files_related_mph; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_related_mph (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_mph OWNER TO postgres;

--
-- TOC entry 336 (class 1259 OID 29569)
-- Name: files_related_mph_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_related_mph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_related_mph_id_seq OWNER TO postgres;

--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 336
-- Name: files_related_mph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_related_mph_id_seq OWNED BY public.files_related_mph.id;


--
-- TOC entry 301 (class 1259 OID 29362)
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.i18n_locale OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 29361)
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i18n_locale_id_seq OWNER TO postgres;

--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 300
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- TOC entry 295 (class 1259 OID 29316)
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    document_id character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    slug character varying(255),
    type character varying(255)
);


ALTER TABLE public.pages OWNER TO postgres;

--
-- TOC entry 363 (class 1259 OID 34872)
-- Name: pages_cmps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.pages_cmps OWNER TO postgres;

--
-- TOC entry 362 (class 1259 OID 34871)
-- Name: pages_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_cmps_id_seq OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 362
-- Name: pages_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_cmps_id_seq OWNED BY public.pages_cmps.id;


--
-- TOC entry 294 (class 1259 OID 29315)
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_id_seq OWNER TO postgres;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 294
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- TOC entry 325 (class 1259 OID 29506)
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO postgres;

--
-- TOC entry 324 (class 1259 OID 29505)
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 324
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- TOC entry 359 (class 1259 OID 29702)
-- Name: strapi_api_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions_token_lnk (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_ord double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_lnk OWNER TO postgres;

--
-- TOC entry 358 (class 1259 OID 29701)
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 358
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNED BY public.strapi_api_token_permissions_token_lnk.id;


--
-- TOC entry 323 (class 1259 OID 29494)
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_tokens OWNER TO postgres;

--
-- TOC entry 322 (class 1259 OID 29493)
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 322
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- TOC entry 331 (class 1259 OID 29542)
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO postgres;

--
-- TOC entry 330 (class 1259 OID 29541)
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNER TO postgres;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 330
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- TOC entry 293 (class 1259 OID 29307)
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 29306)
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_database_schema_id_seq OWNER TO postgres;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 292
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- TOC entry 335 (class 1259 OID 29560)
-- Name: strapi_history_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_history_versions (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255),
    locale character varying(255),
    status character varying(255),
    data jsonb,
    schema jsonb,
    created_at timestamp(6) without time zone,
    created_by_id integer
);


ALTER TABLE public.strapi_history_versions OWNER TO postgres;

--
-- TOC entry 334 (class 1259 OID 29559)
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_history_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_history_versions_id_seq OWNER TO postgres;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 334
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_history_versions_id_seq OWNED BY public.strapi_history_versions.id;


--
-- TOC entry 289 (class 1259 OID 29293)
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 29292)
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 288
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- TOC entry 291 (class 1259 OID 29300)
-- Name: strapi_migrations_internal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_migrations_internal (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations_internal OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 29299)
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_migrations_internal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNER TO postgres;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 290
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNED BY public.strapi_migrations_internal.id;


--
-- TOC entry 305 (class 1259 OID 29386)
-- Name: strapi_release_actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    content_type character varying(255),
    entry_document_id character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_release_actions OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 29385)
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_id_seq OWNER TO postgres;

--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 304
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;


--
-- TOC entry 343 (class 1259 OID 29606)
-- Name: strapi_release_actions_release_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_release_actions_release_lnk (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_ord double precision
);


ALTER TABLE public.strapi_release_actions_release_lnk OWNER TO postgres;

--
-- TOC entry 342 (class 1259 OID 29605)
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_release_actions_release_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 342
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNED BY public.strapi_release_actions_release_lnk.id;


--
-- TOC entry 303 (class 1259 OID 29374)
-- Name: strapi_releases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_releases OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 29373)
-- Name: strapi_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_releases_id_seq OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 302
-- Name: strapi_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;


--
-- TOC entry 329 (class 1259 OID 29530)
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO postgres;

--
-- TOC entry 328 (class 1259 OID 29529)
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 328
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- TOC entry 361 (class 1259 OID 29714)
-- Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_token_permissions_token_lnk (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_ord double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_lnk OWNER TO postgres;

--
-- TOC entry 360 (class 1259 OID 29713)
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 360
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNED BY public.strapi_transfer_token_permissions_token_lnk.id;


--
-- TOC entry 327 (class 1259 OID 29518)
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO postgres;

--
-- TOC entry 326 (class 1259 OID 29517)
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 326
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- TOC entry 333 (class 1259 OID 29551)
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO postgres;

--
-- TOC entry 332 (class 1259 OID 29550)
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_webhooks_id_seq OWNER TO postgres;

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 332
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- TOC entry 307 (class 1259 OID 29398)
-- Name: strapi_workflows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_workflows (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    content_types jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 29397)
-- Name: strapi_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_id_seq OWNER TO postgres;

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 306
-- Name: strapi_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_workflows_id_seq OWNED BY public.strapi_workflows.id;


--
-- TOC entry 345 (class 1259 OID 29618)
-- Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_workflows_stage_required_to_publish_lnk (
    id integer NOT NULL,
    workflow_id integer,
    workflow_stage_id integer
);


ALTER TABLE public.strapi_workflows_stage_required_to_publish_lnk OWNER TO postgres;

--
-- TOC entry 344 (class 1259 OID 29617)
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 344
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNED BY public.strapi_workflows_stage_required_to_publish_lnk.id;


--
-- TOC entry 309 (class 1259 OID 29410)
-- Name: strapi_workflows_stages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_workflows_stages (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows_stages OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 29409)
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_workflows_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNER TO postgres;

--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 308
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNED BY public.strapi_workflows_stages.id;


--
-- TOC entry 349 (class 1259 OID 29641)
-- Name: strapi_workflows_stages_permissions_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_workflows_stages_permissions_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    permission_id integer,
    permission_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_permissions_lnk OWNER TO postgres;

--
-- TOC entry 348 (class 1259 OID 29640)
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 348
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNED BY public.strapi_workflows_stages_permissions_lnk.id;


--
-- TOC entry 347 (class 1259 OID 29629)
-- Name: strapi_workflows_stages_workflow_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_workflows_stages_workflow_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    workflow_id integer,
    workflow_stage_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_workflow_lnk OWNER TO postgres;

--
-- TOC entry 346 (class 1259 OID 29628)
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 346
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNED BY public.strapi_workflows_stages_workflow_lnk.id;


--
-- TOC entry 311 (class 1259 OID 29422)
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_permissions OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 29421)
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 310
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- TOC entry 351 (class 1259 OID 29653)
-- Name: up_permissions_role_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.up_permissions_role_lnk OWNER TO postgres;

--
-- TOC entry 350 (class 1259 OID 29652)
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 350
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNED BY public.up_permissions_role_lnk.id;


--
-- TOC entry 313 (class 1259 OID 29434)
-- Name: up_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_roles OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 29433)
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_roles_id_seq OWNER TO postgres;

--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 312
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- TOC entry 315 (class 1259 OID 29446)
-- Name: up_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    document_id character varying(255),
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_users OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 29445)
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_id_seq OWNER TO postgres;

--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 314
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- TOC entry 353 (class 1259 OID 29665)
-- Name: up_users_role_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users_role_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_ord double precision
);


ALTER TABLE public.up_users_role_lnk OWNER TO postgres;

--
-- TOC entry 352 (class 1259 OID 29664)
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 352
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNED BY public.up_users_role_lnk.id;


--
-- TOC entry 299 (class 1259 OID 29346)
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.upload_folders OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 29345)
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_id_seq OWNER TO postgres;

--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 298
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- TOC entry 341 (class 1259 OID 29594)
-- Name: upload_folders_parent_lnk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders_parent_lnk (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_ord double precision
);


ALTER TABLE public.upload_folders_parent_lnk OWNER TO postgres;

--
-- TOC entry 340 (class 1259 OID 29593)
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNER TO postgres;

--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 340
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNED BY public.upload_folders_parent_lnk.id;


--
-- TOC entry 287 (class 1259 OID 29190)
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- TOC entry 281 (class 1259 OID 29028)
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- TOC entry 284 (class 1259 OID 29051)
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- TOC entry 283 (class 1259 OID 29050)
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 249 (class 1259 OID 16540)
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- TOC entry 251 (class 1259 OID 16582)
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- TOC entry 250 (class 1259 OID 16555)
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- TOC entry 279 (class 1259 OID 28976)
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- TOC entry 280 (class 1259 OID 28990)
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- TOC entry 266 (class 1259 OID 16970)
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: supabase_admin
--

CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;


ALTER VIEW vault.decrypted_secrets OWNER TO supabase_admin;

--
-- TOC entry 3923 (class 2604 OID 16504)
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- TOC entry 3977 (class 2604 OID 29461)
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- TOC entry 3996 (class 2604 OID 29680)
-- Name: admin_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_lnk_id_seq'::regclass);


--
-- TOC entry 3979 (class 2604 OID 29485)
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- TOC entry 3978 (class 2604 OID 29473)
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- TOC entry 3997 (class 2604 OID 29692)
-- Name: admin_users_roles_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_lnk_id_seq'::regclass);


--
-- TOC entry 4002 (class 2604 OID 34922)
-- Name: components_bloc_contenu_contenus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_bloc_contenu_contenus ALTER COLUMN id SET DEFAULT nextval('public.components_bloc_contenu_contenus_id_seq'::regclass);


--
-- TOC entry 4004 (class 2604 OID 34989)
-- Name: components_bloc_contenu_rich_contenus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_bloc_contenu_rich_contenus ALTER COLUMN id SET DEFAULT nextval('public.components_bloc_contenu_rich_contenus_id_seq'::regclass);


--
-- TOC entry 4005 (class 2604 OID 35041)
-- Name: components_bloc_image_image_avants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_bloc_image_image_avants ALTER COLUMN id SET DEFAULT nextval('public.components_bloc_image_image_avants_id_seq'::regclass);


--
-- TOC entry 4003 (class 2604 OID 34952)
-- Name: components_bloc_image_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_bloc_image_images ALTER COLUMN id SET DEFAULT nextval('public.components_bloc_image_images_id_seq'::regclass);


--
-- TOC entry 4001 (class 2604 OID 34913)
-- Name: components_bloc_titre_bloc_titres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_bloc_titre_bloc_titres ALTER COLUMN id SET DEFAULT nextval('public.components_bloc_titre_bloc_titres_id_seq'::regclass);


--
-- TOC entry 3967 (class 2604 OID 29331)
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- TOC entry 3988 (class 2604 OID 29585)
-- Name: files_folder_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_lnk ALTER COLUMN id SET DEFAULT nextval('public.files_folder_lnk_id_seq'::regclass);


--
-- TOC entry 3987 (class 2604 OID 29573)
-- Name: files_related_mph id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_mph ALTER COLUMN id SET DEFAULT nextval('public.files_related_mph_id_seq'::regclass);


--
-- TOC entry 3969 (class 2604 OID 29365)
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- TOC entry 3966 (class 2604 OID 29319)
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- TOC entry 4000 (class 2604 OID 34875)
-- Name: pages_cmps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_cmps ALTER COLUMN id SET DEFAULT nextval('public.pages_cmps_id_seq'::regclass);


--
-- TOC entry 3981 (class 2604 OID 29509)
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- TOC entry 3998 (class 2604 OID 29705)
-- Name: strapi_api_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_lnk_id_seq'::regclass);


--
-- TOC entry 3980 (class 2604 OID 29497)
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- TOC entry 3984 (class 2604 OID 29545)
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- TOC entry 3965 (class 2604 OID 29310)
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- TOC entry 3986 (class 2604 OID 29563)
-- Name: strapi_history_versions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_history_versions ALTER COLUMN id SET DEFAULT nextval('public.strapi_history_versions_id_seq'::regclass);


--
-- TOC entry 3963 (class 2604 OID 29296)
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- TOC entry 3964 (class 2604 OID 29303)
-- Name: strapi_migrations_internal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations_internal ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_internal_id_seq'::regclass);


--
-- TOC entry 3971 (class 2604 OID 29389)
-- Name: strapi_release_actions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);


--
-- TOC entry 3990 (class 2604 OID 29609)
-- Name: strapi_release_actions_release_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_lnk_id_seq'::regclass);


--
-- TOC entry 3970 (class 2604 OID 29377)
-- Name: strapi_releases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);


--
-- TOC entry 3983 (class 2604 OID 29533)
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- TOC entry 3999 (class 2604 OID 29717)
-- Name: strapi_transfer_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_lnk_id_seq'::regclass);


--
-- TOC entry 3982 (class 2604 OID 29521)
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- TOC entry 3985 (class 2604 OID 29554)
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- TOC entry 3972 (class 2604 OID 29401)
-- Name: strapi_workflows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_id_seq'::regclass);


--
-- TOC entry 3991 (class 2604 OID 29621)
-- Name: strapi_workflows_stage_required_to_publish_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq'::regclass);


--
-- TOC entry 3973 (class 2604 OID 29413)
-- Name: strapi_workflows_stages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_id_seq'::regclass);


--
-- TOC entry 3993 (class 2604 OID 29644)
-- Name: strapi_workflows_stages_permissions_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_permissions_lnk_id_seq'::regclass);


--
-- TOC entry 3992 (class 2604 OID 29632)
-- Name: strapi_workflows_stages_workflow_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_workflow_lnk_id_seq'::regclass);


--
-- TOC entry 3974 (class 2604 OID 29425)
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- TOC entry 3994 (class 2604 OID 29656)
-- Name: up_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_lnk_id_seq'::regclass);


--
-- TOC entry 3975 (class 2604 OID 29437)
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- TOC entry 3976 (class 2604 OID 29449)
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- TOC entry 3995 (class 2604 OID 29668)
-- Name: up_users_role_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_lnk_id_seq'::regclass);


--
-- TOC entry 3968 (class 2604 OID 29349)
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- TOC entry 3989 (class 2604 OID 29597)
-- Name: upload_folders_parent_lnk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_lnk_id_seq'::regclass);


--
-- TOC entry 4655 (class 0 OID 16519)
-- Dependencies: 247
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- TOC entry 4669 (class 0 OID 28869)
-- Dependencies: 277
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- TOC entry 4660 (class 0 OID 28666)
-- Dependencies: 268
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- TOC entry 4654 (class 0 OID 16512)
-- Dependencies: 246
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4664 (class 0 OID 28756)
-- Dependencies: 272
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- TOC entry 4663 (class 0 OID 28744)
-- Dependencies: 271
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- TOC entry 4662 (class 0 OID 28731)
-- Dependencies: 270
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- TOC entry 4670 (class 0 OID 28919)
-- Dependencies: 278
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4653 (class 0 OID 16501)
-- Dependencies: 245
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- TOC entry 4667 (class 0 OID 28798)
-- Dependencies: 275
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- TOC entry 4668 (class 0 OID 28816)
-- Dependencies: 276
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- TOC entry 4656 (class 0 OID 16527)
-- Dependencies: 248
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
\.


--
-- TOC entry 4661 (class 0 OID 28696)
-- Dependencies: 269
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
\.


--
-- TOC entry 4666 (class 0 OID 28783)
-- Dependencies: 274
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4665 (class 0 OID 28774)
-- Dependencies: 273
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4651 (class 0 OID 16489)
-- Dependencies: 243
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- TOC entry 3911 (class 0 OID 16790)
-- Dependencies: 259
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
\.


--
-- TOC entry 4705 (class 0 OID 29458)
-- Dependencies: 317
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions (id, document_id, action, action_parameters, subject, properties, conditions, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
5	tfwn712651acezivrv5evdvr	plugin::content-manager.explorer.publish	{}	api::page.page	{}	[]	2025-02-01 21:57:58.488	2025-02-01 21:57:58.488	2025-02-01 21:57:58.488	\N	\N	\N
6	k1c1r4uyer2qb7l7fjgu7ryr	plugin::upload.read	{}	\N	{}	[]	2025-02-01 21:57:58.589	2025-02-01 21:57:58.589	2025-02-01 21:57:58.59	\N	\N	\N
7	oo69sm3wh05yyxdxpktzzyiy	plugin::upload.configure-view	{}	\N	{}	[]	2025-02-01 21:57:58.691	2025-02-01 21:57:58.691	2025-02-01 21:57:58.691	\N	\N	\N
8	i7yo0ekgot6jsd4wkjq92une	plugin::upload.assets.create	{}	\N	{}	[]	2025-02-01 21:57:58.792	2025-02-01 21:57:58.792	2025-02-01 21:57:58.792	\N	\N	\N
9	pd8u4uuvrvizvrprnlmsg6r4	plugin::upload.assets.update	{}	\N	{}	[]	2025-02-01 21:57:58.893	2025-02-01 21:57:58.893	2025-02-01 21:57:58.893	\N	\N	\N
10	hu3e6cp60rqkg3f7v17nlix8	plugin::upload.assets.download	{}	\N	{}	[]	2025-02-01 21:57:58.992	2025-02-01 21:57:58.992	2025-02-01 21:57:58.992	\N	\N	\N
11	kegag64gwxvsfv0h5pcwmgtn	plugin::upload.assets.copy-link	{}	\N	{}	[]	2025-02-01 21:57:59.094	2025-02-01 21:57:59.094	2025-02-01 21:57:59.095	\N	\N	\N
15	o7cgxwm07pdey9w8o0ehpoif	plugin::content-manager.explorer.delete	{}	api::page.page	{}	["admin::is-creator"]	2025-02-01 21:57:59.513	2025-02-01 21:57:59.513	2025-02-01 21:57:59.513	\N	\N	\N
16	copqmjxcjdjh1hi95hrlhxvq	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2025-02-01 21:57:59.61	2025-02-01 21:57:59.61	2025-02-01 21:57:59.611	\N	\N	\N
17	nblj39red9p6a5ro5vwmpect	plugin::upload.configure-view	{}	\N	{}	[]	2025-02-01 21:57:59.71	2025-02-01 21:57:59.71	2025-02-01 21:57:59.711	\N	\N	\N
18	r707qntj5eaotitr7hwl8iwk	plugin::upload.assets.create	{}	\N	{}	[]	2025-02-01 21:57:59.811	2025-02-01 21:57:59.811	2025-02-01 21:57:59.812	\N	\N	\N
19	dr16cg74z2fu64uuo84afesn	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2025-02-01 21:57:59.912	2025-02-01 21:57:59.912	2025-02-01 21:57:59.912	\N	\N	\N
20	qx6kh1jo57m2vuen9e7b8vm0	plugin::upload.assets.download	{}	\N	{}	[]	2025-02-01 21:58:00.012	2025-02-01 21:58:00.012	2025-02-01 21:58:00.013	\N	\N	\N
21	svdi4fkpey4ro61a8mhvk0k1	plugin::upload.assets.copy-link	{}	\N	{}	[]	2025-02-01 21:58:00.112	2025-02-01 21:58:00.112	2025-02-01 21:58:00.113	\N	\N	\N
23	embedlo1yhhyamiwu7u7bvo3	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-02-01 21:58:00.422	2025-02-01 21:58:00.422	2025-02-01 21:58:00.422	\N	\N	\N
25	vbvbhlgqxg6jxcxr5vepb673	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-02-01 21:58:00.622	2025-02-01 21:58:00.622	2025-02-01 21:58:00.622	\N	\N	\N
27	vih3d0589r82kug409n1gt83	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-02-01 21:58:00.822	2025-02-01 21:58:00.822	2025-02-01 21:58:00.823	\N	\N	\N
28	j4qhfoj4chr4u5p40gp7j3pl	plugin::content-manager.explorer.delete	{}	api::page.page	{}	[]	2025-02-01 21:58:00.92	2025-02-01 21:58:00.92	2025-02-01 21:58:00.92	\N	\N	\N
29	r1e1ff1dielh229j3r5x16q3	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2025-02-01 21:58:01.021	2025-02-01 21:58:01.021	2025-02-01 21:58:01.021	\N	\N	\N
30	fslrpgtfoyrqegqprq6udz6n	plugin::content-manager.explorer.publish	{}	api::page.page	{}	[]	2025-02-01 21:58:01.122	2025-02-01 21:58:01.122	2025-02-01 21:58:01.123	\N	\N	\N
31	uutw4ucd510q1qnu722q0akc	plugin::content-manager.explorer.publish	{}	plugin::users-permissions.user	{}	[]	2025-02-01 21:58:01.223	2025-02-01 21:58:01.223	2025-02-01 21:58:01.223	\N	\N	\N
32	snuonkbdfafq2nwjkeo2teg9	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2025-02-01 21:58:01.321	2025-02-01 21:58:01.321	2025-02-01 21:58:01.322	\N	\N	\N
33	glnbye1tpb3egvwztjbaejti	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2025-02-01 21:58:01.421	2025-02-01 21:58:01.421	2025-02-01 21:58:01.421	\N	\N	\N
34	doi7shezbcmxzbzcvl55vpry	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2025-02-01 21:58:01.516	2025-02-01 21:58:01.516	2025-02-01 21:58:01.516	\N	\N	\N
35	gjujxhkevbdfma0waikjprog	plugin::content-type-builder.read	{}	\N	{}	[]	2025-02-01 21:58:01.61	2025-02-01 21:58:01.61	2025-02-01 21:58:01.61	\N	\N	\N
36	cjnmtr63lzqwh5l5qo2auh9b	plugin::email.settings.read	{}	\N	{}	[]	2025-02-01 21:58:01.703	2025-02-01 21:58:01.703	2025-02-01 21:58:01.703	\N	\N	\N
37	q8klzg6btvzczq7wj6ep8ugu	plugin::upload.read	{}	\N	{}	[]	2025-02-01 21:58:01.804	2025-02-01 21:58:01.804	2025-02-01 21:58:01.805	\N	\N	\N
38	zizizl9mrznc8o5kaqh2bu8i	plugin::upload.assets.create	{}	\N	{}	[]	2025-02-01 21:58:01.907	2025-02-01 21:58:01.907	2025-02-01 21:58:01.907	\N	\N	\N
39	h6v9su136ykid4d2dcovrdgz	plugin::upload.assets.update	{}	\N	{}	[]	2025-02-01 21:58:02.007	2025-02-01 21:58:02.007	2025-02-01 21:58:02.007	\N	\N	\N
40	rhfifetl96p78zbt1hfu2ahn	plugin::upload.assets.download	{}	\N	{}	[]	2025-02-01 21:58:02.109	2025-02-01 21:58:02.109	2025-02-01 21:58:02.109	\N	\N	\N
41	p51vvd5ay283a7wszajzx8xm	plugin::upload.assets.copy-link	{}	\N	{}	[]	2025-02-01 21:58:02.207	2025-02-01 21:58:02.207	2025-02-01 21:58:02.207	\N	\N	\N
42	xyqb51f1m0zaqw022q3eb446	plugin::upload.configure-view	{}	\N	{}	[]	2025-02-01 21:58:02.308	2025-02-01 21:58:02.308	2025-02-01 21:58:02.309	\N	\N	\N
43	o9a6q22s4t467d2iwfcfow62	plugin::upload.settings.read	{}	\N	{}	[]	2025-02-01 21:58:02.409	2025-02-01 21:58:02.409	2025-02-01 21:58:02.41	\N	\N	\N
44	g91ix3ugdtooe48xzlp331zi	plugin::i18n.locale.create	{}	\N	{}	[]	2025-02-01 21:58:02.511	2025-02-01 21:58:02.511	2025-02-01 21:58:02.511	\N	\N	\N
45	gl6ds4hchhchhplrw7oma9na	plugin::i18n.locale.read	{}	\N	{}	[]	2025-02-01 21:58:02.608	2025-02-01 21:58:02.608	2025-02-01 21:58:02.608	\N	\N	\N
13	ssun5wy4qgbddpig2uwntp68	plugin::content-manager.explorer.read	{}	api::page.page	{"fields": ["slug", "type"]}	["admin::is-creator"]	2025-02-01 21:57:59.304	2025-02-05 15:45:00.683	2025-02-01 21:57:59.305	\N	\N	\N
12	e0ne48d345twqy0rngn9t845	plugin::content-manager.explorer.create	{}	api::page.page	{"fields": ["slug", "type"]}	["admin::is-creator"]	2025-02-01 21:57:59.2	2025-02-05 15:45:00.682	2025-02-01 21:57:59.201	\N	\N	\N
46	fakvfpt08ttcs6x5n3hebygn	plugin::i18n.locale.update	{}	\N	{}	[]	2025-02-01 21:58:02.707	2025-02-01 21:58:02.707	2025-02-01 21:58:02.708	\N	\N	\N
47	aafiasj8ql20lpvqitcfaly2	plugin::i18n.locale.delete	{}	\N	{}	[]	2025-02-01 21:58:02.808	2025-02-01 21:58:02.808	2025-02-01 21:58:02.808	\N	\N	\N
48	ttwnauh7dnzc126sqisamn1p	plugin::users-permissions.roles.create	{}	\N	{}	[]	2025-02-01 21:58:02.908	2025-02-01 21:58:02.908	2025-02-01 21:58:02.909	\N	\N	\N
49	ginhw5frfn61ta0a7j7u5msy	plugin::users-permissions.roles.read	{}	\N	{}	[]	2025-02-01 21:58:03.01	2025-02-01 21:58:03.01	2025-02-01 21:58:03.011	\N	\N	\N
50	n69mfou096wfk7lyzuxgi6pz	plugin::users-permissions.roles.update	{}	\N	{}	[]	2025-02-01 21:58:03.11	2025-02-01 21:58:03.11	2025-02-01 21:58:03.111	\N	\N	\N
51	vzbq99uzig8b50jokcwoxu9q	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2025-02-01 21:58:03.212	2025-02-01 21:58:03.212	2025-02-01 21:58:03.212	\N	\N	\N
52	e1ds5e87w35q16mt5nfppc61	plugin::users-permissions.providers.read	{}	\N	{}	[]	2025-02-01 21:58:03.312	2025-02-01 21:58:03.312	2025-02-01 21:58:03.313	\N	\N	\N
53	u4ftzmh4t14tml852kvcl2rp	plugin::users-permissions.providers.update	{}	\N	{}	[]	2025-02-01 21:58:03.415	2025-02-01 21:58:03.415	2025-02-01 21:58:03.416	\N	\N	\N
54	ttxvge44c4y3b1wg0ca0lhvz	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2025-02-01 21:58:03.514	2025-02-01 21:58:03.514	2025-02-01 21:58:03.514	\N	\N	\N
55	xn2euobv2lf4ts8j9f79oets	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2025-02-01 21:58:03.612	2025-02-01 21:58:03.612	2025-02-01 21:58:03.612	\N	\N	\N
56	yfgvta5qs6zjmiqteyadl071	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2025-02-01 21:58:03.713	2025-02-01 21:58:03.713	2025-02-01 21:58:03.714	\N	\N	\N
57	j8fe2va2qumu8fs1onlb2d5p	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2025-02-01 21:58:03.815	2025-02-01 21:58:03.815	2025-02-01 21:58:03.816	\N	\N	\N
58	otpsk5k1asy4j6o8m2zjnf00	admin::marketplace.read	{}	\N	{}	[]	2025-02-01 21:58:03.914	2025-02-01 21:58:03.914	2025-02-01 21:58:03.915	\N	\N	\N
59	vufi6tkdlqahpqtp7yjwxhcx	admin::webhooks.create	{}	\N	{}	[]	2025-02-01 21:58:04.017	2025-02-01 21:58:04.017	2025-02-01 21:58:04.017	\N	\N	\N
60	n7f58ufs9tk6fmw69q5p2wax	admin::webhooks.read	{}	\N	{}	[]	2025-02-01 21:58:04.122	2025-02-01 21:58:04.122	2025-02-01 21:58:04.123	\N	\N	\N
61	ncmdxnoemry6dircisgztnke	admin::webhooks.update	{}	\N	{}	[]	2025-02-01 21:58:04.234	2025-02-01 21:58:04.234	2025-02-01 21:58:04.234	\N	\N	\N
62	tyzc26cneduzux9pbp1q3scr	admin::webhooks.delete	{}	\N	{}	[]	2025-02-01 21:58:04.338	2025-02-01 21:58:04.338	2025-02-01 21:58:04.338	\N	\N	\N
63	dqpfpmeo6kz187st9rar3epg	admin::users.create	{}	\N	{}	[]	2025-02-01 21:58:04.441	2025-02-01 21:58:04.441	2025-02-01 21:58:04.442	\N	\N	\N
64	ol9muut292740fm9ym9vpdin	admin::users.read	{}	\N	{}	[]	2025-02-01 21:58:04.54	2025-02-01 21:58:04.54	2025-02-01 21:58:04.54	\N	\N	\N
65	owpu7n42dok4ngpijv1i1ajp	admin::users.update	{}	\N	{}	[]	2025-02-01 21:58:04.638	2025-02-01 21:58:04.638	2025-02-01 21:58:04.638	\N	\N	\N
66	oynvvsnzokkc6xooyt8vtylq	admin::users.delete	{}	\N	{}	[]	2025-02-01 21:58:04.739	2025-02-01 21:58:04.739	2025-02-01 21:58:04.74	\N	\N	\N
67	qvolghjxmch0y1hab7yu0bsg	admin::roles.create	{}	\N	{}	[]	2025-02-01 21:58:04.836	2025-02-01 21:58:04.836	2025-02-01 21:58:04.836	\N	\N	\N
68	i0skyd2mssgbi8uf5lo2zer7	admin::roles.read	{}	\N	{}	[]	2025-02-01 21:58:04.935	2025-02-01 21:58:04.935	2025-02-01 21:58:04.935	\N	\N	\N
69	ig0jox36gl2apaq19fpg7wug	admin::roles.update	{}	\N	{}	[]	2025-02-01 21:58:05.038	2025-02-01 21:58:05.038	2025-02-01 21:58:05.038	\N	\N	\N
70	f9fnnmcmqd9za0o4hbr4x3w3	admin::roles.delete	{}	\N	{}	[]	2025-02-01 21:58:05.138	2025-02-01 21:58:05.138	2025-02-01 21:58:05.138	\N	\N	\N
71	fw2oekwyh74d8mzfxfewqn7y	admin::api-tokens.access	{}	\N	{}	[]	2025-02-01 21:58:05.237	2025-02-01 21:58:05.237	2025-02-01 21:58:05.238	\N	\N	\N
72	erbtlxqau4n2vd4pre8yieee	admin::api-tokens.create	{}	\N	{}	[]	2025-02-01 21:58:05.338	2025-02-01 21:58:05.338	2025-02-01 21:58:05.338	\N	\N	\N
73	e6nflqqzzeqb8n4ufvbdy68r	admin::api-tokens.read	{}	\N	{}	[]	2025-02-01 21:58:05.436	2025-02-01 21:58:05.436	2025-02-01 21:58:05.437	\N	\N	\N
74	n9j42ygejbur7ghko4m94zcm	admin::api-tokens.update	{}	\N	{}	[]	2025-02-01 21:58:05.539	2025-02-01 21:58:05.539	2025-02-01 21:58:05.54	\N	\N	\N
75	u96pi31vzu5k187fcioad28h	admin::api-tokens.regenerate	{}	\N	{}	[]	2025-02-01 21:58:05.641	2025-02-01 21:58:05.641	2025-02-01 21:58:05.642	\N	\N	\N
76	m2ujxc6t130295ht3ircb396	admin::api-tokens.delete	{}	\N	{}	[]	2025-02-01 21:58:05.74	2025-02-01 21:58:05.74	2025-02-01 21:58:05.74	\N	\N	\N
77	b3k1s2lwjws9k4pk8imqj8zi	admin::project-settings.update	{}	\N	{}	[]	2025-02-01 21:58:05.835	2025-02-01 21:58:05.835	2025-02-01 21:58:05.835	\N	\N	\N
78	fctokkpz9e9rjcbywlfo3e54	admin::project-settings.read	{}	\N	{}	[]	2025-02-01 21:58:05.939	2025-02-01 21:58:05.939	2025-02-01 21:58:05.939	\N	\N	\N
79	kppvuz74jnt3qxrsqpi6qdnc	admin::transfer.tokens.access	{}	\N	{}	[]	2025-02-01 21:58:06.039	2025-02-01 21:58:06.039	2025-02-01 21:58:06.039	\N	\N	\N
80	ndvezweeitckj5agi55zygn9	admin::transfer.tokens.create	{}	\N	{}	[]	2025-02-01 21:58:06.139	2025-02-01 21:58:06.139	2025-02-01 21:58:06.139	\N	\N	\N
81	i1v345zrb8ltv73t5pibwzpz	admin::transfer.tokens.read	{}	\N	{}	[]	2025-02-01 21:58:06.239	2025-02-01 21:58:06.239	2025-02-01 21:58:06.239	\N	\N	\N
82	mtfehqfzgkjgefbaeoxm7515	admin::transfer.tokens.update	{}	\N	{}	[]	2025-02-01 21:58:06.335	2025-02-01 21:58:06.335	2025-02-01 21:58:06.335	\N	\N	\N
83	xs7wgngpi7dr3fmeurf5ruf3	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2025-02-01 21:58:06.435	2025-02-01 21:58:06.435	2025-02-01 21:58:06.435	\N	\N	\N
84	c0l8ifcv0azf1cwx7z15tihc	admin::transfer.tokens.delete	{}	\N	{}	[]	2025-02-01 21:58:06.535	2025-02-01 21:58:06.535	2025-02-01 21:58:06.535	\N	\N	\N
104	w9bepln7g38am2c7az4v9kd6	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-02-03 09:56:22.274	2025-02-03 09:56:22.274	2025-02-03 09:56:22.275	\N	\N	\N
105	ct1p4juss8fl9r7bm9w95azd	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-02-03 09:56:22.371	2025-02-03 09:56:22.371	2025-02-03 09:56:22.372	\N	\N	\N
14	s6eth4kfsleb8n554xxa2m92	plugin::content-manager.explorer.update	{}	api::page.page	{"fields": ["slug", "type"]}	["admin::is-creator"]	2025-02-01 21:57:59.414	2025-02-05 15:45:00.683	2025-02-01 21:57:59.415	\N	\N	\N
106	v7pw38fg2o9f889rdkb6cg0q	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-02-03 09:56:22.47	2025-02-03 09:56:22.47	2025-02-03 09:56:22.471	\N	\N	\N
108	lc0vqpx2yz0swcqwlt5kva5n	plugin::content-manager.explorer.publish	{}	plugin::users-permissions.user	{}	[]	2025-02-03 09:56:22.665	2025-02-03 09:56:22.665	2025-02-03 09:56:22.666	\N	\N	\N
139	f1cta5qqfepf6j2qypfelc61	plugin::content-manager.explorer.create	{}	api::page.page	{"fields": ["contenu_flexible", "slug", "type"]}	[]	2025-02-05 15:05:15.624	2025-02-05 15:05:15.624	2025-02-05 15:05:15.628	\N	\N	\N
140	p87b4orstyd564entz0frmai	plugin::content-manager.explorer.read	{}	api::page.page	{"fields": ["contenu_flexible", "slug", "type"]}	[]	2025-02-05 15:05:15.73	2025-02-05 15:05:15.73	2025-02-05 15:05:15.731	\N	\N	\N
141	zn1ales00fs3y7zoer622yzh	plugin::content-manager.explorer.update	{}	api::page.page	{"fields": ["contenu_flexible", "slug", "type"]}	[]	2025-02-05 15:05:15.831	2025-02-05 15:05:15.831	2025-02-05 15:05:15.832	\N	\N	\N
142	oytccq9lr7yfogain4didn4h	plugin::content-manager.explorer.create	{}	api::page.page	{"fields": ["contenu_flexible"]}	[]	2025-02-05 20:12:14.866	2025-02-05 20:12:14.866	2025-02-05 20:12:14.867	\N	\N	\N
143	jjjuywksodktlcrslge44n7b	plugin::content-manager.explorer.read	{}	api::page.page	{"fields": ["contenu_flexible", "slug", "type"]}	[]	2025-02-05 20:12:14.964	2025-02-05 20:12:14.964	2025-02-05 20:12:14.965	\N	\N	\N
144	tk1qqkoiwf4k7y4x5qwj7jrt	plugin::content-manager.explorer.update	{}	api::page.page	{"fields": ["contenu_flexible"]}	[]	2025-02-05 20:12:15.059	2025-02-05 20:12:15.059	2025-02-05 20:12:15.06	\N	\N	\N
\.


--
-- TOC entry 4743 (class 0 OID 29677)
-- Dependencies: 355
-- Data for Name: admin_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
5	5	2	5
6	6	2	6
7	7	2	7
8	8	2	8
9	9	2	9
10	10	2	10
11	11	2	11
12	12	3	1
13	13	3	2
14	14	3	3
15	15	3	4
16	16	3	5
17	17	3	6
18	18	3	7
19	19	3	8
20	20	3	9
21	21	3	10
23	23	1	2
25	25	1	4
27	27	1	6
28	28	1	7
29	29	1	8
30	30	1	9
31	31	1	10
32	32	1	11
33	33	1	12
34	34	1	13
35	35	1	14
36	36	1	15
37	37	1	16
38	38	1	17
39	39	1	18
40	40	1	19
41	41	1	20
42	42	1	21
43	43	1	22
44	44	1	23
45	45	1	24
46	46	1	25
47	47	1	26
48	48	1	27
49	49	1	28
50	50	1	29
51	51	1	30
52	52	1	31
53	53	1	32
54	54	1	33
55	55	1	34
56	56	1	35
57	57	1	36
58	58	1	37
59	59	1	38
60	60	1	39
61	61	1	40
62	62	1	41
63	63	1	42
64	64	1	43
65	65	1	44
66	66	1	45
67	67	1	46
68	68	1	47
69	69	1	48
70	70	1	49
71	71	1	50
72	72	1	51
73	73	1	52
74	74	1	53
75	75	1	54
76	76	1	55
77	77	1	56
78	78	1	57
79	79	1	58
80	80	1	59
81	81	1	60
82	82	1	61
83	83	1	62
84	84	1	63
104	104	2	16
105	105	2	17
106	106	2	18
108	108	2	20
139	139	1	64
140	140	1	65
141	141	1	66
142	142	2	21
143	143	2	22
144	144	2	23
\.


--
-- TOC entry 4709 (class 0 OID 29482)
-- Dependencies: 321
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_roles (id, document_id, name, code, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	k6k2g75z0rhg88wecmiskic2	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2025-02-01 21:57:57.803	2025-02-01 21:57:57.803	2025-02-01 21:57:57.804	\N	\N	\N
3	o1vnejtvpa7gbbeqtnd2x4ut	Author	strapi-author	Authors can manage the content they have created.	2025-02-01 21:57:57.997	2025-02-01 21:57:57.997	2025-02-01 21:57:57.997	\N	\N	\N
2	enblho6uk9aj57e0w6idjzb0	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2025-02-01 21:57:57.912	2025-02-05 20:12:14.368	2025-02-01 21:57:57.912	\N	\N	\N
\.


--
-- TOC entry 4707 (class 0 OID 29470)
-- Dependencies: 319
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users (id, document_id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	e2pkv201af73v4gwc3qa3jkn	MJM-Coding	\N	\N	j.mos@live.fr	$2a$10$F/TjUfLrycpG3Sz9LCQf1er5JdUz0lAg5uKOoYQsUX.PIXdJX9vMa	\N	\N	t	f	\N	2025-02-01 22:05:41.075	2025-02-01 22:05:41.075	2025-02-01 22:05:41.075	\N	\N	\N
2	d0djscfs5jf8i6ys8dcmxib8	HCR		\N	ragazaaa5454@gmail.com	$2a$10$2Fk5qqoSC0ScPJgblLNY3eiB1yabzbPslT5dQNlQsbT1XMI.A9ARq	\N	c95ad337d83e9b5f6fec7c713b94e0dd3f14023c	t	f	\N	2025-02-03 09:49:02.224	2025-02-03 09:49:54.058	2025-02-03 09:49:02.224	\N	\N	\N
\.


--
-- TOC entry 4745 (class 0 OID 29689)
-- Dependencies: 357
-- Data for Name: admin_users_roles_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users_roles_lnk (id, user_id, role_id, role_ord, user_ord) FROM stdin;
1	1	1	1	1
2	2	2	1	1
\.


--
-- TOC entry 4755 (class 0 OID 34919)
-- Dependencies: 367
-- Data for Name: components_bloc_contenu_contenus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_bloc_contenu_contenus (id, contenu) FROM stdin;
2	HCR met son savoir-faire au service de vos projets avec un travail soigné et de qualité. Chaque réalisation est faite avec sérieux et exigence pour garantir votre satisfaction.
1	HCR met son savoir-faire au service de vos projets avec un travail soigné et de qualité. Chaque réalisation est faite avec sérieux et exigence pour garantir votre satisfaction.
3	HCR met son savoir-faire au service de vos projets avec un travail soigné et de qualité. Chaque réalisation est faite avec sérieux et exigence pour garantir votre satisfaction.
\.


--
-- TOC entry 4759 (class 0 OID 34986)
-- Dependencies: 371
-- Data for Name: components_bloc_contenu_rich_contenus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_bloc_contenu_rich_contenus (id, rich_contenu) FROM stdin;
1	[{"type": "paragraph", "children": [{"text": "Je suis à votre disposition pour réaliser une large gamme de travaux dans votre habitat, qu'il s'agisse d'une rénovation complète ou de petits travaux spécifiques. Je mets mon expertise à votre service pour donner vie à vos projets.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Je m'engage à offrir des services de ", "type": "text"}, {"bold": true, "text": "qualité", "type": "text"}, {"text": ", réalisés dans les règles de l'art, avec un souci constant du détail. Quel que soit le type de projet (entretien, rénovation ou installation spécifique), je vous accompagne tout au long du processus, de la conception à la réalisation.", "type": "text"}]}]
2	[{"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Remise à neuf :", "type": "text"}, {"text": " Modernisation et rafraîchissement de vos sols pour un intérieur plus harmonieux.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Matériaux adaptés :", "type": "text"}, {"text": " Pose et rénovation avec des matériaux de qualité, choisis selon vos besoins et votre style.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": " Finition impeccable :", "type": "text"}, {"text": " Un travail précis et soigné pour un rendu esthétique et durable.", "type": "text"}]}]}]
3	[{"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Préparation et réparation", "type": "text"}, {"text": " : Rebouchage des fissures, lissage et traitement des surfaces pour une base impeccable.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Finitions de qualité ", "type": "text"}, {"text": ": Application de peintures, enduits ou revêtements avec précision pour un rendu uniforme.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Soin du détail :", "type": "text"}, {"text": " Un travail minutieux pour des murs et plafonds propres, nets et durables.", "type": "text"}]}]}]
4	[{"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Installation sur mesure", "type": "text"}, {"text": " : Pose de volets roulants adaptés à vos ouvertures pour une intégration parfaite.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Motorisation fiable :", "type": "text"}, {"text": " Automatisation de vos volets pour plus de confort et de praticité au quotidien.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Qualité et durabilité : ", "type": "text"}, {"text": "Un travail soigné avec des équipements robustes pour une utilisation durable.", "type": "text"}]}]}]
5	\N
8	[{"type": "paragraph", "children": [{"text": "Je suis à votre disposition pour réaliser une large gamme de travaux dans votre habitat, qu'il s'agisse d'une rénovation complète ou de petits travaux spécifiques. Je mets mon expertise à votre service pour donner vie à vos projets.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Je m'engage à offrir des services de ", "type": "text"}, {"bold": true, "text": "qualité", "type": "text"}, {"text": ", réalisés dans les règles de l'art, avec un souci constant du détail. Quel que soit le type de projet (entretien, rénovation ou installation spécifique), je vous accompagne tout au long du processus, de la conception à la réalisation.", "type": "text"}]}]
9	[{"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Remise à neuf :", "type": "text"}, {"text": " Modernisation et rafraîchissement de vos sols pour un intérieur plus harmonieux.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Matériaux adaptés :", "type": "text"}, {"text": " Pose et rénovation avec des matériaux de qualité, choisis selon vos besoins et votre style.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": " Finition impeccable :", "type": "text"}, {"text": " Un travail précis et soigné pour un rendu esthétique et durable.", "type": "text"}]}]}]
10	[{"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Préparation et réparation", "type": "text"}, {"text": " : Rebouchage des fissures, lissage et traitement des surfaces pour une base impeccable.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Finitions de qualité ", "type": "text"}, {"text": ": Application de peintures, enduits ou revêtements avec précision pour un rendu uniforme.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Soin du détail :", "type": "text"}, {"text": " Un travail minutieux pour des murs et plafonds propres, nets et durables.", "type": "text"}]}]}]
11	[{"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Installation sur mesure", "type": "text"}, {"text": " : Pose de volets roulants adaptés à vos ouvertures pour une intégration parfaite.", "type": "text"}]}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Motorisation fiable :", "type": "text"}, {"text": " Automatisation de vos volets pour plus de confort et de praticité au quotidien.", "type": "text"}]}]}, {"type": "paragraph", "children": [{"bold": true, "text": "", "type": "text"}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Qualité et durabilité : ", "type": "text"}, {"text": "Un travail soigné avec des équipements robustes pour une utilisation durable.", "type": "text"}]}]}]
12	\N
13	\N
14	\N
15	[{"type": "paragraph", "children": [{"text": "Découvrez mes rénovations et transformations à travers une sélection de photos avant/après. Chaque projet met en lumière mon expertise et mon savoir faire. Du premier coup de pinceau à la touche finale.", "type": "text"}]}]
17	[{"type": "paragraph", "children": [{"text": "test", "type": "text"}]}]
16	[{"type": "paragraph", "children": [{"text": "test", "type": "text"}]}]
18	[{"type": "paragraph", "children": [{"text": "test", "type": "text"}]}]
6	\N
7	\N
61	[{"type": "paragraph", "children": [{"text": "Je suis à votre disposition pour réaliser une large gamme de travaux dans votre habitat, qu'il s'agisse d'une rénovation complète ou de petits travaux spécifiques. Je mets mon expertise à votre service pour donner vie à vos projets.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Je m'engage à offrir des services de ", "type": "text"}, {"bold": true, "text": "qualité", "type": "text"}, {"text": ", réalisés dans les règles de l'art, avec un souci constant du détail. Quel que soit le type de projet (entretien, rénovation ou installation spécifique), je vous accompagne tout au long du processus, de la conception à la réalisation.", "type": "text"}]}]
62	[{"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Remise à neuf :", "type": "text"}, {"text": " Modernisation et rafraîchissement de vos sols pour un intérieur plus harmonieux.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Matériaux adaptés :", "type": "text"}, {"text": " Pose et rénovation avec des matériaux de qualité, choisis selon vos besoins et votre style.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": " Finition impeccable :", "type": "text"}, {"text": " Un travail précis et soigné pour un rendu esthétique et durable.", "type": "text"}]}]}]
63	[{"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Préparation et réparation", "type": "text"}, {"text": " : Rebouchage des fissures, lissage et traitement des surfaces pour une base impeccable.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Finitions de qualité ", "type": "text"}, {"text": ": Application de peintures, enduits ou revêtements avec précision pour un rendu uniforme.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Soin du détail :", "type": "text"}, {"text": " Un travail minutieux pour des murs et plafonds propres, nets et durables.", "type": "text"}]}]}]
64	[{"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Installation sur mesure", "type": "text"}, {"text": " : Pose de volets roulants adaptés à vos ouvertures pour une intégration parfaite.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Motorisation fiable :", "type": "text"}, {"text": " Automatisation de vos volets pour plus de confort et de praticité au quotidien.", "type": "text"}]}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"bold": true, "text": "Qualité et durabilité : ", "type": "text"}, {"text": "Un travail soigné avec des équipements robustes pour une utilisation durable.", "type": "text"}]}]}]
65	\N
66	\N
67	\N
\.


--
-- TOC entry 4761 (class 0 OID 35038)
-- Dependencies: 373
-- Data for Name: components_bloc_image_image_avants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_bloc_image_image_avants (id) FROM stdin;
2
1
3
\.


--
-- TOC entry 4757 (class 0 OID 34949)
-- Dependencies: 369
-- Data for Name: components_bloc_image_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_bloc_image_images (id) FROM stdin;
3
2
4
5
6
7
8
52
53
54
55
56
57
9
10
11
12
13
14
1
21
\.


--
-- TOC entry 4753 (class 0 OID 34910)
-- Dependencies: 365
-- Data for Name: components_bloc_titre_bloc_titres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_bloc_titre_bloc_titres (id, titre) FROM stdin;
4	Les services 
5	Rénovation des sols
3	Bienvenue chez HCR
6	Murs et plafonds
7	Volets roulants
8	\N
9	\N
10	\N
69	Les services 
70	Rénovation des sols
71	Murs et plafonds
72	Volets roulants
73	\N
74	\N
75	\N
11	Les services 
12	Rénovation des sols
13	Murs et plafonds
14	Volets roulants
15	\N
16	\N
17	\N
19	Cuisine
18	Réalisations
22	Réalisations
23	Cuisine
20	Réalisations
21	Cuisine
24	Réalisations
25	Cuisine
2	Bienvenue chez HCR
33	Bienvenue chez HCR
\.


--
-- TOC entry 4685 (class 0 OID 29328)
-- Dependencies: 297
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, document_id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
2	hmkcutp3fotymbmr4ey45rz2	1.webp	\N	\N	5472	3648	{"large": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/large_1.webp-af05793ab5c13ceba524cea9a5c02585.webp", "hash": "af05793ab5c13ceba524cea9a5c02585", "mime": "image/jpeg", "name": "large_1.webp", "path": null, "size": 130, "width": 1000, "height": 667, "sizeInBytes": 129999}, "small": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_1.webp-46ae9faff8b367a48810f2dde1a6d791.webp", "hash": "46ae9faff8b367a48810f2dde1a6d791", "mime": "image/jpeg", "name": "small_1.webp", "path": null, "size": 41.88, "width": 500, "height": 333, "sizeInBytes": 41875}, "medium": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/medium_1.webp-c34a1416b8caa07b64f4c8273766fbad.webp", "hash": "c34a1416b8caa07b64f4c8273766fbad", "mime": "image/jpeg", "name": "medium_1.webp", "path": null, "size": 82.69, "width": 750, "height": 500, "sizeInBytes": 82692}, "thumbnail": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_1.webp-a668b80b50419bb3e08712d3012c14e9.webp", "hash": "a668b80b50419bb3e08712d3012c14e9", "mime": "image/jpeg", "name": "thumbnail_1.webp", "path": null, "size": 11.95, "width": 234, "height": 156, "sizeInBytes": 11947}}	cc08c65734f4394750ea987b1416373b	.webp	image/jpeg	1826.56	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/1.webp-cc08c65734f4394750ea987b1416373b.webp	\N	strapi-provider-upload-supabase	\N	/	2025-02-03 10:33:18.729	2025-02-03 11:03:02.153	2025-02-03 10:33:18.731	1	1	\N
3	d1dbdjs76jzogaj8kaoy5pms	sols.webp	\N	\N	1280	726	{"large": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/large_sols.webp-9a374aa0454b041b36cb2ab9f17ee160.webp", "hash": "9a374aa0454b041b36cb2ab9f17ee160", "mime": "image/webp", "name": "large_sols.webp", "path": null, "size": 34.72, "width": 1000, "height": 567, "sizeInBytes": 34716}, "small": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_sols.webp-bcfc7be9dcf6ebfc979c284d83969761.webp", "hash": "bcfc7be9dcf6ebfc979c284d83969761", "mime": "image/webp", "name": "small_sols.webp", "path": null, "size": 13.7, "width": 500, "height": 284, "sizeInBytes": 13702}, "medium": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/medium_sols.webp-00b89515ee56191878ad3f84fcd89c9f.webp", "hash": "00b89515ee56191878ad3f84fcd89c9f", "mime": "image/webp", "name": "medium_sols.webp", "path": null, "size": 24.46, "width": 750, "height": 425, "sizeInBytes": 24458}, "thumbnail": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_sols.webp-9dfb7f4b83d5c3018cd6c1576ed78f69.webp", "hash": "9dfb7f4b83d5c3018cd6c1576ed78f69", "mime": "image/webp", "name": "thumbnail_sols.webp", "path": null, "size": 4.84, "width": 245, "height": 139, "sizeInBytes": 4844}}	5e347aa5c6de5d3ade42cd220eca7717	.webp	image/webp	55.77	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/sols.webp-5e347aa5c6de5d3ade42cd220eca7717.webp	\N	strapi-provider-upload-supabase	\N	/	2025-02-03 14:20:09.837	2025-02-03 14:20:09.837	2025-02-03 14:20:09.838	1	1	\N
4	ga2bqwqnqxeuteo3eypix2fr	Enduire-un-plafond-comme-un-pro.webp	\N	\N	1688	1125	{"large": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/large_Enduire-un-plafond-comme-un-pro.webp-5124c93db942aee8f98479d89f99b265.webp", "hash": "5124c93db942aee8f98479d89f99b265", "mime": "image/webp", "name": "large_Enduire-un-plafond-comme-un-pro.webp", "path": null, "size": 16.68, "width": 1000, "height": 666, "sizeInBytes": 16680}, "small": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_Enduire-un-plafond-comme-un-pro.webp-f3e3d8bd0ea2045f8cc4fd00ea7cd8cc.webp", "hash": "f3e3d8bd0ea2045f8cc4fd00ea7cd8cc", "mime": "image/webp", "name": "small_Enduire-un-plafond-comme-un-pro.webp", "path": null, "size": 4.86, "width": 500, "height": 333, "sizeInBytes": 4864}, "medium": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/medium_Enduire-un-plafond-comme-un-pro.webp-0312b9937f7cd0b57b4dee79121cad7a.webp", "hash": "0312b9937f7cd0b57b4dee79121cad7a", "mime": "image/webp", "name": "medium_Enduire-un-plafond-comme-un-pro.webp", "path": null, "size": 9.98, "width": 750, "height": 500, "sizeInBytes": 9978}, "thumbnail": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_Enduire-un-plafond-comme-un-pro.webp-666f4059bc5fa109a64187dfaea04c6e.webp", "hash": "666f4059bc5fa109a64187dfaea04c6e", "mime": "image/webp", "name": "thumbnail_Enduire-un-plafond-comme-un-pro.webp", "path": null, "size": 1.48, "width": 234, "height": 156, "sizeInBytes": 1480}}	0d859e5337939ca90eb1a9947594704e	.webp	image/webp	41.75	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/Enduire-un-plafond-comme-un-pro.webp-0d859e5337939ca90eb1a9947594704e.webp	\N	strapi-provider-upload-supabase	\N	/	2025-02-03 22:05:21.982	2025-02-03 22:05:21.982	2025-02-03 22:05:21.986	1	1	\N
5	juc9j7gyowd9tglm7tegtgdl	salle de bain.jpg	\N	\N	960	640	{"small": {"ext": ".jpg", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_salle de bain.jpg-b57e47c47c7cdc095a8310edbb83e77d.jpg", "hash": "b57e47c47c7cdc095a8310edbb83e77d", "mime": "image/jpeg", "name": "small_salle de bain.jpg", "path": null, "size": 28.48, "width": 500, "height": 333, "sizeInBytes": 28476}, "medium": {"ext": ".jpg", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/medium_salle de bain.jpg-6f29ba5a1661b5d4e1dce50e1d6c05fb.jpg", "hash": "6f29ba5a1661b5d4e1dce50e1d6c05fb", "mime": "image/jpeg", "name": "medium_salle de bain.jpg", "path": null, "size": 58.79, "width": 750, "height": 500, "sizeInBytes": 58794}, "thumbnail": {"ext": ".jpg", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_salle de bain.jpg-b85c346614a8dd5e6384e996d616545f.jpg", "hash": "b85c346614a8dd5e6384e996d616545f", "mime": "image/jpeg", "name": "thumbnail_salle de bain.jpg", "path": null, "size": 7.46, "width": 234, "height": 156, "sizeInBytes": 7460}}	7c1c1d5f765b78146a892d27fef8104b	.jpg	image/jpeg	90.59	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/salle de bain.jpg-7c1c1d5f765b78146a892d27fef8104b.jpg	\N	strapi-provider-upload-supabase	\N	/	2025-02-04 10:18:39.056	2025-02-04 10:18:39.056	2025-02-04 10:18:39.061	1	1	\N
7	g8416jyy0nghc4gqrdl0wjzp	cuisine avant.png	\N	\N	787	487	{"small": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_cuisine avant.png-8881aa667b3ca320e0800ade6806031c.png", "hash": "8881aa667b3ca320e0800ade6806031c", "mime": "image/png", "name": "small_cuisine avant.png", "path": null, "size": 249.7, "width": 500, "height": 309, "sizeInBytes": 249695}, "medium": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/medium_cuisine avant.png-1e42a6f2b5db724d97c7d8560400d387.png", "hash": "1e42a6f2b5db724d97c7d8560400d387", "mime": "image/png", "name": "medium_cuisine avant.png", "path": null, "size": 495.9, "width": 750, "height": 464, "sizeInBytes": 495895}, "thumbnail": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_cuisine avant.png-8c824aa42291a5016c580e1810a2806b.png", "hash": "8c824aa42291a5016c580e1810a2806b", "mime": "image/png", "name": "thumbnail_cuisine avant.png", "path": null, "size": 71.98, "width": 245, "height": 152, "sizeInBytes": 71984}}	2915a591c6e6a43e9be1e3407e024a48	.png	image/png	122.87	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/cuisine avant.png-2915a591c6e6a43e9be1e3407e024a48.png	\N	strapi-provider-upload-supabase	\N	/	2025-02-04 12:01:23.765	2025-02-04 12:01:23.765	2025-02-04 12:01:23.766	1	1	\N
8	gjmyzmn693z81jn9r3r91du7	cuisineapres.png	\N	\N	792	602	{"small": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_cuisineapres.png-f2e90d6231a12ca951e35b0b469b14af.png", "hash": "f2e90d6231a12ca951e35b0b469b14af", "mime": "image/png", "name": "small_cuisineapres.png", "path": null, "size": 371.42, "width": 500, "height": 380, "sizeInBytes": 371415}, "medium": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/medium_cuisineapres.png-ddfa094efcbd38cb031743534346d0d8.png", "hash": "ddfa094efcbd38cb031743534346d0d8", "mime": "image/png", "name": "medium_cuisineapres.png", "path": null, "size": 767.64, "width": 750, "height": 570, "sizeInBytes": 767643}, "thumbnail": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_cuisineapres.png-2c7fe8a3f5b89c5e9297567d6a93f44a.png", "hash": "2c7fe8a3f5b89c5e9297567d6a93f44a", "mime": "image/png", "name": "thumbnail_cuisineapres.png", "path": null, "size": 73.84, "width": 205, "height": 156, "sizeInBytes": 73842}}	f9912f6f49c254282e8e796b82953dba	.png	image/png	210.04	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/cuisineapres.png-f9912f6f49c254282e8e796b82953dba.png	\N	strapi-provider-upload-supabase	\N	/	2025-02-04 12:01:36.191	2025-02-04 12:01:36.191	2025-02-04 12:01:36.192	1	1	\N
9	n16gb2jj41kl98hz07825gb5	sdbavant.png	\N	\N	542	424	{"small": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_sdbavant.png-6650de99c085147f47caa5c4aff98be9.png", "hash": "6650de99c085147f47caa5c4aff98be9", "mime": "image/png", "name": "small_sdbavant.png", "path": null, "size": 351.8, "width": 500, "height": 391, "sizeInBytes": 351804}, "thumbnail": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_sdbavant.png-9ca16117f39f47a167a474e90e34d818.png", "hash": "9ca16117f39f47a167a474e90e34d818", "mime": "image/png", "name": "thumbnail_sdbavant.png", "path": null, "size": 68.39, "width": 199, "height": 156, "sizeInBytes": 68387}}	4f3373bcd743b9098ce7d5d1fa95a052	.png	image/png	97.72	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/sdbavant.png-4f3373bcd743b9098ce7d5d1fa95a052.png	\N	strapi-provider-upload-supabase	\N	/	2025-02-04 12:02:31.315	2025-02-04 12:02:31.315	2025-02-04 12:02:31.316	1	1	\N
10	c51ktwqeb298rhfsn1ebtxhr	sdbapres.png	\N	\N	536	396	{"small": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_sdbapres.png-79d03e570ed0663ea65f3345bb600e52.png", "hash": "79d03e570ed0663ea65f3345bb600e52", "mime": "image/png", "name": "small_sdbapres.png", "path": null, "size": 223.8, "width": 500, "height": 369, "sizeInBytes": 223796}, "thumbnail": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_sdbapres.png-5ad01582ac608b2e3dbb047bc6e1781d.png", "hash": "5ad01582ac608b2e3dbb047bc6e1781d", "mime": "image/png", "name": "thumbnail_sdbapres.png", "path": null, "size": 50.16, "width": 211, "height": 156, "sizeInBytes": 50156}}	66e6cd22775a3e345fe376a5eca5ef79	.png	image/png	60.10	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/sdbapres.png-66e6cd22775a3e345fe376a5eca5ef79.png	\N	strapi-provider-upload-supabase	\N	/	2025-02-04 12:02:45.314	2025-02-04 12:02:45.314	2025-02-04 12:02:45.315	1	1	\N
11	m9tco2jae9wsyx1jqdephdec	cuisine avant.png	\N	\N	787	487	{"small": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_cuisine avant.png-29a2102d8d81ad443b157d61e58c3f5b.png", "hash": "29a2102d8d81ad443b157d61e58c3f5b", "mime": "image/png", "name": "small_cuisine avant.png", "path": null, "size": 249.7, "width": 500, "height": 309, "sizeInBytes": 249695}, "medium": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/medium_cuisine avant.png-95e3ce028b4be87f4c5edf3b15626203.png", "hash": "95e3ce028b4be87f4c5edf3b15626203", "mime": "image/png", "name": "medium_cuisine avant.png", "path": null, "size": 495.9, "width": 750, "height": 464, "sizeInBytes": 495895}, "thumbnail": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_cuisine avant.png-c025296132bab0f471c254bb7d9d10b5.png", "hash": "c025296132bab0f471c254bb7d9d10b5", "mime": "image/png", "name": "thumbnail_cuisine avant.png", "path": null, "size": 71.98, "width": 245, "height": 152, "sizeInBytes": 71984}}	b32908b7445dc31f9e2daf314ba1179a	.png	image/png	122.87	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/cuisine avant.png-b32908b7445dc31f9e2daf314ba1179a.png	\N	strapi-provider-upload-supabase	\N	/	2025-02-04 13:30:15.981	2025-02-04 13:30:15.981	2025-02-04 13:30:15.982	1	1	\N
12	o42hsu5bjomew6b4h6210fh5	cuisineapres.png	\N	\N	792	602	{"small": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_cuisineapres.png-f4ea77762bd85842f2912acc568cf445.png", "hash": "f4ea77762bd85842f2912acc568cf445", "mime": "image/png", "name": "small_cuisineapres.png", "path": null, "size": 371.42, "width": 500, "height": 380, "sizeInBytes": 371415}, "medium": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/medium_cuisineapres.png-26275069a26bfa497fd9c2f66c40c008.png", "hash": "26275069a26bfa497fd9c2f66c40c008", "mime": "image/png", "name": "medium_cuisineapres.png", "path": null, "size": 767.64, "width": 750, "height": 570, "sizeInBytes": 767643}, "thumbnail": {"ext": ".png", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_cuisineapres.png-aae208b2dd8b44b1446e5c7630cb5ff3.png", "hash": "aae208b2dd8b44b1446e5c7630cb5ff3", "mime": "image/png", "name": "thumbnail_cuisineapres.png", "path": null, "size": 73.84, "width": 205, "height": 156, "sizeInBytes": 73842}}	28886d0b08f23a1bf3bf62ce4cb8f85c	.png	image/png	210.04	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/cuisineapres.png-28886d0b08f23a1bf3bf62ce4cb8f85c.png	\N	strapi-provider-upload-supabase	\N	/	2025-02-04 13:30:16.088	2025-02-04 14:02:36.397	2025-02-04 13:30:16.088	1	1	\N
13	hl5uh7rgvtrhgui4sa6yk78u	handyman-construction-site-process-drilling-wall-with-perforator.jpg	\N	\N	5472	3648	{"large": {"ext": ".jpg", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/large_handyman-construction-site-process-drilling-wall-with-perforator.jpg-e74b696d7e448b777ad7fca3a2da92d5.jpg", "hash": "e74b696d7e448b777ad7fca3a2da92d5", "mime": "image/jpeg", "name": "large_handyman-construction-site-process-drilling-wall-with-perforator.jpg", "path": null, "size": 130, "width": 1000, "height": 667, "sizeInBytes": 129999}, "small": {"ext": ".jpg", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_handyman-construction-site-process-drilling-wall-with-perforator.jpg-13f29dbaed6abc0d569a8e8cf1ab7232.jpg", "hash": "13f29dbaed6abc0d569a8e8cf1ab7232", "mime": "image/jpeg", "name": "small_handyman-construction-site-process-drilling-wall-with-perforator.jpg", "path": null, "size": 41.88, "width": 500, "height": 333, "sizeInBytes": 41875}, "medium": {"ext": ".jpg", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/medium_handyman-construction-site-process-drilling-wall-with-perforator.jpg-c21c077ca28d415534db38c7135246fd.jpg", "hash": "c21c077ca28d415534db38c7135246fd", "mime": "image/jpeg", "name": "medium_handyman-construction-site-process-drilling-wall-with-perforator.jpg", "path": null, "size": 82.69, "width": 750, "height": 500, "sizeInBytes": 82692}, "thumbnail": {"ext": ".jpg", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_handyman-construction-site-process-drilling-wall-with-perforator.jpg-af1e59a2cd28100ebd13fa14928ab4f4.jpg", "hash": "af1e59a2cd28100ebd13fa14928ab4f4", "mime": "image/jpeg", "name": "thumbnail_handyman-construction-site-process-drilling-wall-with-perforator.jpg", "path": null, "size": 11.95, "width": 234, "height": 156, "sizeInBytes": 11947}}	ffe021b4ac0616448cd943a7eff4e59a	.jpg	image/jpeg	1826.56	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/handyman-construction-site-process-drilling-wall-with-perforator.jpg-ffe021b4ac0616448cd943a7eff4e59a.jpg	\N	strapi-provider-upload-supabase	\N	/	2025-02-05 15:08:51.209	2025-02-05 15:08:51.209	2025-02-05 15:08:51.215	1	1	\N
14	kmp53dv6w7lol5nfprux4qns	sols.webp	\N	\N	1280	726	{"large": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/large_sols.webp-d85d8c0b8ceafb94d56a4d632de6f380.webp", "hash": "d85d8c0b8ceafb94d56a4d632de6f380", "mime": "image/webp", "name": "large_sols.webp", "path": null, "size": 34.72, "width": 1000, "height": 567, "sizeInBytes": 34716}, "small": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_sols.webp-fdbfe7853b378088ee9df5955a3e4044.webp", "hash": "fdbfe7853b378088ee9df5955a3e4044", "mime": "image/webp", "name": "small_sols.webp", "path": null, "size": 13.7, "width": 500, "height": 284, "sizeInBytes": 13702}, "medium": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/medium_sols.webp-97a07797e7c814b214a00ad7f15f5b73.webp", "hash": "97a07797e7c814b214a00ad7f15f5b73", "mime": "image/webp", "name": "medium_sols.webp", "path": null, "size": 24.46, "width": 750, "height": 425, "sizeInBytes": 24458}, "thumbnail": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_sols.webp-be3d021f66cc3a2ddf16ddb5b3ae5b63.webp", "hash": "be3d021f66cc3a2ddf16ddb5b3ae5b63", "mime": "image/webp", "name": "thumbnail_sols.webp", "path": null, "size": 4.84, "width": 245, "height": 139, "sizeInBytes": 4844}}	d2875aa35d2127893f1855488c389d50	.webp	image/webp	55.77	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/sols.webp-d2875aa35d2127893f1855488c389d50.webp	\N	strapi-provider-upload-supabase	\N	/	2025-02-05 15:16:08.073	2025-02-05 15:16:08.073	2025-02-05 15:16:08.074	1	1	\N
15	g9np109svgsmeuhne3eear6o	Enduire-un-plafond-comme-un-pro.webp	\N	\N	1688	1125	{"large": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/large_Enduire-un-plafond-comme-un-pro.webp-71f9fc056f570b612a5c2b8a352aa590.webp", "hash": "71f9fc056f570b612a5c2b8a352aa590", "mime": "image/webp", "name": "large_Enduire-un-plafond-comme-un-pro.webp", "path": null, "size": 16.68, "width": 1000, "height": 666, "sizeInBytes": 16680}, "small": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_Enduire-un-plafond-comme-un-pro.webp-6bbf3a87aefba09fa79825be066dbd12.webp", "hash": "6bbf3a87aefba09fa79825be066dbd12", "mime": "image/webp", "name": "small_Enduire-un-plafond-comme-un-pro.webp", "path": null, "size": 4.86, "width": 500, "height": 333, "sizeInBytes": 4864}, "medium": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/medium_Enduire-un-plafond-comme-un-pro.webp-bb62724d039deb0211af523088313b44.webp", "hash": "bb62724d039deb0211af523088313b44", "mime": "image/webp", "name": "medium_Enduire-un-plafond-comme-un-pro.webp", "path": null, "size": 9.98, "width": 750, "height": 500, "sizeInBytes": 9978}, "thumbnail": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_Enduire-un-plafond-comme-un-pro.webp-6532319c42dae2cdf8b65335b2d9cee5.webp", "hash": "6532319c42dae2cdf8b65335b2d9cee5", "mime": "image/webp", "name": "thumbnail_Enduire-un-plafond-comme-un-pro.webp", "path": null, "size": 1.48, "width": 234, "height": 156, "sizeInBytes": 1480}}	69e8001b304a40fd5fe52b667d16762a	.webp	image/webp	41.75	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/Enduire-un-plafond-comme-un-pro.webp-69e8001b304a40fd5fe52b667d16762a.webp	\N	strapi-provider-upload-supabase	\N	/	2025-02-05 15:17:57.444	2025-02-05 15:17:57.444	2025-02-05 15:17:57.445	1	1	\N
6	wz8xvrb2fcswyyx7otnp4mln	volets.jpg	\N	\N	860	400	{"small": {"ext": ".jpg", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_volets.jpg-221dac9d13ac8cb43fce4d2370d65558.jpg", "hash": "221dac9d13ac8cb43fce4d2370d65558", "mime": "image/jpeg", "name": "small_volets.jpg", "path": null, "size": 13.16, "width": 500, "height": 233, "sizeInBytes": 13156}, "medium": {"ext": ".jpg", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/medium_volets.jpg-da82b0c2eb3a2cd3154da268baeeb6fb.jpg", "hash": "da82b0c2eb3a2cd3154da268baeeb6fb", "mime": "image/jpeg", "name": "medium_volets.jpg", "path": null, "size": 24.47, "width": 750, "height": 349, "sizeInBytes": 24473}, "thumbnail": {"ext": ".jpg", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_volets.jpg-37fe08505b4fd2fcadede92dea7d4f54.jpg", "hash": "37fe08505b4fd2fcadede92dea7d4f54", "mime": "image/jpeg", "name": "thumbnail_volets.jpg", "path": null, "size": 4.29, "width": 245, "height": 114, "sizeInBytes": 4292}}	aceb4e1de501b577bd56192cde537a00	.jpg	image/jpeg	26.50	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/volets.jpg-aceb4e1de501b577bd56192cde537a00.jpg	\N	strapi-provider-upload-supabase	\N	/	2025-02-04 10:18:56.052	2025-02-05 15:19:09.2	2025-02-04 10:18:56.054	1	1	\N
16	y5v20o0f9d9xve5hl2xgp6te	sols.webp	\N	\N	1280	726	{"large": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/large_sols.webp-c9f4b297b062bfd75b86bc75956534a0.webp", "hash": "c9f4b297b062bfd75b86bc75956534a0", "mime": "image/webp", "name": "large_sols.webp", "path": null, "size": 34.72, "width": 1000, "height": 567, "sizeInBytes": 34716}, "small": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/small_sols.webp-e922f8a2ab7c1d502d6a5f7a269b014d.webp", "hash": "e922f8a2ab7c1d502d6a5f7a269b014d", "mime": "image/webp", "name": "small_sols.webp", "path": null, "size": 13.7, "width": 500, "height": 284, "sizeInBytes": 13702}, "medium": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/medium_sols.webp-bc26007c2bfd2956dfa0aea3e42ce6bf.webp", "hash": "bc26007c2bfd2956dfa0aea3e42ce6bf", "mime": "image/webp", "name": "medium_sols.webp", "path": null, "size": 24.46, "width": 750, "height": 425, "sizeInBytes": 24458}, "thumbnail": {"ext": ".webp", "url": "https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/thumbnail_sols.webp-64f2e43779f83bf63670056da996e18a.webp", "hash": "64f2e43779f83bf63670056da996e18a", "mime": "image/webp", "name": "thumbnail_sols.webp", "path": null, "size": 4.84, "width": 245, "height": 139, "sizeInBytes": 4844}}	09782499fa7f1bd19903c33820d62496	.webp	image/webp	55.77	https://zwczzbcaihukhtmpvapl.supabase.co/storage/v1/object/public/Strapi-uploads/strapi-uploads/sols.webp-09782499fa7f1bd19903c33820d62496.webp	\N	strapi-provider-upload-supabase	\N	/	2025-02-05 16:23:06.122	2025-02-05 16:23:06.122	2025-02-05 16:23:06.127	1	1	\N
\.


--
-- TOC entry 4727 (class 0 OID 29582)
-- Dependencies: 339
-- Data for Name: files_folder_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_folder_lnk (id, file_id, folder_id, file_ord) FROM stdin;
\.


--
-- TOC entry 4725 (class 0 OID 29570)
-- Dependencies: 337
-- Data for Name: files_related_mph; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_related_mph (id, file_id, related_id, related_type, field, "order") FROM stdin;
201	13	2	bloc-image.image	image	1
211	14	9	bloc-image.image	image	1
212	15	10	bloc-image.image	image	1
213	6	11	bloc-image.image	image	1
218	11	2	bloc-image.image-avant	imageAvant	1
219	12	2	bloc-image.image-avant	imageApres	1
220	11	1	bloc-image.image-avant	imageAvant	1
221	12	1	bloc-image.image-avant	imageApres	1
222	11	3	bloc-image.image-avant	imageAvant	1
223	12	3	bloc-image.image-avant	imageApres	1
230	13	1	bloc-image.image	image	1
231	13	21	bloc-image.image	image	1
176	11	2	image.bloc-avant-apres	imageAvant	1
177	9	3	image.bloc-avant-apres	imageAvant	1
178	12	2	image.bloc-avant-apres	imageApres	1
179	10	3	image.bloc-avant-apres	imageApres	1
180	11	9	image.bloc-avant-apres	imageAvant	1
181	9	10	image.bloc-avant-apres	imageAvant	1
182	12	9	image.bloc-avant-apres	imageApres	1
115	7	1	image.multiple-image	image	1
116	9	2	image.multiple-image	image	1
117	8	1	image.multiple-image	multipleImage	1
118	10	2	image.multiple-image	multipleImage	1
119	7	3	image.multiple-image	image	1
120	9	4	image.multiple-image	image	1
121	8	3	image.multiple-image	multipleImage	1
122	10	4	image.multiple-image	multipleImage	1
183	10	10	image.bloc-avant-apres	imageApres	1
185	4	1	image.bloc-image	image	1
186	4	83	image.bloc-image	image	1
191	3	5	image.bloc-image	image	1
192	4	6	image.bloc-image	image	1
193	5	7	image.bloc-image	image	1
194	6	8	image.bloc-image	image	1
195	3	84	image.bloc-image	image	1
196	4	85	image.bloc-image	image	1
197	5	86	image.bloc-image	image	1
198	6	87	image.bloc-image	image	1
268	16	3	bloc-image.image	image	1
269	15	4	bloc-image.image	image	1
270	6	5	bloc-image.image	image	1
271	16	52	bloc-image.image	image	1
272	15	53	bloc-image.image	image	1
273	6	54	bloc-image.image	image	1
\.


--
-- TOC entry 4689 (class 0 OID 29362)
-- Dependencies: 301
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i18n_locale (id, document_id, name, code, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	lwlup3uw3ys21cnfyy6fkqui	English (en)	en	2025-02-01 21:57:56.795	2025-02-01 21:57:56.795	2025-02-01 21:57:56.797	\N	\N	\N
\.


--
-- TOC entry 4683 (class 0 OID 29316)
-- Dependencies: 295
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages (id, document_id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, slug, type) FROM stdin;
48	fz5n50k2ne7ahfv33r7djlex	2025-02-05 15:38:35.682	2025-02-05 15:47:34.523	\N	1	1	\N	realisations	realisations
50	fz5n50k2ne7ahfv33r7djlex	2025-02-05 15:38:35.682	2025-02-05 15:47:34.523	2025-02-05 15:47:34.974	1	1	\N	realisations	realisations
1	yy6skz8ucwv97ofviczaeb4q	2025-02-02 09:53:05.132	2025-02-05 15:47:50.36	\N	1	1	\N	accueil	accueil
52	yy6skz8ucwv97ofviczaeb4q	2025-02-02 09:53:05.132	2025-02-05 15:47:50.36	2025-02-05 15:47:50.742	1	1	\N	accueil	accueil
24	zot70epjbv2hno9137lk08zk	2025-02-03 14:25:02.947	2025-02-05 19:01:24.971	\N	1	1	\N	services	services
58	zot70epjbv2hno9137lk08zk	2025-02-03 14:25:02.947	2025-02-05 19:01:24.971	2025-02-05 19:01:26.222	1	1	\N	services	services
\.


--
-- TOC entry 4751 (class 0 OID 34872)
-- Dependencies: 363
-- Data for Name: pages_cmps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
483	24	4	bloc-titre.bloc-titre	contenu_flexible	1
484	24	1	bloc-contenu.rich-contenu	contenu_flexible	2
485	24	5	bloc-titre.bloc-titre	contenu_flexible	3
486	24	2	bloc-contenu.rich-contenu	contenu_flexible	4
487	24	3	bloc-image.image	contenu_flexible	5
488	24	6	bloc-titre.bloc-titre	contenu_flexible	6
489	24	3	bloc-contenu.rich-contenu	contenu_flexible	7
490	24	4	bloc-image.image	contenu_flexible	8
491	24	7	bloc-titre.bloc-titre	contenu_flexible	9
492	24	4	bloc-contenu.rich-contenu	contenu_flexible	10
493	24	5	bloc-image.image	contenu_flexible	11
494	24	8	bloc-titre.bloc-titre	contenu_flexible	12
495	24	5	bloc-contenu.rich-contenu	contenu_flexible	13
496	24	6	bloc-image.image	contenu_flexible	14
497	24	9	bloc-titre.bloc-titre	contenu_flexible	15
498	24	6	bloc-contenu.rich-contenu	contenu_flexible	16
499	24	7	bloc-image.image	contenu_flexible	17
500	24	10	bloc-titre.bloc-titre	contenu_flexible	18
501	24	7	bloc-contenu.rich-contenu	contenu_flexible	19
502	24	8	bloc-image.image	contenu_flexible	20
503	58	69	bloc-titre.bloc-titre	contenu_flexible	1
504	58	61	bloc-contenu.rich-contenu	contenu_flexible	2
505	58	70	bloc-titre.bloc-titre	contenu_flexible	3
506	58	62	bloc-contenu.rich-contenu	contenu_flexible	4
189	48	20	bloc-titre.bloc-titre	contenu_flexible	1
190	48	16	bloc-contenu.rich-contenu	contenu_flexible	2
191	48	21	bloc-titre.bloc-titre	contenu_flexible	3
192	48	1	bloc-image.image-avant	contenu_flexible	4
193	50	24	bloc-titre.bloc-titre	contenu_flexible	1
194	50	18	bloc-contenu.rich-contenu	contenu_flexible	2
195	50	25	bloc-titre.bloc-titre	contenu_flexible	3
196	50	3	bloc-image.image-avant	contenu_flexible	4
507	58	52	bloc-image.image	contenu_flexible	5
508	58	71	bloc-titre.bloc-titre	contenu_flexible	6
509	58	63	bloc-contenu.rich-contenu	contenu_flexible	7
510	58	53	bloc-image.image	contenu_flexible	8
511	58	72	bloc-titre.bloc-titre	contenu_flexible	9
512	58	64	bloc-contenu.rich-contenu	contenu_flexible	10
513	58	54	bloc-image.image	contenu_flexible	11
514	58	73	bloc-titre.bloc-titre	contenu_flexible	12
515	58	65	bloc-contenu.rich-contenu	contenu_flexible	13
516	58	55	bloc-image.image	contenu_flexible	14
517	58	74	bloc-titre.bloc-titre	contenu_flexible	15
237	1	2	bloc-titre.bloc-titre	contenu_flexible	1
238	1	1	bloc-contenu.contenu	contenu_flexible	2
239	1	1	bloc-image.image	contenu_flexible	3
240	52	33	bloc-titre.bloc-titre	contenu_flexible	1
241	52	3	bloc-contenu.contenu	contenu_flexible	2
242	52	21	bloc-image.image	contenu_flexible	3
518	58	66	bloc-contenu.rich-contenu	contenu_flexible	16
519	58	56	bloc-image.image	contenu_flexible	17
520	58	75	bloc-titre.bloc-titre	contenu_flexible	18
521	58	67	bloc-contenu.rich-contenu	contenu_flexible	19
522	58	57	bloc-image.image	contenu_flexible	20
\.


--
-- TOC entry 4713 (class 0 OID 29506)
-- Dependencies: 325
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 4747 (class 0 OID 29702)
-- Dependencies: 359
-- Data for Name: strapi_api_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions_token_lnk (id, api_token_permission_id, api_token_id, api_token_permission_ord) FROM stdin;
\.


--
-- TOC entry 4711 (class 0 OID 29494)
-- Dependencies: 323
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_tokens (id, document_id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 4719 (class 0 OID 29542)
-- Dependencies: 331
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
3	plugin_content_manager_configuration_content_types::plugin::upload.file	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]},"uid":"plugin::upload.file"}	object	\N	\N
4	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]},"uid":"plugin::upload.folder"}	object	\N	\N
5	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]},"uid":"plugin::i18n.locale"}	object	\N	\N
6	plugin_content_manager_configuration_content_types::plugin::content-releases.release	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"releasedAt":{"edit":{"label":"releasedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releasedAt","searchable":true,"sortable":true}},"scheduledAt":{"edit":{"label":"scheduledAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"scheduledAt","searchable":true,"sortable":true}},"timezone":{"edit":{"label":"timezone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timezone","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"actions":{"edit":{"label":"actions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"contentType"},"list":{"label":"actions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","releasedAt","scheduledAt"],"edit":[[{"name":"name","size":6},{"name":"releasedAt","size":6}],[{"name":"scheduledAt","size":6},{"name":"timezone","size":6}],[{"name":"status","size":6},{"name":"actions","size":6}]]},"uid":"plugin::content-releases.release"}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::content-releases.release-action	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"contentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentType","searchable":true,"sortable":true}},"entryDocumentId":{"edit":{"label":"entryDocumentId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"entryDocumentId","searchable":true,"sortable":true}},"release":{"edit":{"label":"release","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"release","searchable":true,"sortable":true}},"isEntryValid":{"edit":{"label":"isEntryValid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEntryValid","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","contentType","entryDocumentId"],"edit":[[{"name":"type","size":6},{"name":"contentType","size":6}],[{"name":"entryDocumentId","size":6},{"name":"release","size":6}],[{"name":"isEntryValid","size":4}]]},"uid":"plugin::content-releases.release-action"}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"stages":{"edit":{"label":"stages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stages","searchable":false,"sortable":false}},"stageRequiredToPublish":{"edit":{"label":"stageRequiredToPublish","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stageRequiredToPublish","searchable":true,"sortable":true}},"contentTypes":{"edit":{"label":"contentTypes","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentTypes","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","stages","stageRequiredToPublish"],"edit":[[{"name":"name","size":6},{"name":"stages","size":6}],[{"name":"stageRequiredToPublish","size":6}],[{"name":"contentTypes","size":12}]]},"uid":"plugin::review-workflows.workflow"}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow-stage	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"workflow":{"edit":{"label":"workflow","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"workflow","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","color","workflow"],"edit":[[{"name":"name","size":6},{"name":"color","size":6}],[{"name":"workflow","size":6},{"name":"permissions","size":6}]]},"uid":"plugin::review-workflows.workflow-stage"}	object	\N	\N
1	strapi_content_types_schema	{"api::page.page":{"kind":"collectionType","collectionName":"pages","info":{"singularName":"page","pluralName":"pages","displayName":"pages","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"contenu_flexible":{"type":"dynamiczone","components":["bloc-titre.bloc-titre","bloc-image.image","bloc-contenu.rich-contenu","bloc-contenu.contenu","bloc-image.image-avant"]},"slug":{"type":"string","required":true,"unique":true},"type":{"type":"string","unique":true,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::page.page","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"pages"}}},"apiName":"page","globalId":"Page","uid":"api::page.page","modelType":"contentType","__schema__":{"collectionName":"pages","info":{"singularName":"page","pluralName":"pages","displayName":"pages","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"contenu_flexible":{"type":"dynamiczone","components":["bloc-titre.bloc-titre","bloc-image.image","bloc-contenu.rich-contenu","bloc-contenu.contenu","bloc-image.image-avant"]},"slug":{"type":"string","required":true,"unique":true},"type":{"type":"string","unique":true,"required":true}},"kind":"collectionType"},"modelName":"page","actions":{},"lifecycles":{}},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"files"}}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"plugin":"upload","globalId":"UploadFile","uid":"plugin::upload.file","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"file"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"upload_folders"}}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"plugin":"upload","globalId":"UploadFolder","uid":"plugin::upload.folder","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true}},"kind":"collectionType"},"modelName":"folder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::i18n.locale","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"i18n_locale"}}},"plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale","uid":"plugin::i18n.locale","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"i18n_locale","info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelName":"locale"},"plugin::content-releases.release":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_releases"}}},"plugin":"content-releases","globalId":"ContentReleasesRelease","uid":"plugin::content-releases.release","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"}},"kind":"collectionType"},"modelName":"release"},"plugin::content-releases.release-action":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_release_actions"}}},"plugin":"content-releases","globalId":"ContentReleasesReleaseAction","uid":"plugin::content-releases.release-action","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"}},"kind":"collectionType"},"modelName":"release-action"},"plugin::review-workflows.workflow":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflow","uid":"plugin::review-workflows.workflow","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"}},"kind":"collectionType"},"modelName":"workflow"},"plugin::review-workflows.workflow-stage":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0","draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow-stage","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows_stages"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflowStage","uid":"plugin::review-workflows.workflow-stage","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false}},"kind":"collectionType"},"modelName":"workflow-stage"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_permissions"}}},"plugin":"users-permissions","globalId":"UsersPermissionsPermission","uid":"plugin::users-permissions.permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelName":"permission","options":{"draftAndPublish":false}},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_roles"}}},"plugin":"users-permissions","globalId":"UsersPermissionsRole","uid":"plugin::users-permissions.role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelName":"role","options":{"draftAndPublish":false}},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true,"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"plugin":"users-permissions","globalId":"UsersPermissionsUser","uid":"plugin::users-permissions.user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelName":"user"},"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_permissions"}}},"plugin":"admin","globalId":"AdminPermission","uid":"admin::permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelName":"permission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"plugin":"admin","globalId":"AdminUser","uid":"admin::user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelName":"user","options":{"draftAndPublish":false}},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_roles"}}},"plugin":"admin","globalId":"AdminRole","uid":"admin::role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelName":"role"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_tokens"}}},"plugin":"admin","globalId":"AdminApiToken","uid":"admin::api-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"api-token"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_token_permissions"}}},"plugin":"admin","globalId":"AdminApiTokenPermission","uid":"admin::api-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelName":"api-token-permission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_tokens"}}},"plugin":"admin","globalId":"AdminTransferToken","uid":"admin::transfer-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"transfer-token"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_token_permissions"}}},"plugin":"admin","globalId":"AdminTransferTokenPermission","uid":"admin::transfer-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelName":"transfer-token-permission"}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.permission"}	object	\N	\N
11	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]},"uid":"plugin::users-permissions.role"}	object	\N	\N
12	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.user"}	object	\N	\N
13	plugin_content_manager_configuration_content_types::admin::permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]},"uid":"admin::permission"}	object	\N	\N
23	plugin_i18n_default_locale	"en"	string	\N	\N
25	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
26	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
24	plugin_users-permissions_grant	{"email":{"icon":"envelope","enabled":true},"discord":{"icon":"discord","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"icon":"facebook-square","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/facebook/callback","scope":["email"]},"google":{"icon":"google","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/google/callback","scope":["email"]},"github":{"icon":"github","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"icon":"windows","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"icon":"twitter","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitter/callback"},"instagram":{"icon":"instagram","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"icon":"vk","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/vk/callback","scope":["email"]},"twitch":{"icon":"twitch","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"icon":"linkedin","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"icon":"aws","enabled":false,"key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"icon":"reddit","enabled":false,"key":"","secret":"","callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"icon":"book","enabled":false,"key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"icon":"","enabled":false,"key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]},"keycloak":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"myKeycloakProvider.com/realms/myrealm","callback":"api/auth/keycloak/callback","scope":["openid","email","profile"]}}	object	\N	\N
14	plugin_content_manager_configuration_content_types::admin::role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]},"uid":"admin::role"}	object	\N	\N
20	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
21	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
22	plugin_upload_metrics	{"weeklySchedule":"56 2 22 * * 6","lastWeeklyUpdate":1738443776097}	object	\N	\N
15	plugin_content_manager_configuration_content_types::admin::user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]},"uid":"admin::user"}	object	\N	\N
16	plugin_content_manager_configuration_content_types::admin::api-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]},"uid":"admin::api-token"}	object	\N	\N
17	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::transfer-token-permission"}	object	\N	\N
18	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::api-token-permission"}	object	\N	\N
27	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
19	plugin_content_manager_configuration_content_types::admin::transfer-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::transfer-token"}	object	\N	\N
2	plugin_content_manager_configuration_content_types::api::page.page	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"contenu_flexible":{"edit":{"label":"contenu_flexible","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contenu_flexible","searchable":false,"sortable":false}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"type","size":6},{"name":"slug","size":6}],[{"name":"contenu_flexible","size":12}]],"list":["id","slug","type"]},"uid":"api::page.page"}	object	\N	\N
38	plugin_content_manager_configuration_components::bloc-titre.bloc-titre	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"titre","defaultSortBy":"titre","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"titre":{"edit":{"label":"titre","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"titre","searchable":true,"sortable":true}}},"layouts":{"list":["id","titre"],"edit":[[{"name":"titre","size":6}]]},"uid":"bloc-titre.bloc-titre","isComponent":true}	object	\N	\N
39	plugin_content_manager_configuration_components::bloc-contenu.contenu	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"contenu":{"edit":{"label":"contenu","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contenu","searchable":true,"sortable":true}}},"layouts":{"list":["id","contenu"],"edit":[[{"name":"contenu","size":6}]]},"uid":"bloc-contenu.contenu","isComponent":true}	object	\N	\N
41	plugin_content_manager_configuration_components::bloc-image.image	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}}},"layouts":{"list":["id","image"],"edit":[[{"name":"image","size":6}]]},"uid":"bloc-image.image","isComponent":true}	object	\N	\N
44	plugin_content_manager_configuration_components::bloc-contenu.rich-contenu	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"richContenu":{"edit":{"label":"richContenu","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"richContenu","searchable":false,"sortable":false}}},"layouts":{"list":["id"],"edit":[[{"name":"richContenu","size":12}]]},"uid":"bloc-contenu.rich-contenu","isComponent":true}	object	\N	\N
48	plugin_content_manager_configuration_components::bloc-image.image-avant	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"imageAvant":{"edit":{"label":"imageAvant","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"imageAvant","searchable":false,"sortable":false}},"imageApres":{"edit":{"label":"imageApres","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"imageApres","searchable":false,"sortable":false}}},"layouts":{"list":["id","imageAvant","imageApres"],"edit":[[{"name":"imageAvant","size":6},{"name":"imageApres","size":6}]]},"uid":"bloc-image.image-avant","isComponent":true}	object	\N	\N
\.


--
-- TOC entry 4681 (class 0 OID 29307)
-- Dependencies: 293
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
47	{"tables":[{"name":"pages_cmps","indexes":[{"name":"pages_field_idx","columns":["field"]},{"name":"pages_component_type_idx","columns":["component_type"]},{"name":"pages_entity_fk","columns":["entity_id"]},{"name":"pages_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"pages_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"pages","indexes":[{"name":"pages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"pages_created_by_id_fk","columns":["created_by_id"]},{"name":"pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_documents_idx","columns":["document_id","locale","published_at"]},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_documents_idx","columns":["document_id","locale","published_at"]},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_documents_idx","columns":["document_id","locale","published_at"]},{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_releases","indexes":[{"name":"strapi_releases_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"released_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"scheduled_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timezone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_release_actions","indexes":[{"name":"strapi_release_actions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"entry_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_entry_valid","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows","indexes":[{"name":"strapi_workflows_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_types","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_workflows_stages","indexes":[{"name":"strapi_workflows_stages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_roles","indexes":[{"name":"up_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_users","indexes":[{"name":"up_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_users","indexes":[{"name":"admin_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_bloc_titre_bloc_titres","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"titre","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_bloc_image_images","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false}]},{"name":"components_bloc_image_image_avants","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false}]},{"name":"components_bloc_contenu_rich_contenus","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"rich_contenu","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_bloc_contenu_contenus","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"contenu","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_history_versions","indexes":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"]}],"foreignKeys":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"schema","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_mph","indexes":[{"name":"files_related_mph_fk","columns":["file_id"]},{"name":"files_related_mph_oidx","columns":["order"]},{"name":"files_related_mph_idix","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_mph_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_lnk","indexes":[{"name":"files_folder_lnk_fk","columns":["file_id"]},{"name":"files_folder_lnk_ifk","columns":["folder_id"]},{"name":"files_folder_lnk_uq","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_lnk_oifk","columns":["file_ord"]}],"foreignKeys":[{"name":"files_folder_lnk_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_lnk_ifk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_lnk","indexes":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"]},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_lnk_uq","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_lnk_oifk","columns":["folder_ord"]}],"foreignKeys":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions_release_lnk","indexes":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"]},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"]},{"name":"strapi_release_actions_release_lnk_uq","columns":["release_action_id","release_id"],"type":"unique"},{"name":"strapi_release_actions_release_lnk_oifk","columns":["release_action_ord"]}],"foreignKeys":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"],"referencedColumns":["id"],"referencedTable":"strapi_release_actions","onDelete":"CASCADE"},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"],"referencedColumns":["id"],"referencedTable":"strapi_releases","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_action_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_action_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stage_required_to_publish_lnk","indexes":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_uq","columns":["workflow_id","workflow_stage_id"],"type":"unique"}],"foreignKeys":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_workflow_lnk","indexes":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"]},{"name":"strapi_workflows_stages_workflow_lnk_uq","columns":["workflow_stage_id","workflow_id"],"type":"unique"},{"name":"strapi_workflows_stages_workflow_lnk_oifk","columns":["workflow_stage_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_permissions_lnk","indexes":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"]},{"name":"strapi_workflows_stages_permissions_lnk_uq","columns":["workflow_stage_id","permission_id"],"type":"unique"},{"name":"strapi_workflows_stages_permissions_lnk_ofk","columns":["permission_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_lnk","indexes":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"up_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_lnk","indexes":[{"name":"up_users_role_lnk_fk","columns":["user_id"]},{"name":"up_users_role_lnk_ifk","columns":["role_id"]},{"name":"up_users_role_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"up_users_role_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_lnk","indexes":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"admin_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_lnk","indexes":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"]},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"]},{"name":"admin_users_roles_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_lnk_ofk","columns":["role_ord"]},{"name":"admin_users_roles_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_lnk","indexes":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_lnk_uq","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_lnk_oifk","columns":["api_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_lnk","indexes":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_uq","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_lnk_oifk","columns":["transfer_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2025-02-05 15:30:48.994	421f618995a91b6b46c8f4231685a05e
\.


--
-- TOC entry 4723 (class 0 OID 29560)
-- Dependencies: 335
-- Data for Name: strapi_history_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_history_versions (id, content_type, related_document_id, locale, status, data, schema, created_at, created_by_id) FROM stdin;
\.


--
-- TOC entry 4677 (class 0 OID 29293)
-- Dependencies: 289
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- TOC entry 4679 (class 0 OID 29300)
-- Dependencies: 291
-- Data for Name: strapi_migrations_internal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_migrations_internal (id, name, "time") FROM stdin;
1	5.0.0-rename-identifiers-longer-than-max-length	2025-02-01 21:57:48.153
2	5.0.0-02-created-document-id	2025-02-01 21:57:48.769
3	5.0.0-03-created-locale	2025-02-01 21:57:49.389
4	5.0.0-04-created-published-at	2025-02-01 21:57:50.003
5	5.0.0-05-drop-slug-fields-index	2025-02-01 21:57:50.619
6	core::5.0.0-discard-drafts	2025-02-01 21:57:51.237
\.


--
-- TOC entry 4693 (class 0 OID 29386)
-- Dependencies: 305
-- Data for Name: strapi_release_actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_release_actions (id, document_id, type, content_type, entry_document_id, locale, is_entry_valid, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- TOC entry 4731 (class 0 OID 29606)
-- Dependencies: 343
-- Data for Name: strapi_release_actions_release_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_release_actions_release_lnk (id, release_action_id, release_id, release_action_ord) FROM stdin;
\.


--
-- TOC entry 4691 (class 0 OID 29374)
-- Dependencies: 303
-- Data for Name: strapi_releases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_releases (id, document_id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 4717 (class 0 OID 29530)
-- Dependencies: 329
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 4749 (class 0 OID 29714)
-- Dependencies: 361
-- Data for Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_token_permissions_token_lnk (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_ord) FROM stdin;
\.


--
-- TOC entry 4715 (class 0 OID 29518)
-- Dependencies: 327
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_tokens (id, document_id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 4721 (class 0 OID 29551)
-- Dependencies: 333
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- TOC entry 4695 (class 0 OID 29398)
-- Dependencies: 307
-- Data for Name: strapi_workflows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_workflows (id, document_id, name, content_types, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 4733 (class 0 OID 29618)
-- Dependencies: 345
-- Data for Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_workflows_stage_required_to_publish_lnk (id, workflow_id, workflow_stage_id) FROM stdin;
\.


--
-- TOC entry 4697 (class 0 OID 29410)
-- Dependencies: 309
-- Data for Name: strapi_workflows_stages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_workflows_stages (id, document_id, name, color, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 4737 (class 0 OID 29641)
-- Dependencies: 349
-- Data for Name: strapi_workflows_stages_permissions_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_workflows_stages_permissions_lnk (id, workflow_stage_id, permission_id, permission_ord) FROM stdin;
\.


--
-- TOC entry 4735 (class 0 OID 29629)
-- Dependencies: 347
-- Data for Name: strapi_workflows_stages_workflow_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_workflows_stages_workflow_lnk (id, workflow_stage_id, workflow_id, workflow_stage_ord) FROM stdin;
\.


--
-- TOC entry 4699 (class 0 OID 29422)
-- Dependencies: 311
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	fm5e3w352rn3v9i24lylnw3b	plugin::users-permissions.user.me	2025-02-01 21:57:57.51	2025-02-01 21:57:57.51	2025-02-01 21:57:57.51	\N	\N	\N
2	akf52dwijjmcua37wf52qdpi	plugin::users-permissions.auth.changePassword	2025-02-01 21:57:57.51	2025-02-01 21:57:57.51	2025-02-01 21:57:57.511	\N	\N	\N
3	cjflp6gu5g38f9obdebqlv60	plugin::users-permissions.auth.callback	2025-02-01 21:57:57.617	2025-02-01 21:57:57.617	2025-02-01 21:57:57.618	\N	\N	\N
4	xpnltrr58snb1nkguos6116r	plugin::users-permissions.auth.emailConfirmation	2025-02-01 21:57:57.617	2025-02-01 21:57:57.617	2025-02-01 21:57:57.621	\N	\N	\N
5	ex08pptxmniak5da3u17gvco	plugin::users-permissions.auth.connect	2025-02-01 21:57:57.617	2025-02-01 21:57:57.617	2025-02-01 21:57:57.619	\N	\N	\N
6	fl4k6rwqmvksk7mxmnyu00px	plugin::users-permissions.auth.register	2025-02-01 21:57:57.617	2025-02-01 21:57:57.617	2025-02-01 21:57:57.621	\N	\N	\N
7	f25d98f41wmftpk3q79odsvc	plugin::users-permissions.auth.forgotPassword	2025-02-01 21:57:57.617	2025-02-01 21:57:57.617	2025-02-01 21:57:57.62	\N	\N	\N
8	wpog1t5qkyipjwecbych8yt7	plugin::users-permissions.auth.resetPassword	2025-02-01 21:57:57.617	2025-02-01 21:57:57.617	2025-02-01 21:57:57.62	\N	\N	\N
9	z6lpxrcmoc8pp6x33cy4tqei	plugin::users-permissions.auth.sendEmailConfirmation	2025-02-01 21:57:57.617	2025-02-01 21:57:57.617	2025-02-01 21:57:57.622	\N	\N	\N
10	ok392rg8xak5uuizjmxp00ll	api::page.page.find	2025-02-01 22:13:02.814	2025-02-01 22:13:02.814	2025-02-01 22:13:02.815	\N	\N	\N
11	pv6cqjy85cauf5i9qlz3ooof	api::page.page.findOne	2025-02-01 22:13:02.814	2025-02-01 22:13:02.814	2025-02-01 22:13:02.816	\N	\N	\N
12	ergh6iz8wbmwywbyrd8639oa	plugin::upload.content-api.find	2025-02-01 22:52:25.757	2025-02-01 22:52:25.757	2025-02-01 22:52:25.758	\N	\N	\N
13	nealegoopwwmd4f6mb4i1qjx	plugin::upload.content-api.findOne	2025-02-01 22:52:25.757	2025-02-01 22:52:25.757	2025-02-01 22:52:25.759	\N	\N	\N
\.


--
-- TOC entry 4739 (class 0 OID 29653)
-- Dependencies: 351
-- Data for Name: up_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	2	1	1
3	3	2	1
4	9	2	1
5	7	2	1
6	8	2	1
8	6	2	1
9	4	2	1
10	10	2	2
13	13	2	3
11	11	2	2
12	12	2	3
2	1	1	1
7	5	2	1
\.


--
-- TOC entry 4701 (class 0 OID 29434)
-- Dependencies: 313
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_roles (id, document_id, name, description, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	xx8j299z3sx9czpcm7o4bxqx	Authenticated	Default role given to authenticated user.	authenticated	2025-02-01 21:57:57.329	2025-02-01 21:57:57.329	2025-02-01 21:57:57.329	\N	\N	\N
2	sds6l029pq2gsi52eswt8j6m	Public	Default role given to unauthenticated user.	public	2025-02-01 21:57:57.399	2025-02-01 22:52:25.667	2025-02-01 21:57:57.399	\N	\N	\N
\.


--
-- TOC entry 4703 (class 0 OID 29446)
-- Dependencies: 315
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users (id, document_id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	t9feyelyjrfmxhnbabkd43wb	admin	admin@example.com	local	$2a$10$D0nXCeWcNjeWdUcIFmjh5.Siw.oPTAQRBQZ.521Tbni.ZVs1fnl3i	\N	\N	t	f	2025-02-02 16:41:02.015	2025-02-03 09:42:16.29	2025-02-03 09:42:16.159	1	1	\N
\.


--
-- TOC entry 4741 (class 0 OID 29665)
-- Dependencies: 353
-- Data for Name: up_users_role_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users_role_lnk (id, user_id, role_id, user_ord) FROM stdin;
1	1	1	1
\.


--
-- TOC entry 4687 (class 0 OID 29346)
-- Dependencies: 299
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders (id, document_id, name, path_id, path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- TOC entry 4729 (class 0 OID 29594)
-- Dependencies: 341
-- Data for Name: upload_folders_parent_lnk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders_parent_lnk (id, folder_id, inv_folder_id, folder_ord) FROM stdin;
\.


--
-- TOC entry 4673 (class 0 OID 29028)
-- Dependencies: 281
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-02-01 20:20:03
20211116045059	2025-02-01 20:20:03
20211116050929	2025-02-01 20:20:03
20211116051442	2025-02-01 20:20:03
20211116212300	2025-02-01 20:20:03
20211116213355	2025-02-01 20:20:03
20211116213934	2025-02-01 20:20:04
20211116214523	2025-02-01 20:20:04
20211122062447	2025-02-01 20:20:04
20211124070109	2025-02-01 20:20:04
20211202204204	2025-02-01 20:20:04
20211202204605	2025-02-01 20:20:04
20211210212804	2025-02-01 20:20:04
20211228014915	2025-02-01 20:20:04
20220107221237	2025-02-01 20:20:04
20220228202821	2025-02-01 20:20:05
20220312004840	2025-02-01 20:20:05
20220603231003	2025-02-01 20:20:05
20220603232444	2025-02-01 20:20:05
20220615214548	2025-02-01 20:20:05
20220712093339	2025-02-01 20:20:05
20220908172859	2025-02-01 20:20:05
20220916233421	2025-02-01 20:20:05
20230119133233	2025-02-01 20:20:05
20230128025114	2025-02-01 20:20:05
20230128025212	2025-02-01 20:20:06
20230227211149	2025-02-01 20:20:06
20230228184745	2025-02-01 20:20:06
20230308225145	2025-02-01 20:20:06
20230328144023	2025-02-01 20:20:06
20231018144023	2025-02-01 20:20:06
20231204144023	2025-02-01 20:20:06
20231204144024	2025-02-01 20:20:06
20231204144025	2025-02-01 20:20:06
20240108234812	2025-02-01 20:20:06
20240109165339	2025-02-01 20:20:06
20240227174441	2025-02-01 20:20:07
20240311171622	2025-02-01 20:20:07
20240321100241	2025-02-01 20:20:07
20240401105812	2025-02-01 20:20:07
20240418121054	2025-02-01 20:20:07
20240523004032	2025-02-01 20:20:08
20240618124746	2025-02-01 20:20:08
20240801235015	2025-02-01 20:20:08
20240805133720	2025-02-01 20:20:08
20240827160934	2025-02-01 20:20:08
20240919163303	2025-02-01 20:20:08
20240919163305	2025-02-01 20:20:08
20241019105805	2025-02-01 20:20:08
20241030150047	2025-02-01 20:20:09
20241108114728	2025-02-01 20:20:09
20241121104152	2025-02-01 20:20:09
20241130184212	2025-02-01 20:20:09
20241220035512	2025-02-01 20:20:09
20241220123912	2025-02-01 20:20:09
20241224161212	2025-02-01 20:20:09
20250107150512	2025-02-01 20:20:09
20250110162412	2025-02-01 20:20:09
20250123174212	2025-02-01 20:20:10
20250128220012	2025-02-01 20:20:10
\.


--
-- TOC entry 4675 (class 0 OID 29051)
-- Dependencies: 284
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- TOC entry 4657 (class 0 OID 16540)
-- Dependencies: 249
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
Strapi-uploads	Strapi-uploads	\N	2025-02-01 20:43:09.140947+00	2025-02-01 20:43:09.140947+00	t	f	\N	\N	\N
\.


--
-- TOC entry 4659 (class 0 OID 16582)
-- Dependencies: 251
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-02-01 20:19:57.376665
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-02-01 20:19:57.39037
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-02-01 20:19:57.39379
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-02-01 20:19:57.41538
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-02-01 20:19:57.439001
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-02-01 20:19:57.44259
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-02-01 20:19:57.447025
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-02-01 20:19:57.451644
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-02-01 20:19:57.456323
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-02-01 20:19:57.460553
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-02-01 20:19:57.466948
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-02-01 20:19:57.472161
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-02-01 20:19:57.478879
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-02-01 20:19:57.482852
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-02-01 20:19:57.488069
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-02-01 20:19:57.517007
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-02-01 20:19:57.521241
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-02-01 20:19:57.52623
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-02-01 20:19:57.531863
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-02-01 20:19:57.537363
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-02-01 20:19:57.543332
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-02-01 20:19:57.554162
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-02-01 20:19:57.585415
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-02-01 20:19:57.611312
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-02-01 20:19:57.615616
25	custom-metadata	67eb93b7e8d401cafcdc97f9ac779e71a79bfe03	2025-02-01 20:19:57.620122
\.


--
-- TOC entry 4658 (class 0 OID 16555)
-- Dependencies: 250
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
c434e5bf-c15a-4bd0-95c1-92686a366033	Strapi-uploads	strapi-uploads/sdbavant.png-4f3373bcd743b9098ce7d5d1fa95a052.png	\N	2025-02-04 11:02:31.15257+00	2025-02-04 11:02:31.15257+00	2025-02-04 11:02:31.15257+00	{"eTag": "\\"43f67cd1d8892dde9c1caca9b9dcccd3\\"", "size": 97719, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T11:02:32.000Z", "contentLength": 97719, "httpStatusCode": 200}	c2a7ee65-7986-423d-aee5-0da5716ed494	\N	{}
acf964a5-e8d1-4d48-b5ce-40f4871fedb5	Strapi-uploads	strapi-uploads/thumbnail_sdbavant.png-9ca16117f39f47a167a474e90e34d818.png	\N	2025-02-04 11:02:31.188689+00	2025-02-04 11:02:31.188689+00	2025-02-04 11:02:31.188689+00	{"eTag": "\\"11f09c3506c7f4dc327007272eadb3ca\\"", "size": 68387, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T11:02:32.000Z", "contentLength": 68387, "httpStatusCode": 200}	05520cd8-af8b-4456-afe1-94b2a4161629	\N	{}
a7c40859-7c7d-4975-b227-ebbe34a29984	Strapi-uploads	strapi-uploads/small_sdbavant.png-6650de99c085147f47caa5c4aff98be9.png	\N	2025-02-04 11:02:31.279558+00	2025-02-04 11:02:31.279558+00	2025-02-04 11:02:31.279558+00	{"eTag": "\\"f833e7eb0928259360a7d6d4a966d2fb\\"", "size": 351804, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T11:02:32.000Z", "contentLength": 351804, "httpStatusCode": 200}	67afa11e-121a-4e49-b4b1-f225a9cb645b	\N	{}
8c1273ad-e78e-48a7-a1cd-5a050699e6c4	Strapi-uploads	strapi-uploads/thumbnail_handyman-construction-site-process-drilling-wall-with-perforator.jpg-af1e59a2cd28100ebd13fa14928ab4f4.jpg	\N	2025-02-05 14:08:50.681824+00	2025-02-05 14:08:50.681824+00	2025-02-05 14:08:50.681824+00	{"eTag": "\\"1ae40ecc9cd138d922b5799f0aa03194\\"", "size": 11947, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:08:51.000Z", "contentLength": 11947, "httpStatusCode": 200}	5a8b8e35-7c39-4903-97db-372a07d99a2c	\N	{}
eed71529-bd24-4135-aa8b-414af9e01748	Strapi-uploads	strapi-uploads/large_handyman-construction-site-process-drilling-wall-with-perforator.jpg-e74b696d7e448b777ad7fca3a2da92d5.jpg	\N	2025-02-05 14:08:50.846661+00	2025-02-05 14:08:50.846661+00	2025-02-05 14:08:50.846661+00	{"eTag": "\\"c89ea00076ee21f7bd7ac5e3c0dff359\\"", "size": 129999, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:08:51.000Z", "contentLength": 129999, "httpStatusCode": 200}	7dd34f59-6084-48d7-b66d-7e5cf82e90e5	\N	{}
12048b23-b401-449b-ac06-909e40ac51e3	Strapi-uploads	strapi-uploads/small_handyman-construction-site-process-drilling-wall-with-perforator.jpg-13f29dbaed6abc0d569a8e8cf1ab7232.jpg	\N	2025-02-05 14:08:50.937052+00	2025-02-05 14:08:50.937052+00	2025-02-05 14:08:50.937052+00	{"eTag": "\\"22c5fbadbb536431bb6a55a37a25cc0c\\"", "size": 41875, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:08:51.000Z", "contentLength": 41875, "httpStatusCode": 200}	e5f1147c-4dcb-420c-963a-da5a32fafb56	\N	{}
1ee53a70-ef00-4988-86df-3e2b0d93752d	Strapi-uploads	strapi-uploads/large_sols.webp-c9f4b297b062bfd75b86bc75956534a0.webp	\N	2025-02-05 15:23:05.495348+00	2025-02-05 15:23:05.495348+00	2025-02-05 15:23:05.495348+00	{"eTag": "\\"aa84728ac7b72e829fccea7f39f6a7d1\\"", "size": 34716, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T15:23:06.000Z", "contentLength": 34716, "httpStatusCode": 200}	94db078e-3507-4dda-8e28-b2111273eb17	\N	{}
348b9c8b-d88b-4fb4-9698-4023d6e7b6d0	Strapi-uploads	strapi-uploads/medium_sols.webp-bc26007c2bfd2956dfa0aea3e42ce6bf.webp	\N	2025-02-05 15:23:05.583669+00	2025-02-05 15:23:05.583669+00	2025-02-05 15:23:05.583669+00	{"eTag": "\\"3c41e1c5bc1561d8744c91147c0db1a9\\"", "size": 24458, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T15:23:06.000Z", "contentLength": 24458, "httpStatusCode": 200}	0a58f2f6-38fb-4d30-9804-45288606f03b	\N	{}
fb7d6626-297e-4b86-8175-6b58dda5fcf0	Strapi-uploads	strapi-uploads/medium_handyman-construction-site-process-drilling-wall-with-perforator.jpg-c21c077ca28d415534db38c7135246fd.jpg	\N	2025-02-05 14:08:50.964182+00	2025-02-05 14:08:50.964182+00	2025-02-05 14:08:50.964182+00	{"eTag": "\\"460997a07844133fabbf5db7e28878fe\\"", "size": 82692, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:08:51.000Z", "contentLength": 82692, "httpStatusCode": 200}	10a57e80-b094-4ba4-9d91-9df32a47ad89	\N	{}
2e3f0b01-5506-4300-b414-d214235e7d8d	Strapi-uploads	strapi-uploads/handyman-construction-site-process-drilling-wall-with-perforator.jpg-ffe021b4ac0616448cd943a7eff4e59a.jpg	\N	2025-02-05 14:08:51.07049+00	2025-02-05 14:08:51.07049+00	2025-02-05 14:08:51.07049+00	{"eTag": "\\"2230dc16cd4f5f4178784f1b8d6071a4\\"", "size": 1826557, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:08:51.000Z", "contentLength": 1826557, "httpStatusCode": 200}	01821724-d30b-4227-a22c-711e90bffacf	\N	{}
c3327671-2f9b-4382-9d44-53979fa3afc8	Strapi-uploads	strapi-uploads/sols.webp-09782499fa7f1bd19903c33820d62496.webp	\N	2025-02-05 15:23:05.933298+00	2025-02-05 15:23:05.933298+00	2025-02-05 15:23:05.933298+00	{"eTag": "\\"295282008b51ebec1eec7b944b67e444\\"", "size": 55774, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T15:23:06.000Z", "contentLength": 55774, "httpStatusCode": 200}	9cf65b12-6946-4994-be6e-4e5c5ab1f0f9	\N	{}
e3673a3d-a654-4c15-ab7c-a61aa4550b54	Strapi-uploads	strapi-uploads/thumbnail_sdbapres.png-5ad01582ac608b2e3dbb047bc6e1781d.png	\N	2025-02-04 11:02:45.162124+00	2025-02-04 11:02:45.162124+00	2025-02-04 11:02:45.162124+00	{"eTag": "\\"02176c36d472a9e087e1012a30c9502a\\"", "size": 50156, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T11:02:46.000Z", "contentLength": 50156, "httpStatusCode": 200}	111270c4-0580-48a6-85ff-f5fb9fee79bc	\N	{}
0d63fd17-e221-41f1-8aa7-aa307e5c95c7	Strapi-uploads	strapi-uploads/small_sdbapres.png-79d03e570ed0663ea65f3345bb600e52.png	\N	2025-02-04 11:02:45.212054+00	2025-02-04 11:02:45.212054+00	2025-02-04 11:02:45.212054+00	{"eTag": "\\"adbff6544ec7504621c14c76e827a432\\"", "size": 223796, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T11:02:46.000Z", "contentLength": 223796, "httpStatusCode": 200}	4785480c-2ed8-43b3-9b86-9d2a44068914	\N	{}
0b27cbf0-1923-4d0f-833b-6b889b5361e4	Strapi-uploads	strapi-uploads/large_1.webp-af05793ab5c13ceba524cea9a5c02585.webp	\N	2025-02-03 10:03:01.593684+00	2025-02-03 10:03:01.593684+00	2025-02-03 10:03:01.593684+00	{"eTag": "\\"c89ea00076ee21f7bd7ac5e3c0dff359\\"", "size": 129999, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T10:03:02.000Z", "contentLength": 129999, "httpStatusCode": 200}	7ad5b4b6-c36f-41c0-80cb-f48d8c5ff122	\N	{}
12888a75-06a9-449a-a6d0-a91bec5b4574	Strapi-uploads	strapi-uploads/medium_1.webp-c34a1416b8caa07b64f4c8273766fbad.webp	\N	2025-02-03 10:03:01.749881+00	2025-02-03 10:03:01.749881+00	2025-02-03 10:03:01.749881+00	{"eTag": "\\"460997a07844133fabbf5db7e28878fe\\"", "size": 82692, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T10:03:02.000Z", "contentLength": 82692, "httpStatusCode": 200}	32b912af-0614-4911-b12c-bfa1208dd9a2	\N	{}
9a0c85fc-94bd-4eb8-98a5-0fade659a27a	Strapi-uploads	strapi-uploads/thumbnail_1.webp-a668b80b50419bb3e08712d3012c14e9.webp	\N	2025-02-03 10:03:01.756312+00	2025-02-03 10:03:01.756312+00	2025-02-03 10:03:01.756312+00	{"eTag": "\\"1ae40ecc9cd138d922b5799f0aa03194\\"", "size": 11947, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T10:03:02.000Z", "contentLength": 11947, "httpStatusCode": 200}	e7b6edc7-7f62-4a9e-ad73-540bbef7cd51	\N	{}
5f3c1839-4758-463a-a45c-6cce79255d40	Strapi-uploads	strapi-uploads/small_1.webp-46ae9faff8b367a48810f2dde1a6d791.webp	\N	2025-02-03 10:03:01.95215+00	2025-02-03 10:03:01.95215+00	2025-02-03 10:03:01.95215+00	{"eTag": "\\"22c5fbadbb536431bb6a55a37a25cc0c\\"", "size": 41875, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T10:03:02.000Z", "contentLength": 41875, "httpStatusCode": 200}	a8b9ed47-b9a5-49a1-9abd-e0559b69f202	\N	{}
8babef7a-7d8c-48c1-9ccc-21176a0476f5	Strapi-uploads	strapi-uploads/1.webp-cc08c65734f4394750ea987b1416373b.webp	\N	2025-02-03 10:03:02.083612+00	2025-02-03 10:03:02.083612+00	2025-02-03 10:03:02.083612+00	{"eTag": "\\"2230dc16cd4f5f4178784f1b8d6071a4\\"", "size": 1826557, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T10:03:02.000Z", "contentLength": 1826557, "httpStatusCode": 200}	9ee988ec-4c0a-4655-9388-1c3e261d8a38	\N	{}
8be13dbc-1dc6-4ef9-a9d9-bd9ff19b4f75	Strapi-uploads	strapi-uploads/sols.webp-5e347aa5c6de5d3ade42cd220eca7717.webp	\N	2025-02-03 13:20:09.711852+00	2025-02-03 13:20:09.711852+00	2025-02-03 13:20:09.711852+00	{"eTag": "\\"295282008b51ebec1eec7b944b67e444\\"", "size": 55774, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T13:20:10.000Z", "contentLength": 55774, "httpStatusCode": 200}	6010f226-da0a-4f05-beb8-71e52c154e31	\N	{}
1dc79007-77d3-4669-b0a0-8a3e0860220a	Strapi-uploads	strapi-uploads/large_sols.webp-9a374aa0454b041b36cb2ab9f17ee160.webp	\N	2025-02-03 13:20:09.729023+00	2025-02-03 13:20:09.729023+00	2025-02-03 13:20:09.729023+00	{"eTag": "\\"aa84728ac7b72e829fccea7f39f6a7d1\\"", "size": 34716, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T13:20:10.000Z", "contentLength": 34716, "httpStatusCode": 200}	d02e9606-e1bb-467f-81cb-eaae08b1e74f	\N	{}
c7e6ad9a-9dee-4485-bb20-e3a27524a791	Strapi-uploads	strapi-uploads/small_sols.webp-bcfc7be9dcf6ebfc979c284d83969761.webp	\N	2025-02-03 13:20:09.740303+00	2025-02-03 13:20:09.740303+00	2025-02-03 13:20:09.740303+00	{"eTag": "\\"9798b96523c24e9746d6b1902b4e4d8a\\"", "size": 13702, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T13:20:10.000Z", "contentLength": 13702, "httpStatusCode": 200}	b1d80ac2-a14c-487d-ab12-09bf5c2f6806	\N	{}
d76bd300-7d6b-46e6-afeb-88ed1613a82f	Strapi-uploads	strapi-uploads/thumbnail_sols.webp-9dfb7f4b83d5c3018cd6c1576ed78f69.webp	\N	2025-02-03 13:20:09.77618+00	2025-02-03 13:20:09.77618+00	2025-02-03 13:20:09.77618+00	{"eTag": "\\"4eb915c32404240591dfba084832739d\\"", "size": 4844, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T13:20:10.000Z", "contentLength": 4844, "httpStatusCode": 200}	632343bc-1f20-4841-8170-ae36623b51b4	\N	{}
08862a32-1dba-4e01-99fe-b3e32fa1330a	Strapi-uploads	strapi-uploads/medium_sols.webp-00b89515ee56191878ad3f84fcd89c9f.webp	\N	2025-02-03 13:20:09.785987+00	2025-02-03 13:20:09.785987+00	2025-02-03 13:20:09.785987+00	{"eTag": "\\"3c41e1c5bc1561d8744c91147c0db1a9\\"", "size": 24458, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T13:20:10.000Z", "contentLength": 24458, "httpStatusCode": 200}	05095318-0922-4301-ac0c-4b4c2a6e2633	\N	{}
85b96dcc-83c4-494e-8f7f-4f78b847985d	Strapi-uploads	strapi-uploads/thumbnail_Enduire-un-plafond-comme-un-pro.webp-666f4059bc5fa109a64187dfaea04c6e.webp	\N	2025-02-03 21:05:21.805984+00	2025-02-03 21:05:21.805984+00	2025-02-03 21:05:21.805984+00	{"eTag": "\\"77c90bdbd17101b6ba44351bec87ae5f\\"", "size": 1480, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T21:05:22.000Z", "contentLength": 1480, "httpStatusCode": 200}	1fd6911a-e208-475b-bee9-2d18bb3447aa	\N	{}
6fd81b16-dde5-48e9-bf9f-d214967ed128	Strapi-uploads	strapi-uploads/large_Enduire-un-plafond-comme-un-pro.webp-5124c93db942aee8f98479d89f99b265.webp	\N	2025-02-03 21:05:21.835499+00	2025-02-03 21:05:21.835499+00	2025-02-03 21:05:21.835499+00	{"eTag": "\\"de5b1836ae9b91354a1c10c01b855ffa\\"", "size": 16680, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T21:05:22.000Z", "contentLength": 16680, "httpStatusCode": 200}	77faf7c7-5489-4a33-88bf-943c120a8577	\N	{}
94ee1ada-a687-4567-bdd8-3250e15eca49	Strapi-uploads	strapi-uploads/Enduire-un-plafond-comme-un-pro.webp-0d859e5337939ca90eb1a9947594704e.webp	\N	2025-02-03 21:05:21.900582+00	2025-02-03 21:05:21.900582+00	2025-02-03 21:05:21.900582+00	{"eTag": "\\"afff0eab73f4f3ba5268ab2f7309cf1e\\"", "size": 41750, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T21:05:22.000Z", "contentLength": 41750, "httpStatusCode": 200}	1a74444b-8963-4311-8fab-78fb67e25ed8	\N	{}
d34d0fb3-f95a-410e-9a29-0e0cad5c9be8	Strapi-uploads	strapi-uploads/sdbapres.png-66e6cd22775a3e345fe376a5eca5ef79.png	\N	2025-02-04 11:02:45.245238+00	2025-02-04 11:02:45.245238+00	2025-02-04 11:02:45.245238+00	{"eTag": "\\"281a49874bb9dcbcde8582f47dcfd091\\"", "size": 60098, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T11:02:46.000Z", "contentLength": 60098, "httpStatusCode": 200}	63082349-73b3-4f88-82e8-ccfad5b463a7	\N	{}
6697bee2-00e1-41a9-a0dd-f0297924fe84	Strapi-uploads	strapi-uploads/thumbnail_sols.webp-be3d021f66cc3a2ddf16ddb5b3ae5b63.webp	\N	2025-02-05 14:16:07.729989+00	2025-02-05 14:16:07.729989+00	2025-02-05 14:16:07.729989+00	{"eTag": "\\"4eb915c32404240591dfba084832739d\\"", "size": 4844, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:16:08.000Z", "contentLength": 4844, "httpStatusCode": 200}	49202dec-3aad-4141-907a-98c8ccc201c0	\N	{}
cf13e336-aab9-456e-ac30-f9fda5954dfe	Strapi-uploads	strapi-uploads/large_sols.webp-d85d8c0b8ceafb94d56a4d632de6f380.webp	\N	2025-02-05 14:16:07.799542+00	2025-02-05 14:16:07.799542+00	2025-02-05 14:16:07.799542+00	{"eTag": "\\"aa84728ac7b72e829fccea7f39f6a7d1\\"", "size": 34716, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:16:08.000Z", "contentLength": 34716, "httpStatusCode": 200}	25c5fe87-15b6-42bc-b92b-05775bac7149	\N	{}
955a02ad-01bc-4bb5-92a2-fa1a6ec77feb	Strapi-uploads	strapi-uploads/sols.webp-d2875aa35d2127893f1855488c389d50.webp	\N	2025-02-05 14:16:07.87325+00	2025-02-05 14:16:07.87325+00	2025-02-05 14:16:07.87325+00	{"eTag": "\\"295282008b51ebec1eec7b944b67e444\\"", "size": 55774, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:16:08.000Z", "contentLength": 55774, "httpStatusCode": 200}	ecc1496a-f465-41fd-a1a6-269dff0e86b2	\N	{}
1e1ed3c7-912f-46c4-b78a-161fe313292e	Strapi-uploads	strapi-uploads/Enduire-un-plafond-comme-un-pro.webp-69e8001b304a40fd5fe52b667d16762a.webp	\N	2025-02-05 14:17:57.173612+00	2025-02-05 14:17:57.173612+00	2025-02-05 14:17:57.173612+00	{"eTag": "\\"afff0eab73f4f3ba5268ab2f7309cf1e\\"", "size": 41750, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:17:58.000Z", "contentLength": 41750, "httpStatusCode": 200}	cb68c05f-ed0b-420b-93d8-d2f2e79859f9	\N	{}
8bad521f-930f-4fd9-b265-167b0e7f2c5d	Strapi-uploads	strapi-uploads/large_Enduire-un-plafond-comme-un-pro.webp-71f9fc056f570b612a5c2b8a352aa590.webp	\N	2025-02-05 14:17:57.287985+00	2025-02-05 14:17:57.287985+00	2025-02-05 14:17:57.287985+00	{"eTag": "\\"de5b1836ae9b91354a1c10c01b855ffa\\"", "size": 16680, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:17:58.000Z", "contentLength": 16680, "httpStatusCode": 200}	95152d6a-898d-4bd5-9c59-c10ddb779c82	\N	{}
16d93965-d131-4496-a9ef-2b658271c51e	Strapi-uploads	strapi-uploads/small_Enduire-un-plafond-comme-un-pro.webp-f3e3d8bd0ea2045f8cc4fd00ea7cd8cc.webp	\N	2025-02-03 21:05:21.90575+00	2025-02-03 21:05:21.90575+00	2025-02-03 21:05:21.90575+00	{"eTag": "\\"7ca54d1989aa5aadfb5d05075abde357\\"", "size": 4864, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T21:05:22.000Z", "contentLength": 4864, "httpStatusCode": 200}	fc9339db-f376-47c8-828c-2f73b962cf7f	\N	{}
6d30b361-6965-402c-a456-d8db6579e7ff	Strapi-uploads	strapi-uploads/thumbnail_cuisine avant.png-c025296132bab0f471c254bb7d9d10b5.png	\N	2025-02-04 12:30:15.773802+00	2025-02-04 12:30:15.773802+00	2025-02-04 12:30:15.773802+00	{"eTag": "\\"70f236bf043e5609fdf83f8f45314a96\\"", "size": 71984, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T12:30:16.000Z", "contentLength": 71984, "httpStatusCode": 200}	e4846aed-0a21-44e4-9ff3-41b733a31661	\N	{}
3c14b48a-855d-4d95-9d0a-53c094e5055c	Strapi-uploads	strapi-uploads/cuisine avant.png-b32908b7445dc31f9e2daf314ba1179a.png	\N	2025-02-04 12:30:15.926858+00	2025-02-04 12:30:15.926858+00	2025-02-04 12:30:15.926858+00	{"eTag": "\\"dbd4e6a1aa3799416068be5a2de20f10\\"", "size": 122870, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T12:30:16.000Z", "contentLength": 122870, "httpStatusCode": 200}	9407c416-0aaf-449e-84f2-7e4a85872a00	\N	{}
50f8a5af-c9a4-4f0b-9552-3deae6a30a9b	Strapi-uploads	strapi-uploads/small_cuisineapres.png-f4ea77762bd85842f2912acc568cf445.png	\N	2025-02-04 12:30:15.952535+00	2025-02-04 12:30:15.952535+00	2025-02-04 12:30:15.952535+00	{"eTag": "\\"af512e8c1229e57318144963f6010cf1\\"", "size": 371415, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T12:30:16.000Z", "contentLength": 371415, "httpStatusCode": 200}	bb0292fb-1789-4fc7-a6af-231fa29d8e06	\N	{}
9174d774-a267-4d70-9191-c77d067902a3	Strapi-uploads	strapi-uploads/thumbnail_cuisineapres.png-aae208b2dd8b44b1446e5c7630cb5ff3.png	\N	2025-02-04 12:30:16.050847+00	2025-02-04 12:30:16.050847+00	2025-02-04 12:30:16.050847+00	{"eTag": "\\"fd1dfb07d34e93cd3ba80caa91b27fd3\\"", "size": 73842, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T12:30:16.000Z", "contentLength": 73842, "httpStatusCode": 200}	95d7f31e-cc3c-439f-afcb-c7096d5daea4	\N	{}
6a17ed7c-eb69-447d-b727-74d33a3f498f	Strapi-uploads	strapi-uploads/small_sols.webp-fdbfe7853b378088ee9df5955a3e4044.webp	\N	2025-02-05 14:16:07.931129+00	2025-02-05 14:16:07.931129+00	2025-02-05 14:16:07.931129+00	{"eTag": "\\"9798b96523c24e9746d6b1902b4e4d8a\\"", "size": 13702, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:16:08.000Z", "contentLength": 13702, "httpStatusCode": 200}	1cf90f59-f550-4824-807d-c2e45ba6adb9	\N	{}
8679909a-9dfd-41b8-ab10-d959e14464ed	Strapi-uploads	strapi-uploads/medium_sols.webp-97a07797e7c814b214a00ad7f15f5b73.webp	\N	2025-02-05 14:16:08.008255+00	2025-02-05 14:16:08.008255+00	2025-02-05 14:16:08.008255+00	{"eTag": "\\"3c41e1c5bc1561d8744c91147c0db1a9\\"", "size": 24458, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:16:08.000Z", "contentLength": 24458, "httpStatusCode": 200}	c436d2a5-8ef4-4c75-8c0a-f6a4fc4519a8	\N	{}
1962ac91-e994-4246-999e-b5a7a23f6d7a	Strapi-uploads	strapi-uploads/thumbnail_Enduire-un-plafond-comme-un-pro.webp-6532319c42dae2cdf8b65335b2d9cee5.webp	\N	2025-02-05 14:17:57.166891+00	2025-02-05 14:17:57.166891+00	2025-02-05 14:17:57.166891+00	{"eTag": "\\"77c90bdbd17101b6ba44351bec87ae5f\\"", "size": 1480, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:17:58.000Z", "contentLength": 1480, "httpStatusCode": 200}	9063ce35-1410-411d-86c2-2ae3285af1eb	\N	{}
7c2032a1-2d10-49cd-abe4-96135fa029b3	Strapi-uploads	strapi-uploads/medium_Enduire-un-plafond-comme-un-pro.webp-0312b9937f7cd0b57b4dee79121cad7a.webp	\N	2025-02-03 21:05:21.916754+00	2025-02-03 21:05:21.916754+00	2025-02-03 21:05:21.916754+00	{"eTag": "\\"8a7f31a129ae119f95534dae737e2abc\\"", "size": 9978, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-03T21:05:22.000Z", "contentLength": 9978, "httpStatusCode": 200}	cf34a77f-2e1c-42e2-91c8-c74a97b84986	\N	{}
f1097f08-babd-44a4-b41e-2df0fa0196b6	Strapi-uploads	strapi-uploads/medium_cuisineapres.png-26275069a26bfa497fd9c2f66c40c008.png	\N	2025-02-04 12:30:15.931114+00	2025-02-04 12:30:15.931114+00	2025-02-04 12:30:15.931114+00	{"eTag": "\\"63e022d4c4c580117a66c5ee3ceb1afb\\"", "size": 767643, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T12:30:16.000Z", "contentLength": 767643, "httpStatusCode": 200}	d6acfdfe-9ede-484d-9be0-e2339ee8c94e	\N	{}
e3c55357-0d25-4982-bacc-a6e93fbd82f1	Strapi-uploads	strapi-uploads/thumbnail_salle de bain.jpg-b85c346614a8dd5e6384e996d616545f.jpg	\N	2025-02-04 09:18:38.453448+00	2025-02-04 09:18:38.453448+00	2025-02-04 09:18:38.453448+00	{"eTag": "\\"882335b62d7c3515795dcd1f99b96be3\\"", "size": 7460, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T09:18:39.000Z", "contentLength": 7460, "httpStatusCode": 200}	e6d01a88-15ee-4285-88e9-4201854644bb	\N	{}
56a36bb4-d86d-4a3c-a4ba-e96fdc0d2f8b	Strapi-uploads	strapi-uploads/salle de bain.jpg-7c1c1d5f765b78146a892d27fef8104b.jpg	\N	2025-02-04 09:18:38.683539+00	2025-02-04 09:18:38.683539+00	2025-02-04 09:18:38.683539+00	{"eTag": "\\"c70165f70b47f7d813ac05b22e890367\\"", "size": 90590, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T09:18:39.000Z", "contentLength": 90590, "httpStatusCode": 200}	86d5553a-3101-418b-a68e-d726e6231ac0	\N	{}
968d215c-b4ce-45b1-81e6-eaaae4cc20cc	Strapi-uploads	strapi-uploads/medium_salle de bain.jpg-6f29ba5a1661b5d4e1dce50e1d6c05fb.jpg	\N	2025-02-04 09:18:38.761055+00	2025-02-04 09:18:38.761055+00	2025-02-04 09:18:38.761055+00	{"eTag": "\\"693247eda8868f6753cf4f33e501e687\\"", "size": 58794, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T09:18:39.000Z", "contentLength": 58794, "httpStatusCode": 200}	a673af08-f980-4135-bae8-730ed0669e9a	\N	{}
e0d5eeb6-0281-49bd-b4a6-42f1f5251843	Strapi-uploads	strapi-uploads/small_salle de bain.jpg-b57e47c47c7cdc095a8310edbb83e77d.jpg	\N	2025-02-04 09:18:38.901409+00	2025-02-04 09:18:38.901409+00	2025-02-04 09:18:38.901409+00	{"eTag": "\\"db32e7f8fafb3f239ecc938423f69155\\"", "size": 28476, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T09:18:39.000Z", "contentLength": 28476, "httpStatusCode": 200}	e345b561-ba67-4533-b645-bc36bcf713f4	\N	{}
0ac99fc6-e935-405d-bd04-aca7d5b702d2	Strapi-uploads	strapi-uploads/small_Enduire-un-plafond-comme-un-pro.webp-6bbf3a87aefba09fa79825be066dbd12.webp	\N	2025-02-05 14:17:57.285641+00	2025-02-05 14:17:57.285641+00	2025-02-05 14:17:57.285641+00	{"eTag": "\\"7ca54d1989aa5aadfb5d05075abde357\\"", "size": 4864, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:17:58.000Z", "contentLength": 4864, "httpStatusCode": 200}	5271c121-8af5-4505-98ac-e1e7b8d76ff8	\N	{}
9e446249-43bd-4911-8e77-e6d578632845	Strapi-uploads	strapi-uploads/medium_Enduire-un-plafond-comme-un-pro.webp-bb62724d039deb0211af523088313b44.webp	\N	2025-02-05 14:17:57.360065+00	2025-02-05 14:17:57.360065+00	2025-02-05 14:17:57.360065+00	{"eTag": "\\"8a7f31a129ae119f95534dae737e2abc\\"", "size": 9978, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T14:17:58.000Z", "contentLength": 9978, "httpStatusCode": 200}	8eeaf563-e0f6-4f0d-9736-a931eff7348d	\N	{}
8730bbcc-6b4a-4ca3-9815-171de63b6194	Strapi-uploads	strapi-uploads/thumbnail_volets.jpg-37fe08505b4fd2fcadede92dea7d4f54.jpg	\N	2025-02-04 09:18:55.784817+00	2025-02-04 09:18:55.784817+00	2025-02-04 09:18:55.784817+00	{"eTag": "\\"5e8ffeb36544d89d3d0cb69ed9f6eaee\\"", "size": 4292, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T09:18:56.000Z", "contentLength": 4292, "httpStatusCode": 200}	dc78bd52-e1c0-4ff1-adfa-902e214bfee6	\N	{}
3d2c08c5-dff8-4328-9648-74c1a9465c8f	Strapi-uploads	strapi-uploads/small_volets.jpg-221dac9d13ac8cb43fce4d2370d65558.jpg	\N	2025-02-04 09:18:55.82254+00	2025-02-04 09:18:55.82254+00	2025-02-04 09:18:55.82254+00	{"eTag": "\\"25da143813a13ff0fbff08aafa70e40a\\"", "size": 13156, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T09:18:56.000Z", "contentLength": 13156, "httpStatusCode": 200}	52a4516d-ae44-4c28-ba80-910b5167a30b	\N	{}
b33aca32-e8ae-4434-b472-315c030207f2	Strapi-uploads	strapi-uploads/volets.jpg-aceb4e1de501b577bd56192cde537a00.jpg	\N	2025-02-04 09:18:55.860901+00	2025-02-04 09:18:55.860901+00	2025-02-04 09:18:55.860901+00	{"eTag": "\\"30c340d398e1b0be8e4ebd5cbfa455fe\\"", "size": 26502, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T09:18:56.000Z", "contentLength": 26502, "httpStatusCode": 200}	f686b835-d4ca-4003-8db8-ed11b0c2619e	\N	{}
6e22814b-1f5d-4a96-9d41-0f52165aceae	Strapi-uploads	strapi-uploads/medium_volets.jpg-da82b0c2eb3a2cd3154da268baeeb6fb.jpg	\N	2025-02-04 09:18:55.965377+00	2025-02-04 09:18:55.965377+00	2025-02-04 09:18:55.965377+00	{"eTag": "\\"4573d50fd498110967476ab7f1adfcda\\"", "size": 24473, "mimetype": "image/jpeg", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T09:18:56.000Z", "contentLength": 24473, "httpStatusCode": 200}	4e14be89-d152-410b-8cc8-a55fd7ed5503	\N	{}
545e718c-1d28-495a-9919-fe9fff68f1a1	Strapi-uploads	strapi-uploads/cuisine avant.png-2915a591c6e6a43e9be1e3407e024a48.png	\N	2025-02-04 11:01:23.242415+00	2025-02-04 11:01:23.242415+00	2025-02-04 11:01:23.242415+00	{"eTag": "\\"dbd4e6a1aa3799416068be5a2de20f10\\"", "size": 122870, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T11:01:24.000Z", "contentLength": 122870, "httpStatusCode": 200}	cfecf3f0-36e2-4ecb-a45a-5ee87288459e	\N	{}
724c40d4-a0de-45da-8e2a-030c61961b9a	Strapi-uploads	strapi-uploads/small_cuisine avant.png-8881aa667b3ca320e0800ade6806031c.png	\N	2025-02-04 11:01:23.32184+00	2025-02-04 11:01:23.32184+00	2025-02-04 11:01:23.32184+00	{"eTag": "\\"91dee1dd4cfab44876e3114482bf8d65\\"", "size": 249695, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T11:01:24.000Z", "contentLength": 249695, "httpStatusCode": 200}	ecfc9f68-fbf6-4500-932b-e5760f06f33e	\N	{}
bbf8ffa5-5386-4545-82df-5061a919c5fb	Strapi-uploads	strapi-uploads/medium_cuisine avant.png-1e42a6f2b5db724d97c7d8560400d387.png	\N	2025-02-04 11:01:23.503007+00	2025-02-04 11:01:23.503007+00	2025-02-04 11:01:23.503007+00	{"eTag": "\\"af69136b32e3670c73979fc42862d088\\"", "size": 495895, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T11:01:24.000Z", "contentLength": 495895, "httpStatusCode": 200}	6c3785d3-cdbd-463b-8269-8d75f7c9510b	\N	{}
2a2431c1-90bb-44a4-ac12-f24fe3f0d90b	Strapi-uploads	strapi-uploads/thumbnail_cuisine avant.png-8c824aa42291a5016c580e1810a2806b.png	\N	2025-02-04 11:01:23.717689+00	2025-02-04 11:01:23.717689+00	2025-02-04 11:01:23.717689+00	{"eTag": "\\"70f236bf043e5609fdf83f8f45314a96\\"", "size": 71984, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T11:01:24.000Z", "contentLength": 71984, "httpStatusCode": 200}	f32bb5c5-7faf-4d38-a78f-2ce5557a79df	\N	{}
4281c0ea-e887-4c56-8d78-e6a62a4e68ec	Strapi-uploads	strapi-uploads/small_cuisineapres.png-f2e90d6231a12ca951e35b0b469b14af.png	\N	2025-02-04 11:01:36.083164+00	2025-02-04 11:01:36.083164+00	2025-02-04 11:01:36.083164+00	{"eTag": "\\"af512e8c1229e57318144963f6010cf1\\"", "size": 371415, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T11:01:36.000Z", "contentLength": 371415, "httpStatusCode": 200}	8ba44848-f0f5-421d-bc9b-ed0bf278c197	\N	{}
358cf475-56f3-40f6-a6aa-9b4efe06d8d1	Strapi-uploads	strapi-uploads/medium_cuisineapres.png-ddfa094efcbd38cb031743534346d0d8.png	\N	2025-02-04 11:01:36.144391+00	2025-02-04 11:01:36.144391+00	2025-02-04 11:01:36.144391+00	{"eTag": "\\"63e022d4c4c580117a66c5ee3ceb1afb\\"", "size": 767643, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T11:01:37.000Z", "contentLength": 767643, "httpStatusCode": 200}	a54f9990-f1bf-4d84-9862-42e082ebade7	\N	{}
da26251a-89d2-4391-90c3-910d29b9493a	Strapi-uploads	strapi-uploads/medium_cuisine avant.png-95e3ce028b4be87f4c5edf3b15626203.png	\N	2025-02-04 12:30:15.900901+00	2025-02-04 12:30:15.900901+00	2025-02-04 12:30:15.900901+00	{"eTag": "\\"af69136b32e3670c73979fc42862d088\\"", "size": 495895, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T12:30:16.000Z", "contentLength": 495895, "httpStatusCode": 200}	649a30ad-3cb9-4b1c-be12-89f18a72fed1	\N	{}
7479a1d3-f76a-44e1-9efd-d69390c6a3ab	Strapi-uploads	strapi-uploads/small_cuisine avant.png-29a2102d8d81ad443b157d61e58c3f5b.png	\N	2025-02-04 12:30:15.921066+00	2025-02-04 12:30:15.921066+00	2025-02-04 12:30:15.921066+00	{"eTag": "\\"91dee1dd4cfab44876e3114482bf8d65\\"", "size": 249695, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T12:30:16.000Z", "contentLength": 249695, "httpStatusCode": 200}	08b39bd9-8fd3-4090-9057-347521e241ce	\N	{}
0b95f4b0-8315-47e6-adb4-09c7acef7989	Strapi-uploads	strapi-uploads/thumbnail_sols.webp-64f2e43779f83bf63670056da996e18a.webp	\N	2025-02-05 15:23:05.457811+00	2025-02-05 15:23:05.457811+00	2025-02-05 15:23:05.457811+00	{"eTag": "\\"4eb915c32404240591dfba084832739d\\"", "size": 4844, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T15:23:06.000Z", "contentLength": 4844, "httpStatusCode": 200}	9fb44ec5-05b5-4e25-a46d-a0f90e185e4f	\N	{}
b0d9ddbc-dc05-4600-85d4-62afdc2acc79	Strapi-uploads	strapi-uploads/small_sols.webp-e922f8a2ab7c1d502d6a5f7a269b014d.webp	\N	2025-02-05 15:23:05.721541+00	2025-02-05 15:23:05.721541+00	2025-02-05 15:23:05.721541+00	{"eTag": "\\"9798b96523c24e9746d6b1902b4e4d8a\\"", "size": 13702, "mimetype": "image/webp", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-05T15:23:06.000Z", "contentLength": 13702, "httpStatusCode": 200}	52332778-f16c-49c4-9f23-20fc98f6d60c	\N	{}
4b4deb72-b8c3-4b5e-aa4a-df76f0e4f390	Strapi-uploads	strapi-uploads/cuisineapres.png-28886d0b08f23a1bf3bf62ce4cb8f85c.png	\N	2025-02-04 12:30:15.946449+00	2025-02-04 12:30:15.946449+00	2025-02-04 12:30:15.946449+00	{"eTag": "\\"38ecf8817d0296f8cc5f5821340b547a\\"", "size": 210035, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T12:30:16.000Z", "contentLength": 210035, "httpStatusCode": 200}	b8ea8636-1282-4cbc-91e6-d6a18542609f	\N	{}
f2217e88-f93d-46c7-853a-0cc8c6df8721	Strapi-uploads	strapi-uploads/thumbnail_cuisineapres.png-2c7fe8a3f5b89c5e9297567d6a93f44a.png	\N	2025-02-04 11:01:35.928178+00	2025-02-04 11:01:35.928178+00	2025-02-04 11:01:35.928178+00	{"eTag": "\\"fd1dfb07d34e93cd3ba80caa91b27fd3\\"", "size": 73842, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T11:01:36.000Z", "contentLength": 73842, "httpStatusCode": 200}	2a0a3d42-8faf-493e-b22a-e15f42f87e03	\N	{}
e7240902-063a-451c-8104-f35936cea38a	Strapi-uploads	strapi-uploads/cuisineapres.png-f9912f6f49c254282e8e796b82953dba.png	\N	2025-02-04 11:01:36.077241+00	2025-02-04 11:01:36.077241+00	2025-02-04 11:01:36.077241+00	{"eTag": "\\"38ecf8817d0296f8cc5f5821340b547a\\"", "size": 210035, "mimetype": "image/png", "cacheControl": "max-age=public, max-age=31536000, immutable", "lastModified": "2025-02-04T11:01:36.000Z", "contentLength": 210035, "httpStatusCode": 200}	2f29559a-d28d-4784-bc23-f47f2a5bc96f	\N	{}
\.


--
-- TOC entry 4671 (class 0 OID 28976)
-- Dependencies: 279
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- TOC entry 4672 (class 0 OID 28990)
-- Dependencies: 280
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- TOC entry 3913 (class 0 OID 16951)
-- Dependencies: 265
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 244
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 258
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 316
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 144, true);


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 354
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_role_lnk_id_seq', 144, true);


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 320
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 318
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 2, true);


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 356
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_roles_lnk_id_seq', 4, true);


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 366
-- Name: components_bloc_contenu_contenus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_bloc_contenu_contenus_id_seq', 3, true);


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 370
-- Name: components_bloc_contenu_rich_contenus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_bloc_contenu_rich_contenus_id_seq', 67, true);


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 372
-- Name: components_bloc_image_image_avants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_bloc_image_image_avants_id_seq', 3, true);


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 368
-- Name: components_bloc_image_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_bloc_image_images_id_seq', 57, true);


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 364
-- Name: components_bloc_titre_bloc_titres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_bloc_titre_bloc_titres_id_seq', 75, true);


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 338
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_folder_lnk_id_seq', 1, false);


--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 296
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 16, true);


--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 336
-- Name: files_related_mph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_related_mph_id_seq', 273, true);


--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 300
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 362
-- Name: pages_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_cmps_id_seq', 522, true);


--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 294
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_id_seq', 58, true);


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 324
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 358
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_lnk_id_seq', 1, false);


--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 322
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, false);


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 330
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 48, true);


--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 292
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 47, true);


--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 334
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_history_versions_id_seq', 1, false);


--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 288
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 290
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_migrations_internal_id_seq', 6, true);


--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 304
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);


--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 342
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_release_actions_release_lnk_id_seq', 1, false);


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 302
-- Name: strapi_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 328
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 360
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_lnk_id_seq', 1, false);


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 326
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 332
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 306
-- Name: strapi_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_workflows_id_seq', 1, false);


--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 344
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq', 1, false);


--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 308
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_id_seq', 1, false);


--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 348
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_permissions_lnk_id_seq', 1, false);


--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 346
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_workflow_lnk_id_seq', 1, false);


--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 310
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 19, true);


--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 350
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_role_lnk_id_seq', 19, true);


--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 312
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 3, true);


--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 314
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_id_seq', 2, true);


--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 352
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_role_lnk_id_seq', 3, true);


--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 298
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 340
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_parent_lnk_id_seq', 1, false);


--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 283
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- TOC entry 4090 (class 2606 OID 28769)
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- TOC entry 4041 (class 2606 OID 16525)
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 4112 (class 2606 OID 28875)
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- TOC entry 4069 (class 2606 OID 28893)
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- TOC entry 4071 (class 2606 OID 28903)
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- TOC entry 4039 (class 2606 OID 16518)
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- TOC entry 4092 (class 2606 OID 28762)
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- TOC entry 4088 (class 2606 OID 28750)
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- TOC entry 4080 (class 2606 OID 28943)
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- TOC entry 4082 (class 2606 OID 28737)
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- TOC entry 4116 (class 2606 OID 28928)
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4033 (class 2606 OID 16508)
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4036 (class 2606 OID 28679)
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- TOC entry 4101 (class 2606 OID 28809)
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- TOC entry 4103 (class 2606 OID 28807)
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 4108 (class 2606 OID 28823)
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- TOC entry 4044 (class 2606 OID 16531)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 4075 (class 2606 OID 28700)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4098 (class 2606 OID 28790)
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- TOC entry 4094 (class 2606 OID 28781)
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 4026 (class 2606 OID 28863)
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- TOC entry 4028 (class 2606 OID 16495)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4207 (class 2606 OID 29465)
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4310 (class 2606 OID 29682)
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4312 (class 2606 OID 29686)
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- TOC entry 4217 (class 2606 OID 29489)
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4212 (class 2606 OID 29477)
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4318 (class 2606 OID 29694)
-- Name: admin_users_roles_lnk admin_users_roles_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4320 (class 2606 OID 29698)
-- Name: admin_users_roles_lnk admin_users_roles_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_uq UNIQUE (user_id, role_id);


--
-- TOC entry 4345 (class 2606 OID 34926)
-- Name: components_bloc_contenu_contenus components_bloc_contenu_contenus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_bloc_contenu_contenus
    ADD CONSTRAINT components_bloc_contenu_contenus_pkey PRIMARY KEY (id);


--
-- TOC entry 4349 (class 2606 OID 34993)
-- Name: components_bloc_contenu_rich_contenus components_bloc_contenu_rich_contenus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_bloc_contenu_rich_contenus
    ADD CONSTRAINT components_bloc_contenu_rich_contenus_pkey PRIMARY KEY (id);


--
-- TOC entry 4351 (class 2606 OID 35043)
-- Name: components_bloc_image_image_avants components_bloc_image_image_avants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_bloc_image_image_avants
    ADD CONSTRAINT components_bloc_image_image_avants_pkey PRIMARY KEY (id);


--
-- TOC entry 4347 (class 2606 OID 34954)
-- Name: components_bloc_image_images components_bloc_image_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_bloc_image_images
    ADD CONSTRAINT components_bloc_image_images_pkey PRIMARY KEY (id);


--
-- TOC entry 4343 (class 2606 OID 34915)
-- Name: components_bloc_titre_bloc_titres components_bloc_titre_bloc_titres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_bloc_titre_bloc_titres
    ADD CONSTRAINT components_bloc_titre_bloc_titres_pkey PRIMARY KEY (id);


--
-- TOC entry 4255 (class 2606 OID 29587)
-- Name: files_folder_lnk files_folder_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4257 (class 2606 OID 29591)
-- Name: files_folder_lnk files_folder_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_uq UNIQUE (file_id, folder_id);


--
-- TOC entry 4147 (class 2606 OID 29335)
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- TOC entry 4250 (class 2606 OID 29577)
-- Name: files_related_mph files_related_mph_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_pkey PRIMARY KEY (id);


--
-- TOC entry 4167 (class 2606 OID 29369)
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- TOC entry 4336 (class 2606 OID 34879)
-- Name: pages_cmps pages_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_cmps
    ADD CONSTRAINT pages_cmps_pkey PRIMARY KEY (id);


--
-- TOC entry 4142 (class 2606 OID 29323)
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- TOC entry 4341 (class 2606 OID 34884)
-- Name: pages_cmps pages_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_cmps
    ADD CONSTRAINT pages_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- TOC entry 4227 (class 2606 OID 29513)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4325 (class 2606 OID 29707)
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4327 (class 2606 OID 29711)
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_uq UNIQUE (api_token_permission_id, api_token_id);


--
-- TOC entry 4222 (class 2606 OID 29501)
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4240 (class 2606 OID 29549)
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 4138 (class 2606 OID 29314)
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- TOC entry 4245 (class 2606 OID 29567)
-- Name: strapi_history_versions strapi_history_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_pkey PRIMARY KEY (id);


--
-- TOC entry 4136 (class 2606 OID 29305)
-- Name: strapi_migrations_internal strapi_migrations_internal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations_internal
    ADD CONSTRAINT strapi_migrations_internal_pkey PRIMARY KEY (id);


--
-- TOC entry 4134 (class 2606 OID 29298)
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4177 (class 2606 OID 29393)
-- Name: strapi_release_actions strapi_release_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);


--
-- TOC entry 4269 (class 2606 OID 29611)
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4271 (class 2606 OID 29615)
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_uq UNIQUE (release_action_id, release_id);


--
-- TOC entry 4172 (class 2606 OID 29381)
-- Name: strapi_releases strapi_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);


--
-- TOC entry 4237 (class 2606 OID 29537)
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4332 (class 2606 OID 29719)
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4334 (class 2606 OID 29723)
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- TOC entry 4232 (class 2606 OID 29525)
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4242 (class 2606 OID 29558)
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- TOC entry 4182 (class 2606 OID 29405)
-- Name: strapi_workflows strapi_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_pkey PRIMARY KEY (id);


--
-- TOC entry 4275 (class 2606 OID 29623)
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4277 (class 2606 OID 29627)
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_uq UNIQUE (workflow_id, workflow_stage_id);


--
-- TOC entry 4289 (class 2606 OID 29646)
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4291 (class 2606 OID 29650)
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_uq UNIQUE (workflow_stage_id, permission_id);


--
-- TOC entry 4187 (class 2606 OID 29417)
-- Name: strapi_workflows_stages strapi_workflows_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_pkey PRIMARY KEY (id);


--
-- TOC entry 4282 (class 2606 OID 29634)
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4284 (class 2606 OID 29638)
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_uq UNIQUE (workflow_stage_id, workflow_id);


--
-- TOC entry 4192 (class 2606 OID 29429)
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4296 (class 2606 OID 29658)
-- Name: up_permissions_role_lnk up_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4298 (class 2606 OID 29662)
-- Name: up_permissions_role_lnk up_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- TOC entry 4197 (class 2606 OID 29441)
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4202 (class 2606 OID 29453)
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4303 (class 2606 OID 29670)
-- Name: up_users_role_lnk up_users_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4305 (class 2606 OID 29674)
-- Name: up_users_role_lnk up_users_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_uq UNIQUE (user_id, role_id);


--
-- TOC entry 4262 (class 2606 OID 29599)
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_pkey PRIMARY KEY (id);


--
-- TOC entry 4264 (class 2606 OID 29603)
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_uq UNIQUE (folder_id, inv_folder_id);


--
-- TOC entry 4158 (class 2606 OID 29355)
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- TOC entry 4160 (class 2606 OID 29357)
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- TOC entry 4162 (class 2606 OID 29353)
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- TOC entry 4132 (class 2606 OID 29204)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 4129 (class 2606 OID 29059)
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- TOC entry 4126 (class 2606 OID 29032)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 4047 (class 2606 OID 16548)
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- TOC entry 4054 (class 2606 OID 16589)
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- TOC entry 4056 (class 2606 OID 16587)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4052 (class 2606 OID 16565)
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- TOC entry 4124 (class 2606 OID 28999)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- TOC entry 4122 (class 2606 OID 28984)
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- TOC entry 4042 (class 1259 OID 16526)
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- TOC entry 4016 (class 1259 OID 28689)
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 4017 (class 1259 OID 28691)
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 4018 (class 1259 OID 28692)
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 4078 (class 1259 OID 28771)
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- TOC entry 4110 (class 1259 OID 28879)
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- TOC entry 4067 (class 1259 OID 28859)
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 4067
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- TOC entry 4072 (class 1259 OID 28686)
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- TOC entry 4113 (class 1259 OID 28876)
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- TOC entry 4114 (class 1259 OID 28877)
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- TOC entry 4086 (class 1259 OID 28882)
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- TOC entry 4083 (class 1259 OID 28743)
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- TOC entry 4084 (class 1259 OID 28888)
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- TOC entry 4117 (class 1259 OID 28935)
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- TOC entry 4118 (class 1259 OID 28934)
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- TOC entry 4119 (class 1259 OID 28936)
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- TOC entry 4019 (class 1259 OID 28693)
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 4020 (class 1259 OID 28690)
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 4029 (class 1259 OID 16509)
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- TOC entry 4030 (class 1259 OID 16510)
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- TOC entry 4031 (class 1259 OID 28685)
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- TOC entry 4034 (class 1259 OID 28773)
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- TOC entry 4037 (class 1259 OID 28878)
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- TOC entry 4104 (class 1259 OID 28815)
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- TOC entry 4105 (class 1259 OID 28880)
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- TOC entry 4106 (class 1259 OID 28830)
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- TOC entry 4109 (class 1259 OID 28829)
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- TOC entry 4073 (class 1259 OID 28881)
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- TOC entry 4076 (class 1259 OID 28772)
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- TOC entry 4096 (class 1259 OID 28797)
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- TOC entry 4099 (class 1259 OID 28796)
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- TOC entry 4095 (class 1259 OID 28782)
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- TOC entry 4085 (class 1259 OID 28941)
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- TOC entry 4077 (class 1259 OID 28770)
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- TOC entry 4021 (class 1259 OID 28850)
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 4021
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- TOC entry 4022 (class 1259 OID 28687)
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- TOC entry 4023 (class 1259 OID 16499)
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- TOC entry 4024 (class 1259 OID 28905)
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- TOC entry 4204 (class 1259 OID 29467)
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- TOC entry 4205 (class 1259 OID 29466)
-- Name: admin_permissions_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_documents_idx ON public.admin_permissions USING btree (document_id, locale, published_at);


--
-- TOC entry 4306 (class 1259 OID 29683)
-- Name: admin_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_lnk_fk ON public.admin_permissions_role_lnk USING btree (permission_id);


--
-- TOC entry 4307 (class 1259 OID 29684)
-- Name: admin_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_lnk_ifk ON public.admin_permissions_role_lnk USING btree (role_id);


--
-- TOC entry 4308 (class 1259 OID 29687)
-- Name: admin_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_lnk_oifk ON public.admin_permissions_role_lnk USING btree (permission_ord);


--
-- TOC entry 4208 (class 1259 OID 29468)
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- TOC entry 4214 (class 1259 OID 29491)
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- TOC entry 4215 (class 1259 OID 29490)
-- Name: admin_roles_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_documents_idx ON public.admin_roles USING btree (document_id, locale, published_at);


--
-- TOC entry 4218 (class 1259 OID 29492)
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- TOC entry 4209 (class 1259 OID 29479)
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- TOC entry 4210 (class 1259 OID 29478)
-- Name: admin_users_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_documents_idx ON public.admin_users USING btree (document_id, locale, published_at);


--
-- TOC entry 4313 (class 1259 OID 29695)
-- Name: admin_users_roles_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_lnk_fk ON public.admin_users_roles_lnk USING btree (user_id);


--
-- TOC entry 4314 (class 1259 OID 29696)
-- Name: admin_users_roles_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_lnk_ifk ON public.admin_users_roles_lnk USING btree (role_id);


--
-- TOC entry 4315 (class 1259 OID 29699)
-- Name: admin_users_roles_lnk_ofk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_lnk_ofk ON public.admin_users_roles_lnk USING btree (role_ord);


--
-- TOC entry 4316 (class 1259 OID 29700)
-- Name: admin_users_roles_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_lnk_oifk ON public.admin_users_roles_lnk USING btree (user_ord);


--
-- TOC entry 4213 (class 1259 OID 29480)
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- TOC entry 4144 (class 1259 OID 29343)
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- TOC entry 4145 (class 1259 OID 29342)
-- Name: files_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_documents_idx ON public.files USING btree (document_id, locale, published_at);


--
-- TOC entry 4251 (class 1259 OID 29588)
-- Name: files_folder_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_lnk_fk ON public.files_folder_lnk USING btree (file_id);


--
-- TOC entry 4252 (class 1259 OID 29589)
-- Name: files_folder_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_lnk_ifk ON public.files_folder_lnk USING btree (folder_id);


--
-- TOC entry 4253 (class 1259 OID 29592)
-- Name: files_folder_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_lnk_oifk ON public.files_folder_lnk USING btree (file_ord);


--
-- TOC entry 4246 (class 1259 OID 29578)
-- Name: files_related_mph_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_mph_fk ON public.files_related_mph USING btree (file_id);


--
-- TOC entry 4247 (class 1259 OID 29580)
-- Name: files_related_mph_idix; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_mph_idix ON public.files_related_mph USING btree (related_id);


--
-- TOC entry 4248 (class 1259 OID 29579)
-- Name: files_related_mph_oidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_mph_oidx ON public.files_related_mph USING btree ("order");


--
-- TOC entry 4148 (class 1259 OID 29344)
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- TOC entry 4164 (class 1259 OID 29371)
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- TOC entry 4165 (class 1259 OID 29370)
-- Name: i18n_locale_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_documents_idx ON public.i18n_locale USING btree (document_id, locale, published_at);


--
-- TOC entry 4168 (class 1259 OID 29372)
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- TOC entry 4337 (class 1259 OID 34881)
-- Name: pages_component_type_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_component_type_idx ON public.pages_cmps USING btree (component_type);


--
-- TOC entry 4139 (class 1259 OID 29325)
-- Name: pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_created_by_id_fk ON public.pages USING btree (created_by_id);


--
-- TOC entry 4140 (class 1259 OID 29324)
-- Name: pages_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_documents_idx ON public.pages USING btree (document_id, locale, published_at);


--
-- TOC entry 4338 (class 1259 OID 34882)
-- Name: pages_entity_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_entity_fk ON public.pages_cmps USING btree (entity_id);


--
-- TOC entry 4339 (class 1259 OID 34880)
-- Name: pages_field_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_field_idx ON public.pages_cmps USING btree (field);


--
-- TOC entry 4143 (class 1259 OID 29326)
-- Name: pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_updated_by_id_fk ON public.pages USING btree (updated_by_id);


--
-- TOC entry 4224 (class 1259 OID 29515)
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- TOC entry 4225 (class 1259 OID 29514)
-- Name: strapi_api_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_documents_idx ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);


--
-- TOC entry 4321 (class 1259 OID 29708)
-- Name: strapi_api_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_lnk_fk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id);


--
-- TOC entry 4322 (class 1259 OID 29709)
-- Name: strapi_api_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_lnk_ifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_id);


--
-- TOC entry 4323 (class 1259 OID 29712)
-- Name: strapi_api_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_lnk_oifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_ord);


--
-- TOC entry 4228 (class 1259 OID 29516)
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- TOC entry 4219 (class 1259 OID 29503)
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- TOC entry 4220 (class 1259 OID 29502)
-- Name: strapi_api_tokens_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_documents_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);


--
-- TOC entry 4223 (class 1259 OID 29504)
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- TOC entry 4243 (class 1259 OID 29568)
-- Name: strapi_history_versions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_history_versions_created_by_id_fk ON public.strapi_history_versions USING btree (created_by_id);


--
-- TOC entry 4174 (class 1259 OID 29395)
-- Name: strapi_release_actions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);


--
-- TOC entry 4175 (class 1259 OID 29394)
-- Name: strapi_release_actions_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_release_actions_documents_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);


--
-- TOC entry 4265 (class 1259 OID 29612)
-- Name: strapi_release_actions_release_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_release_actions_release_lnk_fk ON public.strapi_release_actions_release_lnk USING btree (release_action_id);


--
-- TOC entry 4266 (class 1259 OID 29613)
-- Name: strapi_release_actions_release_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_release_actions_release_lnk_ifk ON public.strapi_release_actions_release_lnk USING btree (release_id);


--
-- TOC entry 4267 (class 1259 OID 29616)
-- Name: strapi_release_actions_release_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_release_actions_release_lnk_oifk ON public.strapi_release_actions_release_lnk USING btree (release_action_ord);


--
-- TOC entry 4178 (class 1259 OID 29396)
-- Name: strapi_release_actions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);


--
-- TOC entry 4169 (class 1259 OID 29383)
-- Name: strapi_releases_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);


--
-- TOC entry 4170 (class 1259 OID 29382)
-- Name: strapi_releases_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_releases_documents_idx ON public.strapi_releases USING btree (document_id, locale, published_at);


--
-- TOC entry 4173 (class 1259 OID 29384)
-- Name: strapi_releases_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);


--
-- TOC entry 4234 (class 1259 OID 29539)
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- TOC entry 4235 (class 1259 OID 29538)
-- Name: strapi_transfer_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_documents_idx ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);


--
-- TOC entry 4328 (class 1259 OID 29720)
-- Name: strapi_transfer_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_fk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id);


--
-- TOC entry 4329 (class 1259 OID 29721)
-- Name: strapi_transfer_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_ifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_id);


--
-- TOC entry 4330 (class 1259 OID 29724)
-- Name: strapi_transfer_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_oifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_ord);


--
-- TOC entry 4238 (class 1259 OID 29540)
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- TOC entry 4229 (class 1259 OID 29527)
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- TOC entry 4230 (class 1259 OID 29526)
-- Name: strapi_transfer_tokens_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_documents_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);


--
-- TOC entry 4233 (class 1259 OID 29528)
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- TOC entry 4179 (class 1259 OID 29407)
-- Name: strapi_workflows_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_created_by_id_fk ON public.strapi_workflows USING btree (created_by_id);


--
-- TOC entry 4180 (class 1259 OID 29406)
-- Name: strapi_workflows_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_documents_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);


--
-- TOC entry 4272 (class 1259 OID 29624)
-- Name: strapi_workflows_stage_required_to_publish_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_fk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_id);


--
-- TOC entry 4273 (class 1259 OID 29625)
-- Name: strapi_workflows_stage_required_to_publish_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_ifk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_stage_id);


--
-- TOC entry 4184 (class 1259 OID 29419)
-- Name: strapi_workflows_stages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_created_by_id_fk ON public.strapi_workflows_stages USING btree (created_by_id);


--
-- TOC entry 4185 (class 1259 OID 29418)
-- Name: strapi_workflows_stages_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_documents_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);


--
-- TOC entry 4285 (class 1259 OID 29647)
-- Name: strapi_workflows_stages_permissions_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_fk ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id);


--
-- TOC entry 4286 (class 1259 OID 29648)
-- Name: strapi_workflows_stages_permissions_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ifk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_id);


--
-- TOC entry 4287 (class 1259 OID 29651)
-- Name: strapi_workflows_stages_permissions_lnk_ofk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ofk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_ord);


--
-- TOC entry 4188 (class 1259 OID 29420)
-- Name: strapi_workflows_stages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_updated_by_id_fk ON public.strapi_workflows_stages USING btree (updated_by_id);


--
-- TOC entry 4278 (class 1259 OID 29635)
-- Name: strapi_workflows_stages_workflow_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_fk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id);


--
-- TOC entry 4279 (class 1259 OID 29636)
-- Name: strapi_workflows_stages_workflow_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_ifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_id);


--
-- TOC entry 4280 (class 1259 OID 29639)
-- Name: strapi_workflows_stages_workflow_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_oifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_ord);


--
-- TOC entry 4183 (class 1259 OID 29408)
-- Name: strapi_workflows_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_workflows_updated_by_id_fk ON public.strapi_workflows USING btree (updated_by_id);


--
-- TOC entry 4189 (class 1259 OID 29431)
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- TOC entry 4190 (class 1259 OID 29430)
-- Name: up_permissions_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_documents_idx ON public.up_permissions USING btree (document_id, locale, published_at);


--
-- TOC entry 4292 (class 1259 OID 29659)
-- Name: up_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_lnk_fk ON public.up_permissions_role_lnk USING btree (permission_id);


--
-- TOC entry 4293 (class 1259 OID 29660)
-- Name: up_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_lnk_ifk ON public.up_permissions_role_lnk USING btree (role_id);


--
-- TOC entry 4294 (class 1259 OID 29663)
-- Name: up_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_lnk_oifk ON public.up_permissions_role_lnk USING btree (permission_ord);


--
-- TOC entry 4193 (class 1259 OID 29432)
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- TOC entry 4194 (class 1259 OID 29443)
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- TOC entry 4195 (class 1259 OID 29442)
-- Name: up_roles_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_documents_idx ON public.up_roles USING btree (document_id, locale, published_at);


--
-- TOC entry 4198 (class 1259 OID 29444)
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- TOC entry 4199 (class 1259 OID 29455)
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- TOC entry 4200 (class 1259 OID 29454)
-- Name: up_users_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_documents_idx ON public.up_users USING btree (document_id, locale, published_at);


--
-- TOC entry 4299 (class 1259 OID 29671)
-- Name: up_users_role_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_lnk_fk ON public.up_users_role_lnk USING btree (user_id);


--
-- TOC entry 4300 (class 1259 OID 29672)
-- Name: up_users_role_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_lnk_ifk ON public.up_users_role_lnk USING btree (role_id);


--
-- TOC entry 4301 (class 1259 OID 29675)
-- Name: up_users_role_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_lnk_oifk ON public.up_users_role_lnk USING btree (user_ord);


--
-- TOC entry 4203 (class 1259 OID 29456)
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- TOC entry 4149 (class 1259 OID 29337)
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- TOC entry 4150 (class 1259 OID 29341)
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- TOC entry 4151 (class 1259 OID 29336)
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- TOC entry 4152 (class 1259 OID 29339)
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- TOC entry 4153 (class 1259 OID 29340)
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- TOC entry 4154 (class 1259 OID 29338)
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- TOC entry 4155 (class 1259 OID 29359)
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- TOC entry 4156 (class 1259 OID 29358)
-- Name: upload_folders_documents_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_documents_idx ON public.upload_folders USING btree (document_id, locale, published_at);


--
-- TOC entry 4258 (class 1259 OID 29600)
-- Name: upload_folders_parent_lnk_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_lnk_fk ON public.upload_folders_parent_lnk USING btree (folder_id);


--
-- TOC entry 4259 (class 1259 OID 29601)
-- Name: upload_folders_parent_lnk_ifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_lnk_ifk ON public.upload_folders_parent_lnk USING btree (inv_folder_id);


--
-- TOC entry 4260 (class 1259 OID 29604)
-- Name: upload_folders_parent_lnk_oifk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_lnk_oifk ON public.upload_folders_parent_lnk USING btree (folder_ord);


--
-- TOC entry 4163 (class 1259 OID 29360)
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- TOC entry 4127 (class 1259 OID 29205)
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- TOC entry 4130 (class 1259 OID 29108)
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- TOC entry 4045 (class 1259 OID 16554)
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- TOC entry 4048 (class 1259 OID 16576)
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- TOC entry 4120 (class 1259 OID 29010)
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- TOC entry 4049 (class 1259 OID 28975)
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- TOC entry 4050 (class 1259 OID 16577)
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- TOC entry 4431 (class 2620 OID 29064)
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- TOC entry 4430 (class 2620 OID 28963)
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- TOC entry 4354 (class 2606 OID 28673)
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4358 (class 2606 OID 28763)
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- TOC entry 4357 (class 2606 OID 28751)
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- TOC entry 4356 (class 2606 OID 28738)
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4363 (class 2606 OID 28929)
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4352 (class 2606 OID 28706)
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- TOC entry 4360 (class 2606 OID 28810)
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 4361 (class 2606 OID 28883)
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- TOC entry 4362 (class 2606 OID 28824)
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 4355 (class 2606 OID 28701)
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4359 (class 2606 OID 28791)
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 4389 (class 2606 OID 29835)
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4421 (class 2606 OID 29995)
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4422 (class 2606 OID 30000)
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- TOC entry 4390 (class 2606 OID 29840)
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4393 (class 2606 OID 29855)
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4394 (class 2606 OID 29860)
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4391 (class 2606 OID 29845)
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4423 (class 2606 OID 30005)
-- Name: admin_users_roles_lnk admin_users_roles_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- TOC entry 4424 (class 2606 OID 30010)
-- Name: admin_users_roles_lnk admin_users_roles_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- TOC entry 4392 (class 2606 OID 29850)
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4369 (class 2606 OID 29735)
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4405 (class 2606 OID 29915)
-- Name: files_folder_lnk files_folder_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- TOC entry 4406 (class 2606 OID 29920)
-- Name: files_folder_lnk files_folder_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_ifk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 4404 (class 2606 OID 29910)
-- Name: files_related_mph files_related_mph_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- TOC entry 4370 (class 2606 OID 29740)
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4373 (class 2606 OID 29755)
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4374 (class 2606 OID 29760)
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4367 (class 2606 OID 29725)
-- Name: pages pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4429 (class 2606 OID 34899)
-- Name: pages_cmps pages_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_cmps
    ADD CONSTRAINT pages_entity_fk FOREIGN KEY (entity_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- TOC entry 4368 (class 2606 OID 29730)
-- Name: pages pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4397 (class 2606 OID 29875)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4425 (class 2606 OID 30015)
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4426 (class 2606 OID 30020)
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_ifk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- TOC entry 4398 (class 2606 OID 29880)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4395 (class 2606 OID 29865)
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4396 (class 2606 OID 29870)
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4403 (class 2606 OID 29905)
-- Name: strapi_history_versions strapi_history_versions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4377 (class 2606 OID 29775)
-- Name: strapi_release_actions strapi_release_actions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4409 (class 2606 OID 29935)
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;


--
-- TOC entry 4410 (class 2606 OID 29940)
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_ifk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;


--
-- TOC entry 4378 (class 2606 OID 29780)
-- Name: strapi_release_actions strapi_release_actions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4375 (class 2606 OID 29765)
-- Name: strapi_releases strapi_releases_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4376 (class 2606 OID 29770)
-- Name: strapi_releases strapi_releases_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4401 (class 2606 OID 29895)
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4427 (class 2606 OID 30025)
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4428 (class 2606 OID 30030)
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- TOC entry 4402 (class 2606 OID 29900)
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4399 (class 2606 OID 29885)
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4400 (class 2606 OID 29890)
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4379 (class 2606 OID 29785)
-- Name: strapi_workflows strapi_workflows_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4411 (class 2606 OID 29945)
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_fk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- TOC entry 4412 (class 2606 OID 29950)
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_ifk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- TOC entry 4381 (class 2606 OID 29795)
-- Name: strapi_workflows_stages strapi_workflows_stages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4415 (class 2606 OID 29965)
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- TOC entry 4416 (class 2606 OID 29970)
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4382 (class 2606 OID 29800)
-- Name: strapi_workflows_stages strapi_workflows_stages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4413 (class 2606 OID 29955)
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- TOC entry 4414 (class 2606 OID 29960)
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- TOC entry 4380 (class 2606 OID 29790)
-- Name: strapi_workflows strapi_workflows_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4383 (class 2606 OID 29805)
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4417 (class 2606 OID 29975)
-- Name: up_permissions_role_lnk up_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4418 (class 2606 OID 29980)
-- Name: up_permissions_role_lnk up_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- TOC entry 4384 (class 2606 OID 29810)
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4385 (class 2606 OID 29815)
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4386 (class 2606 OID 29820)
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4387 (class 2606 OID 29825)
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4419 (class 2606 OID 29985)
-- Name: up_users_role_lnk up_users_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- TOC entry 4420 (class 2606 OID 29990)
-- Name: up_users_role_lnk up_users_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- TOC entry 4388 (class 2606 OID 29830)
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4371 (class 2606 OID 29745)
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4407 (class 2606 OID 29925)
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 4408 (class 2606 OID 29930)
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_ifk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 4372 (class 2606 OID 29750)
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 4353 (class 2606 OID 16566)
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 4364 (class 2606 OID 28985)
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 4365 (class 2606 OID 29005)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 4366 (class 2606 OID 29000)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- TOC entry 4584 (class 0 OID 16519)
-- Dependencies: 247
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4598 (class 0 OID 28869)
-- Dependencies: 277
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4589 (class 0 OID 28666)
-- Dependencies: 268
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4583 (class 0 OID 16512)
-- Dependencies: 246
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4593 (class 0 OID 28756)
-- Dependencies: 272
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4592 (class 0 OID 28744)
-- Dependencies: 271
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4591 (class 0 OID 28731)
-- Dependencies: 270
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4599 (class 0 OID 28919)
-- Dependencies: 278
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4582 (class 0 OID 16501)
-- Dependencies: 245
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4596 (class 0 OID 28798)
-- Dependencies: 275
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4597 (class 0 OID 28816)
-- Dependencies: 276
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4585 (class 0 OID 16527)
-- Dependencies: 248
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4590 (class 0 OID 28696)
-- Dependencies: 269
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4595 (class 0 OID 28783)
-- Dependencies: 274
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4594 (class 0 OID 28774)
-- Dependencies: 273
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4581 (class 0 OID 16489)
-- Dependencies: 243
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4646 (class 3256 OID 31146)
-- Name: admin_users Admin can delete; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admin can delete" ON public.admin_users FOR DELETE USING ((auth.role() = 'authenticated'::text));


--
-- TOC entry 4648 (class 3256 OID 31144)
-- Name: admin_users Admin can insert; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admin can insert" ON public.admin_users FOR INSERT WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- TOC entry 4649 (class 3256 OID 31143)
-- Name: admin_users Admin can read; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admin can read" ON public.admin_users FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- TOC entry 4647 (class 3256 OID 31145)
-- Name: admin_users Admin can update; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admin can update" ON public.admin_users FOR UPDATE USING ((auth.role() = 'authenticated'::text));


--
-- TOC entry 4617 (class 0 OID 29458)
-- Dependencies: 317
-- Name: admin_permissions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.admin_permissions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4636 (class 0 OID 29677)
-- Dependencies: 355
-- Name: admin_permissions_role_lnk; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.admin_permissions_role_lnk ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4619 (class 0 OID 29482)
-- Dependencies: 321
-- Name: admin_roles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.admin_roles ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4618 (class 0 OID 29470)
-- Dependencies: 319
-- Name: admin_users; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.admin_users ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4637 (class 0 OID 29689)
-- Dependencies: 357
-- Name: admin_users_roles_lnk; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.admin_users_roles_lnk ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4607 (class 0 OID 29328)
-- Dependencies: 297
-- Name: files; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.files ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4628 (class 0 OID 29582)
-- Dependencies: 339
-- Name: files_folder_lnk; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.files_folder_lnk ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4627 (class 0 OID 29570)
-- Dependencies: 337
-- Name: files_related_mph; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.files_related_mph ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4609 (class 0 OID 29362)
-- Dependencies: 301
-- Name: i18n_locale; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.i18n_locale ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4606 (class 0 OID 29316)
-- Dependencies: 295
-- Name: pages; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.pages ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4645 (class 3256 OID 31168)
-- Name: pages public can read; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "public can read" ON public.pages FOR SELECT USING (true);


--
-- TOC entry 4621 (class 0 OID 29506)
-- Dependencies: 325
-- Name: strapi_api_token_permissions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_api_token_permissions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4638 (class 0 OID 29702)
-- Dependencies: 359
-- Name: strapi_api_token_permissions_token_lnk; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_api_token_permissions_token_lnk ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4620 (class 0 OID 29494)
-- Dependencies: 323
-- Name: strapi_api_tokens; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_api_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4624 (class 0 OID 29542)
-- Dependencies: 331
-- Name: strapi_core_store_settings; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_core_store_settings ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4605 (class 0 OID 29307)
-- Dependencies: 293
-- Name: strapi_database_schema; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_database_schema ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4626 (class 0 OID 29560)
-- Dependencies: 335
-- Name: strapi_history_versions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_history_versions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4603 (class 0 OID 29293)
-- Dependencies: 289
-- Name: strapi_migrations; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4604 (class 0 OID 29300)
-- Dependencies: 291
-- Name: strapi_migrations_internal; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_migrations_internal ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4611 (class 0 OID 29386)
-- Dependencies: 305
-- Name: strapi_release_actions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_release_actions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4630 (class 0 OID 29606)
-- Dependencies: 343
-- Name: strapi_release_actions_release_lnk; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_release_actions_release_lnk ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4610 (class 0 OID 29374)
-- Dependencies: 303
-- Name: strapi_releases; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_releases ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4623 (class 0 OID 29530)
-- Dependencies: 329
-- Name: strapi_transfer_token_permissions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_transfer_token_permissions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4639 (class 0 OID 29714)
-- Dependencies: 361
-- Name: strapi_transfer_token_permissions_token_lnk; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_transfer_token_permissions_token_lnk ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4622 (class 0 OID 29518)
-- Dependencies: 327
-- Name: strapi_transfer_tokens; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_transfer_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4625 (class 0 OID 29551)
-- Dependencies: 333
-- Name: strapi_webhooks; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_webhooks ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4612 (class 0 OID 29398)
-- Dependencies: 307
-- Name: strapi_workflows; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_workflows ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4631 (class 0 OID 29618)
-- Dependencies: 345
-- Name: strapi_workflows_stage_required_to_publish_lnk; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_workflows_stage_required_to_publish_lnk ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4613 (class 0 OID 29410)
-- Dependencies: 309
-- Name: strapi_workflows_stages; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_workflows_stages ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4633 (class 0 OID 29641)
-- Dependencies: 349
-- Name: strapi_workflows_stages_permissions_lnk; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_workflows_stages_permissions_lnk ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4632 (class 0 OID 29629)
-- Dependencies: 347
-- Name: strapi_workflows_stages_workflow_lnk; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.strapi_workflows_stages_workflow_lnk ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4614 (class 0 OID 29422)
-- Dependencies: 311
-- Name: up_permissions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.up_permissions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4634 (class 0 OID 29653)
-- Dependencies: 351
-- Name: up_permissions_role_lnk; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.up_permissions_role_lnk ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4615 (class 0 OID 29434)
-- Dependencies: 313
-- Name: up_roles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.up_roles ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4616 (class 0 OID 29446)
-- Dependencies: 315
-- Name: up_users; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.up_users ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4635 (class 0 OID 29665)
-- Dependencies: 353
-- Name: up_users_role_lnk; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.up_users_role_lnk ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4608 (class 0 OID 29346)
-- Dependencies: 299
-- Name: upload_folders; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.upload_folders ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4629 (class 0 OID 29594)
-- Dependencies: 341
-- Name: upload_folders_parent_lnk; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.upload_folders_parent_lnk ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4602 (class 0 OID 29190)
-- Dependencies: 287
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4640 (class 3256 OID 31271)
-- Name: objects Allow all operations for Strapi uploads 350bhq_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow all operations for Strapi uploads 350bhq_0" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'Strapi-uploads'::text));


--
-- TOC entry 4641 (class 3256 OID 31270)
-- Name: objects Allow all operations for Strapi uploads 350bhq_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow all operations for Strapi uploads 350bhq_1" ON storage.objects FOR UPDATE USING ((bucket_id = 'Strapi-uploads'::text));


--
-- TOC entry 4642 (class 3256 OID 31269)
-- Name: objects Allow all operations for Strapi uploads 350bhq_2; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow all operations for Strapi uploads 350bhq_2" ON storage.objects FOR DELETE USING ((bucket_id = 'Strapi-uploads'::text));


--
-- TOC entry 4643 (class 3256 OID 31268)
-- Name: objects Allow all operations for Strapi uploads 350bhq_3; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow all operations for Strapi uploads 350bhq_3" ON storage.objects FOR SELECT USING ((bucket_id = 'Strapi-uploads'::text));


--
-- TOC entry 4644 (class 3256 OID 31241)
-- Name: objects Public Access; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Public Access" ON storage.objects FOR SELECT USING (true);


--
-- TOC entry 4586 (class 0 OID 16540)
-- Dependencies: 249
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4588 (class 0 OID 16582)
-- Dependencies: 251
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4587 (class 0 OID 16555)
-- Dependencies: 250
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4600 (class 0 OID 28976)
-- Dependencies: 279
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4601 (class 0 OID 28990)
-- Dependencies: 280
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4650 (class 6104 OID 16420)
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- TOC entry 4767 (class 0 OID 0)
-- Dependencies: 15
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- TOC entry 4768 (class 0 OID 0)
-- Dependencies: 13
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- TOC entry 4770 (class 0 OID 0)
-- Dependencies: 24
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;
GRANT ALL ON SCHEMA public TO strapi_user;


--
-- TOC entry 4771 (class 0 OID 0)
-- Dependencies: 16
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- TOC entry 4772 (class 0 OID 0)
-- Dependencies: 14
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- TOC entry 4780 (class 0 OID 0)
-- Dependencies: 391
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- TOC entry 4781 (class 0 OID 0)
-- Dependencies: 595
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- TOC entry 4783 (class 0 OID 0)
-- Dependencies: 390
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- TOC entry 4785 (class 0 OID 0)
-- Dependencies: 389
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- TOC entry 4786 (class 0 OID 0)
-- Dependencies: 577
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;


--
-- TOC entry 4787 (class 0 OID 0)
-- Dependencies: 572
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- TOC entry 4788 (class 0 OID 0)
-- Dependencies: 573
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- TOC entry 4789 (class 0 OID 0)
-- Dependencies: 560
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- TOC entry 4790 (class 0 OID 0)
-- Dependencies: 574
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- TOC entry 4791 (class 0 OID 0)
-- Dependencies: 540
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4792 (class 0 OID 0)
-- Dependencies: 542
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4793 (class 0 OID 0)
-- Dependencies: 557
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- TOC entry 4794 (class 0 OID 0)
-- Dependencies: 556
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- TOC entry 4795 (class 0 OID 0)
-- Dependencies: 539
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4796 (class 0 OID 0)
-- Dependencies: 541
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4797 (class 0 OID 0)
-- Dependencies: 561
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- TOC entry 4798 (class 0 OID 0)
-- Dependencies: 562
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- TOC entry 4799 (class 0 OID 0)
-- Dependencies: 537
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- TOC entry 4800 (class 0 OID 0)
-- Dependencies: 538
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- TOC entry 4802 (class 0 OID 0)
-- Dependencies: 594
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- TOC entry 4804 (class 0 OID 0)
-- Dependencies: 414
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 585
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 559
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4808 (class 0 OID 0)
-- Dependencies: 558
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- TOC entry 4809 (class 0 OID 0)
-- Dependencies: 580
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;


--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 579
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- TOC entry 4811 (class 0 OID 0)
-- Dependencies: 578
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;


--
-- TOC entry 4812 (class 0 OID 0)
-- Dependencies: 575
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 571
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- TOC entry 4814 (class 0 OID 0)
-- Dependencies: 398
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 567
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4816 (class 0 OID 0)
-- Dependencies: 569
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- TOC entry 4817 (class 0 OID 0)
-- Dependencies: 566
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 568
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 570
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 386
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 388
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 387
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 565
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 401
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 403
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 402
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 404
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 563
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 399
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 564
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 400
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 584
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 412
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4835 (class 0 OID 0)
-- Dependencies: 586
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4836 (class 0 OID 0)
-- Dependencies: 581
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;


--
-- TOC entry 4837 (class 0 OID 0)
-- Dependencies: 582
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.try_cast_double(inp text) FROM postgres;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;


--
-- TOC entry 4838 (class 0 OID 0)
-- Dependencies: 408
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.url_decode(data text) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;


--
-- TOC entry 4839 (class 0 OID 0)
-- Dependencies: 576
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.url_encode(data bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;


--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 405
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 406
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 407
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 554
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 555
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 392
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 393
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 395
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 394
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 396
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 583
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;


--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 588
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 374
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: postgres
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 548
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 549
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 550
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 609
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 616
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 608
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 602
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 611
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 613
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 614
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 610
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 617
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 612
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 607
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 615
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 277
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 278
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 244
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 275
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 276
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 269
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 273
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 264
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 262
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 317
-- Name: TABLE admin_permissions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.admin_permissions TO anon;
GRANT ALL ON TABLE public.admin_permissions TO authenticated;
GRANT ALL ON TABLE public.admin_permissions TO service_role;
GRANT ALL ON TABLE public.admin_permissions TO strapi_user;


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 316
-- Name: SEQUENCE admin_permissions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.admin_permissions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.admin_permissions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.admin_permissions_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.admin_permissions_id_seq TO strapi_user;


--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 355
-- Name: TABLE admin_permissions_role_lnk; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.admin_permissions_role_lnk TO anon;
GRANT ALL ON TABLE public.admin_permissions_role_lnk TO authenticated;
GRANT ALL ON TABLE public.admin_permissions_role_lnk TO service_role;
GRANT ALL ON TABLE public.admin_permissions_role_lnk TO strapi_user;


--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 354
-- Name: SEQUENCE admin_permissions_role_lnk_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.admin_permissions_role_lnk_id_seq TO anon;
GRANT ALL ON SEQUENCE public.admin_permissions_role_lnk_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.admin_permissions_role_lnk_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.admin_permissions_role_lnk_id_seq TO strapi_user;


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 321
-- Name: TABLE admin_roles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.admin_roles TO anon;
GRANT ALL ON TABLE public.admin_roles TO authenticated;
GRANT ALL ON TABLE public.admin_roles TO service_role;
GRANT ALL ON TABLE public.admin_roles TO strapi_user;


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 320
-- Name: SEQUENCE admin_roles_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.admin_roles_id_seq TO anon;
GRANT ALL ON SEQUENCE public.admin_roles_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.admin_roles_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.admin_roles_id_seq TO strapi_user;


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 319
-- Name: TABLE admin_users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.admin_users TO anon;
GRANT ALL ON TABLE public.admin_users TO authenticated;
GRANT ALL ON TABLE public.admin_users TO service_role;
GRANT ALL ON TABLE public.admin_users TO strapi_user;


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 318
-- Name: SEQUENCE admin_users_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.admin_users_id_seq TO anon;
GRANT ALL ON SEQUENCE public.admin_users_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.admin_users_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.admin_users_id_seq TO strapi_user;


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 357
-- Name: TABLE admin_users_roles_lnk; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.admin_users_roles_lnk TO anon;
GRANT ALL ON TABLE public.admin_users_roles_lnk TO authenticated;
GRANT ALL ON TABLE public.admin_users_roles_lnk TO service_role;
GRANT ALL ON TABLE public.admin_users_roles_lnk TO strapi_user;


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 356
-- Name: SEQUENCE admin_users_roles_lnk_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.admin_users_roles_lnk_id_seq TO anon;
GRANT ALL ON SEQUENCE public.admin_users_roles_lnk_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.admin_users_roles_lnk_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.admin_users_roles_lnk_id_seq TO strapi_user;


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 367
-- Name: TABLE components_bloc_contenu_contenus; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.components_bloc_contenu_contenus TO anon;
GRANT ALL ON TABLE public.components_bloc_contenu_contenus TO authenticated;
GRANT ALL ON TABLE public.components_bloc_contenu_contenus TO service_role;
GRANT ALL ON TABLE public.components_bloc_contenu_contenus TO strapi_user;


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 366
-- Name: SEQUENCE components_bloc_contenu_contenus_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.components_bloc_contenu_contenus_id_seq TO anon;
GRANT ALL ON SEQUENCE public.components_bloc_contenu_contenus_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.components_bloc_contenu_contenus_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.components_bloc_contenu_contenus_id_seq TO strapi_user;


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 371
-- Name: TABLE components_bloc_contenu_rich_contenus; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.components_bloc_contenu_rich_contenus TO anon;
GRANT ALL ON TABLE public.components_bloc_contenu_rich_contenus TO authenticated;
GRANT ALL ON TABLE public.components_bloc_contenu_rich_contenus TO service_role;
GRANT ALL ON TABLE public.components_bloc_contenu_rich_contenus TO strapi_user;


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 370
-- Name: SEQUENCE components_bloc_contenu_rich_contenus_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.components_bloc_contenu_rich_contenus_id_seq TO anon;
GRANT ALL ON SEQUENCE public.components_bloc_contenu_rich_contenus_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.components_bloc_contenu_rich_contenus_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.components_bloc_contenu_rich_contenus_id_seq TO strapi_user;


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 373
-- Name: TABLE components_bloc_image_image_avants; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.components_bloc_image_image_avants TO anon;
GRANT ALL ON TABLE public.components_bloc_image_image_avants TO authenticated;
GRANT ALL ON TABLE public.components_bloc_image_image_avants TO service_role;
GRANT ALL ON TABLE public.components_bloc_image_image_avants TO strapi_user;


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 372
-- Name: SEQUENCE components_bloc_image_image_avants_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.components_bloc_image_image_avants_id_seq TO anon;
GRANT ALL ON SEQUENCE public.components_bloc_image_image_avants_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.components_bloc_image_image_avants_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.components_bloc_image_image_avants_id_seq TO strapi_user;


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 369
-- Name: TABLE components_bloc_image_images; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.components_bloc_image_images TO anon;
GRANT ALL ON TABLE public.components_bloc_image_images TO authenticated;
GRANT ALL ON TABLE public.components_bloc_image_images TO service_role;
GRANT ALL ON TABLE public.components_bloc_image_images TO strapi_user;


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 368
-- Name: SEQUENCE components_bloc_image_images_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.components_bloc_image_images_id_seq TO anon;
GRANT ALL ON SEQUENCE public.components_bloc_image_images_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.components_bloc_image_images_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.components_bloc_image_images_id_seq TO strapi_user;


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 365
-- Name: TABLE components_bloc_titre_bloc_titres; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.components_bloc_titre_bloc_titres TO anon;
GRANT ALL ON TABLE public.components_bloc_titre_bloc_titres TO authenticated;
GRANT ALL ON TABLE public.components_bloc_titre_bloc_titres TO service_role;
GRANT ALL ON TABLE public.components_bloc_titre_bloc_titres TO strapi_user;


--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 364
-- Name: SEQUENCE components_bloc_titre_bloc_titres_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.components_bloc_titre_bloc_titres_id_seq TO anon;
GRANT ALL ON SEQUENCE public.components_bloc_titre_bloc_titres_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.components_bloc_titre_bloc_titres_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.components_bloc_titre_bloc_titres_id_seq TO strapi_user;


--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 297
-- Name: TABLE files; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.files TO anon;
GRANT ALL ON TABLE public.files TO authenticated;
GRANT ALL ON TABLE public.files TO service_role;
GRANT ALL ON TABLE public.files TO strapi_user;


--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 339
-- Name: TABLE files_folder_lnk; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.files_folder_lnk TO anon;
GRANT ALL ON TABLE public.files_folder_lnk TO authenticated;
GRANT ALL ON TABLE public.files_folder_lnk TO service_role;
GRANT ALL ON TABLE public.files_folder_lnk TO strapi_user;


--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 338
-- Name: SEQUENCE files_folder_lnk_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.files_folder_lnk_id_seq TO anon;
GRANT ALL ON SEQUENCE public.files_folder_lnk_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.files_folder_lnk_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.files_folder_lnk_id_seq TO strapi_user;


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 296
-- Name: SEQUENCE files_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.files_id_seq TO anon;
GRANT ALL ON SEQUENCE public.files_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.files_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.files_id_seq TO strapi_user;


--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 337
-- Name: TABLE files_related_mph; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.files_related_mph TO anon;
GRANT ALL ON TABLE public.files_related_mph TO authenticated;
GRANT ALL ON TABLE public.files_related_mph TO service_role;
GRANT ALL ON TABLE public.files_related_mph TO strapi_user;


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 336
-- Name: SEQUENCE files_related_mph_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.files_related_mph_id_seq TO anon;
GRANT ALL ON SEQUENCE public.files_related_mph_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.files_related_mph_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.files_related_mph_id_seq TO strapi_user;


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 301
-- Name: TABLE i18n_locale; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.i18n_locale TO anon;
GRANT ALL ON TABLE public.i18n_locale TO authenticated;
GRANT ALL ON TABLE public.i18n_locale TO service_role;
GRANT ALL ON TABLE public.i18n_locale TO strapi_user;


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 300
-- Name: SEQUENCE i18n_locale_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.i18n_locale_id_seq TO anon;
GRANT ALL ON SEQUENCE public.i18n_locale_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.i18n_locale_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.i18n_locale_id_seq TO strapi_user;


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 295
-- Name: TABLE pages; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.pages TO anon;
GRANT ALL ON TABLE public.pages TO authenticated;
GRANT ALL ON TABLE public.pages TO service_role;
GRANT ALL ON TABLE public.pages TO strapi_user;


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 363
-- Name: TABLE pages_cmps; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.pages_cmps TO anon;
GRANT ALL ON TABLE public.pages_cmps TO authenticated;
GRANT ALL ON TABLE public.pages_cmps TO service_role;
GRANT ALL ON TABLE public.pages_cmps TO strapi_user;


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 362
-- Name: SEQUENCE pages_cmps_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.pages_cmps_id_seq TO anon;
GRANT ALL ON SEQUENCE public.pages_cmps_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.pages_cmps_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.pages_cmps_id_seq TO strapi_user;


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 294
-- Name: SEQUENCE pages_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.pages_id_seq TO anon;
GRANT ALL ON SEQUENCE public.pages_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.pages_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.pages_id_seq TO strapi_user;


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 325
-- Name: TABLE strapi_api_token_permissions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_api_token_permissions TO anon;
GRANT ALL ON TABLE public.strapi_api_token_permissions TO authenticated;
GRANT ALL ON TABLE public.strapi_api_token_permissions TO service_role;
GRANT ALL ON TABLE public.strapi_api_token_permissions TO strapi_user;


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 324
-- Name: SEQUENCE strapi_api_token_permissions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_api_token_permissions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_api_token_permissions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_api_token_permissions_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_api_token_permissions_id_seq TO strapi_user;


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 359
-- Name: TABLE strapi_api_token_permissions_token_lnk; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_api_token_permissions_token_lnk TO anon;
GRANT ALL ON TABLE public.strapi_api_token_permissions_token_lnk TO authenticated;
GRANT ALL ON TABLE public.strapi_api_token_permissions_token_lnk TO service_role;
GRANT ALL ON TABLE public.strapi_api_token_permissions_token_lnk TO strapi_user;


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 358
-- Name: SEQUENCE strapi_api_token_permissions_token_lnk_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq TO strapi_user;


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 323
-- Name: TABLE strapi_api_tokens; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_api_tokens TO anon;
GRANT ALL ON TABLE public.strapi_api_tokens TO authenticated;
GRANT ALL ON TABLE public.strapi_api_tokens TO service_role;
GRANT ALL ON TABLE public.strapi_api_tokens TO strapi_user;


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 322
-- Name: SEQUENCE strapi_api_tokens_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_api_tokens_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_api_tokens_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_api_tokens_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_api_tokens_id_seq TO strapi_user;


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 331
-- Name: TABLE strapi_core_store_settings; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_core_store_settings TO anon;
GRANT ALL ON TABLE public.strapi_core_store_settings TO authenticated;
GRANT ALL ON TABLE public.strapi_core_store_settings TO service_role;
GRANT ALL ON TABLE public.strapi_core_store_settings TO strapi_user;


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 330
-- Name: SEQUENCE strapi_core_store_settings_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_core_store_settings_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_core_store_settings_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_core_store_settings_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_core_store_settings_id_seq TO strapi_user;


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 293
-- Name: TABLE strapi_database_schema; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_database_schema TO anon;
GRANT ALL ON TABLE public.strapi_database_schema TO authenticated;
GRANT ALL ON TABLE public.strapi_database_schema TO service_role;
GRANT ALL ON TABLE public.strapi_database_schema TO strapi_user;


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 292
-- Name: SEQUENCE strapi_database_schema_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_database_schema_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_database_schema_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_database_schema_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_database_schema_id_seq TO strapi_user;


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 335
-- Name: TABLE strapi_history_versions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_history_versions TO anon;
GRANT ALL ON TABLE public.strapi_history_versions TO authenticated;
GRANT ALL ON TABLE public.strapi_history_versions TO service_role;
GRANT ALL ON TABLE public.strapi_history_versions TO strapi_user;


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 334
-- Name: SEQUENCE strapi_history_versions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_history_versions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_history_versions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_history_versions_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_history_versions_id_seq TO strapi_user;


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 289
-- Name: TABLE strapi_migrations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_migrations TO anon;
GRANT ALL ON TABLE public.strapi_migrations TO authenticated;
GRANT ALL ON TABLE public.strapi_migrations TO service_role;
GRANT ALL ON TABLE public.strapi_migrations TO strapi_user;


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 288
-- Name: SEQUENCE strapi_migrations_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_migrations_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_migrations_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_migrations_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_migrations_id_seq TO strapi_user;


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 291
-- Name: TABLE strapi_migrations_internal; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_migrations_internal TO anon;
GRANT ALL ON TABLE public.strapi_migrations_internal TO authenticated;
GRANT ALL ON TABLE public.strapi_migrations_internal TO service_role;
GRANT ALL ON TABLE public.strapi_migrations_internal TO strapi_user;


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 290
-- Name: SEQUENCE strapi_migrations_internal_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_migrations_internal_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_migrations_internal_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_migrations_internal_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_migrations_internal_id_seq TO strapi_user;


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 305
-- Name: TABLE strapi_release_actions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_release_actions TO anon;
GRANT ALL ON TABLE public.strapi_release_actions TO authenticated;
GRANT ALL ON TABLE public.strapi_release_actions TO service_role;
GRANT ALL ON TABLE public.strapi_release_actions TO strapi_user;


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 304
-- Name: SEQUENCE strapi_release_actions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_release_actions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_release_actions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_release_actions_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_release_actions_id_seq TO strapi_user;


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 343
-- Name: TABLE strapi_release_actions_release_lnk; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_release_actions_release_lnk TO anon;
GRANT ALL ON TABLE public.strapi_release_actions_release_lnk TO authenticated;
GRANT ALL ON TABLE public.strapi_release_actions_release_lnk TO service_role;
GRANT ALL ON TABLE public.strapi_release_actions_release_lnk TO strapi_user;


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 342
-- Name: SEQUENCE strapi_release_actions_release_lnk_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_release_actions_release_lnk_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_release_actions_release_lnk_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_release_actions_release_lnk_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_release_actions_release_lnk_id_seq TO strapi_user;


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 303
-- Name: TABLE strapi_releases; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_releases TO anon;
GRANT ALL ON TABLE public.strapi_releases TO authenticated;
GRANT ALL ON TABLE public.strapi_releases TO service_role;
GRANT ALL ON TABLE public.strapi_releases TO strapi_user;


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 302
-- Name: SEQUENCE strapi_releases_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_releases_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_releases_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_releases_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_releases_id_seq TO strapi_user;


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 329
-- Name: TABLE strapi_transfer_token_permissions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_transfer_token_permissions TO anon;
GRANT ALL ON TABLE public.strapi_transfer_token_permissions TO authenticated;
GRANT ALL ON TABLE public.strapi_transfer_token_permissions TO service_role;
GRANT ALL ON TABLE public.strapi_transfer_token_permissions TO strapi_user;


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 328
-- Name: SEQUENCE strapi_transfer_token_permissions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_transfer_token_permissions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_transfer_token_permissions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_transfer_token_permissions_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_transfer_token_permissions_id_seq TO strapi_user;


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 361
-- Name: TABLE strapi_transfer_token_permissions_token_lnk; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_transfer_token_permissions_token_lnk TO anon;
GRANT ALL ON TABLE public.strapi_transfer_token_permissions_token_lnk TO authenticated;
GRANT ALL ON TABLE public.strapi_transfer_token_permissions_token_lnk TO service_role;
GRANT ALL ON TABLE public.strapi_transfer_token_permissions_token_lnk TO strapi_user;


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 360
-- Name: SEQUENCE strapi_transfer_token_permissions_token_lnk_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq TO strapi_user;


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 327
-- Name: TABLE strapi_transfer_tokens; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_transfer_tokens TO anon;
GRANT ALL ON TABLE public.strapi_transfer_tokens TO authenticated;
GRANT ALL ON TABLE public.strapi_transfer_tokens TO service_role;
GRANT ALL ON TABLE public.strapi_transfer_tokens TO strapi_user;


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 326
-- Name: SEQUENCE strapi_transfer_tokens_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_transfer_tokens_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_transfer_tokens_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_transfer_tokens_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_transfer_tokens_id_seq TO strapi_user;


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 333
-- Name: TABLE strapi_webhooks; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_webhooks TO anon;
GRANT ALL ON TABLE public.strapi_webhooks TO authenticated;
GRANT ALL ON TABLE public.strapi_webhooks TO service_role;
GRANT ALL ON TABLE public.strapi_webhooks TO strapi_user;


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 332
-- Name: SEQUENCE strapi_webhooks_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_webhooks_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_webhooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_webhooks_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_webhooks_id_seq TO strapi_user;


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 307
-- Name: TABLE strapi_workflows; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_workflows TO anon;
GRANT ALL ON TABLE public.strapi_workflows TO authenticated;
GRANT ALL ON TABLE public.strapi_workflows TO service_role;
GRANT ALL ON TABLE public.strapi_workflows TO strapi_user;


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 306
-- Name: SEQUENCE strapi_workflows_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_workflows_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_workflows_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_workflows_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_workflows_id_seq TO strapi_user;


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 345
-- Name: TABLE strapi_workflows_stage_required_to_publish_lnk; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_workflows_stage_required_to_publish_lnk TO anon;
GRANT ALL ON TABLE public.strapi_workflows_stage_required_to_publish_lnk TO authenticated;
GRANT ALL ON TABLE public.strapi_workflows_stage_required_to_publish_lnk TO service_role;
GRANT ALL ON TABLE public.strapi_workflows_stage_required_to_publish_lnk TO strapi_user;


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 344
-- Name: SEQUENCE strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq TO strapi_user;


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 309
-- Name: TABLE strapi_workflows_stages; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_workflows_stages TO anon;
GRANT ALL ON TABLE public.strapi_workflows_stages TO authenticated;
GRANT ALL ON TABLE public.strapi_workflows_stages TO service_role;
GRANT ALL ON TABLE public.strapi_workflows_stages TO strapi_user;


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 308
-- Name: SEQUENCE strapi_workflows_stages_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_workflows_stages_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_workflows_stages_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_workflows_stages_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_workflows_stages_id_seq TO strapi_user;


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 349
-- Name: TABLE strapi_workflows_stages_permissions_lnk; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_workflows_stages_permissions_lnk TO anon;
GRANT ALL ON TABLE public.strapi_workflows_stages_permissions_lnk TO authenticated;
GRANT ALL ON TABLE public.strapi_workflows_stages_permissions_lnk TO service_role;
GRANT ALL ON TABLE public.strapi_workflows_stages_permissions_lnk TO strapi_user;


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 348
-- Name: SEQUENCE strapi_workflows_stages_permissions_lnk_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq TO strapi_user;


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 347
-- Name: TABLE strapi_workflows_stages_workflow_lnk; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.strapi_workflows_stages_workflow_lnk TO anon;
GRANT ALL ON TABLE public.strapi_workflows_stages_workflow_lnk TO authenticated;
GRANT ALL ON TABLE public.strapi_workflows_stages_workflow_lnk TO service_role;
GRANT ALL ON TABLE public.strapi_workflows_stages_workflow_lnk TO strapi_user;


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 346
-- Name: SEQUENCE strapi_workflows_stages_workflow_lnk_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq TO anon;
GRANT ALL ON SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq TO strapi_user;


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 311
-- Name: TABLE up_permissions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.up_permissions TO anon;
GRANT ALL ON TABLE public.up_permissions TO authenticated;
GRANT ALL ON TABLE public.up_permissions TO service_role;
GRANT ALL ON TABLE public.up_permissions TO strapi_user;


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 310
-- Name: SEQUENCE up_permissions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.up_permissions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.up_permissions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.up_permissions_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.up_permissions_id_seq TO strapi_user;


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 351
-- Name: TABLE up_permissions_role_lnk; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.up_permissions_role_lnk TO anon;
GRANT ALL ON TABLE public.up_permissions_role_lnk TO authenticated;
GRANT ALL ON TABLE public.up_permissions_role_lnk TO service_role;
GRANT ALL ON TABLE public.up_permissions_role_lnk TO strapi_user;


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 350
-- Name: SEQUENCE up_permissions_role_lnk_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.up_permissions_role_lnk_id_seq TO anon;
GRANT ALL ON SEQUENCE public.up_permissions_role_lnk_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.up_permissions_role_lnk_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.up_permissions_role_lnk_id_seq TO strapi_user;


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 313
-- Name: TABLE up_roles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.up_roles TO anon;
GRANT ALL ON TABLE public.up_roles TO authenticated;
GRANT ALL ON TABLE public.up_roles TO service_role;
GRANT ALL ON TABLE public.up_roles TO strapi_user;


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 312
-- Name: SEQUENCE up_roles_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.up_roles_id_seq TO anon;
GRANT ALL ON SEQUENCE public.up_roles_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.up_roles_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.up_roles_id_seq TO strapi_user;


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 315
-- Name: TABLE up_users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.up_users TO anon;
GRANT ALL ON TABLE public.up_users TO authenticated;
GRANT ALL ON TABLE public.up_users TO service_role;
GRANT ALL ON TABLE public.up_users TO strapi_user;


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 314
-- Name: SEQUENCE up_users_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.up_users_id_seq TO anon;
GRANT ALL ON SEQUENCE public.up_users_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.up_users_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.up_users_id_seq TO strapi_user;


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 353
-- Name: TABLE up_users_role_lnk; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.up_users_role_lnk TO anon;
GRANT ALL ON TABLE public.up_users_role_lnk TO authenticated;
GRANT ALL ON TABLE public.up_users_role_lnk TO service_role;
GRANT ALL ON TABLE public.up_users_role_lnk TO strapi_user;


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 352
-- Name: SEQUENCE up_users_role_lnk_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.up_users_role_lnk_id_seq TO anon;
GRANT ALL ON SEQUENCE public.up_users_role_lnk_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.up_users_role_lnk_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.up_users_role_lnk_id_seq TO strapi_user;


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 299
-- Name: TABLE upload_folders; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.upload_folders TO anon;
GRANT ALL ON TABLE public.upload_folders TO authenticated;
GRANT ALL ON TABLE public.upload_folders TO service_role;
GRANT ALL ON TABLE public.upload_folders TO strapi_user;


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 298
-- Name: SEQUENCE upload_folders_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.upload_folders_id_seq TO anon;
GRANT ALL ON SEQUENCE public.upload_folders_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.upload_folders_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.upload_folders_id_seq TO strapi_user;


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 341
-- Name: TABLE upload_folders_parent_lnk; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.upload_folders_parent_lnk TO anon;
GRANT ALL ON TABLE public.upload_folders_parent_lnk TO authenticated;
GRANT ALL ON TABLE public.upload_folders_parent_lnk TO service_role;
GRANT ALL ON TABLE public.upload_folders_parent_lnk TO strapi_user;


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 340
-- Name: SEQUENCE upload_folders_parent_lnk_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.upload_folders_parent_lnk_id_seq TO anon;
GRANT ALL ON SEQUENCE public.upload_folders_parent_lnk_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.upload_folders_parent_lnk_id_seq TO service_role;
GRANT ALL ON SEQUENCE public.upload_folders_parent_lnk_id_seq TO strapi_user;


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 287
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 281
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 284
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 283
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 279
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 280
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- TOC entry 2717 (class 826 OID 16597)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- TOC entry 2718 (class 826 OID 16598)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- TOC entry 2716 (class 826 OID 16596)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- TOC entry 2732 (class 826 OID 16980)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- TOC entry 2731 (class 826 OID 16979)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- TOC entry 2730 (class 826 OID 16978)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- TOC entry 2735 (class 826 OID 16631)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2734 (class 826 OID 16630)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2733 (class 826 OID 16629)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2722 (class 826 OID 16611)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2724 (class 826 OID 16610)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2723 (class 826 OID 16609)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2729 (class 826 OID 16839)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES TO pgsodium_keyholder;


--
-- TOC entry 2728 (class 826 OID 16838)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES TO pgsodium_keyholder;


--
-- TOC entry 2726 (class 826 OID 16836)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES TO pgsodium_keyiduser;


--
-- TOC entry 2727 (class 826 OID 16837)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS TO pgsodium_keyiduser;


--
-- TOC entry 2725 (class 826 OID 16835)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES TO pgsodium_keyiduser;


--
-- TOC entry 2737 (class 826 OID 16484)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO strapi_user;


--
-- TOC entry 2710 (class 826 OID 16485)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2738 (class 826 OID 16483)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO strapi_user;


--
-- TOC entry 2712 (class 826 OID 16487)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2736 (class 826 OID 16482)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO strapi_user;


--
-- TOC entry 2711 (class 826 OID 16486)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2720 (class 826 OID 16601)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- TOC entry 2721 (class 826 OID 16602)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- TOC entry 2719 (class 826 OID 16600)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- TOC entry 2715 (class 826 OID 16539)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2714 (class 826 OID 16538)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2713 (class 826 OID 16537)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 3904 (class 3466 OID 16615)
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- TOC entry 3910 (class 3466 OID 16993)
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- TOC entry 3903 (class 3466 OID 16613)
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- TOC entry 3902 (class 3466 OID 16594)
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- TOC entry 3905 (class 3466 OID 16616)
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- TOC entry 3906 (class 3466 OID 16617)
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

-- Completed on 2025-02-05 20:42:14 CET

--
-- PostgreSQL database dump complete
--

