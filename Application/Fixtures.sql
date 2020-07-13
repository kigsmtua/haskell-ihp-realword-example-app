

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.users DISABLE TRIGGER ALL;



ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.articles DISABLE TRIGGER ALL;



ALTER TABLE public.articles ENABLE TRIGGER ALL;


ALTER TABLE public.article_comments DISABLE TRIGGER ALL;



ALTER TABLE public.article_comments ENABLE TRIGGER ALL;


ALTER TABLE public.article_favorites DISABLE TRIGGER ALL;



ALTER TABLE public.article_favorites ENABLE TRIGGER ALL;


ALTER TABLE public.tags DISABLE TRIGGER ALL;



ALTER TABLE public.tags ENABLE TRIGGER ALL;


ALTER TABLE public.article_tags DISABLE TRIGGER ALL;



ALTER TABLE public.article_tags ENABLE TRIGGER ALL;


ALTER TABLE public.user_followers DISABLE TRIGGER ALL;



ALTER TABLE public.user_followers ENABLE TRIGGER ALL;


