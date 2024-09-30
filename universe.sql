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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    tail_length integer NOT NULL,
    orbit_period numeric,
    description text,
    is_periodic boolean NOT NULL,
    is_visible boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    galaxy_type character varying(50),
    distance_from_earth numeric,
    is_visible boolean NOT NULL,
    has_black_hole boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter integer NOT NULL,
    distance_from_planet numeric,
    description text,
    planet_id integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    is_geologically_active boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    mass integer NOT NULL,
    radius integer NOT NULL,
    description text,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric,
    description text,
    galaxy_id integer NOT NULL,
    is_visible boolean NOT NULL,
    is_main_sequence boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 24, 75.3, 'One of the most famous periodic comets', true, true);
INSERT INTO public.comet VALUES (2, 'Comet Hale-Bopp', 56, 2533, 'A very bright comet that was visible to the naked eye', true, true);
INSERT INTO public.comet VALUES (3, 'Comet Hyakutake', 18, 17000, 'A comet that passed very close to Earth in 1996', true, true);
INSERT INTO public.comet VALUES (4, 'Comet Encke', 5, 3.3, 'A periodic comet with the shortest known orbital period', true, true);
INSERT INTO public.comet VALUES (5, 'Comet McNaught', 20, 92000, 'One of the brightest comets seen in recent times', true, true);
INSERT INTO public.comet VALUES (6, 'Comet Lovejoy', 15, 8000, 'A comet discovered by amateur astronomer Terry Lovejoy', true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 0, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 'Spiral', 2537000, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in the Local Group', 'Spiral', 3000000, true, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous for its spiral structure', 'Spiral', 23000000, true, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Notable for its bright nucleus', 'Elliptical', 29000000, false, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A giant elliptical galaxy', 'Elliptical', 53000000, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, 0.384, 'Earth''s only natural satellite', 3, false, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 0.00006, 'One of Mars'' moons', 4, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 0.00023, 'One of Mars'' moons', 4, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 3643, 0.422, 'One of Jupiter''s moons', 5, false, true);
INSERT INTO public.moon VALUES (5, 'Europa', 3122, 0.671, 'One of Jupiter''s moons', 5, true, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, 1.070, 'The largest moon in the solar system', 5, false, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820, 1.882, 'One of Jupiter''s moons', 5, false, false);
INSERT INTO public.moon VALUES (8, 'Titan', 5150, 1.222, 'Saturn''s largest moon', 6, true, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 1528, 0.527, 'One of Saturn''s moons', 6, false, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1469, 3.561, 'One of Saturn''s moons', 6, false, false);
INSERT INTO public.moon VALUES (11, 'Oberon', 1523, 0.584, 'One of Uranus'' moons', 7, false, false);
INSERT INTO public.moon VALUES (12, 'Titania', 1578, 0.436, 'One of Uranus'' moons', 7, false, false);
INSERT INTO public.moon VALUES (13, 'Triton', 2706, 0.354, 'Neptune''s largest moon', 8, true, true);
INSERT INTO public.moon VALUES (14, 'Nereid', 340, 5.513, 'One of Neptune''s moons', 8, false, false);
INSERT INTO public.moon VALUES (15, 'Proxima b I', 1000, 0.002, 'A moon of Proxima b', 9, false, false);
INSERT INTO public.moon VALUES (16, 'Alpha Centauri Bb I', 1200, 0.003, 'A moon of Alpha Centauri Bb', 10, false, false);
INSERT INTO public.moon VALUES (17, 'Kepler-22b I', 1500, 0.004, 'A moon of Kepler-22b', 11, false, false);
INSERT INTO public.moon VALUES (18, 'TRAPPIST-1e I', 800, 0.005, 'A moon of TRAPPIST-1e', 12, false, false);
INSERT INTO public.moon VALUES (19, 'TRAPPIST-1e II', 900, 0.006, 'A moon of TRAPPIST-1e', 12, false, false);
INSERT INTO public.moon VALUES (20, 'TRAPPIST-1e III', 1000, 0.007, 'A moon of TRAPPIST-1e', 12, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 330, 2439, 'The smallest planet in our solar system', 1, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 4870, 6052, 'The hottest planet in our solar system', 1, false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 5972, 6371, 'Our home planet', 1, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 641, 3389, 'The red planet', 1, false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1898600, 69911, 'The largest planet in our solar system', 1, false, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 568340, 58232, 'Known for its ring system', 1, false, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 86810, 25362, 'An ice giant', 1, false, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 102410, 24622, 'The farthest planet from the Sun', 1, false, false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 1200, 6371, 'An exoplanet orbiting Proxima Centauri', 2, false, true);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 1300, 6371, 'An exoplanet orbiting Alpha Centauri B', 5, false, true);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 2400, 12742, 'An exoplanet in the habitable zone of its star', 6, false, true);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 600, 6371, 'An exoplanet in the TRAPPIST-1 system', 6, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 0, 'The star at the center of our solar system', 1, true, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4500, 4.24, 'The closest known star to the Sun', 2, true, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8500, 642.5, 'A red supergiant star in the constellation Orion', 1, true, false);
INSERT INTO public.star VALUES (4, 'Sirius', 300, 8.6, 'The brightest star in the night sky', 1, true, true);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 4500, 4.37, 'Part of the closest star system to the Solar System', 2, true, true);
INSERT INTO public.star VALUES (6, 'Vega', 455, 25, 'The fifth-brightest star in the night sky', 1, true, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

