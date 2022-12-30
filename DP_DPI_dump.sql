--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2022-12-30 22:29:45 CET

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
-- TOC entry 229 (class 1259 OID 16787)
-- Name: Commodities; Type: TABLE; Schema: global_schema; Owner: postgres
--

CREATE TABLE global_schema."Commodities" (
    "FS name" text NOT NULL,
    "FS macro region" text NOT NULL,
    "Name" text NOT NULL,
    "NCBI taxonomy ID" integer,
    "Max THI" real,
    "Min temperature" real,
    "Max temperature" real,
    "Average temperature" real,
    "Min precipitation" real,
    "Max precipitation" real,
    "Average precipitation" real,
    "Min elevation" real,
    "Max elevation" real
);


ALTER TABLE global_schema."Commodities" OWNER TO postgres;

--
-- TOC entry 3631 (class 0 OID 16787)
-- Dependencies: 229
-- Data for Name: Commodities; Type: TABLE DATA; Schema: global_schema; Owner: postgres
--

INSERT INTO global_schema."Commodities" VALUES ('Agro-Pastoral Millet/Sorghum', 'SSA', 'Ago-pastoral', NULL, NULL, NULL, NULL, NULL, NULL, 450, 800, 200, 400);
INSERT INTO global_schema."Commodities" VALUES ('Irrigated', 'LAC', 'Asparagus', 4685, NULL, 15, 26, NULL, 60, 100, NULL, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Forest based Livestock', 'LAC', 'Avocado', 3435, NULL, 16, NULL, 22, NULL, NULL, 1500, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Irrigated', 'LAC', 'Avocado', 3435, NULL, 16, NULL, 22, NULL, NULL, 1.6, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Irrigated', 'LAC', 'Banana', 89151, NULL, 16, 38, 19.5, 1.2, 2.2, NULL, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Dryland mixed', 'MENA', 'Barley', 4513, NULL, 5, 27, 16, 390, 430, NULL, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Irrigated', 'LAC', 'Blueberry', NULL, NULL, -3, 30, NULL, 250, 1, NULL, 100, 625);
INSERT INTO global_schema."Commodities" VALUES ('Coastal plantation and mixed', 'LAC', 'Cacao Tree', 3641, NULL, 18, 32, 25, 1000, 2, 1500, NULL, 1.2);
INSERT INTO global_schema."Commodities" VALUES ('Dryland mixed', 'LAC', 'Cassava', 3983, NULL, 25, 29, 20, 500, 1500, 1000, 1000, 1000);
INSERT INTO global_schema."Commodities" VALUES ('Cereal-Root Crop Mixed', 'SSA', 'Cassava', 3983, NULL, 22, 33, NULL, 300, 500, NULL, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Root Crop', 'SSA', 'Cassava', NULL, NULL, 25, 30, 27.5, NULL, NULL, 1, 500, 2);
INSERT INTO global_schema."Commodities" VALUES ('Irrigated', 'LAC', 'Cattle', 9913, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Forest based Livestock', 'LAC', 'Cattle (Beef)', 9913, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('High Altitude Mixed (C. Andes)', 'LAC', 'Cañihua', NULL, NULL, 10, 28, 19, 500, 800, 650, 3800, 4.5);
INSERT INTO global_schema."Commodities" VALUES ('Highland Mixed', 'MENA', 'Chickpea', 3827, NULL, 24, 30, 27, 650, 950, 800, 1500, 2500);
INSERT INTO global_schema."Commodities" VALUES ('Rainfed Mixed', 'MENA', 'Chickpea', 3827, NULL, 24, 30, 27, 650, 950, 800, 1.5, 2.5);
INSERT INTO global_schema."Commodities" VALUES ('Rainfed Mixed', 'SA', 'Chickpea', NULL, NULL, 24, 30, 27, 650, 950, 800, 1500, 2500);
INSERT INTO global_schema."Commodities" VALUES ('Forest based Livestock', 'LAC', 'Coffee', 13442, NULL, 10, NULL, 19.5, NULL, NULL, 1.6, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Coastal plantation and mixed', 'LAC', 'Coffee (Coffea arabica)', 13443, NULL, 15, 24, 20, 1500, 2, 1750, 1000, 2);
INSERT INTO global_schema."Commodities" VALUES ('Maize-beans (Mesoamerica)', 'LAC', 'Coffee (Coffea arabica)', 13443, NULL, 14, 26, NULL, 1, 2.7, NULL, 1, 2.1);
INSERT INTO global_schema."Commodities" VALUES ('Highland Perennial', 'SSA', 'Coffee (Coffea arabica)', NULL, NULL, 18, 23, 20.5, 1500, 2000, 1750, 1000, 2);
INSERT INTO global_schema."Commodities" VALUES ('Coastal plantation and mixed', 'LAC', 'Coffee (Coffea robusta)', 49390, NULL, 22, 26, 24, NULL, NULL, 2000, 800, 800);
INSERT INTO global_schema."Commodities" VALUES ('Maize-beans (Mesoamerica)', 'LAC', 'Coffee (Coffea robusta)', 49390, NULL, 21, 25, NULL, 2, 3, NULL, 200, 300);
INSERT INTO global_schema."Commodities" VALUES ('Highland Mixed', 'MENA', 'Corn', 381124, NULL, 18, 27, 23, 600, 1.1, 850, 1.5, 3.6);
INSERT INTO global_schema."Commodities" VALUES ('Maize-beans (Mesoamerica)', 'LAC', 'Dry bean', NULL, NULL, 18, 24, NULL, 600, 650, NULL, 600, 2);
INSERT INTO global_schema."Commodities" VALUES ('Irrigated', 'LAC', 'Grape', 3602, NULL, 14, 29, 21, 75, 100, NULL, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Rainfed Mixed', 'SA', 'Groundnut', NULL, NULL, 20, 30, 25, 200, 1, 600, 1000, 1.5);
INSERT INTO global_schema."Commodities" VALUES ('Highland Mixed', 'SSA', 'Highland livestock-cereal', NULL, NULL, NULL, NULL, 14, NULL, NULL, 2200, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Highland Mixed', 'SSA', 'Highland maize-based', NULL, NULL, NULL, NULL, NULL, 600, 1.3, NULL, 1.7, 2.2);
INSERT INTO global_schema."Commodities" VALUES ('Highland Mixed', 'SSA', 'Highland mixed North African', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1700);
INSERT INTO global_schema."Commodities" VALUES ('Highland Mixed', 'SSA', 'Highland wheat-pulse', NULL, NULL, 6, 24, NULL, 600, 800, NULL, 2200, 3);
INSERT INTO global_schema."Commodities" VALUES ('Coastal plantation and mixed', 'LAC', 'Inshore fishing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Highland Mixed', 'MENA', 'Lentil', 3864, NULL, 18, 30, 24, 350, 550, 450, 1500, 3500);
INSERT INTO global_schema."Commodities" VALUES ('Rainfed Mixed', 'MENA', 'Lentil', 3864, NULL, 18, 30, 24, 350, 550, 450, 1500, 3.5);
INSERT INTO global_schema."Commodities" VALUES ('Dryland mixed', 'LAC', 'Livestock', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Temperate Mixed', 'EAP', 'Maize', 4577, NULL, 6.2, 42, 30.8, 300, 550, NULL, 700, 1.4);
INSERT INTO global_schema."Commodities" VALUES ('Upland Intensive Mixed', 'EAP', 'Maize', 4577, NULL, 10, 32, 19, 450, 600, NULL, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Dryland mixed', 'LAC', 'Maize', 4577, NULL, 13.5, 18.5, 16, 600, 1.2, 900, 940, 3.4);
INSERT INTO global_schema."Commodities" VALUES ('Rainfed Mixed', 'SA', 'Maize', NULL, NULL, 22, 30, 26, 500, 900, 700, 1.5, 2.5);
INSERT INTO global_schema."Commodities" VALUES ('Cereal-Root Crop Mixed', 'SSA', 'Maize', 4577, NULL, 18, 32, 23, 300, 1.2, 650, NULL, 3.8);
INSERT INTO global_schema."Commodities" VALUES ('High Altitude Mixed (C. Andes)', 'LAC', 'Maize', 4577, NULL, 18, 27, 23, 600, 1.1, 850, 2800, 3300);
INSERT INTO global_schema."Commodities" VALUES ('Maize-beans (Mesoamerica)', 'LAC', 'Maize (Zea mays)', 4577, NULL, 10, 32, 19, 200, 2, NULL, 0, 3.8);
INSERT INTO global_schema."Commodities" VALUES ('Maize Mixed', 'SSA', 'Maize (Zea mays)', NULL, NULL, 10, 32, 19, 450, 600, 525, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Cereal-Root Crop Mixed', 'SSA', 'Millet', NULL, NULL, 25, 35, NULL, 250, 700, NULL, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Upland Intensive Mixed', 'EAP', 'Oilseeds (palm oil)', NULL, NULL, 22, 33, NULL, NULL, 2, 2.5, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Rainfed Mixed', 'MENA', 'Olive', 4145, NULL, 15, 20, 18, 400, 1, 700, 800, 1);
INSERT INTO global_schema."Commodities" VALUES ('Forest based Livestock', 'LAC', 'Palm (Acai)', NULL, NULL, 11, 33, 25, NULL, NULL, 2050, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Rainfed Mixed', 'SA', 'Pigeopea', NULL, NULL, 17, 22, 20, 600, 1.4, 1000, 50, 2);
INSERT INTO global_schema."Commodities" VALUES ('High Altitude Mixed (C. Andes)', 'LAC', 'Potato', 4113, NULL, 7, 30, 20, 400, 600, 500, 3300, 3.8);
INSERT INTO global_schema."Commodities" VALUES ('Temperate Mixed', 'EAP', 'Pulse', NULL, NULL, 20, 25, 30, 350, 600, NULL, 0, 1.6);
INSERT INTO global_schema."Commodities" VALUES ('Upland Intensive Mixed', 'EAP', 'Pulse (green gram)', 3916, NULL, 30, 40, NULL, 600, 1, NULL, 0, 2);
INSERT INTO global_schema."Commodities" VALUES ('High Altitude Mixed (C. Andes)', 'LAC', 'Quinoa', 63459, NULL, -8, 38, 15, 250, 1.5, 875, 3.8, 4.5);
INSERT INTO global_schema."Commodities" VALUES ('Lowland Rice', 'EAP', 'Rice', 4530, NULL, 26.5, 29.3, 27.9, 1287.6, 2832.8, 2060.2, NULL, 250);
INSERT INTO global_schema."Commodities" VALUES ('Upland Intensive Mixed', 'EAP', 'Rice', 4530, NULL, 10, 38, 22, 1, 1.7, NULL, 700, 1.1);
INSERT INTO global_schema."Commodities" VALUES ('Highland Mixed', 'MENA', 'Rice', 4530, NULL, 20, 27, 24, 1150, 3000, 2075, 1500, 3);
INSERT INTO global_schema."Commodities" VALUES ('Rainfed Mixed', 'SA', 'Rice', NULL, NULL, 21, 30, 26, 1000, 2, 1500, 2500, 3);
INSERT INTO global_schema."Commodities" VALUES ('Rice-Wheat', 'SA', 'Rice (Oryza sativa)', 4530, NULL, 10, 42, 24, 1, 3, NULL, 0, 3);
INSERT INTO global_schema."Commodities" VALUES ('Rice', 'SA', 'Rice (Oryza sativa)', 4530, NULL, 10, 42, 24, 1, 3, NULL, 0, 3);
INSERT INTO global_schema."Commodities" VALUES ('Pastoral', 'SSA', 'Sahelian subsystem', NULL, NULL, 21, 35, NULL, 100, 200, 150, 200, 400);
INSERT INTO global_schema."Commodities" VALUES ('High Altitude Mixed (C. Andes)', 'LAC', 'Sheep', 9940, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Dryland mixed', 'MENA', 'Sheep', 9940, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Highland Mixed', 'MENA', 'Sheep', 9940, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO global_schema."Commodities" VALUES ('Cereal-Root Crop Mixed', 'SSA', 'Sorghum', 4557, NULL, 23, 37, NULL, 250, 800, 500, NULL, 2);
INSERT INTO global_schema."Commodities" VALUES ('Forest based Livestock', 'LAC', 'Soybean', 3847, NULL, 13, 30, 25, 500, 900, NULL, 0, 2);
INSERT INTO global_schema."Commodities" VALUES ('Upland Intensive Mixed', 'EAP', 'Sugarcane', 128810, NULL, 20, 35, NULL, 1.1, 1.5, NULL, 0, 3);
INSERT INTO global_schema."Commodities" VALUES ('Highland Perennial', 'SSA', 'Tea', NULL, NULL, 13, 30, 26.5, 1.15, 1.4, NULL, 1500, 2100);
INSERT INTO global_schema."Commodities" VALUES ('Temperate Mixed', 'EAP', 'Wheat', 4565, NULL, 6.4, 21.6, 28.7, 300, 550, NULL, 1500, 2.9);
INSERT INTO global_schema."Commodities" VALUES ('High Altitude Mixed (C. Andes)', 'LAC', 'Wheat', 4565, NULL, 21, 26, 24, 750, 1000, 875, 2800, 3300);
INSERT INTO global_schema."Commodities" VALUES ('Dryland mixed', 'MENA', 'Wheat', 4565, NULL, 3.5, 35, NULL, 500, 1, 750, 0, 3.3);
INSERT INTO global_schema."Commodities" VALUES ('Highland Mixed', 'MENA', 'Wheat', 4565, NULL, 15, 25, 20, 500, 1.3, 900, 1500, 3);
INSERT INTO global_schema."Commodities" VALUES ('Rainfed Mixed', 'SA', 'Wheat', NULL, NULL, 21, 26, 24, 750, 1000, 880, 1500, 3);
INSERT INTO global_schema."Commodities" VALUES ('Rice-Wheat', 'SA', 'Wheat (Triticum aestivum)', 4565, NULL, 3.5, 35, NULL, 500, 1, 750, 0, 3.3);
INSERT INTO global_schema."Commodities" VALUES ('Root Crop', 'SSA', 'Yam', NULL, NULL, NULL, NULL, 26.8, NULL, NULL, 1150, 500, NULL);


--
-- TOC entry 3485 (class 2606 OID 16793)
-- Name: Commodities Commodities_pkey; Type: CONSTRAINT; Schema: global_schema; Owner: postgres
--

ALTER TABLE ONLY global_schema."Commodities"
    ADD CONSTRAINT "Commodities_pkey" PRIMARY KEY ("FS name", "FS macro region", "Name");


--
-- TOC entry 3486 (class 1259 OID 16810)
-- Name: fki_Name; Type: INDEX; Schema: global_schema; Owner: postgres
--

CREATE INDEX "fki_Name" ON global_schema."Commodities" USING btree ("Name");


--
-- TOC entry 3487 (class 2606 OID 16800)
-- Name: Commodities FS name macro region; Type: FK CONSTRAINT; Schema: global_schema; Owner: postgres
--

ALTER TABLE ONLY global_schema."Commodities"
    ADD CONSTRAINT "FS name macro region" FOREIGN KEY ("FS macro region", "FS name") REFERENCES global_schema."Farming system"("Macro region", "Name") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3488 (class 2606 OID 16805)
-- Name: Commodities Name; Type: FK CONSTRAINT; Schema: global_schema; Owner: postgres
--

ALTER TABLE ONLY global_schema."Commodities"
    ADD CONSTRAINT "Name" FOREIGN KEY ("Name") REFERENCES global_schema."Commodity names"("Name") ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


-- Completed on 2022-12-30 22:29:45 CET

--
-- PostgreSQL database dump complete
--

