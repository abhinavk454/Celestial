--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    description text,
    total_stars integer,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    has_life boolean,
    is_spherical boolean
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
    name character varying(50) NOT NULL,
    description text,
    distance_from_planet integer,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    planet_id integer
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
-- Name: observation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observation (
    observation_id integer NOT NULL,
    event_name character varying(100) NOT NULL,
    observation_date date NOT NULL,
    description text,
    observed_object_type character varying(50),
    observed_object_id integer,
    observer_name character varying(100),
    has_life boolean,
    is_spherical boolean,
    int_column1 integer,
    int_column2 integer,
    name character varying(100) NOT NULL
);


ALTER TABLE public.observation OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observation_observation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_observation_id_seq OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observation_observation_id_seq OWNED BY public.observation.observation_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    total_moons integer,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    star_id integer
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
    name character varying(50) NOT NULL,
    description text,
    total_planets integer,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: observation observation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation ALTER COLUMN observation_id SET DEFAULT nextval('public.observation_observation_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral galaxy containing billions of stars.', 200000000, 13000, 100000.00, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral galaxy nearest to the Milky Way.', 1000000000, 6000, 2200000.00, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy in the Local Group.', 400000000, 20000, 3000000.00, false, true);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 'Spiral galaxy in the constellation Ursa Major.', 250000000, 12000, 11500000.00, false, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'Interacting spiral galaxy also in Ursa Major.', 400000000, 15000, 31000000.00, false, true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Spiral galaxy with a prominent bulge.', 100000000, 13000, 29000000.00, false, true);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel Galaxy', 'Face-on spiral galaxy in the constellation Ursa Major.', 300000000, 15000, 27000000.00, false, true);
