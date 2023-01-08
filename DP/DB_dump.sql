PGDMP     (                     {            DP_DPI    15.1    15.1 x    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16565    DP_DPI    DATABASE     j   CREATE DATABASE "DP_DPI" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "DP_DPI";
                postgres    false                        2615    16566    global_schema    SCHEMA        CREATE SCHEMA global_schema;
    DROP SCHEMA global_schema;
                postgres    false            z           1247    16654    irrigated_rainfed    TYPE     d   CREATE TYPE global_schema.irrigated_rainfed AS ENUM (
    'Irrigated',
    'Rainfed',
    'Both'
);
 +   DROP TYPE global_schema.irrigated_rainfed;
       global_schema          postgres    false    6            w           1247    16647    irrigated_rainfed    TYPE     ]   CREATE TYPE public.irrigated_rainfed AS ENUM (
    'Irrigated',
    'Rainfed',
    'Both'
);
 $   DROP TYPE public.irrigated_rainfed;
       public          postgres    false            �            1259    16632    Agro-ecological zones    TABLE     a   CREATE TABLE global_schema."Agro-ecological zones" (
    "Agro-ecological zone" text NOT NULL
);
 2   DROP TABLE global_schema."Agro-ecological zones";
       global_schema         heap    postgres    false    6            �            1259    16787    Commodities    TABLE     �  CREATE TABLE global_schema."Commodities" (
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
 (   DROP TABLE global_schema."Commodities";
       global_schema         heap    postgres    false    6            �            1259    16773    Commodity names    TABLE     K   CREATE TABLE global_schema."Commodity names" (
    "Name" text NOT NULL
);
 ,   DROP TABLE global_schema."Commodity names";
       global_schema         heap    postgres    false    6            �            1259    16984    Commodity soils    TABLE     �   CREATE TABLE global_schema."Commodity soils" (
    "FS name" text NOT NULL,
    "FS macro region" text NOT NULL,
    "Commodity name" text NOT NULL,
    "Soil" text NOT NULL,
    "Description" text
);
 ,   DROP TABLE global_schema."Commodity soils";
       global_schema         heap    postgres    false    6            �            1259    16894    Connection link types    TABLE     V   CREATE TABLE global_schema."Connection link types" (
    "Link type" text NOT NULL
);
 2   DROP TABLE global_schema."Connection link types";
       global_schema         heap    postgres    false    6            �            1259    16598 	   Countries    TABLE     �   CREATE TABLE global_schema."Countries" (
    "M49" integer NOT NULL,
    "Sub-region M49" integer,
    "Intermediate region M49" integer,
    "Name" text NOT NULL,
    "ISO-alpha3" character varying(3)
);
 &   DROP TABLE global_schema."Countries";
       global_schema         heap    postgres    false    6            �            1259    16618    Dixon macro regions    TABLE     j   CREATE TABLE global_schema."Dixon macro regions" (
    "Label" text NOT NULL,
    "Name" text NOT NULL
);
 0   DROP TABLE global_schema."Dixon macro regions";
       global_schema         heap    postgres    false    6            �            1259    16851    Domains    TABLE     E   CREATE TABLE global_schema."Domains" (
    "Domain" text NOT NULL
);
 $   DROP TABLE global_schema."Domains";
       global_schema         heap    postgres    false    6            �            1259    16858    Expert involvements    TABLE     �   CREATE TABLE global_schema."Expert involvements" (
    "Expert ID" integer NOT NULL,
    "FS name" text NOT NULL,
    "FS macro region" text NOT NULL,
    "Domain" text NOT NULL,
    "Date" date
);
 0   DROP TABLE global_schema."Expert involvements";
       global_schema         heap    postgres    false    6            �            1259    16910    Experts    TABLE     �   CREATE TABLE global_schema."Experts" (
    "ID" integer NOT NULL,
    "Organisation" text,
    "First name" text NOT NULL,
    "Middle name" text,
    "Last name" text NOT NULL,
    "Email" text
);
 $   DROP TABLE global_schema."Experts";
       global_schema         heap    postgres    false    6            �            1259    16909    Experts_ID_seq    SEQUENCE     �   ALTER TABLE global_schema."Experts" ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME global_schema."Experts_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            global_schema          postgres    false    6    237            �            1259    16811    FS country assignments    TABLE     �   CREATE TABLE global_schema."FS country assignments" (
    "Country M49" integer NOT NULL,
    "FS name" text NOT NULL,
    "FS macro region" text NOT NULL
);
 3   DROP TABLE global_schema."FS country assignments";
       global_schema         heap    postgres    false    6            �            1259    16755    FS landscapes    TABLE     �   CREATE TABLE global_schema."FS landscapes" (
    "FS name" text NOT NULL,
    "FS macro region" text NOT NULL,
    "Landscape" text NOT NULL,
    "Description" text
);
 *   DROP TABLE global_schema."FS landscapes";
       global_schema         heap    postgres    false    6            �            1259    16696    FS livelihood sources    TABLE     �   CREATE TABLE global_schema."FS livelihood sources" (
    "FS name" text NOT NULL,
    "FS macro region" text NOT NULL,
    "Livelihood sources" text NOT NULL
);
 2   DROP TABLE global_schema."FS livelihood sources";
       global_schema         heap    postgres    false    6            �            1259    16625    FS names    TABLE     S   CREATE TABLE global_schema."FS names" (
    "Farming system name" text NOT NULL
);
 %   DROP TABLE global_schema."FS names";
       global_schema         heap    postgres    false    6            �            1259    16639    Farming system    TABLE     �  CREATE TABLE global_schema."Farming system" (
    "Name" text NOT NULL,
    "Macro region" text NOT NULL,
    "Agro-ecological zone" text,
    "Total area" real,
    "Cultivated area" real,
    "Total population" real,
    "Agricultural population" real,
    "Irrigated area" real,
    "Cattle population" real,
    "Farm size" real,
    "Description" text,
    "Irrigated/Rainfed" public.irrigated_rainfed
);
 +   DROP TABLE global_schema."Farming system";
       global_schema         heap    postgres    false    6    887            �            1259    16923    Impact chain model    TABLE     �   CREATE TABLE global_schema."Impact chain model" (
    "FS name" text NOT NULL,
    "FS macro region" text NOT NULL,
    "Description" text
);
 /   DROP TABLE global_schema."Impact chain model";
       global_schema         heap    postgres    false    6            �            1259    16587    Intermediate regions    TABLE     �   CREATE TABLE global_schema."Intermediate regions" (
    "M49" integer NOT NULL,
    "Sub-region M49" integer NOT NULL,
    "Name" text NOT NULL
);
 1   DROP TABLE global_schema."Intermediate regions";
       global_schema         heap    postgres    false    6            �            1259    16748 
   Landscapes    TABLE     K   CREATE TABLE global_schema."Landscapes" (
    "Landscape" text NOT NULL
);
 '   DROP TABLE global_schema."Landscapes";
       global_schema         heap    postgres    false    6            �            1259    16689    Livelihood sources    TABLE     P   CREATE TABLE global_schema."Livelihood sources" (
    "Source" text NOT NULL
);
 /   DROP TABLE global_schema."Livelihood sources";
       global_schema         heap    postgres    false    6            �            1259    16829    Organisations    TABLE     Q   CREATE TABLE global_schema."Organisations" (
    "Organisation" text NOT NULL
);
 *   DROP TABLE global_schema."Organisations";
       global_schema         heap    postgres    false    6            �            1259    16567    Regions    TABLE     _   CREATE TABLE global_schema."Regions" (
    "M49" integer NOT NULL,
    "Name" text NOT NULL
);
 $   DROP TABLE global_schema."Regions";
       global_schema         heap    postgres    false    6            �            1259    16977    Soils    TABLE     A   CREATE TABLE global_schema."Soils" (
    "Soil" text NOT NULL
);
 "   DROP TABLE global_schema."Soils";
       global_schema         heap    postgres    false    6            �            1259    16574    Sub-regions    TABLE     �   CREATE TABLE global_schema."Sub-regions" (
    "M49" integer NOT NULL,
    "Region M49" integer NOT NULL,
    "Name" text NOT NULL
);
 (   DROP TABLE global_schema."Sub-regions";
       global_schema         heap    postgres    false    6            �            1259    16901    Tags    TABLE     ?   CREATE TABLE global_schema."Tags" (
    "Tag" text NOT NULL
);
 !   DROP TABLE global_schema."Tags";
       global_schema         heap    postgres    false    6            �            1259    16780 
   Taxonomies    TABLE     t   CREATE TABLE global_schema."Taxonomies" (
    "NCBI taxonomy ID" integer NOT NULL,
    "NCBI taxonomy name" text
);
 '   DROP TABLE global_schema."Taxonomies";
       global_schema         heap    postgres    false    6            �          0    16632    Agro-ecological zones 
   TABLE DATA           P   COPY global_schema."Agro-ecological zones" ("Agro-ecological zone") FROM stdin;
    global_schema          postgres    false    221   ��       �          0    16787    Commodities 
   TABLE DATA             COPY global_schema."Commodities" ("FS name", "FS macro region", "Name", "NCBI taxonomy ID", "Max THI", "Min temperature", "Max temperature", "Average temperature", "Min precipitation", "Max precipitation", "Average precipitation", "Min elevation", "Max elevation") FROM stdin;
    global_schema          postgres    false    229   P�       �          0    16773    Commodity names 
   TABLE DATA           :   COPY global_schema."Commodity names" ("Name") FROM stdin;
    global_schema          postgres    false    227   ��       �          0    16984    Commodity soils 
   TABLE DATA           y   COPY global_schema."Commodity soils" ("FS name", "FS macro region", "Commodity name", "Soil", "Description") FROM stdin;
    global_schema          postgres    false    240   #�       �          0    16894    Connection link types 
   TABLE DATA           E   COPY global_schema."Connection link types" ("Link type") FROM stdin;
    global_schema          postgres    false    234   E�       �          0    16598 	   Countries 
   TABLE DATA           v   COPY global_schema."Countries" ("M49", "Sub-region M49", "Intermediate region M49", "Name", "ISO-alpha3") FROM stdin;
    global_schema          postgres    false    218   ��       �          0    16618    Dixon macro regions 
   TABLE DATA           G   COPY global_schema."Dixon macro regions" ("Label", "Name") FROM stdin;
    global_schema          postgres    false    219   *�       �          0    16851    Domains 
   TABLE DATA           4   COPY global_schema."Domains" ("Domain") FROM stdin;
    global_schema          postgres    false    232   ��       �          0    16858    Expert involvements 
   TABLE DATA           s   COPY global_schema."Expert involvements" ("Expert ID", "FS name", "FS macro region", "Domain", "Date") FROM stdin;
    global_schema          postgres    false    233   ��       �          0    16910    Experts 
   TABLE DATA           s   COPY global_schema."Experts" ("ID", "Organisation", "First name", "Middle name", "Last name", "Email") FROM stdin;
    global_schema          postgres    false    237   ��       �          0    16811    FS country assignments 
   TABLE DATA           f   COPY global_schema."FS country assignments" ("Country M49", "FS name", "FS macro region") FROM stdin;
    global_schema          postgres    false    230   ��       �          0    16755    FS landscapes 
   TABLE DATA           j   COPY global_schema."FS landscapes" ("FS name", "FS macro region", "Landscape", "Description") FROM stdin;
    global_schema          postgres    false    226   ��       �          0    16696    FS livelihood sources 
   TABLE DATA           l   COPY global_schema."FS livelihood sources" ("FS name", "FS macro region", "Livelihood sources") FROM stdin;
    global_schema          postgres    false    224   ��       �          0    16625    FS names 
   TABLE DATA           B   COPY global_schema."FS names" ("Farming system name") FROM stdin;
    global_schema          postgres    false    220   v�       �          0    16639    Farming system 
   TABLE DATA           	  COPY global_schema."Farming system" ("Name", "Macro region", "Agro-ecological zone", "Total area", "Cultivated area", "Total population", "Agricultural population", "Irrigated area", "Cattle population", "Farm size", "Description", "Irrigated/Rainfed") FROM stdin;
    global_schema          postgres    false    222   c�       �          0    16923    Impact chain model 
   TABLE DATA           b   COPY global_schema."Impact chain model" ("FS name", "FS macro region", "Description") FROM stdin;
    global_schema          postgres    false    238   �      �          0    16587    Intermediate regions 
   TABLE DATA           X   COPY global_schema."Intermediate regions" ("M49", "Sub-region M49", "Name") FROM stdin;
    global_schema          postgres    false    217   �p      �          0    16748 
   Landscapes 
   TABLE DATA           :   COPY global_schema."Landscapes" ("Landscape") FROM stdin;
    global_schema          postgres    false    225   :q      �          0    16689    Livelihood sources 
   TABLE DATA           ?   COPY global_schema."Livelihood sources" ("Source") FROM stdin;
    global_schema          postgres    false    223   Tr      �          0    16829    Organisations 
   TABLE DATA           @   COPY global_schema."Organisations" ("Organisation") FROM stdin;
    global_schema          postgres    false    231   ,s      �          0    16567    Regions 
   TABLE DATA           9   COPY global_schema."Regions" ("M49", "Name") FROM stdin;
    global_schema          postgres    false    215   �s      �          0    16977    Soils 
   TABLE DATA           0   COPY global_schema."Soils" ("Soil") FROM stdin;
    global_schema          postgres    false    239    t      �          0    16574    Sub-regions 
   TABLE DATA           K   COPY global_schema."Sub-regions" ("M49", "Region M49", "Name") FROM stdin;
    global_schema          postgres    false    216   mu      �          0    16901    Tags 
   TABLE DATA           .   COPY global_schema."Tags" ("Tag") FROM stdin;
    global_schema          postgres    false    235   Zv      �          0    16780 
   Taxonomies 
   TABLE DATA           W   COPY global_schema."Taxonomies" ("NCBI taxonomy ID", "NCBI taxonomy name") FROM stdin;
    global_schema          postgres    false    228   �x      �           0    0    Experts_ID_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('global_schema."Experts_ID_seq"', 1, true);
          global_schema          postgres    false    236            �           2606    16638 0   Agro-ecological zones Agro-ecological zones_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY global_schema."Agro-ecological zones"
    ADD CONSTRAINT "Agro-ecological zones_pkey" PRIMARY KEY ("Agro-ecological zone");
 e   ALTER TABLE ONLY global_schema."Agro-ecological zones" DROP CONSTRAINT "Agro-ecological zones_pkey";
       global_schema            postgres    false    221            �           2606    16793    Commodities Commodities_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY global_schema."Commodities"
    ADD CONSTRAINT "Commodities_pkey" PRIMARY KEY ("FS name", "FS macro region", "Name");
 Q   ALTER TABLE ONLY global_schema."Commodities" DROP CONSTRAINT "Commodities_pkey";
       global_schema            postgres    false    229    229    229            �           2606    16779 $   Commodity names Commodity names_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY global_schema."Commodity names"
    ADD CONSTRAINT "Commodity names_pkey" PRIMARY KEY ("Name");
 Y   ALTER TABLE ONLY global_schema."Commodity names" DROP CONSTRAINT "Commodity names_pkey";
       global_schema            postgres    false    227                       2606    16990 $   Commodity soils Commodity soils_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY global_schema."Commodity soils"
    ADD CONSTRAINT "Commodity soils_pkey" PRIMARY KEY ("FS name", "FS macro region", "Commodity name", "Soil");
 Y   ALTER TABLE ONLY global_schema."Commodity soils" DROP CONSTRAINT "Commodity soils_pkey";
       global_schema            postgres    false    240    240    240    240                       2606    16900 0   Connection link types Connection link types_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY global_schema."Connection link types"
    ADD CONSTRAINT "Connection link types_pkey" PRIMARY KEY ("Link type");
 e   ALTER TABLE ONLY global_schema."Connection link types" DROP CONSTRAINT "Connection link types_pkey";
       global_schema            postgres    false    234            �           2606    16604    Countries Countries_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY global_schema."Countries"
    ADD CONSTRAINT "Countries_pkey" PRIMARY KEY ("M49");
 M   ALTER TABLE ONLY global_schema."Countries" DROP CONSTRAINT "Countries_pkey";
       global_schema            postgres    false    218            �           2606    16624 ,   Dixon macro regions Dixon macro regions_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY global_schema."Dixon macro regions"
    ADD CONSTRAINT "Dixon macro regions_pkey" PRIMARY KEY ("Label");
 a   ALTER TABLE ONLY global_schema."Dixon macro regions" DROP CONSTRAINT "Dixon macro regions_pkey";
       global_schema            postgres    false    219                       2606    16857    Domains Domains_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY global_schema."Domains"
    ADD CONSTRAINT "Domains_pkey" PRIMARY KEY ("Domain");
 I   ALTER TABLE ONLY global_schema."Domains" DROP CONSTRAINT "Domains_pkey";
       global_schema            postgres    false    232                       2606    16864 ,   Expert involvements Expert involvements_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY global_schema."Expert involvements"
    ADD CONSTRAINT "Expert involvements_pkey" PRIMARY KEY ("Expert ID", "FS name", "FS macro region", "Domain");
 a   ALTER TABLE ONLY global_schema."Expert involvements" DROP CONSTRAINT "Expert involvements_pkey";
       global_schema            postgres    false    233    233    233    233                       2606    16916    Experts Experts_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY global_schema."Experts"
    ADD CONSTRAINT "Experts_pkey" PRIMARY KEY ("ID");
 I   ALTER TABLE ONLY global_schema."Experts" DROP CONSTRAINT "Experts_pkey";
       global_schema            postgres    false    237            �           2606    16817 2   FS country assignments FS country assignments_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY global_schema."FS country assignments"
    ADD CONSTRAINT "FS country assignments_pkey" PRIMARY KEY ("Country M49", "FS name", "FS macro region");
 g   ALTER TABLE ONLY global_schema."FS country assignments" DROP CONSTRAINT "FS country assignments_pkey";
       global_schema            postgres    false    230    230    230            �           2606    16761     FS landscapes FS landscapes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY global_schema."FS landscapes"
    ADD CONSTRAINT "FS landscapes_pkey" PRIMARY KEY ("FS name", "FS macro region", "Landscape");
 U   ALTER TABLE ONLY global_schema."FS landscapes" DROP CONSTRAINT "FS landscapes_pkey";
       global_schema            postgres    false    226    226    226            �           2606    16703 0   FS livelihood sources FS livelihood sources_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY global_schema."FS livelihood sources"
    ADD CONSTRAINT "FS livelihood sources_pkey" PRIMARY KEY ("FS name", "FS macro region", "Livelihood sources");
 e   ALTER TABLE ONLY global_schema."FS livelihood sources" DROP CONSTRAINT "FS livelihood sources_pkey";
       global_schema            postgres    false    224    224    224            �           2606    16631    FS names FS names_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY global_schema."FS names"
    ADD CONSTRAINT "FS names_pkey" PRIMARY KEY ("Farming system name");
 K   ALTER TABLE ONLY global_schema."FS names" DROP CONSTRAINT "FS names_pkey";
       global_schema            postgres    false    220            �           2606    16645 "   Farming system Farming system_pkey 
   CONSTRAINT        ALTER TABLE ONLY global_schema."Farming system"
    ADD CONSTRAINT "Farming system_pkey" PRIMARY KEY ("Name", "Macro region");
 W   ALTER TABLE ONLY global_schema."Farming system" DROP CONSTRAINT "Farming system_pkey";
       global_schema            postgres    false    222    222                       2606    16929 *   Impact chain model Impact chain model_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY global_schema."Impact chain model"
    ADD CONSTRAINT "Impact chain model_pkey" PRIMARY KEY ("FS name", "FS macro region");
 _   ALTER TABLE ONLY global_schema."Impact chain model" DROP CONSTRAINT "Impact chain model_pkey";
       global_schema            postgres    false    238    238            �           2606    16591 .   Intermediate regions Intermediate regions_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY global_schema."Intermediate regions"
    ADD CONSTRAINT "Intermediate regions_pkey" PRIMARY KEY ("M49");
 c   ALTER TABLE ONLY global_schema."Intermediate regions" DROP CONSTRAINT "Intermediate regions_pkey";
       global_schema            postgres    false    217            �           2606    16754    Landscapes Landscapes_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY global_schema."Landscapes"
    ADD CONSTRAINT "Landscapes_pkey" PRIMARY KEY ("Landscape");
 O   ALTER TABLE ONLY global_schema."Landscapes" DROP CONSTRAINT "Landscapes_pkey";
       global_schema            postgres    false    225            �           2606    16695 *   Livelihood sources Livelihood sources_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY global_schema."Livelihood sources"
    ADD CONSTRAINT "Livelihood sources_pkey" PRIMARY KEY ("Source");
 _   ALTER TABLE ONLY global_schema."Livelihood sources" DROP CONSTRAINT "Livelihood sources_pkey";
       global_schema            postgres    false    223                       2606    16835     Organisations Organisations_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY global_schema."Organisations"
    ADD CONSTRAINT "Organisations_pkey" PRIMARY KEY ("Organisation");
 U   ALTER TABLE ONLY global_schema."Organisations" DROP CONSTRAINT "Organisations_pkey";
       global_schema            postgres    false    231            �           2606    16573    Regions Regions_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY global_schema."Regions"
    ADD CONSTRAINT "Regions_pkey" PRIMARY KEY ("M49");
 I   ALTER TABLE ONLY global_schema."Regions" DROP CONSTRAINT "Regions_pkey";
       global_schema            postgres    false    215                       2606    16983    Soils Soils_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY global_schema."Soils"
    ADD CONSTRAINT "Soils_pkey" PRIMARY KEY ("Soil");
 E   ALTER TABLE ONLY global_schema."Soils" DROP CONSTRAINT "Soils_pkey";
       global_schema            postgres    false    239            �           2606    16578    Sub-regions Sub-regions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY global_schema."Sub-regions"
    ADD CONSTRAINT "Sub-regions_pkey" PRIMARY KEY ("M49");
 Q   ALTER TABLE ONLY global_schema."Sub-regions" DROP CONSTRAINT "Sub-regions_pkey";
       global_schema            postgres    false    216                       2606    16907    Tags Tags_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY global_schema."Tags"
    ADD CONSTRAINT "Tags_pkey" PRIMARY KEY ("Tag");
 C   ALTER TABLE ONLY global_schema."Tags" DROP CONSTRAINT "Tags_pkey";
       global_schema            postgres    false    235            �           2606    16786    Taxonomies Taxonomies_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY global_schema."Taxonomies"
    ADD CONSTRAINT "Taxonomies_pkey" PRIMARY KEY ("NCBI taxonomy ID");
 O   ALTER TABLE ONLY global_schema."Taxonomies" DROP CONSTRAINT "Taxonomies_pkey";
       global_schema            postgres    false    228                        1259    16823    fki_Country M49    INDEX     f   CREATE INDEX "fki_Country M49" ON global_schema."FS country assignments" USING btree ("Country M49");
 ,   DROP INDEX global_schema."fki_Country M49";
       global_schema            postgres    false    230                       1259    16886 
   fki_Domain    INDEX     Y   CREATE INDEX "fki_Domain" ON global_schema."Expert involvements" USING btree ("Domain");
 '   DROP INDEX global_schema."fki_Domain";
       global_schema            postgres    false    233                       1259    16875    fki_Expert ID    INDEX     _   CREATE INDEX "fki_Expert ID" ON global_schema."Expert involvements" USING btree ("Expert ID");
 *   DROP INDEX global_schema."fki_Expert ID";
       global_schema            postgres    false    233            �           1259    16741    fki_FS name macro region    INDEX     }   CREATE INDEX "fki_FS name macro region" ON global_schema."FS livelihood sources" USING btree ("FS name", "FS macro region");
 5   DROP INDEX global_schema."fki_FS name macro region";
       global_schema            postgres    false    224    224            �           1259    16688 '   fki_Farming system agro-ecological zone    INDEX        CREATE INDEX "fki_Farming system agro-ecological zone" ON global_schema."Farming system" USING btree ("Agro-ecological zone");
 D   DROP INDEX global_schema."fki_Farming system agro-ecological zone";
       global_schema            postgres    false    222            �           1259    16672    fki_Farming system macro region    INDEX     o   CREATE INDEX "fki_Farming system macro region" ON global_schema."Farming system" USING btree ("Macro region");
 <   DROP INDEX global_schema."fki_Farming system macro region";
       global_schema            postgres    false    222            �           1259    16666    fki_Farming system name    INDEX     _   CREATE INDEX "fki_Farming system name" ON global_schema."Farming system" USING btree ("Name");
 4   DROP INDEX global_schema."fki_Farming system name";
       global_schema            postgres    false    222            �           1259    16615    fki_Intermediate region M49    INDEX     q   CREATE INDEX "fki_Intermediate region M49" ON global_schema."Countries" USING btree ("Intermediate region M49");
 8   DROP INDEX global_schema."fki_Intermediate region M49";
       global_schema            postgres    false    218            �           1259    16772    fki_Landscape    INDEX     Y   CREATE INDEX "fki_Landscape" ON global_schema."FS landscapes" USING btree ("Landscape");
 *   DROP INDEX global_schema."fki_Landscape";
       global_schema            postgres    false    226            �           1259    16747    fki_Livelihood source    INDEX     r   CREATE INDEX "fki_Livelihood source" ON global_schema."FS livelihood sources" USING btree ("Livelihood sources");
 2   DROP INDEX global_schema."fki_Livelihood source";
       global_schema            postgres    false    224            �           1259    16810    fki_Name    INDEX     M   CREATE INDEX "fki_Name" ON global_schema."Commodities" USING btree ("Name");
 %   DROP INDEX global_schema."fki_Name";
       global_schema            postgres    false    229            �           1259    16586    fki_Region M49    INDEX     Y   CREATE INDEX "fki_Region M49" ON global_schema."Sub-regions" USING btree ("Region M49");
 +   DROP INDEX global_schema."fki_Region M49";
       global_schema            postgres    false    216                       1259    17001    fki_Soil    INDEX     Q   CREATE INDEX "fki_Soil" ON global_schema."Commodity soils" USING btree ("Soil");
 %   DROP INDEX global_schema."fki_Soil";
       global_schema            postgres    false    240            �           1259    16597    fki_Sub-region M49    INDEX     j   CREATE INDEX "fki_Sub-region M49" ON global_schema."Intermediate regions" USING btree ("Sub-region M49");
 /   DROP INDEX global_schema."fki_Sub-region M49";
       global_schema            postgres    false    217            	           1259    16922    fki_W    INDEX     W   CREATE INDEX "fki_W" ON global_schema."Expert involvements" USING btree ("Expert ID");
 "   DROP INDEX global_schema."fki_W";
       global_schema            postgres    false    233            $           2606    16818 "   FS country assignments Country M49    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."FS country assignments"
    ADD CONSTRAINT "Country M49" FOREIGN KEY ("Country M49") REFERENCES global_schema."Countries"("M49") ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY global_schema."FS country assignments" DROP CONSTRAINT "Country M49";
       global_schema          postgres    false    230    218    3551            &           2606    16881    Expert involvements Domain    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."Expert involvements"
    ADD CONSTRAINT "Domain" FOREIGN KEY ("Domain") REFERENCES global_schema."Domains"("Domain") ON UPDATE CASCADE ON DELETE SET NULL;
 O   ALTER TABLE ONLY global_schema."Expert involvements" DROP CONSTRAINT "Domain";
       global_schema          postgres    false    233    3588    232            '           2606    16917    Expert involvements Expert ID    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."Expert involvements"
    ADD CONSTRAINT "Expert ID" FOREIGN KEY ("Expert ID") REFERENCES global_schema."Experts"("ID");
 R   ALTER TABLE ONLY global_schema."Expert involvements" DROP CONSTRAINT "Expert ID";
       global_schema          postgres    false    233    237    3599                       2606    16736 *   FS livelihood sources FS name macro region    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."FS livelihood sources"
    ADD CONSTRAINT "FS name macro region" FOREIGN KEY ("FS name", "FS macro region") REFERENCES global_schema."Farming system"("Name", "Macro region") ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY global_schema."FS livelihood sources" DROP CONSTRAINT "FS name macro region";
       global_schema          postgres    false    222    3560    222    224    224                        2606    16762 "   FS landscapes FS name macro region    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."FS landscapes"
    ADD CONSTRAINT "FS name macro region" FOREIGN KEY ("FS name", "FS macro region") REFERENCES global_schema."Farming system"("Name", "Macro region") ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY global_schema."FS landscapes" DROP CONSTRAINT "FS name macro region";
       global_schema          postgres    false    222    226    226    3560    222            "           2606    16800     Commodities FS name macro region    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."Commodities"
    ADD CONSTRAINT "FS name macro region" FOREIGN KEY ("FS macro region", "FS name") REFERENCES global_schema."Farming system"("Macro region", "Name") ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY global_schema."Commodities" DROP CONSTRAINT "FS name macro region";
       global_schema          postgres    false    229    222    222    3560    229            %           2606    16824 +   FS country assignments FS name macro region    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."FS country assignments"
    ADD CONSTRAINT "FS name macro region" FOREIGN KEY ("FS name", "FS macro region") REFERENCES global_schema."Farming system"("Name", "Macro region") ON UPDATE CASCADE ON DELETE CASCADE;
 `   ALTER TABLE ONLY global_schema."FS country assignments" DROP CONSTRAINT "FS name macro region";
       global_schema          postgres    false    3560    222    222    230    230            (           2606    16876 (   Expert involvements FS name macro region    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."Expert involvements"
    ADD CONSTRAINT "FS name macro region" FOREIGN KEY ("FS name", "FS macro region") REFERENCES global_schema."Farming system"("Name", "Macro region") ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY global_schema."Expert involvements" DROP CONSTRAINT "FS name macro region";
       global_schema          postgres    false    222    222    233    233    3560            )           2606    16930 '   Impact chain model FS name macro region    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."Impact chain model"
    ADD CONSTRAINT "FS name macro region" FOREIGN KEY ("FS name", "FS macro region") REFERENCES global_schema."Farming system"("Name", "Macro region") ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY global_schema."Impact chain model" DROP CONSTRAINT "FS name macro region";
       global_schema          postgres    false    222    238    222    238    3560            *           2606    16991 $   Commodity soils FS name macro region    FK CONSTRAINT     
  ALTER TABLE ONLY global_schema."Commodity soils"
    ADD CONSTRAINT "FS name macro region" FOREIGN KEY ("FS name", "FS macro region", "Commodity name") REFERENCES global_schema."Commodities"("FS name", "FS macro region", "Name") ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY global_schema."Commodity soils" DROP CONSTRAINT "FS name macro region";
       global_schema          postgres    false    3580    240    240    240    229    229    229                       2606    16683 2   Farming system Farming system agro-ecological zone    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."Farming system"
    ADD CONSTRAINT "Farming system agro-ecological zone" FOREIGN KEY ("Agro-ecological zone") REFERENCES global_schema."Agro-ecological zones"("Agro-ecological zone") ON UPDATE CASCADE ON DELETE SET NULL;
 g   ALTER TABLE ONLY global_schema."Farming system" DROP CONSTRAINT "Farming system agro-ecological zone";
       global_schema          postgres    false    3558    221    222                       2606    16678 *   Farming system Farming system macro region    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."Farming system"
    ADD CONSTRAINT "Farming system macro region" FOREIGN KEY ("Macro region") REFERENCES global_schema."Dixon macro regions"("Label") ON UPDATE CASCADE ON DELETE SET NULL;
 _   ALTER TABLE ONLY global_schema."Farming system" DROP CONSTRAINT "Farming system macro region";
       global_schema          postgres    false    222    219    3554                       2606    16673 "   Farming system Farming system name    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."Farming system"
    ADD CONSTRAINT "Farming system name" FOREIGN KEY ("Name") REFERENCES global_schema."FS names"("Farming system name") ON UPDATE CASCADE ON DELETE SET NULL;
 W   ALTER TABLE ONLY global_schema."Farming system" DROP CONSTRAINT "Farming system name";
       global_schema          postgres    false    222    220    3556                       2606    16610 !   Countries Intermediate region M49    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."Countries"
    ADD CONSTRAINT "Intermediate region M49" FOREIGN KEY ("Intermediate region M49") REFERENCES global_schema."Intermediate regions"("M49") ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY global_schema."Countries" DROP CONSTRAINT "Intermediate region M49";
       global_schema          postgres    false    217    3548    218            !           2606    16767    FS landscapes Landscape    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."FS landscapes"
    ADD CONSTRAINT "Landscape" FOREIGN KEY ("Landscape") REFERENCES global_schema."Landscapes"("Landscape") ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY global_schema."FS landscapes" DROP CONSTRAINT "Landscape";
       global_schema          postgres    false    225    226    3571                       2606    16742 '   FS livelihood sources Livelihood source    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."FS livelihood sources"
    ADD CONSTRAINT "Livelihood source" FOREIGN KEY ("Livelihood sources") REFERENCES global_schema."Livelihood sources"("Source") ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY global_schema."FS livelihood sources" DROP CONSTRAINT "Livelihood source";
       global_schema          postgres    false    3565    223    224            #           2606    16805    Commodities Name    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."Commodities"
    ADD CONSTRAINT "Name" FOREIGN KEY ("Name") REFERENCES global_schema."Commodity names"("Name") ON UPDATE CASCADE ON DELETE SET NULL;
 E   ALTER TABLE ONLY global_schema."Commodities" DROP CONSTRAINT "Name";
       global_schema          postgres    false    229    227    3576                       2606    16581    Sub-regions Region M49    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."Sub-regions"
    ADD CONSTRAINT "Region M49" FOREIGN KEY ("Region M49") REFERENCES global_schema."Regions"("M49") ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY global_schema."Sub-regions" DROP CONSTRAINT "Region M49";
       global_schema          postgres    false    215    216    3543            +           2606    16996    Commodity soils Soil    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."Commodity soils"
    ADD CONSTRAINT "Soil" FOREIGN KEY ("Soil") REFERENCES global_schema."Soils"("Soil") ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY global_schema."Commodity soils" DROP CONSTRAINT "Soil";
       global_schema          postgres    false    239    3603    240                       2606    16592 #   Intermediate regions Sub-region M49    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."Intermediate regions"
    ADD CONSTRAINT "Sub-region M49" FOREIGN KEY ("Sub-region M49") REFERENCES global_schema."Sub-regions"("M49");
 X   ALTER TABLE ONLY global_schema."Intermediate regions" DROP CONSTRAINT "Sub-region M49";
       global_schema          postgres    false    3545    217    216                       2606    16605    Countries Sub-region M49    FK CONSTRAINT     �   ALTER TABLE ONLY global_schema."Countries"
    ADD CONSTRAINT "Sub-region M49" FOREIGN KEY ("Sub-region M49") REFERENCES global_schema."Sub-regions"("M49") ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY global_schema."Countries" DROP CONSTRAINT "Sub-region M49";
       global_schema          postgres    false    3545    218    216            �   �   x�s)�T.M��(��L�r)�����,.A�@�
�y)._�R���1�hF��f�&e�hF�hJ����d&'�(8���(`�"�X���X�!�E�	�⨞��OX���@΁(�[�%H�b���� E���      �   E  x��X�r�6}�����T xyT�4͌���;�v�K��	EjHʩ�W���Xw %J4�d�ci�r��B�uYL�uU�μ�4�L�ˢ(כ��-36[��{�}�p�(�ž�|�?z_��Z�f�ngs6�v���}ł0V�~���!��h�[Q���ueV�m��)�_,�s�ԫ��@Z�s�������4�5{�s���+��d�x2U`"����׿��L�+o���wo?������%�	�"�ɓ�����є���a"�}��[7 �P�Ѽ�j@�vpp��Ƚ�5�K]x�1L�������@�ڔA<g!X����\��u��*�ЊL	��1����l�(jo^;�b!}.��� }��棵��ٗ�Ȇ����ي�$�u]g�%	�>
z��*�,�7~c��ͫ@���7��ޯ��ϧ�,_�����=��@88�\"��oB(�ć`��jqw��|�.��d0"a.�2M\�QU�*��N�'�3�\Nt'���%�xzRr�%&Ǫ��:�	����*�.���Fh$�u��H9ʊѝN��ɣ�y��LU�)��:��i��E�?���!�SL��x.�		~��(+�~��MEY<����	j��9�W4<�b��c���؛�������grQ�@Aέ'x���D>�beI(��+n�dy��I
;SlC��syxW�j�/�*&@����ޕ�>_���M u��h��߷t8ֿ�S�t�dI�ّޖG��llk3�mv�L6����OX�H�[��1{�,��G���v�n��'�}V�ơ��ľ�F)_'���ڀ�xOi�I���c�	#�ݚ�N3 ^���"DQ��u�|A>���_Nӣ��`�;SY��og��� �HeB�<@9�?����T��������>�M^��/���6 C=O�����D���G�h&X�� �.{��7̦̅4��*:;;ęv���<�u������K�Q)_UGz��ʸ���H�����=kp�)@�$t룄j��@�hw?Y��.+���,��B˚�����+���r�y�r�J%u�GT9�]�}�r@R9�Ck�=>�-u�&���M Q��@�ӵ)��
�h�����j��5\�/@�
Ʈ�ї�9�,�&T۾��?�@�-V�]
�*B �x�|�K���E�^c$�Ѫ�E�*�?�i^h�@%h6��z��MJG8�c�Ho���ܧti�#z����ؼ	�X��E�'b)�\��o�J <d�c�8ͮV�x��w�����sE[+rk���
��p�L��#���m��p�5F��cy���
�3nCG�A���5�?c�\ɩ�zc�T�^��Um�'~�>sWp����_���Ƙ\s��@�L��K�a"_4�+�uG�\��D�����$�����J1�1��@��7��J׌&�O�]�׺�]� �c�P��cʩ�\5_�<uʞ�g\�T}vm(n��XR*Tv;���S�M�����L�kх��v��:��p�=���`���ʥ�Fז���4&i�=�lMۦ8�:>Zv����C���r��4P$}�oo����y��z��0�2n��jH9�<�F��(��      �   n  x�]P[n�0��)�il��m��@��v(R�i��,��ĹUϐ��v�B!`���a3��L)G%M�Ii,	�%v�G8R�g��W8��-���:�xUfS���s����:2�e�?��:�g� ��k'�v&4�V:���klK�{]��-S�J3��P2���<��,lf��C��f�Og"y�CK�����=~��6���o��1��\|b����8HrF�����o9��ƿ!V�l��Týx�NbC�OX��'��k8m��y˫�#��,#��F�)G8��;b5ڭ�JS���H�E:����/���,v�9�BSiӚ2Opq�3\���X����2��i���~��!VW�,]��̡,�dh��� �'$ò      �     x��Y�n�6�v���H�8�e�ݸn�p�NSl�ͱD[\(R )��[��b;�d[�%YRZH�;�/��f��a�W�
���x0E��(@~6�(�_�N���g(õÏ��Ң�JA̿��K��b�����q��@�ig
���(.<s�R��^���h-���z�z���^���%��8�+T����hCs�Ak�D�S�LB4����|L��
0T���N���@iE{�ZD5�<o�a��(�gk@��Z��r{u7"�l=x�ξ�C�lδ^QsE��ʴ0@���G|��4����#�"X>��3�1��=ܘi�b�Q)c����٨,�[���
�D�"�����	�&[�)�&Ť�@�Z�A(��A=fOI7|�HXnӐe�@�{#2s����(ͬk���ӆ�Ώ�f�x�0$C��	e���ȂV>����܀FI]�B�~�xV��������I9���7��%�v!��MP��=��KD[G�^"�ȿ�ᜡ4pz�}ʹ�Ma�G��s ��z���q�{7t��F��<%�nM�lһ��TJN��-�f����Q�Q��e��.��+Ǣ�p�̔���
�)A��s��i<x`qB�kY�Єa��h��~6b`)�����m�`�·��9<G��5��p�ʐB2HN�%�G̀�1�����{��~ ?�5��Lm���!���I�Z�j0���ꔱ�Jl\g�,P^�Ϗc��d7�r��$zGR>�\و�ᣄ(譙i����g��bm���Ŕ�L��R�R��u��.E�$�k+�1F��Fܼ�8�y���N����$��^by�l�u]d���4쫠;�)��.��ޚ��j'����K�즊���S��;�`�fOU���)�a�
���S���%I�[@��Ś/���x����K��4�˨	������d�7T����M�
�@����<M�@�,ے2�M���o{�@wa�S�w�AZ&eӗ�KW��k{�UB8ChyQ̈́��惲r��ʪ3>R�f��KoC��<is�G��o�?ĸ6���?�@����ϯ~�J��,\�0cܽ�~��!���?�"Qْ��K��
�
x��o�:G�����It ]�ɤ8�(��	�9E:�b�PV\��~������J�8>�P<���.�V:Ӕ/�j�D�"K�t�F��>��W0�7�m�TY����L��k���[\�|��`J�}�5zh�ʘ:��dn���@8]j�$,5�Y�c�o��68��?S.f,��p���B�i#�J?�����3���F�I��p�5�ukN�l:L:�s*���׋K8�h0�0F�k��g]H�Β������9��u*�9��@I��d���Y���?\�M�BGY�zl~2
�ѠҌ.<mp��!�:LrM��ܵ�k�M�t�9m�">�</�k�E.��v��	js,��$CAr\�z�4�v��M�M9A�٭�K/j���x˽�j�{�DZ?�m�~tc�A_?�s3��z���-_�./�C���r��Y׷�m_��?#n���8�I�λ�3��pW	��͚��Be(x�zCd���w�D�5a���d��PD~<A�Ç�W����L�}wu�r���Ea��@C䚥K��~�\����λ8.���h>g�٥>�O����oM4�ɿ?]�2Ue��y����IM\��}ak-v�pUw��A�bM��IC��9~��ѳ�9���8�sd�������>h�rKc@�s�J�P�Fh{Y,=���b��7ak~Έ*߂�P�;�P������\������;      �   -   x�s�(�/NMQ(���,V��,�LO,�*�|RS�A1z\\\ /y      �   �  x�}Y˒�H�]��B��4��!	�D�$THa�q��Bȣ��Ī7��m�����O�K��$w"��f�iyq]��s����Cb��d0&���S2��-�KL&��δ�׊d2��E��Ȥ8�����8=��8�<����]ҷ=?����h.��+���%�qsE���"�AO	��(K�1r-ҷl)��bGsRҽ9��V�63c8h,��/��&0��rR^Xs�&2�q����J~���ҋ�o)~��*Z*�L&|�������8��T�ՙ������(��%�����jjJ�=Z��TC�����Z�4�vmS��!\��7���}�`���d.�g0�U&yuYGN��Ұ��c�����BD��\�Ɔ=����((/ٟ̔�9������1=��
o��}WR�/��9�WA��İ{]�x�8��Ȯg�SX)�j�����J��`c��h��蹤Ң��6���^!M��*O\��ƨ+?�I��T{˅���iJ�xu��Ϝ]n����@�rZ��n���?�R�� |6d����Ef͋���v5扜���oI^����^n�3ů߉����N����� F��w��Q���g�2l#�,2nN�qW�S�n�jF�\�>���Yږ��U]co��A�#�U�w*��81�VO���Aՙ�_��߰�z���'s�/[���ǧpݟ��U��8���m����]w�﯌ѽ��w^�Z��j�V�y� !��M�A+�El]]a��!�����ߗo�I���ݽ��^!
�G��j��]����1$�D��� h���ZO'��������z��=e���e�"�����R-苋(�<�R�t/�+��?�������1s#��,��X�/Q��z���]V���0t��tT:�%�}�*���:�3z� �ڕ'�r�:Ͽ��6���Pu���g� 0f0�)�
����l4(����=��������Sq�tn={zLYq����+��x�S5Ne$e϶S��$tL����:qv��E%��[��������Z�Y�d���0�d����P�}d�Jbx
������աM�*ai�":á�v��$�4����Wg.^�<[`�9���M^��b������\l�\�����4�E4��v�N�!be��0/iq`dD �M�Lgz�Y�;$�H��C)
v��5gG&��k�Xs����� U[�`��@�����(.��@��"P*Ǣl��d�߁��b���	Q
fkÕ��]�@P�+��@f�uU�g�_���?ڴ|��t&����׈Լ@��zx/� %�rQ�2�H娧�Ӧ���3�?j����5	b��������Q�T��?ÞP�Cj�����6Pl�+|�g��6!��)d��� �I�!-����x��&(�9�t��D���
�[{��b�~��?�������� ݙeJ:R�7�.<a���
l5֢͂�Rh���0���N�<��'����<�?�wQ�K�[(YlvЮ3��8�ȖP�*4Z�HÍ,��*�r;)���M=��4F%���!r��2�'r�X�'�8q͛P��z6��
s}`���nd����2]z*/э�7��ב��ͺ�q�w�P/�]�әB�H#��ZR�C��HTŵ�h��F�����$	��q�z`�짇�xeO�}��yXC�l��&諔%0v,�mr��������:��[��F�
��BG���t�h�� [��`L�j�Z�z]��Qd�܀���r����{��_�*��^g�籾�W����5aU�����1���	�0&^s�_W�� 	$��k0PJB��-zpt�A#��f� 6�A��0�ߤ�	��xhX�q]�!ǌ�X��.��,UPi�͐/�h������*�� a
C�e�juU�Y��l����/���	�?C��!�����[�Wh�����a!��pt����c�[S	��'�XT�"P��A@�����@DJ}�5֝�9͑ȏ⍒h
�m��E@��0�i`X�}C��#�B�ê�9~����M��1-5iy=�<�(����Q�v�L�aa�f�G�)nrTA�*N�piXzM��x�,��cu��/��H�>V'E�*`�6�3���IV*�(�hM��5���/mr� �z!�ćn�׌Dkt�Ƚ�[�y�8�����ݥ-W`�HܱF����m�e?!�� �aQ$�\`m��CN��G��V-(�7	��S
�l��DUA���z���r@ǀ6���n��M��]2b?�ƫ�v�AI<��HM-��W�+>O��
_8_����g�f�10��X�I�����m1G����n�ɜ�y��)N�F����Fb��=P�W��8���X�&��mm8<}f������֠�d��f�j�%��}�I&pp�W�$(���$�n$�:`��a�b	�	���T��k��\�J��ڝ�	,�����]r�ZSS�ѣ����Ӊh�I�;9C]y	�_%�.$H~n��{���qZc���Y����K�#�	NP�NO-nI��Ġ�(�.�jm`��`5IRl>��6V
�D~k)G�4��z��D%�i�ˆ�7?�Y*7X�K?=lĥ��Z��ε��/HGΛ�P�����<(�����:Hi}��{t��-��q��i-'}
z为�S	6M��=���q
JO_J�r�w!k��̎�7�Xnѭ4�?�9�(`�����	����t!�,�����|/��T�@%���}KM"c��=�����c�>�_�%b�!�o��`�*�������pg8#���AAR��Ü"?vS,��D�~{^:�ȻXK|%��R�����2SV6��xH�{����G:���!Ũ�ĥU���Ǟ�f	¥
7m�.o���f��E^�[An+ n�:��~g��;j<Π�U;��S��?�PC~�Nt ?�mZW��k3�ӟ��XO���g��uH��#Gs��&GT�X�IV���}"�˗���`��Ӝ�����Hs�GȦЯ'Y&N�d�25d�3��d�G�@�ӌ��;t�����L�0�b�*�Y�>��{q��
���E������]D�5��jhː;~�m�gbO��lv�kE����a��ugg?��|�7\"�>V`���ػ݁��iۭ柑1��G�4��dF�k{jpdH��ji�"�`ٮ0��~���� B��溮��Bgj-�VK綬��d]K=�~U뺗w�MaFS2Mܷ{��i���~�tE� ��)cd'av���<w���B��v3�v~�������ƥ���!Q_w�������Ahx�Y[�ս?�]ʮU��2Al�.��F��-���d�����AJy��?ѽ�pn������/Sl��H�C��Yd��=��-������"zn�C�#�W_�3������g �����W�_b�o�a�Q�.��16~�o�0�����      �   p   x�5�K
�0��S��;4����������D����YU���X���T0r�AW4HoT�,�T4�l���'d�$f������(ucY[ON�;��ϛ\��w
�?Z>Dt[%*W      �   @   x���-HL.QH�H��S(J-NM,J�H-�rL/�L.�))-J�Q(�,.I�UH�(H-*����� V��      �   �  x���OS�0���S䨇(�Vzej;S:�Vǋ�֒&I���]�u�3���}��$��V�:mDAY�.7���}I6���@�����s�n��*0�~0����w�P@�B��Εe�� o��Y�"���i.��,��`Z~����'�n���.� ΐ>�E<�௘!?7F�Ö�H�2�����,�E	(V��(1b�V}m��e#6�-������L�=� �@z}<��/im}R����;(�%�8 >�nD�/֮o�NjE}�HS���N��H"v+w9�'�>k'�g��l�4��k<|B6�&��`k��]߃��~md7w[2�#�����2��7�5��r+��l���������Ǯem��D�x-�'�^Mx�]�A:w^X/��?������>F��w      �   8  x���=o� ���`��~�v5��U9^*e��>�!�8U�}��!C���}�幇�E
#{�V��DC�ʈ� :Q�!r#A����xGk�!�ҌA������ґ��W=(zt-^�?Xvp�1R���T��������.p��k:�p �&�R�ty���Zn�E��^�(�ME������Y�q����tb�8�FߡK�1v(�v7Q���fE�M?dՍ�a%���(wU=+�?y|`�x"����l��x8b� 3߈�;�x���e��~��%��;#�9��>Ȧ�r�6�)�^fY��K��      �   �  x��V�n�0<�_�crp+����h������Ĭ#ԖY����5l#|x�7{v8�]�2ZN��ۺ]͓���罹̀,*����)(t�_���^\_�X6������s8�}9h߶�k�ͯ`��XXUh�A��1kw>��?$l4�7�8��EW�z[ i���k`����b�������=αr��,!5f�qF���gOa;Q��"d'(- $I�B�촦��r�ZU�$I�'UR�@<����OZ<��KN8J�ZJc*�($J-)Sn)=�/���m�>)
z����޻uq�o���=�<��!Q����A�p	!a�QߓO�湘o�fx]ߒ�j񮘷k��>$��"��aʞ>mN���X�m�H���)p�-�柛=���WK���뛧��� ��-pܻ8fg@�#>���3�%�x�7��S�rfP�+����jH��Dt:�-tV�Zs���p�����>���i� �<�H�D30$����j��+��L�?����e��)��y���:��"�M��������~]6ۭޯ�~�����<��q�U!�s�$�8��'��q�!x�%!;�5�d�)FPR�PE�-�dJ
��ixE�'A���(�K)����]��=t�P,���4�-�0�>����r$l������	��_mqkxQ5�
�[�5�YDªD��h�aT�T�	������]�h�R��7���f�,���p9Xg�p�d`�+��{��/F�6��<-BAZaH���CZ�K��t*/�0�/���H0�b�A���S)ǔ`��1ݙb�Z#S
�`e�4A«ҵ&��7��8�3��m @�G (a���B�B@����FΫ��ĺ�<��Yx�B�%B�u!2F�U�86����J�dw�L���EH�@F����N����t:�
al      �   �  x��T[n�@��N��HR��y�q�i���%Z�f�vWv�S�=Yg���������][v]�Z�iuU�X�Ey#� ����<H�#g��E�+��CN<wQ\0���m�('�!���7r4�(��xQM
�vĭ7�h���`�]��a��>�q�u05K�bq�JC�Cy�7�m�1�:٢ߋ���CH��{�u-��P�.��N��#Ϗƾ���=8��7.K\lȚ:�	-��Zߓqt�	�k��hg\-�.i&�V�̦1P���B}%��c�����-�g�����ı�M��&�T�F§,.ܯ�#�)H�Ƅ ��P4��!�Ҋ��M@N�w����x�<0��/F=��C�x%~\�?7i/�d�R�1v�đx��ث]O_���=�S��HW1��Ok�/j�h���VC�CZ	 �Qi�4����ӑZ��|�nO:c%�|+.���r��Q�.��L�r[j޺������G�2��o��!3��m�ڝ��j�f�i�1j��
Qd�%�>0x�#��P^��%�W?�^VH�PL|�[��z�0�8��� �z?:��ԉUm�m(}��0EY���@�魘�A��y���ƾ�8}ؽFx�كk�H����b��'����i����������������N�Ud
�X�}�1�$>%�%MR-�䋻���,˿x5��      �   �  x��TMs�0=�_�cr �mfL�1��ҋh�f%�i}���&_�������m��[��R)���Ů:��,��������+�����,�X�yN��~�&�
�Z���<��A	ㅗ�pa�#q���h�=�����`�mXH��av���(�f��:GHY��Z>�L�-!U0,8�BIJ�~�5R��s�y05p1��Cv=ϔ�>4����<3��y�70���@��B�H���W�/A+����"GdM^��B��3�섟&�jX��4!GE�Y�/-��
�����6���)['����i����m������X)��M}\���}���]	�
J_���8�|@ۄz�E6m\�3�ِ�-L�U'Y���6��}T{;�����Ckc�t�j���W�'S��"�/�Y��@�����dt��D��uPn9��u�{6�9�ng��FQ`������$��      �   �   x�EP�n�0�����7.�H��mѥc�6QY4(���/���"H��T*���b{����ItO4���jE,4*����ý�DL}��둇1���N=]a�lB�z���E�U��o;�*�;�=�/UG�jOYp"�װd�9���ST�z	�3�3M3���2_�f��R��e܈{�3jh,)�:=�R�p��w.��ǭ��?&%�T%���m �u�      �      x��}�r$W����Հ��1Y)��$���$�ɦu7�Nx�G� 0������/$3-�V�I}���<<�l3�D����w߽�;�o��*���c�(����p�vؔy���7e�'���t�ߎ�_�<zy~t}qtyytsq}t����.�J���s�e�n�z�t��/6I�%�f�?�u2o�u�v���;�a�?���X4U�*Y����E�۞��:}���-覬��]���>�K�E�-�Y�Ʋi��f;T�йA����2��mWf	��C�(���&��h����rCo���dSVU���:K�JzVc��b�����k��4˄f��%wtM��O��"�4�<�⎧u���Λ�O���m�.���Iٶ�
�ϒo�vU�S:�ԯK�]����uVbF��ʢ��M���e�&k��^�揾�7`�<w벦�|X�U�ݖ�o\��1�e6K�7YU��﫚��.�̛��'���G���1M>�a^���N���ʪl�58~S���iA\��������]K�L�O��'���iSr�7�CV�$���y�a�ޔXJ��,MY/�!�O[�E�'���vi�X��>�WE�.ۡ��ߚTt{�7�m��!��v#�%<<g��u_�]��0%�&F[l�:��ҘZ��%ޖ�h�����IU�+Z'�9�O|?M;]�GB��G�񜖋^G�u�v[zj��Lh�Q�7�$���</y��&���D4��)���l6��M-/p�6[�nhzqWU��&�h�����މ���	۶ɇm���1ީ�{�G3�̋EF/�m�/<�^��x��=yA��.�����χ%MuS��b�V�J0�C����hl�e���m6��}��C�Je�����ͣspM�H��� ��omy�&$'M�5M3�ީ�ܩ�e5)����}L�n۲���%=���-V�wL-dP�E�.i�IVC�YQ�a��ќ�?�m�	u�,� �Gwm��1#	$��n���4���S�gh�i������uR���/]�~G�'kEר~���'��~��Ͷjv�v�ꐞtu��im�H����i�o0��l]h"�����]��+��g��BH�L��vd[��.���>������F�bYє���.�Hs���!$��vMI�B+{5c���>ZRm�[�IS;7�ߺ���n����~��ѰK�-�OM�������U��0D�,��@E߹95m�V^4	�o�s�	2^�X��E{ɓ.�m�7�{9X��)��$wb쐶��mr�~0�]r[�n�q��E��C��7�ճS�P��`d=���� �'���gkCҌ-&l�C��� 3�8T5����៻f��C�I�c�M;�n�oNfG_,��'�
��ޗ�9�1�� ��zu��w����]��6��9�%x���كxM�.�
����2�.�h^h3-�00y�ԫ��DS���<T�pիW
��%���~�&�c�0f�*�:�;*�����a�����q�c�O�ǲ��\Ү�S�L{�`��3^�-h����h��6X��/�E[ʄmI�y��2�z��L{ƫ��5�+�Y�k�S�E L�8%���@]��4��_4c@�}��8N�`�M�������2��&0нƾ���_��l|]��;��D�c�TN+���ؾYK�`�L?�+y䶡���D#D߹U��#w�V�]�دY;N��n�i��
��'g����=
�
��7�`� x_d�B����Ⱪ1�����M!�	�P����4�����.w�z��4ٞ��s�KU[5p�h�6�@���� �<�Y�Ó�XgP�`���G��I:dg)���թ��,'��A87���0}Bm���=Kn�^�s<�IG���Q�`]�\HI�2�뒳�%|3}P�b�j��i'�xH�ׄ�-����)�Nu��0���ݞ�@���_G���#`3�ɖ��/�pX���X��"�,���wύ=�v��,���M�	��UaZcZ?��TD�<]J~9��M������9�r�(/��:!�MO���X��&�o�d��8�#�c��
�����y�+��#�������'�6��g��d��t�� �̈��bh�+zB��#t�'`�f�?{�Af�hU|i�bx���dۙ�i?mb�l��2�e�=�OI�����1�$˯��"��I�E���>r'�,�����ɓD#����IӮȗY(ڵ)
��[���N�+��^�fi����p�?M��դ��� X��V��ed!ȏ�q14���+��+�(���,�ڗL�ӔM�w��HS�cG��؅v�"2}|#�P�M��p[�>��溿D��b�U#�ѨϫS���v1���lmNl�m�E�c�l�V�L~�O� ���pI�n�k=����������@$y��1���KY��vp��x�4{�<`�cB���2`�ʜ�(c^��n�UQ�`���e�g���Ol��\?S�6��Ĵ{�S�����	/{浄K՟a����&]�l��V��WY��ܬce��A�:��/�ǲmjv��Ida���Ie�:X��o�<=�	ٖ���^��J�i�sV�p���W�`�/�-)%�`k�r��uI#~��@� �`�ȃ��/^��\\a;]�Ι����n�-�ځ�0�����'UR1����.���C�T���h��CĬPi�S�_�(rڸ�l�m�� "pO*�Q��"�n����wX���m��2To�i�j�U��3c���'ۡ�
��U�.�:��E�ӏ���B{$��x����%o1{􌜄I���U���o�ZR��ǲ[�ux�96[�\��m3���Y�a+�G�'�4�M�UѐlפS�-gn�����؁�l�H��r�Toh��C7�����u�V����M3P��[{ƻ.����qz78$�hV��M��7��mӴFu��������; �����(J^��	K-N6���ɪ���rf�O~�O5�~�I�"������W]��[7I�d���ۉyp\ܪq��v�|�GV�2�*�0������~9��1�N�;GWU����cp�(�ę�YYA'�̋i�_IG�'5��wŦ<%� hɎ�>� iW�Hd���X8�A07���2�����=K����S�>�~����B�õ(�Sh��/�t�F¾�"%����	�>��F=m�R`�~�,���g՟��9�4�_bC3&V� ���V�a�-4���Y&G����V�qŠD&�<t�б�(�q�x���D�J[5r7S�G֋}��7��'U��a�9�"S�[���QZߖ���U�����x���m�O[Htf�^Lb0������.$���=����o��6뫓��GqX�p��>A|�^�{V�a�ѷ�w ��7/&��sw�U2���^'�����6��h�����{��S��a�ф� z��U��S�X�<�W���d�W���{"QV��k�,�}�kcMKJo�g��pF��1������۔m��.���C���N�5��%�m���m�A�j� �t\�V3�R ��D�����}�_D'�J%Ǒ��� �=�;�c�W����QO�Y���U���(M�6�����؅'�SiH{��6Nt��^��rr���U�`�/��q&��˱�^"�@�``Om�ty�����Vݛa��H�i�˓�ށ�E��e��ZV��G^Jf�.�d�+~,Mr����r��Y���y �E{�@ldŞ���rѤ�)�J41�������o�#��R�m~h�/�6]V��l�?ޖ�l�o�M��4����J����ss�{�<��n���j�����.���?�	H5G@L��q�����k~ ����ƒSu��c5����K�{�!���z�vW{�3�T�O��#����o`�	�IPt��0Zژ��_}}Y��\�1E����F�l����.�V�Hooe�U�m	�E
��D����;�ŔC���/�>y�u�Q�̅�6^f�2���AH.�,�k���#i,�fԀ5�r���!t R�������-��=�0]ʁ�5Ж�xS�[�
�>t�\�uA2GYÏ�4 w�2    >�O�k���-83�)!�d�X{
e�ي��z�L�5�c�C3�����9Z
����͆2���P��q�:RcS"�����P4?��$ŏ0+�z!8���\.�������5�6�N�3_��0�|G+�pm��)����0,��&#�[�:T����O����8L�M�z���J��Z��t�)C����y�댅�Mx�L��e^K�Q��F8�{��xR����A�*�s����6����x�������|��ʈ�R�xx�����s� ⊋�{[jq��y��V�ç�-�O m�N^�>1e�!2��"p��O�(
��Q�&p4K3�>I�����['Z�5�j�@ulP7��>X�i��O�<h�P����wOeN�{�6qE.�)��t>���2f@�F	B#jT��ƪz���^�%�%��k{ɷd�O���TA����q�v�:�i�ٝ�� 9v>Knc��n�w�f����O:!����@V!9�����KqIn�l.؎�hD∹�MGO]�/��Ǔ��[��I;��dWk^s`ɂr��0s����B*�ǩ�� ��2�y�찣��4���yc�d� �+�����^�Ilʎ�7��vK�݉�`F���~-�(�	$��~�C(��ӯlZ�gS��r� iq��y�04�2M�����%9��o����r�ҫ��S���e�C� Q*x��~�a��%G��4���X"��sZ%�A�%p�Zz����5���g�5'B�'�Ze�}�&�)z�'P���(֎uc��B�xh'�<��<O/�$%rڻ�Ԁ�a�0�h��%@(�_+�G�c�� �P�b#��W;6q9h"]�f�c|�:R�,Cm������Ff%9~�y���N>f��À�π=yq��`�L�a#��jd�y��bkH��9�\N�h�n ]�Le�r?i�e�ԟj�B�cHSH��O���f!��fV�uq�T����4I^�!�#�? 8�$��W��$���5�E^\%���>���7����Y&�<laB����]\�٭��l�K�(V'��.��Q;��'a�!�2 �t�<z�l+�����uZ��
��AKȑlh��!��c�i	�ma�..~�5�j=l4c��Hf�H�0P����	�5���cU�b��-�
З?B�����M!���I"�?��s��t
\x6S6�_#��l��҂7��E���pp�f�"���@-ze9�Ѻ9gF�Syz1�F���⬉��yz�i����i��X_�oK��R�QL�w�#K�9�٪��@C?�9/[����@[�BW�����
i���{�9h�8�8"���4v�X�N5��pvB���	������d�'w�Oי��ZKs�UT۳O}��dqnڋ��s�����W�11[��@~�&�t6YW	�a����L��w����j��LM�n!�&Zm���]�Oӽ��{�l,8]�!���ՙ�2�.�ԕ���2U͇�;�a�X)b!��G����K�X�,����N�:r4�h��j!YO��[��t�AC`���~~�����Wg|12��?���m3���j=IL�dG�'$�����w�E��v$}C�4��%���J����J��'92���6��?�V"1z�d�e�1`�o�?O��|�'�������*��I�PB�i�ŊC��D;�]���>������9�x������*���-�.�<��V`H��ԌY�>���p>�N�?�e�����K�ibǼN�*�_��"{��w#���x7 Te/�.NL q7iW@pX��C���a��V�`!ݑrN��k�f�Aɻ�9U#��0��mٌc0�ۢ�O�y�+̑�A=�8�^�2д-|E(���w��(����"�S,�3Jn�R�����̥/����۴��"�)�g����WUr�U��ٷ'Q.`@�5�9�
��}�Cۇw�K6cpȉ�KJ�\���[�]x�7��ܰ��"���T 5e�N����o�v��!�B�e��
6��P�=e;1PR���$/(���N�W�̉#5�ߦ}P~N�|������	�L�l*�����N����<�.`�օ�]҂U�\Ȱ�1i�z���^���}wb���9��j����/�U|,3��t9>���X�����#CD?^�|�(��W���KB50������",7K3���W�C�|�8�	q��#g論�u�W���]�t�e쑡�]�7��Э15���m�l�@��Kf��>��P�aYx�b4��,G��)Eșo6���e�(��&{���ħC�ı����y�}Z�R��m�@��ĘECz�W� � E-r���<�F署qZ�F�
y6���"m�Gܶ��l���� �T�nσ�� �h���m�;�KJ�\�w="f�G�hH�
��?R�qKole{\���/��v�9ў�N�3��@��l��<��I��f6_+ ����/F5�{��eNAX,�×y�q5=���q�������"o�[s�Cj;�_h汣$� <s(a�]-���ܻ�
$>��җ�p��2�!~�T�������(�>��i�<�2��u����(x�~ҞY��٣:n�ruԲ�2ǋ��tLǒ�G�O�(�,��&f�P9X�;�p|q��I�������/Nh����2#�>��='e�M�N;�ǚWC17���ۺ�WcP�9�jzd�Ҟ&E���
	�'v�J�İ'%&��Im������N�PG�6c���d�@�K��C �2הR��3*O����o��	����@�SH\��*��@�_�&�5��9q'����S9�8�@`�w��Ƹ-�[��'z/��׫F�'��4���_e��*Ϩc�R��It�Oddk.���<��j�4>K��f��.ࡥTh]P����1|��"�O�b�Պ���~́]5���Æ�#GB���7���,
G@+J^Fh����T��\�LO��4�� $����?�E�o����8_��;!%�"���?�D	:ώ{i�sD0�哹d���'?��B�*�<$*%P��-Q�Ka���7�b��-Js�e
�d���D����dO�_�b�X�I:��?շ,b�7u�*Đ�l�(����j�e#y[S�$��69�.���c�&�O�/l�i_��,砮D
?�w�)�`�JR&�lAN�bX�9�s�M�n�M�<���B�1=�ץơ�y������%v(�^����|ҡ~�VM���Ţ*�����^@��ș�?�X�����3I�<9����z�|/f�׿S�S�S�S�S�S�S�S�S�S�S���R�q-������q�+quqt9���tǓ��q�Δ�W5����J�� ���.�S��;�\]x�o`G��G�x��xԏCy����U�]��rS^@�|��T���������&j'�i�o��HH_��H��	�v�j��&G�sPmVH����x�ۘr�/�m߳��EA�D+������|��_ݽ��׷�;l�S}7J�DV��B��{�19����#-��Vzm��P���kVѫ��I)$/[�i6z���|��x��Ԝ"q1."? 7A��\�#������Ix�(���O���KmT��v���57g?�s���	���j6"g��I�w��]1��M|��>R�¾gQ��z�V%��b5 +;�ڗ`A��a[�m�&>�F�_`�%d?�>�*Q�
�7+u�J�`ɵ,�ݯ\��c��_�M���s�A�l��KKȰa�}��Ti�����
�f�ˢ(r�B����[��7�l�Ǩ�>��;��M/R-��5��Za�d6�#x�3�;+?��ÜQ�(2_Ձ�	pT��u��C��9z���Z�7��2<�$�+��ǰ8U�7 宸6��ED#�Ɨ�Rs�y�:MԯѠ-�����~���
j��"� ��ׁWG&�̤��d�)B�P,�#�6��(-{��*	%�b�q����a{��!b�3�s��e�Z56��٥��p��3`&��n��t���U��	��m��~=tA�'����3S    ��M*�@X�ﱾh�90�b���@���Ϛ�(����X/���]1�rL�dA�\zyu����P����J
΄=�9;����|}n�B"�[������k�Q�j�\�5�`�I�%PP�5���3������1���#�D���2;�%����o[UrM#�hD��t���*���>e,����13h������W�-J�^4����+�S3T���BT���3v��/7��@+#��i5�B�ң:<!�����~S�)\�Y�y� ӟ�T�Ef��aK�Yd�9Yt��)(���:'�,�0�*��\��\��,l�$�Ǵ��"�(T׽�Fp���G�}ct͜N�o�	���;���;t\GB�����M"W��6�[�����,���P�����̶,b�V3>�͵{�8�� w۠���?&nZ2[׀��y�L�{�MXg�ŭ���k*=>._2+�	�7h��Y�<�B��x��?��.���ʳ�2�lhy�d��0 �'�Va�ܓ��K�ڋY�_��GY �G��a}:��h�j�����
$�9r�,�#դn?�}��T>ho�3��W��~ǈ�[7-|�٠p�������uBR>g����k��R�;� ic��gɭ���U'��iBU��Py��H/�?�����iY�c�&����X+ed\ZM�Θ�}��M;��1�dǠ��A�u1�Ƀ��yUZ�S(;]���@Bн.���1�&Q��4Y��;�f$#��}��ܔ��1q��;"Ř�Be:�To��{���Q���0}���Z���t�A\������|q�ұX�Y�A���y�{]h�����^�ƙ���w�r'8��u(w�=J�6�[dRW�kב1[I�D;_�j�$�J������[>lX���ˑ&	��kI�k�Jk|г�"��e��N�~�v�0��9*e��L&��B�Ti�����5nA���0Z@�tk��\*�����������WwJ�2Z} 7��
���45�zG��ÉR��T�a3(�:2�� ��������BH� ��z�s}��lm����g0�jD\/*��#�n�~�+v,�F�-�-�Y*��$�S�C�� �U43��h?l
�� sI:j:_��Qj!@�'<R��c����Q���JD=5����%������C��'?���a_��dΝ���=��8�Z�Yj'���^Kf\��e�K��n`�F��j�4�jK��-��<i#�,^lZ���N��R[`
�<('a��w�3�ß`N}���s���H�ס�f��%�\��qngQ�{�E��*H������G�����s��w�le�m�7!�uЦ�R�z�6��F��#)�d���}m���ucy4�l��=�G��ػ$|?������;�%��;IS-���)WN��'Ų��,��?n�R�g�%�!�tq�N�fE�]�E��(9˳Nd�Zۖ�W�+V���M�2��s>^-���<�iԇ+��C�D#<|�q���� �����n��TFH��]��z��9��{�#�T!�>G!��Z�Ö�Ȃ���r�2*��oK��Q9_�Q���Kί^��!�,�}>�?�^0����Lcm	�g,Bq�܅V"H�eG���S_,:�l'	��s�S������ь:h��Ǻ.�n�V�ǎ���S��u����HX�%�>�۾��+{����IawhD]�xO5������H�� W�̪nT�ݒS��;��[.�l?���hs��B�}��yK8iP�A��%��Mg�cG6|������6)�q|C�4֫\�0�ź����sǉ9҈�NH�C�"dl��'���ĕU
�S�<*+e�9�l�`<9M%��LȀq��V�w�ctP�4(�3���j��n�z�j�EIAþ[&��~��X�5D���7�m��I��"q4���v�O�b��5��5V�����~m*���'H�ia&�K4�Jr��?SV؍+���P_�ߢ�����>	�F uGX���Cf1��Bp�`��k%y�W7�z�">( ,��$����P	)?/l�V�l��+�<6���=i3'fR8'@Bu�Ys�b̲�js�e@U5b��#F��.Vl'�i���AE�0�h#��V!�'_������N?Ł����+�X(<�~en��8��Y'��0DD;kt����3Q8��u�%���:w��gv����~�ll�+هֈs*�}>k��8X�չ���	��/�U��MZ��_�u��	&ݛ1o��E�.0hy���� ����{>��Ҧ��N�fo�����)?s_��l�m6��;9�K{P����)xŋ�K{���]�<���D�'O ��n�`��T,c9r@���(_�uf��`��l8��t'��bgB�|���#HJ�\��Ӗ���-^W]��9e��ҧ�A���~�k��W_���`�]�뿪K3Ŗ��ؾmx���:ˌ��<�߀�C7��%1�o�h&K�	�E]l!�\��A��CO�-0�:M�,ךS�B��KR����p����>�_�3+��P�8�7����h�p\S�y��}��I�� -�T����>�(+�c��^e&�/f���Q�6��_t&/f����&�����|I��~^��ҭ������(���������O"�$OE���pq���m<^����>Q�����c��6_���v���U_n�|lI��K��u�3�.<E�=ye\����#ymѣ�b�����i��$�Ĵ��g���z���X��;���qZ�P"\֕�5v�-�\߶��QJ�O5F%-�G	���>����x�6�ZUr����'T�I��lK��{0[OhR����D�'?/Z���.���u���Iumڏ?�kQF_��XX��`�虧�a�O�l��
5Lo]pQ�.d�Ķ�5Obj=��f>�+9��y�W5*�%�ʤ����˕��tWŲ��E�V�=wK�_�b^��&?n+�d;k�w��~�H��Ѥ�Ȧw�G�fM��'ı���s�	�p���q�` ��p��M{���>�3<r��{�:L�U�{b�[g��w�z�tn���TA�K�����XOG�Z�h�'�e��dU��`>����&��~��������T���=�;c��P���Z��Ap|�kc�~z���ΰ���X��"����6���_����Wf����1�������%�?������S��7����L�b��񖩶��Gs��9�!z4�cl	�$a���?M*�hs��Hv�]- �-n.�����-�N�j$Ǯt혗�������������o�R�Z5I���ݸs-����H�\٦J�>�=IɈ�5�:j�l=���J%��S[y�^���N��o�0 �_ �6�a�����+|��1�n�0���&ῡ����[�>�H�*a��3^z�
K�eӤ�����ԗ���Xfb����ˀ�MM  (|���Vί�;��l���y�WU��dH���IIV��x� �:>�`A�s6O]o9�сlL��r���g8xR�4b��4H���m|b��E0�V���r��)���k_�)�0�ct8��h4���}���8��k$��s�)�26?�#��-���2(�N�RÇ1i��VI�V��v�:}}�EǤ���ť�:t��!L���@7@i~�	3�$��F8�����?[�+,9ɾ�#W=s�(WNLu�.�SI܁U����� �w�S韥N�=���l���E�Vچh�?q�GEvo,i��ex\B�6����8�:�|�QlNQ����^s��D�^�:*~K�Y��Q��E�oQ+p������@��u�E,���tL�15Vvf�s���������U�+����*Z�D#�=V�}{@z>R�E]�1+&6r��:��E'���
�8Y�J����$C��ȇ�3jab��nڈ%ə�;Θ}:���֧���GD�q�F�����՗-+Df$���j�;�N�۪	G�[TH���O�����[���\&�����`�rV�lY09���[��t5d8z�@�Ś��ȃ F  Sw�)��CE��±0h�F�t:��G�K>��Ǧ�.�� 7�Ov��P)�;$xty9{qt���ˣ�룫ˣ����%\u��R'4Ya4"A�����-��/4��I�,��`V��f@�1G3��hw�_4�����o����{�7dd-|j�O�Kd�&ߕ+��W'��4V��̲�%���������\����b~V}����ߎo7e��9�l3�%h��/Zw��K�.������� 3X�$�t"�ҙkѢ��ՙ&U��d���n�d��5"h�mD͕x��ы�F#|k���'G�徤6�ܓ�*�rzY�I�v���Zz�sL���l�ɲwz�'=�\AA�.5�g)�ߗ���ps���ӫ��|�	m0.m��à�
�ԧ��K)YD�����B����M@["��;VǬd#|�F��ͦ�|�v3{ �6M�m�d�^���Y.�Y�pD	��\�<���@�5,|��`�hsʟ��)^�T�^"�Z�"������Bz�a�?���p���`�;�E���T�w��������D�Br���e�)���4�������\�ZwP5�^YK+L���Η\
L�:�8�(Sכ�ʆU�Cb_�"����:�%�q'ֳ�jL�X��n=�85p ��Y^�I�OQ�;3���-��؝�#��^ :N$��LB|�SsJ�����x�����{s ��	e{�mN��<�:g� V��r��kS��&LLL�k��\e-*�T������D4���th�e�ju��|C�CIb�>��K�����2�\-�$�<WzgG
���Чځ���B /�7�Qб�˝E�U��>����C�� C�\_�_]� ��$�s5�>:����uYeԦ������O�Q:5-����c(a@�u���u�J/P�/���'q�n�	cűH�[��c.QiZ��$��%~�.�x��v�9�׷EG �����A��zՠ��W�"�¤��_�ͼ��@��<����/�f�͟&\7�~(zBiR�K�e4HQa�s}�߽�1_c����--��V\E̩�R9%M�gP,���͛Ok�j�"|�B~�͢��Ch��ؔ�8I��O���H�_���A&�h	�$��:N�MP�-���9]H�j��fh;��y~}�Jw�Yiu���������;��OZGds]v^�$���0��Z�,s��ml�N��x������������1}��`F�`x��w|�%��bE+�ݢ���to�/��T�\��.�-H��gK��m�SAA���#��c9�A����#¤fw�h� �]�6Ѡ�]��q��\{���s0�-/¯Vʃv�����nȧb8R�'&nO	�����\��ʁ�u>��a_.�[9S]kkJ;�AMt��Ȍ.�w����'��;�?-_�?���!}�!?i�̍���,���|��i	;�(�1�6Fɲ�:y�]�پ�����-�:I�rY�R#!����u���5�kWw2�qI5ǘ�ӱJ+ѥJ�*�\}U��4�$>�X����=���U����}L��5M.��f�G7?y���� ǋs�#��]���9��w�=�R(�`�a��w�rpt)�.��e�j�]A�]C`�&�������&_-b�i��J~��տf5�ß�z'����^�Q�0���.�&8sz�;6� %���x���w�n?q>�DL]l�^0ȫ���eR�8����m5���E�\�eSC>?A�R��2�ȿ��߇21t)�++A���$`�P�f�߲��j�Ѝ?����#��V�������O��ӱ���
�w�_���x]�vp��K�Ǉ^O�A�t߮sG�Ji�8[z*u�T�ZH��IM��$B�==ד6��+f�����c�;���~���M=����m�~���:׆��(Ji�TWz�Zj$�7������ӗ�AC��=H�f$@��Z2����1�e=jr%0�U��|*1_f7R�Ӧ��wio<������B��WG�7�G�g/�.f�7�������T�E4�4�3$�F~g���W�am�#��دw݂��v��Zs���o�r��W�^�]Lw�<K��Y�=�I1w2�4�_O8���C�k��l��� f':}��c�)6�+��?B��Im��,�V�i	��i([��Y�+ʚ�S��A�P��PGu��Qlڝ�����KzX3Ϙ�S�$���AT|���"h�n$�eVCڒm
�����,׼Q���3��6�NY��u�������҈Iޖ���Sצħ�)=��-����V��.�fB��I3����p��Q;&��e��0y ��R���Hp��m%�d,����jZ:�z��`�U�kvq׍�����Ju�U+�����"��)ɷS�D\[���0��V���
T���:`º�OaP��q�W"=���u�kn7*1tG�@w���O�Gth��Xs� �f��7C��i�OE�Ɔ�_'?�߾{��vކ�m�\�>��Gƚ*�:,���*��Ƈ���V�-�&�Է1:���	��y��i�1�4�6���GW77G�W���:��z����˛���:�.0�ep�Uj3�uQ9^��S��xu0P���7G�B}zu�������x�m��w3�O������6��ĕJ��N(�7?�`"�����s�l8��Mɖ�f�{�3uB#9ڍ�`u��FIw,�ʋ<�u��z^�_�Ѵw	������`�lB�TK��`����p ���ʞ�^�sI`�&rv}��[�_HI2�>.��}�DK0
���t^ոHoX ���C�z�V|2�PI�L���ej�L�MO��XO����D�E��LuV��@�8��;n���������z������{��[�v]�g���AI�h��׋����|�hb9%�����uq`�_{.+�ݾ"g���{G
*�U7��ш蒄[_C�	>ك�TQ�V�+ɡi��)�"�f�����^�4�X%������P�Xϯ���/�����։p�^�,Ӱ
v�<����ʕ{`c�ȥ��yN�� ��' y{(��@�F���}���ba�עԸs9Xp	�ջL�Y0���F��zx���l5�t�mVm �M��|�P!m��H��;�-��^9��`����>hju������qX��6I�QA��[4�9�]��ĸ��n��
3Y}2)w��{A}dFt|����&y��S� msdtv�p7�B����;��֝-�TL���EҴscP�c~ў�k�;>�7��7y��� �X.���Ķ�L>��Q��7��I��9i5h�2K��a1�A�0|Ę�Ga8"+j,��.&����?�С��֕5�зYk!vY�����m��]}gT{���
��A$���J��Sn�3��6`�x'/��ұ�*R���
6�&1��Q�hl\¾�fv���#�|����xs�1a����j�p�md���hK��n�mѼ��=��?ދ��Jqu��_]]�x1��>z	��fv��������ѫ�ٕ�����o���%\��)�����޼�����)7�3����l��cR�>-<�QB]�ʌp������gb���ցٷ��f�V8���k�^�;Ȧ���(³o�2�� ~-�1�F��!$˸A.�˸�K[.D���p�`_1	��g��i�̫lg��ỷw%9�GKc��gzHt�!6ğ�v�s��e/��(b�U%eexҨ��������\�wt���"��H���q'�@]�G����ҟ����5��Ҧ>�w�8<f�;H0�q���Qj=��Zщ8�8^�ꓫ7R"��.8q�X&.�G����Q�4v����Ȥ8��;�:Wa|5Z.����,L�ح�k/j���������h      �      x�ݽ͒G�&�n>E,�&LQɪ� n�����!HJm�Dfze+2";~��\��z#i'�1��b�t_A\�-�It~ݏ{D���Lcצ����q?~~������W��r�����ß�Y�eٶ(��]岛�Ye��������.[U_���O�*{]t}vѕ}�C�,o�eֺu���<{Wg�ǧ�y��wm��=�)+��P�E�&+v��_�-\��gOO�ϲmYU����k�e�8?����[x�۲^��d�Y��Z������%^���3�������k���y�������<��qٕ�m���;�f�\�������B�8�us��e=|_.D�Ͽ�/t�E��:\�<+����M�f^uST7Ys3���ٺ�ǵ�W*��xq�h�G潺lvyy������s|�Vf�}�6��jr��do�v��z��z��w�+��l��-��v���ݽ+Zx���W��ܖ��e�Y����p�����p_+@�+r\�{��[�ឭ�g��ݔ]����e��}�@�z	W�\7{U�
��RTs\���?� ��jU����
�E~�/�o�_}v�6�^����n�#�����hW � ��n�s�tC�<�\�U������K�[���Z�,w����#ѱK��77� �\��g�6�>��e�\3|W��lvq��_����ZG��?f� ��z�UŶ��2�������/��~zv~��E�������ahoq���:�_ܛ��g�W���0�T�=n���P�w���
e���H�R2��\=�yfW%��r�����c6!4���д�w���=`�ga�u=�������n�+���h�߶HX�"�No�v-Q�V��ӡ�m�X@�́x��UM�PA�"�K�.
/(wCU�$.�
�_/>޴Xid?�#-��/<�����SvZ��$m�G^dW�ޞ�Eۖk}���D ��m�h��GK!��ξ�7�������A��OZ+�֦\o�j\x8l ��^��;д��yFW�G\�k��C�(�s<�7p	X�h��8�%�����q �х��;��!�\�o,|�������6V�|{�wν��Vx@:��E0� Ţ�7��+�UX5�#�[���Q��T�������Mi�����Vf����^o	�n�K�OOE�����޺MS��c��bU�d�@8`��]�#)8�[W���䕂4��\��삜�.U7U��=�ժ��*��ѳ�`/�`Ѷhг!}rW���P'Vg<�[�P�|W��6�[z���w�������6"�+V���B⎵���	��n�B�H��_�}�Ř����Ë�xwy���K����(�m9�}%��rhIt�L[��i���l8KP�eW&�z�ͅ_�)�4��K��_݊|�WxR�]��pk�x�פ��pTaI��HU���M�-���./;t8�-:� xO��u���p��\�o�l[C?)A��nZy����#Z�c��[ۂ��wXŎu�6H$s[�ʕzj�L�S���W�To?zv�^7(�4�����:�H\D�=�&��p�z���\��
T�o .4�����3��q�$�&k�g�k��To�>x��(��ި��T�%]w�V��a��.{f�aQ���W�=l)~A/��
����͛~:о�_mQV$ ]��IqԤ*נ�;�L ^���*�����
�=�l��oJw��D�Y�u�է3�����f?�/�Űm~�D����l����d�������p�y�:�>����K%�5����l������O+����/���]�{��ɕ�%Gѥ'���Tv��&��c?Y�_�?v��/�˪�Y6�E��oa��<'���1z�oʺ*�p���ܨb���g-6�W��-��1]����K�钉'��O	H�{�(��f��㑔6˲9��+�:�u��c���!���	<��[�`�Dw"������T�R�[8��rpAa���w����nV�h���-K�T�KC��)ᵧV�<{F6�\��?]}�s��L+l�#ߍV�ۜ�<�E$[htv-k��Ro.~�m�f}8{�O ����q��-�=ꉆ��C����`l�:��Jn�Y����-�dr�I-�з��);�JY�᥎���C��p0�o���CFӈ�ɓ4$�I��Tw}��1|=��U�.V���S<%���K�iM����,E�Q��-�UIn6+⫦u�����W��GE��s쬃�^����MA+9�������(�ƺ_!r�k��D�y����,��
E��f '=+�(ᓓE�5U5`���s/�>��,�_�`=K��jX��y�]T�9a�3�4��<t�`}��(���)�V�9�Q��//>���x��
N�j�1�-�q�~t�Y�uo�\�Ns<d�X���N��C�í�<������7v�3��%xH(OWgy���R"ύ$���%A 	�ؖ`r]��\�r����X��]��>��E�H�_�y�ǧ`o�2�7�2�c����M_jl ���a�u=�^݀���<{	o�d���x��qf�],�MK"�)�lF���r�L�a�ґ�����ɚ%(�4I_�6�3<���(������y|x6�E��s�-\�k�cf	�C���w`�Q��<�u��2�[p%Ѕ����m
�5���he���np�J�LY�;g�uX�sJ���\�y����ܹ�#���i�����b��?4�
�j�����xɽm�*^��.�Z\]P��E�W�}H=�����̀^�|�|E!!<Ȃ�+��"Gn/��=l��gk�К���h��t��UW� �D�Qr4;����Y��XQ�SN+��-:�> 4rȪ�m1z�u��,�[�ol�\6�x���c�PrHJ�v��&����+v=��&�^��C��Q+{ 9�����4��-�M����UŒ%�4�FU6��!EH+�#8��̒EɌ���J#��?�D�km&�;Y�$R@�&�.�$����1��1��F���(�&�^�J��u��=|(�bH��<3�دo��݂s� �;y���<��a��'����@��q";��Î��;�
B����\»ԙ���o�암?@Q�ɺC���t$k[X�-%�fI($q`��(mpSv�t%;�hn��Ų\l�|�1����fENO���*�w�vB���|��q:�։b�iIZ� #.a���4;y���?���O�� � �Lu$��/���/٧b_5���o��Ҧ�N���/��w�
�H��a��i)Zo43A���5��d��D������W��k@�__�����5��ѝEy,x������,��:.���d7;�*fIoKU��k�ԝ��]�y򻶥m� k��:�P��Þ����5+8�P�ZHiV�)|�0�ݮ�ul7�T��D�;ɂ����e����y���	$�)NY�G�����{��_o
���
L�E}�r�m�ˡ"hK�>��x�r���K��8�︖]��w`X1!h��))�\��ɳ�v�5��0�^��R�d�n]�B�a�+
��������8ʩ�SzسG\�-@�N�XTz�O���G����I�˄�W���܅���p��-�<��~c>ǣ6�P��~7ܮ�K�?���J�f�pE-&����c��v��/��r�|3��)}����$)�I���q�Ċa!���$���kܯ+-ks��x�����<,v\<+buD�˫.��Tu̮���`"���Aȗ~<���+�\v�mQ��+�:� �*$�-_�w< �۫�Cq�ₒ�^"��f@�U���j��;,x&j�u��/�w���-�W���n�&�p�hrn:�v�?M�u6�P�տeS��P+0X��(�>���IԽh�!��x�u��#��=���R�,J�����$"3_����/b�Qhc�	t4�C�dr������`��ӳė�į�X� ���]��$��ʚ1�i{|�,����~S�r�EdW��w��"� �d��^h�����    ��s��ׯ��'D;O��8}$��K����:,<�TjZ��()���#���I�OIzٕ�P��$j.�s����vY�>Y�S
 |\3q�Q�G���(��,
���ȗ�ʕV���mȷ��,�F������(}%i"� �� v7�x�@��8�ȳ�e�+4�T��I��S��wH�]�h1{�s�Fk4C�����"��.��z��H,|I����	�)���$%�)��2�l+��r;l�%�7ö�t+G����R�em�rM��Aɸ�U�&�Љ�E��(E����v0�F	�.�V�~q�hTgx�JR�/��I�c���%7#� 8��(�*
{sO.*:��Ry�>�bc
�]��ĬmI��P���L��$-*GX�Ggw�v�Q4��Rd��N1�nY�&>��ْO�^jN,HIc|�dx��C��.
:��% ��tBAe�����?C	��H�/{]j�˴b���*�$L���{ƿӂ
�6���!����<�\CkQ�x"�5��=o.�W�[��}���P��Y{z(z&� �DjU��3��H�xU�ߔ�n�%"a�o@�����7-�t�g��z�1g�Q�.FI���7���5�J�3
Cꥴ�7Ҳ^sssD8&���AR�����O�mN���g��a�Qg@��]��-J�3��3,W�)�|D���︊�{��w����4����>�)bxq8A�-����^B���:�ꅿb��RU�b(9�/g��ɝ�l��pP�U�^R��mK�ұDk�9)L�����|=G��pO�7��w0&H؈処*��P�l	]��gM�jUk'�]��6�"�	W�*[4���^�X�5]�ɽ�OA���Ew��Lᤂ���W��.�ˣL�r,�����O!#�*�a�5�����"X��ߩ�C�ώN�cP�0"\���>���0�kQctH >Ī�����'T��^����.��t��%�L�ݠ�0�8�S�PPnz���P�ē��΄�����X��QN+[�o��J�5��b�Ju2���Z���x�k��%���,V��Pldڮ�����������I"�7lbnv��/Z ��o(�Ί��+'uДۙ�?x���/�7�T���>S�
��s�'�1���>�f+"���a�`�s���w���>V:����>z*�嗲�3D����@ؾ7%�%ɦIm�
V�i	�����۵G�b���g�9�N��m�+���ő0"������`�����1�3��	����j�Z��}��J�2>��3��5��`�NV"I�ͣS�R��e�xr��� D%�����GϻN�ǖ��>�?)尿ހ9���fIY�%�R�X���U�+����o���=i�g��(�ǫ�R�Ǘ��)��+�X�o�����u�֠�Y��Q��x�b����Z@�h&e�o�ND1]繠�=$���U�b�g|y�� ����blk!�q�,Ƚ$H8>(k0�c�9
/�7 �M�Aa�I�"�KE�P1�X���"���f?:8�m�g?Y���y��l�{wy��?/꾩�&���!��\ח֛���5��I��P߻�6��h��g�d���xV�5�_C�0�#�OqX�[|�=����o|*n�T�\Ŗ�5;Ӻ���a�#��
���Q`�#+L +��7x��U�����ъg��������������{cM�
�V�]��%�Y}W��+���F�	!�<{�s�D1%�g�Y���B��|����Z��1�{)�֑�5�ὖ�P���>{*���b����58�e����8f�D�UU�j�5pt+Bu:�w��QT��q���B�q��ޡW_JO�FT�rH�ER�n��(b�9���n���[�+��<��s�����T��m|���R�Sx�	�@�����r�z��>��Vn�Ft$/@����D WQ<��Ax\�Y7u�����Knzd^���y��ɮ��?x[�
*���j��D�Z�7�����{�U��Y}���/e�zC���캨��d(?������M˰L�z
2�'n׹Ո��E�׹��s����x^D_S�SI�e�P9�#J��nM'���a�2�]�Q�%]�P��廋O�)3QjXJ)o*�(�[�P��Ҹ�w�F��ƣ�t-�d܃�[짂Asői��h8X�s�FA�C]2�0.*�&%4U�H*MG:,'|�ZjDwR�<�m���#��h˴+
�P��|�q.&����^��x�rS�!��$���6el$��M�
�FW�TS�UČ������w�	�	�1���攧r�R~���Wq.�MdJX�ݙ�`��fweeȩװ��Un��ur�x�F@�����?�E��J���aY����6�n���.�Ň�j+�0x:?C� =f�0Hw��h���o�8Cs���#�`�����5�����ŻW���u��ɇ�]ɾL' 8�*�F������I��r5q8�۹�hS[v�����Σ��4�*�U1.9���űcE]�T���!��q/��Z�vGGQ�}�~�
IVR��[��B������AV�`��G��1��aD����@�uACVրO'��.	�̠a�N�6�ϔs�T0^#wm�v)n��֎���'�PIs�=����8���|<?����q2?ɶ[ɏ�r/�ʊ�s�>׹��q��ց�&_�`��T�R��i/�
�L����6���,,�Ŷ�Mc+�  U�9ց��yfW���既���Р}A������N�i_;�Tp��T�%�	�W� �a�a�r��0��eu½FQ�Y�P�~x�CFӫ�n�|A���NP���yaR�(}���p�/�;-XSω� 8����:����w�=p���%6�����G�l�ڭ��VKj�ay�i��s�����`#�l�vE�����}�v*�֋�bs��_���^�7QH��I ���	�в���x~��g��2�!M<;y~�����]@IW5�����٣l��7��T{��}���R��"
ïU?}��RO=W~ehӵ��$OY���Bk���SN�Cw���2��wBV��YUH�	D�N���{���tO�H�gS;�y��2�`���<�R�>!)���������;u�vX_�ukj򼈴�Sh�:���@,g�����kQ3�ʰ64T�������u�hZn�-����h�{B���R�uݹ`�m��կ�@z�y@��N�|jhl!�x_�)~��!nJ�_^�ʉ�醥��r���kZ#�=q��D̕%X��a)ʧ���+-oFUI꤫|z���)�ћ�ݑI�٬�l{|[uݰ���T����������.�강��`y#>�G�i��z	?���6ǋs�7h!��fOt3|rI�H��n2�)���1ډ>J�p�q��-��*�o�2h(Z.�6�uE�bYH.	;��6I�>#�HA�cz�p�9vV'D�k��I��CX��kv��%��j%��`@�f�����r�p��90�ر�zd���&Uj�8]rה�"�G��6������U~S;�%nROTc��S$xbn��$$�~y�����3A��zFxI�2v>�IJeLp��P��@x�Z[�-&��6�|����%iV�!����pG��Њt��ޯ�u�]ͣr�)��Ne����1��0v[���9^�aV��,����J���K߸EnWVM���xU�N`*R\�S����p��.�'�)�w./��	'P>)����1G���\��8:�g�J[;%XRN"��n���b��Y�w�/ŧ�g! �`���Tcb���pk�`G���W�>]���=ۖ����%�3ÿPc<غjE5So��l��E�s��y.mF*���A�� �)v�ºە��1
T�$�O��G��'���MM(!GWNhMP�0N��6�XА�����K�짟�p�;��@���B��^��o�����w1Vj�\��Bj�\;�"���R�IǷ�����*��:{
�����������g    ����g�goۡ�ÆS�H:d(�Q~r�PL�PO��J!�w͟࿨��Y��-vG��$Hu�j�M�E���E)#F���@ )�̧�x�tN��<�ߍ;����Z{|���$1��%�� �R��jD��5�iz�X6P(���g}�'���%(��B:�Y`���5Ā˥�N��I�B���Ś[����������#0����݇��V�8�E��S�����O��U���ܾ���<�Ѩ�ay�r�����q���u�yIO(���qjG��⓳c�C��wY��C_�����#��;�~�<9�����oc����\�D��'�؝�'�FШ|�o1��͆�J�K!��� B@8��tL납l�r֋/޼��%�H�Xga[����}�54U�n����踷`B!�4��ÆF���U��+ϙ
Y�	*HNk1*S2��	G�vH��u�RA����'����`'{�a��>}�%��>��q�?t����G`
W��B��p���㉟N�K�f)R��t�ʍ� �C�\y�#|���l��_�SL �TO�5}I���y��D��ɋg��p�E"GF��aξ�zJ�vO;B�p	�3����/�D��U��@|+�p�� 2�e+��4�kx��ux�����%��S&cF��L-���9BxUB�[�!���u����Sl�����R�bӮ��\d�\;_5-T�f��}�/QZ�3��z%p���8Jeƃ2+L��)�U�C��N���6BtLH�Jx@�t��ґ�R:Tp��.���	ݖ��^�1G	(���K�!� :�\L�!��%2���;	��?�g['�I�50-m!�C��_N�w��V٢+�����-��Ǆ~(]b�%���� �tK
�Ӑ�P�wb*�x~��9���R38�M9�?A���M²�������.{X��X[��a�4��+��W��m�7����G��������ϳ�6��0!A$�X뤦F8
G���ͺ�c����toE�m����}D[�1&�"�O�%F��RBQd�5��>��[^�U� �U�L�+�Ŧ���D������r\�U��Q��R���"����k wr;�	����*z�@3H�?m#(j�3Mg�����JЈG�Өl�y��R�h)��n�	�nԿ�!Lq������Sz�!Մ���8�!������4,�{i�'1��z�/30	`�N)YБ&i]�}��"��*�y� m8��]Gd�=EI�s^ߓeq%ח�ҍ���1�Ƹ߆�3����,Q&."$T/ʹ���&:��!�NC �v�<�5��#h���Rp�m����?�I�^���u�c+�5}�I���;^%y#}}J���J�K���`�:Z�ke�=ʉ�Th�R�̕*�߶���1O�EG=|��$����6I5�I�;��5��kv��}V����L���$h����|�,�
E�"�P/Y[�k� cH�dDTp�d�s�#C�\rnl��f"z�Z'ϳ����+(�ݖB��B�+��2c�sAJ����e�Ѻ�����X��g4�����$~r�-��E���>�_Ҏ:QnG+��P�����}�h]�����$���.�]b�n����Q�׶�5����	*�/a���,�JD9Ucl`���F��4�(��螼xq��PS����ڿi��Ê�r���\�=���e���7������ιBhC��9�
Y|ݶ<��Bcw JSc����sI�c�|M���_)ߞ�;EZy&�d~`� �A�*��*JC�/pqK�s0��~%gC�$y��@z��W�T!g>D�+�E�����`hjvE�wd��4^k���|M�h}�˼X lZӉ�}h@�5�������<��a(����'���Y`�U��x���M<5��r��-��m����]��ׄs�@2`naE���Pc�p������z������u���@�)�a��@PɁ�t m��A�Ai$��ئf������i�1ǖ��r+��^�_��2,j��6������aN�X7mF�{�EK:��AWj6i��T�`T���qqn�yZ+x���O �F���^�;Yk�����0���"APp�7�[�룟ʾ�Œw��2�Nm���+ڒ@e�}��{�?p�nLG.ӃE��E3�e$��v{`Y=tJĖT"�tdиÜQ�x�g���6h���ۦ�R�S�����|T po}=q��߽�x��㫤�lK����!���'刌�"�Q+'ՆFޖsG��v� �)�~ｈ�1��Q��� 	
a���|� �?���C1��M)y�db��7#�!?��*W���xt}#�t"��� �:!�l������޿R�|�$$rHXwԨ���}�>����x��˶�,��W�Mx�T��jZd#H'�s����l���������h��e��X5�
i��B/����m�b�-�N�Y"k6�%��j��AV����c � q��|Ox�fW����
e��i�I� y�𣶦0;�?;nń�{01Ќ�@I�h��-� ��$?ѕc���b��
'�ic�zj¢||hg��&�d��MOu�bO�ь�k�Jj�R�� ˿����u�'/�!�]>
*�9��p��
�ص �T#�4�
��䧴C��S��60�^�*W[�>Q�z�!]t�Y�}��*��p8F�G���L^��FJ�/S5���|-���)�Ol�x�@�U}J*<e�d}��Y���̤�+���C;Gn�S��7Cխ�n;*e�&va�㞣�#Y�%1So�IE�I���y�R7u���4<��I��ܯ��st���7CD.7%�/$���d[�?�D�h�N��wשHT�y�Q�"3�n*�O�˂��]+���n�	C6�>꒼�>��R�}��{8)��{�ף�-e�q��l��`]E|?��NaZ����A���9�ƛ"�B(���':�uس�	|R��ߔxpj�M	���I9&���n5hiB]$)�L	�E,"�)#p�F�	̴��˰�LDE�S�2�*�=�f�Nr�R�X������9Q�?Ƞ5�0��Q͊�+�˼,~)�ˢ*�k5����i�M��K�B�|?�H��%5�+ ��3�6|���쯩__�hΆ%����nD�����'��^�4�p�T���)��5-y��[,�`��*���x~��o����?��O��\�9'/��4��g'����'���q2��͏�H=$�r�g�o��0E^^	�1�S��c��@E.����P�SiR�)�fe����J��!�[���k�	6Ï6B�SRZt��w�;�Ġך{G��4)�π�	��3��,��>7�M�#-��xS�!/��5`8>/�FV�z%�~	���m�e-j���f���-[ޫ��Ź>i�_���
����B2��b`�V���P��c���˵�-g��N�N���f'��-��n�J�\o��e��(�[�;��tAb���MoE��
�d�z��q"M-�����pT��w�! �$�2L����ܟ`J��h0�W����@�f��2��`G������Z
<ߵΞ?�f-~\_�����ܶ�	��y4핔,�a78�)�탾>Sb�e�q�TMb8eF'��)G�Ȱy`��eHf���G!�ҧqz�d1S��o �y
�p-�Ne�򈋕��Z7�30��xi\������A�<m4�V�1�U�"���G2�M����L"���X�f~��;�)�ɑ��TF�y�ֱ��1{�ZƐF�&9!Mj��h���� |D��|�&+ln���mP�iO��?��ɾ)�S���+*�-`1����J<�bc�/B}Rb�܃����h���@�@�G~Zm�Y�n���%�;�a�f 8��XLKy���T��	�Ӂx^��'�l����R+K�wj����_�k��Ӧ��4®�2�Z���5��Mv�
�
D�겘��������D�J|���#O,ݤ|�� A}�l&����������٣��ὤ�T���\g4�0������o��>���Թ�j�z����    ���J*��R��h�E	��V��l�<�#}�`���0�ѕr3�* ͣ�cj�L����u�E�R��#7�X��ҙ�=�~�<Kc�'���Y�Mt�b��@=�Qo���y���i`7�[�������m��6���	��0�x�FO�ү�캨�Q�iΓPu�D���ğ�X@�*�T�鍋�w���GO�����B	�ا�W�/�zr��b,oPy;4������H�����R^�[�v-�:ʰg�SkR���)1�' �I�(�X�:B��P"��ñ��K�F�����2�m�5͋���'�;Ȥ�
��.ȊF��axJ�@�TQ�M��I��p�]�(0��mݲl��;M�����W��v����B`+�v�\��/X'BNi�駿���k��54�uG �kqj1��z���c���!�����'����=����r��k00W3Z^cƖ;����1�t��ʥ�'#���^���!j�#�}]�%K�Xέ�i<��s��ãl#�D(�  ���N���J�����F*�׈��[|��tj�g"`SQ�q,��&R�'���[�Q�^��4 )pJ�u��<n���S�A��\J��J�d�#)ŅP�׷�B��Rp����]�i��-��N�?��'l��ǂF�C��1DG:�7^�!��KR�|&y��D#��}P�Mi���_����5R]�Bo��=[�]�l��xɴB�;�Q[�J�6^��?$���V�Y$�9(��'IJ_vt\l�>(Qo ��
��d��v�7����~�u"��2Le��J�'�j
LN��Ey)o�c��]�n�yi����u�����������?%���*N���iE ��������V�L�&�	����9�v�I��4O�A��F���r�pv@�W>�x�������*��,&��#��k:&��S�����8�t`����W_��Z{�����Yn�?7�E)��[WWn祈?T;jBF�~�-&Z0{��wp@%'��i~|�D��WM�,��tQ�q�&��� "U�PSM�@̔�贙X�Mӣ!D�x�^'���o�s8f����2�������\�3^#6�qE>q�m�Ç�I����}�w`a�@�f(�q,E�������������>ZFe�.r0ظ>>�̷Z1�9+��<\��Ġ�O
m�'��f"df��ܴ+aQ��㾥�BΈ0J?�;;�=:�/N�$�5W�,����RS��n�Z�$yv-�H%ꋵ�oQ>��((|�D��e2�h�85�S�災����c/���	V ᳓��'G����m�T��y!�9���k������É�(����'��Ñ�͊M������"~s��?����<��i6�>f�é,A�x��z��}[b�}�2p<O�}�h�c챦M}fݫ���s���8��/ۧ�.<��h�1>ӫL�m| _>��̮�-��dg�c�`E�O!��0� b�
�aҹ�ը�,�NFu����,�`��[*H��ԛ:�cN�P>kuv�L��yL�aIs��1zr��({r�<����ޤ���LޟFR�`_d���Ќ��aPP�)T[��������h��\>��}���|�LY��$�-�"��ҍ��	^�D=4�9׺��7�tĽ�k���K�T�BG{��'�Fiqb͜N�+�e��;B;-��v���ȭ<�5�Xp7�	��Q������2ZL�Bk������DZK��[�ݫf�P� ``4��3<�6��[�r�8YcRfS�N�}���}�i���!�狝�O�Ǣ��f+'��Cz}`V��J�(|Y�I7A�����!��;w=��<�[�T8�y#���A�wt_���5�`���4�!^�ƎR5��8��F�ORlxD�6�C,\Eg�Hb@x��Ela!r����_�T���k�K�1�5�cf$�����9*C�k��|�qHx�qk�����z 
���A8�d{�������\�ō�x�	>L�n�M<=w�#@n�����@�XJ�������n�|�Ԯ=T�M�i~��=��G������T"�v�r��r�.a3Y�����Љ�y��n��J pWͦ@$!
"���R����Ϯ��M$�R5��i�&X���G2�n(x)C@��'tH��	ʏ���=�czJ�M�
��;kbt�H�ZY��,|!W����HmL�T��j�w��QN��A�/��P+v��҈���|r�@��B����D@��B��ɲ�k�;Ϯe��3�����+⯈;�bϓX}!}"�/��C �B�$�H'vXt��{�P	M���L������-����o�#,wy�NOz��?�^�0�q�� ����9N���΃��� b���5fe��G��8 ���VU�h�/M�U�B�� j=?����X��4����"���&MGv���f�xʴM�bR�a̗�~�mnA���)�廊�� ����1M|�� ���,@�,�������9�=��D�U��o���y�Y\?��BM�IBp������0�U�	t�=�
�5�$�S�M��A���)s{�Xʆ��q/�h�ASc��eoyac�Z{��Q�j���[�grZ��P}��Y��8�
��et\C��6v|��P\{��[F�>�aL�bix�@��A԰�R���Oi�s���< �CͰ���q �j�:7<h�(���}�@� � _wί"�I�=<�f	����~b�p�,�Ӷ~�{Z��KG*G�iUz��(y^��8d�f����H���݃Ϥ�G合��luh6��x�1������Ꞥ?0����U���UQ��UV��.���El���!���V����!��Z�	P"̰kƾwr�_ �@N��ā1鰖�fz6���+J�WX!Ogx�p�p���6�O�#<�sZ�lNjL2����Q����
�7 R�MF�g��ח?]�ɑ~��a:ϲ�{S��n\է�*�[L{�w��E'E~M�k#6|�IgB>�q��cB�k?�]��rMB��	����_�[Ĭtp
;N�Z�M2����vf9���� %K��@[ �T{�C��`z�`q,oeċA�%���`��7�T�~��V������R�{�26�S�8���h��(B�����i_F�xh��y#Z����b9���6�=�(�=0���#ك�r6FH�hR�gwK�TW��\%Ņ)��^T#=)[���1di�c�η��x���*5�ػ� ��YW"�욥I
}�����$0
))Ǩ!	�6�����-�}AsN�)M*#����D��e!I�e�g��A0�+	X}�1�S�Vh� �;/v@�L��Rߎ�OR)�(Q.:l�^�Ų��H�IH�p�+s7�K�5A��am�I���3�#+���|���P�L�:��j���ж�F���8�w�(�cG��"=�G!㇤x$��N{x//t�A�JKq`�շC*J;��[t����r�L���>���ftb*�z�r��68��!FL}��`�\�Glϱ�pfJ#�������k���+�=�?{-fS����ч�`���)�R��&04���:�)߹�36��v��ߤ��Fr�hY��q�c�qv�t���Z�[JM)0S�̅B7�XP�����@6�9�~
��B:�N`V\Z Y�����M���?Ms)���P��x��R&Q�|���X�� �+L�;��Q
?:x��E�y����s�[��񻀅2������u�Hxf�$-{�x 'V�̧!ߊ��u��]�M��R�Ԡ�L�c��j3옊b���tP�X�Á]��J�F�T$f�R�S���I��n�V�%��i� ����@��w�Yx�[P�8�$��C����]8'��X��I]�
`D���I�&2Db�+��2(8�詧~4�~��
�YV&��n|?�/�KVCx
��25��Lr��584E�i�<4� ��q�iI��^I^����%����y8x�nF�A�N4_�z�hB��ﲯ�    ��4�}��t*����� %(=��vH<x���]��a�m�\��rUl�Ͱ�v�r�W:e[>�5qN�E�,��!#���\I��b��q��t*(�׶�6��<I�PH6�$�d��]+�B��l�bI�G����=��!Y�=0tB�����X������_4D�
��.D���r���C�%�����u΄�O�llJ��g��q�?ݛ'��0z����R�#9!>�q>9x����&������df7J���(�T)n|�p�<�%Kb����=,�gVTfs�]���x�VX��H��M�$���@�$��H	7Ȩ5�a�ٍ���#�.k���#�0p�G��rr��\g̔J�"�7�ک��v(B]'�	��+	h*FG��ه���M!;��W��"����Ƭ�a2�g��g�c���GC�Ů��^�$G�~-�1I�i'~ B��2���C�4�������,�.ee�MQ9NY�	����#��G9{��i��츌ϰ�J�����ʠ��X� }�򲐾8�@b��V���v�/&v~�9�g��gY��k0�`L��-�q���N��x����|O;a~�����R_�D������Q!1��/���g��2vy쵺����N*���nBô��BV2`9��B�v�Z[�7]㆗U�tWw�-�� 4p�v(p��u��8f�a�7W��vc�Jib$����pdJ<q$-�TYѱQ��`D���7=YU�3��t�&N�<����AI��:���t9���a7�1��/V�Xm���H��<W��V�*�l��\59N�3j�V�R`�o8�!~�{�W\���<́����>V���@[J�)���n{��7���r"�{}�W�A�G�
�l
l��8���I@��H$셐s�fE[��-�v�D:�C[��+�}�#:��Aʅaƃ�I>F�ZP���ف��R�J����y޸�0C�_��_��ySܳCJq�O!�h{�
����E)�6�5AH���⍼��d�)qHC>W��tmm�Ū���R��b���Ȁ�����[LHB͆\��mi��vͥe�Ds�t��Mh�����8gd��j���#6I��s���hBz�ii��<��[.��f�^��<qҹ*WB���"�:6"�gz\����.0yʩJ��>�5��H�Mw�;�'E��E�8-4Sf�J�{Q�#�4鋻�\1��;FuֺH��Aזx)2��9��㶝A���,Jp��ʙ��)P�Gä��iȍ�T8$���	Ћ�S� ��3e�������3�'Ϟf�9�G��� c.��Bo�A>�4�}|�as�1q�H�vLM��~o�@
�ٻ�ֱn���b�tZת�eR�f��(fȦ�2��:�5v����	F�?�OVb!Dk��~�1��v��.���
����=g�R7_�G��#���hᢉ�S����K����W/5�}���n�%D����+t(��}�@Y_l}���w^�C���W�5K2y�r�]v}O�!�����'.(�\���W���(?�>��&��w&!��W��>9�?�� ��VFdq�У4�8$W�]����ӭ�b�M�}(n��H��{���`���c���6c*񏊾����?��5"G�-�B;�YBR
f��d��'I�!ϼ���-�j�1x awR��hhdt}�hj������+eZ�U���PE������1t�FuP�l���t7��&��>��>KU���m� ��+�£W�
;v<��F�- Ϩ�Ͽ�����ۦ���	�w��rv��OCG#��@d�N�T�qt�S��79��>;�fm�c|�Sp��ѝ�H��Z���2��D����.,Zd?�	�YD���'�����ƇL�z����PΥaƋ��������+,�p	-G����({���J}I�Rm9���c�4��[`�p>T�-�oCgzQt��/�\��ަ@�`4C�Ka�Y$�n��l�k|�.j�͒�C�xL��t�ږ\6_��~�N;���Q���D�t����۴R/�w�a��gk�����oZ1�7VjS��,!,�Mx�E�ބ�c�=�R8�-��
�$��R��\*^�+�hF�Pwd�)��?�H+�=����4�cq	AҰ�����uʄ�Q�=��l��kr���`�;��h�pA�@��i7)�Ѽ4G0X��h`O��7�}��z
��	��Z�����Xͤ���%y&3ٸʅ�rqI�xz1%�5���<���p��ut=p�+���������/\k_��4-�~[&�8����̇�@�Y�>!����)Xv�E�*lA!�F���L��A�b� H�a֞ȇ��\
#L�@�p�)�ڄ�y�x���Ǆ⬚BX<�'��0�X��^p�10��+���)�V΃��w p'�������ǜ ��?Hi���IL�4ޕJ\���HV��
�A$,�1S,(P����d��pF��&Y���Um�nXŖ�JP �*ع�W��C�i���T�h�v��S�����F_Q%���������`�"XyԊ��1����FEV�9���ճB����,:R:�Ǔ;���!�,NW4��pm�tE�i6�6`c�5�1N{�
3ïD9���sҐz�
�`����wЛV���w��'���U�K����JD�jU�d�D���FQv��6�ҤC��f�.�[��d�|�M�{���$X.�y��&Wpz�@�����,c���c�EÛԳ��m�07&M�i���5�iN���k\`�Pϝ#*d�]��p"-��]G��'�t�h3S���o<���~%���s������d�� �;��{�~�����$��Z�DM����G]�%Ö^��(���mѪ1Ӳ���>�*������uxJ㞢�ṁ�A�T��N!�Fi�t]?��9T2Okh3��ʽ�^���b`bH�����x�T}#�z�1�&uNõ�[/���E�D�3	��Ԉ��5�����I��́��s�
E�Hʄh�X6���c���0���-"r�hZ�^�R��\�ʱ���JJC.FiDr��&��@�NL��j�O���~Қ�%���jI�-aq_�i��8��ǌ����#GDA���dGn���$�|�QUbi,��)<fM�o��G��O��W�xA�P��t,����W�m��Xc��49ð]1��0ʐӳ���o����P�{L�8�RVҬ1DJ�O� '?^��?��u�	�̥	r�����Y�.�xElv[�m�t��B�A;��a@x݉�ž��asG���`L^G@3Ć�B���y�c��TSo�a)�H�Oa�xB��a���X�)�����ܠL]!#vP�?=(t)�i����!VI�����o��Ό�-�ib�
�~m6��M1{a�P�D9�������_��-�����i�I�G�i0�!����Q�z���*����}&��\}ٴcۃJ��j��E�!�CI�'�`}9m�.����D�J�|����V�3?v�8hu�k�<���6���WQN1Ĳ�>�BHBs;�0h�r4t��%'���s���Y����e
���2�L�fN����|�4
&���x�(�WJs>'!�A	��T�O����@A��">TV�+�#*��|��j�G�*�.�DTӮx��/�L�1Ͼk��\w�Ŕ&�+�kP�f����'��umHt񑨘Rx��1M���i�n#��B��#,-r߅���Z���c�8�
[��N� Fg�JtYhI�3������$�t=`�U̼5r��kN�Y��-zDW�YB.�#aG����(��n�X��#�gBbߘ���=�#��%���]_�K���4�>"�-���>�a&#Mk�<��Ĕ^�wp���<��1�_��r�q�I���y��%��{HYm�t�ȮT��41�$�Ӌ��t��	ۋs��3��0��s�Hnr�MӖ���M�$br�j%�����4�eN���!1��p�4�GPw��2i�e����}	��>4_l�D�1Kf�$Krq��0    �1��&/^tX� ��Lfט|�L�(M�C�5
�p�����bli�F|���L�=�|-ِ��K�ǃ��x���S����T�
��T�ᠿ�fx����/���d4+~ T�;�D�mx��g�� dzF�
��$��O#ch�Uc�O]rď| �Ȉ��S��_t���llf?���%� M]M=����^�d~_.�uV��mq�G������@N����_-t]�ճ7e��f1Ә�BҨ���`�\ۤ��w��߾�x|�Mh�H
����~�5��.?b�ߏ��~��ċ�I4F���� �x:��9��T�^�B�:�=���6�si�ězB�@H��~V�Yk��W��F�\��R7��%��Π���i賚�sC��"�=qP�+t{����v���į6h�Sv �!XQISY���6�7�����K
}�#"/������Y���<ۨ�E�T��[ٶQ�&#��#��7r1v쫛Lν�<����D%�m��u_ܕ�����v�NaE�}�����V��
2GN}\��K� o(��_�v�W�݋=�g��S��<�E4���(���-z_NX��Sf��P�Ǭ�q��[ԋ��D�5U�%~�MG���"�I��(n����.����#��ģ)�V�d��#�k� �C}W�"�.6��J��
ҧ�ͷp��	s�Ώ��D�����Zz�Ma&iyt�:%�v��9=*<�T���"!vPMw^I$������k����*�����ggg��*uEn��4&�&�+6��p�N�/^�W��J�T/�l��dQ9�������ۆ^|e	1�d.q�oY־r��r5�;�o1�m�4!%J0�Q3��a\b;�~x��;G�f�I�&f	g�eY��QJl7J�p�8M"��,��,!�4�h����`"�`��!���N��:M�R7��`��;h|"�(VDlڨ>L��@�F@�	�[Y���0�8(�2L��`A�[Q�j$��2C����-� &�7�gI�D0�VZ?�pD�icC���G꒫p��
�M�M�<�$?�[�$p�b{���	sFp26"��UXU!nD���Va|F~�g/�3�+�̉�`��q��Q=j����n���3���<�s�("���-��̅���2�m|�|[�h�K�c�A�X2$�S��8������$�	ߝ �Y�ُ�U�=�?�r��E�{�w[d���������7��RG#�I�Gl~�����P�|O4H��&����*��&ݲ ƣ��M}��O��jp��n#M����d�{�����u�m|��b[����ݦ�}5k���X�ҏ
��\��4M!�#{Ϲ�2���P�)�z�!��,w���v�M�	�d���?�M��AQWS��D�C�4�%��
�<{�mvA�^����evJ��>�2D����m�ޡ1nG���W�Ov�p����^��y���:�lPE���+��"���5�7ddV�3�z�F���߸W&�1�K�'ޫ%F�R����?R����Ѯ�*$ynZYF�5*�О*^t��~����܄6��Z�2���ڸjw���	�j�������8�$ ^�$�w���3l�P�t2��W��i���鈦rjIT���p1m�$�����K/����w�	�N6Nӟ�pHj����+�5�y��П�u(��l�"��&��<���`���e�/�aA
`����.�=7�e
�wC��%�ɥ���7����i��J���4�U�G�o.!1ݖ����h���-�y��j��d������	kQƛcu�����'�'/�9�N���(�j+�d�,�9�~c0sz&N㯋�s��R�ci��ի��W�(��1�$z��L	O��(�? !%�8"�����b4���[��t4�pl�� S�<L�M#
���l96�>ϓb�w!�� �v�ψ�X+$M*b���LUػ`�(�6����SUH��N&B�r����%H;���}7�Ó@q��������(u�c��s*��A	+�qP�k��x9}�D���=a>�1f�Ǧ�ʁ�VJ��+� ѯPcxLañ�`_Je�G�U���C}df�'Q)�q�9r1'�]S*��>!�vw��f��g\�Y���K�Ŗ���j���9zZDgFz�����+���Ev�#Fx�\�Q/���X���!X���N�pg��M����N��](k�	�{��t�}������uZ哹`����x�ͯ��,�醍cxx��Wסb`2EZ�����W�����m.ʺ�[d}���l���VT3퇭U���`���@�0�5�j�KX�y3Q�I����A�'������o����5ϳ:ȳ�Di�?��tJ���'A�NC�rH�K6(��Ŝ8�z�Lr�+ۦ���ƳD%@��^��:�}^8��io��$S�XfI��Z<��X�ޏ'�e�,:�"|�ŝ�^nP4���K��������aE��J��!� ��ZEǣr�`b@x�3&vz_�z7�u7ԥJ�$.j��̛I%SyAῘ��E�P]��_�2���%�^��FH�bKu��ο�B�tD�-ʂf��p̎�95��3��l���ܛ��������J���L����\ҏC�Q��K�Zw�1�}I�<�W���Ԣ�<�xT��4[+= �fۙ��x4���\q%�(T���O2���X����wR�|��k\�ׯ4q���n�zWnG��^Z[�垊e�2
njm�Rl�z_`��H ���;nGѳ���?�oZ�hMTfu����Ш�� �}ob/��]�O�� _��Zݨ��.��N�6:�:���BM�ᮬ^�3��5T%t�ͦ������;�8��0���?�]���$y��١M?��*���S�:��Ԙ��D�Ȯ�TJ��(9�@qC��G@�a�$�@�r&�7MzO�����6e��#�Ț0���Y"����M7y><фXQ4ԡl``�����)�RǸ�hZ*x��/0j�G���~�TTz��|��������P��V�	s6N:�1�S�BI���Rz�?�K-��ۃ��4�3 u��ޥA݄��W�Fu�����e͑���`��	㊟�����C�
w��xN����NB���pL神}���C("D����Jm��h`}%�l�h��j����z9rx�}�8�ƶ�>�N����M�S��_��fȊB1��Ic^��	�3Pw�
D�r��)m�Fi��ҶD��ُ��`e3�fB��t���>b���f�	N�C<�I�o�#�lhB��^�1�RT��w�����d��x8�g��ڲ�\.F�wn2��͜�{��T�a�!�S$cU	f?E�ohb��VԬ� B�f��\�w�B����j|�[3}�O�k���	m�Ϋ¥d�Ũ6�O�O�΍چ�Ú����>X@VcGX���S��Z�`+��מ9V"N��Y;2Nn��O��d>�ĺ�Clnf�Ƅ�+��M��)�d�{X���0&���"�<tq�Mōj�	�'�����K�-"F���:�0+�c��&H�Z��2����5Vz>m�jJ���ӁQ�l���tZS���9�i��� �c���PJ2���"�;�\����B���|�`v20߹b��*�A 3$��s�#�7PD�D�9\����&0���J��3*�*Z:u3�p���N��L���D���|z�ͱe߲�ÖK��������lk�x�F	d_�`h����E��Q���ź};$����O�:���\��o��X���Lkuٳ�	y���b�}�AZ��	�j�ٔ"�x?kK�0��r�g��g/;�1>���xs�g�|57p���@{��Oʟ���k�@V+�m(�F��I{��d�ZYB���9����!�����].�R�=ҁ�
S5d�u�k�!�ϰi�~�(hE�q�R)kܱt�I�G򑸎��x��ُ�k��x��R�y�D��y(��f�Af(�[�*/1�h]c<8)W4��9s:Fc��@R�BƠ�ĦC�@t���|:�����>�n�ҳ8�\VcO,'��B�k �  n*D��Ôc�f����:�:�0'P���ǻ)�krأ���χz#�nu.���=b�}0��M�$q�b�������G�#�<����9�=�C�7��5���W��]j��<m�=��W!�H,���OO����%�k�tі�������u,�ΊQ$ȸ��G�L^��hg�������>M�]N���:�c9V`�v�ʠ�EQ�v��C	:��3C�DK�$����7�#��|G��>����"�jX�I)3�z{�]�l���13�`)��Ck#*Ʀ��Y ��x���OԙrA�=�9̟"Eb�Tͮ�u�͊/0����J�tņ� ���m��K�cEيIGAw b�y�ߌ�,��VH�FT-�K����+�.V����
��S7�BjF�:��R�h�1�0��p3�Il������F�l�=\EE(S�[%���	�Q\��=��g�\����xR/'0䙠��p���=�z����C�TP�����Ɉ���I��E��a�B�<�m7I8q�P�řMk��<���a���"�({q����#�au�L����f+0pQw	�:��gǏRJ��×u煏qQ���<��1��!�>=Ιg?==~~�'4e�1$��0�=�Q�=̑�olB�&�]N�	���
g�4�^�G��R<{Q&*M>/Z�.�$n��3���E����:��&<犱/6�����(�5�Z�#��)5��$=�7�],7�@�k�~����P5ﻲ�D�;�zo�����<�5����`�U�Z`���6=>D15�[��+}+�� �Fwz�xd(3W��Q���9����8t6��$a@�I(� ѓ�9_���Pd�k�L3�S�q&�S@ĳ[L���S;g���px���2l���'��5��	�'F�>oh'��:�d���������0�r��n̿�y��W_�?Fu`      �   }   x�U̱
�0����)��KSl�R�\\�椁x�$��pB����'�up�R%k3=s|0���CH��`x��u�m��&7��f�qY����h͜��%�����m�Z��ü����\k(x? �a�2      �   
  x�M��N1��~
? ��A/�����n6R�lg˾=N�GG3_ff[�a�KY�Y�r���PaO5�,�v��l�2�
E��������Y��HMx/d����4tW6�2|R)��A���Os�X�`/�z�����yZa[D���5����#I^�h�Zi�ǿ$x�>��юGt��r�.7�%k����kd��L�O�wG���TCs�%*jlc6���wX�D��m�5�˥��k&��V�u�u���W�Rꩮ�|��ٹ��      �   �   x�MOAN�0��+��h�rYĊ�ąK6��MR�	B��lYDOc������R�_�ҀJ���y��8��A=g-�M�F�Q��۬������P�ܼ��km��n�Nl�0�V)xR/	GN5�p�OZ���^���q���s�B��ɷ��E,�T#^%�\q�+L�������>s��^������jx����� O�n�      �   y   x�m�1�0Ew���;�L��R� �X�G����1��=�]���[��vt��+��n��V��=���鿰X�� ��L��m�G5C�
j-j3�=�R��%>��p�!S�q�gz���[{:�      �   ;   x�3�tL+�LN�2��t�M1��M�8�3������E��\���ɩ�y@�=... ��      �   ]  x�MQAR�0���@�C)S8�Ph/\TGm4U�⦄�#�-p�E+���[�{�!� s9�p K�<2
�C˯{At>�,��UĢC9N���Iľd3��&�W�3.ו}D���]Hd�*��V�����7M�VF?�KR5��}I��<�<cn�SIm�Û�e~�2�|TI��p�
h��4�ۡ!��N�[C�T�h��%W
"��'7�0hn���H���h��%\�c�U�����������^\o*L1��d���L5V�k1t+�i%���g��wk�t�}��d#�S�8��\�mP9۹�6�
�Y�(����s�۹��nWgo)��¥��; ��S�-      �   �   x�U��j�0D��W�,Yj�фܚP�rY',p�"˄�}W�#7����0;�0�N·� 껷W�PD���4Ё�l��U���ࡷ `��>���?7��#�GK�]���ݬ?$�/���Rˊ���`���TI[��m[��+S��9ȥ.�Ԋ�q�kD+�"��!e3�5n
���:J=��_Ra�\|���A�:�<n�e�p.�q���z��-���.s�      �   E  x�mT�r�0��+xl�?�]�$���\zA(�"T���/H��8' K�V�&��:h�Q:�۽��|��=>z���aޱ`L�9�`yg=�����)�n[A	+s?V�������{j4d��c�
�C-�0ce�
u�	�H�0�n�.�&{�ꇈҗB�b��(�v:ii� ���dͣ���l�SL�,�ͧ���2�C��-���1�$�<�4�\�D�,{˙h�(@p8}��j��L���,����1�,��~��j6���E��nt۔t_O̕��u�����B?�)|/�gV���w�E?�[^BW��?�U�	��\W��
����
1Q�
/�}˞a������CV�4�Ml�qeA����H�-˺bȼ��@g󼒦��)�?���}+9�o�ը[�HxWa��UIL��ߎDˮU�AYS{�k+��F���Tz�	8�$Z��a�줋SЇ~y���������o(�V�P.6�-�����wΏ]t���O��
jզ�^�ˋ3��������cӢd>�U�����ÊJ2�S�!գ���~P.?&��e��&�      �   �  x�URAn�0<K��+K��c�(�C�H�C�Wfl��R�"�ח�6z28��k���T,H1@i�c#^���Z<O�ϔPdi|ӉSH
(�Ӿ0h;q?_CL�xg���+���>���"M�[>&PC����Q�7�R��p#&���F<�x���3R.��j���LpL��i@&\�yB�Q<���[�T��x�S�v����	�0�w��Ζ,p-Ҷމ��������S.j��n���XnF����8��WU��w8�����?~�l8�S&�����	S^�Y��=����i�P��b�����ٶ��iE�g��ԍ��(� �	�M�3š�P= �E���;Q��\�ßs����w�Te6�ޖ
J�ӹ�T�0�q��8�:ً;�1�!�u�#� �[�8��ǿB��)�oS��     