INSERT INTO public.galaxy VALUES (8, 'Bode''s Galaxy', 'Spiral galaxy in the constellation Ursa Major.', 150000000, 12000, 29000000.00, false, true);
INSERT INTO public.galaxy VALUES (9, 'Cigar Galaxy', 'Spiral galaxy in the constellation Ursa Major.', 200000000, 14000, 30000000.00, false, true);
INSERT INTO public.galaxy VALUES (10, 'Sculptor Galaxy', 'Spiral galaxy in the constellation Sculptor.', 100000000, 13000, 12000000.00, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (14, 'Europa', 'Jupiter’s moon with a possible subsurface ocean.', 670, 100, 670.90, true, true, 2);
INSERT INTO public.moon VALUES (15, 'Titan', 'Saturn’s largest moon, with a dense atmosphere.', 1221, 100, 1221.90, true, true, 1);
INSERT INTO public.moon VALUES (16, 'Ganymede', 'Largest moon of Jupiter and in the solar system.', 1070, 100, 1070.40, true, true, 1);
INSERT INTO public.moon VALUES (17, 'Callisto', 'One of Jupiter’s Galilean moons.', 1882, 100, 1882.70, true, false, 1);
INSERT INTO public.moon VALUES (18, 'Io1', 'Volcanic moon of Jupiter with intense volcanic activity.', 421, 100, 421.70, false, false, 1);
INSERT INTO public.moon VALUES (19, 'Enceladus', 'Moon of Saturn known for its geysers.', 238, 100, 238.00, true, true, 1);
INSERT INTO public.moon VALUES (20, 'Miranda', 'Moon of Uranus known for its fractured surface.', 130, 100, 130.00, false, true, 1);
INSERT INTO public.moon VALUES (21, 'Triton', 'Largest moon of Neptune and in the solar system.', 355, 100, 355.00, false, true, 1);
INSERT INTO public.moon VALUES (22, 'Charon', 'Largest moon of Pluto.', 220, 100, 220.00, false, false, 1);
INSERT INTO public.moon VALUES (23, 'Phobos', 'Largest moon of Mars.', 9378, 100, 9378.00, false, false, 1);
INSERT INTO public.moon VALUES (24, 'Deimos', 'Smaller moon of Mars.', 23463, 100, 23463.00, false, false, 1);
INSERT INTO public.moon VALUES (25, 'Luna', 'The Moon, Earth’s natural satellite.', 384, 100, 384.00, true, true, 1);
INSERT INTO public.moon VALUES (26, 'Io2', 'Volcanic moon of Jupiter with intense volcanic activity.', 421, 100, 421.70, false, false, 1);
INSERT INTO public.moon VALUES (27, 'Phobos2', 'Largest moon of Mars.', 9378, 100, 9378.00, false, false, 1);
INSERT INTO public.moon VALUES (28, 'Deimos2', 'Smaller moon of Mars.', 23463, 100, 23463.00, false, false, 1);
INSERT INTO public.moon VALUES (29, 'Luna2', 'The Moon, Earth’s natural satellite.', 384, 100, 384.00, true, true, 1);
INSERT INTO public.moon VALUES (30, 'Ganymede2', 'Largest moon of Jupiter and in the solar system.', 1070, 100, 1070.40, true, true, 1);
INSERT INTO public.moon VALUES (31, 'Callisto2', 'One of Jupiter’s Galilean moons.', 1882, 100, 1882.70, true, false, 1);
INSERT INTO public.moon VALUES (32, 'Io3', 'Volcanic moon of Jupiter with intense volcanic activity.', 421, 100, 421.70, false, false, 1);
INSERT INTO public.moon VALUES (33, 'Enceladus2', 'Moon of Saturn known for its geysers.', 238, 100, 238.00, true, true, 1);


--
-- Data for Name: observation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observation VALUES (1, 'Supernova Observation', '2023-12-01', 'Astronomers observed a distant supernova.', 'Star', 1, 'Astronomer A', true, false, 10, 20, 'Observation1');
INSERT INTO public.observation VALUES (2, 'Exoplanet Transit', '2023-12-10', 'Detection of an exoplanet transit in a star system.', 'Planet', 1, 'Astronomer B', true, true, 30, 40, 'Observation2');
INSERT INTO public.observation VALUES (3, 'Lunar Eclipse', '2023-12-25', 'Observation of a lunar eclipse.', 'Moon', 1, 'Astronomer C', false, false, 50, 60, 'Observation3');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Kepler-452b', 'An exoplanet orbiting a sun-like star.', 2, 6500, 1400.00, true, true, 2);
INSERT INTO public.planet VALUES (2, 'HD 209458 b', 'A gaseous exoplanet known for its atmosphere.', 0, 4500, 156.00, false, false, 2);
INSERT INTO public.planet VALUES (3, 'Gliese 581c', 'A potentially habitable exoplanet.', 1, 2000, 20.00, true, true, 2);
INSERT INTO public.planet VALUES (4, 'WASP-12b', 'A hot Jupiter exoplanet with extreme conditions.', 0, 3000, 600.00, false, true, 2);
INSERT INTO public.planet VALUES (5, 'TRAPPIST-1e', 'A potentially habitable exoplanet within the TRAPPIST-1 system.', 2, 1500, 40.00, true, true, 2);
INSERT INTO public.planet VALUES (6, 'Proxima Centauri b', 'An exoplanet orbiting Proxima Centauri, our nearest star.', 0, 500, 4.24, true, true, 5);
INSERT INTO public.planet VALUES (7, 'PSR B1257+12 A', 'The first extrasolar planetary system discovered around a pulsar.', 3, 10000, 2300.00, true, false, 4);
INSERT INTO public.planet VALUES (8, 'PSR B1257+12 B', 'A planet in the PSR B1257+12 system.', 1, 9000, 2500.00, false, false, 4);
INSERT INTO public.planet VALUES (9, 'PSR B1257+12 C', 'One of the planets in the PSR B1257+12 system.', 0, 8000, 2700.00, false, false, 4);
INSERT INTO public.planet VALUES (10, 'K2-18b', 'An exoplanet within the habitable zone of its star.', 2, 3500, 110.00, true, true, 2);
INSERT INTO public.planet VALUES (11, 'HD 85512 b', 'An exoplanet within the habitable zone of its star.', 1, 4000, 36.00, true, true, 2);
INSERT INTO public.planet VALUES (12, 'Wolf 1061c', 'A potentially habitable exoplanet within the Wolf 1061 system.', 1, 8000, 14.00, true, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our solar system star.', 8, 4500, 0.00, true, true, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'Closest star system to the Solar System.', 5, 6000, 4.37, false, true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'Brightest star in Earth’s night sky.', 3, 250, 8.60, false, true, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant in the constellation Orion.', 0, 8000, 643.00, false, false, 3);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Closest known star to the Sun.', 2, 6000, 4.24, false, true, 1);
INSERT INTO public.star VALUES (6, 'Alpha Proxima', 'A red dwarf star in the Alpha Centauri system.', 4, 6000, 4.22, false, true, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 33, true);


--
-- Name: observation_observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observation_observation_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: observation observation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (observation_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: observation unique_name_observation; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT unique_name_observation UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

