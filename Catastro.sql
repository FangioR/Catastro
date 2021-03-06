PGDMP     '                	    y            Catastro    13.4    13.4 +    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16659    Catastro    DATABASE     i   CREATE DATABASE "Catastro" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE "Catastro";
                postgres    false            ?           1247    16751    tipoconstruccion    TYPE     f   CREATE TYPE public.tipoconstruccion AS ENUM (
    'Industrial',
    'Comercial',
    'Residencial'
);
 #   DROP TYPE public.tipoconstruccion;
       public          postgres    false            x           1247    16690    tipoid    TYPE     O   CREATE TYPE public.tipoid AS ENUM (
    'CC',
    'CE',
    'NIT',
    'TI'
);
    DROP TYPE public.tipoid;
       public          postgres    false            ?            1259    16878    construcciones    TABLE     ?   CREATE TABLE public.construcciones (
    idconstrucciones bigint NOT NULL,
    numeropisos smallint NOT NULL,
    areaconstrucciones bigint NOT NULL,
    tipoconstruccion public.tipoconstruccion NOT NULL,
    direccionconstruccion text NOT NULL
);
 "   DROP TABLE public.construcciones;
       public         heap    postgres    false    647            ?            1259    16729    dpto    TABLE     Y   CREATE TABLE public.dpto (
    iddpto smallint NOT NULL,
    nombredpto text NOT NULL
);
    DROP TABLE public.dpto;
       public         heap    postgres    false            ?            1259    16737 	   municipio    TABLE     ?   CREATE TABLE public.municipio (
    iddptofk smallint NOT NULL,
    idmunicipio bigint NOT NULL,
    nombremunicipio text NOT NULL
);
    DROP TABLE public.municipio;
       public         heap    postgres    false            ?            1259    16699    personas    TABLE     ?   CREATE TABLE public.personas (
    tipoidentificacion public.tipoid NOT NULL,
    numeroidentificacion bigint NOT NULL,
    direccion text NOT NULL,
    telefono bigint NOT NULL,
    email text
);
    DROP TABLE public.personas;
       public         heap    postgres    false    632            ?            1259    16822    personasjudiciales    TABLE     ?   CREATE TABLE public.personasjudiciales (
    idpersonasjudiciales bigint NOT NULL,
    tipoidentificacionjudiciales public.tipoid NOT NULL,
    numeroidentificacionjudiciales bigint NOT NULL,
    razonsocial text NOT NULL
);
 &   DROP TABLE public.personasjudiciales;
       public         heap    postgres    false    632            ?            1259    16809    personasnaturales    TABLE       CREATE TABLE public.personasnaturales (
    idpersonasnaturales bigint NOT NULL,
    tipoidentificacionnaturales public.tipoid NOT NULL,
    numeroidentificacionnaturales bigint NOT NULL,
    nombrenatural text NOT NULL,
    apellidonatural text NOT NULL
);
 %   DROP TABLE public.personasnaturales;
       public         heap    postgres    false    632            ?            1259    16905    personaspredios    TABLE     ?   CREATE TABLE public.personaspredios (
    fk_tipoidentificacion public.tipoid NOT NULL,
    fk_numeroidentificacion bigint NOT NULL,
    fk_numeropredial bigint NOT NULL
);
 #   DROP TABLE public.personaspredios;
       public         heap    postgres    false    632            ?            1259    16887    predios    TABLE     ?   CREATE TABLE public.predios (
    numeropredial bigint NOT NULL,
    avaluo bigint NOT NULL,
    nombre text NOT NULL,
    dpto smallint NOT NULL,
    municipio bigint NOT NULL,
    construcciones bigint NOT NULL,
    terrenos bigint
);
    DROP TABLE public.predios;
       public         heap    postgres    false            ?            1259    16944    prediosterrenos    TABLE     ?   CREATE TABLE public.prediosterrenos (
    fk_numeropredial bigint NOT NULL,
    fk_idterrenos bigint,
    fk_idconstrucciones bigint NOT NULL
);
 #   DROP TABLE public.prediosterrenos;
       public         heap    postgres    false            ?            1259    16765    terrenos    TABLE       CREATE TABLE public.terrenos (
    idterrenos bigint NOT NULL,
    areaterrenos bigint NOT NULL,
    valorterrenos bigint NOT NULL,
    fuenteagua boolean DEFAULT false,
    tipoterrenos boolean DEFAULT false,
    construccionesterrenos boolean DEFAULT false
);
    DROP TABLE public.terrenos;
       public         heap    postgres    false            ?          0    16878    construcciones 
   TABLE DATA           ?   COPY public.construcciones (idconstrucciones, numeropisos, areaconstrucciones, tipoconstruccion, direccionconstruccion) FROM stdin;
    public          postgres    false    206   ?9       ?          0    16729    dpto 
   TABLE DATA           2   COPY public.dpto (iddpto, nombredpto) FROM stdin;
    public          postgres    false    201   :       ?          0    16737 	   municipio 
   TABLE DATA           K   COPY public.municipio (iddptofk, idmunicipio, nombremunicipio) FROM stdin;
    public          postgres    false    202   ;:       ?          0    16699    personas 
   TABLE DATA           h   COPY public.personas (tipoidentificacion, numeroidentificacion, direccion, telefono, email) FROM stdin;
    public          postgres    false    200   h:       ?          0    16822    personasjudiciales 
   TABLE DATA           ?   COPY public.personasjudiciales (idpersonasjudiciales, tipoidentificacionjudiciales, numeroidentificacionjudiciales, razonsocial) FROM stdin;
    public          postgres    false    205   ;       ?          0    16809    personasnaturales 
   TABLE DATA           ?   COPY public.personasnaturales (idpersonasnaturales, tipoidentificacionnaturales, numeroidentificacionnaturales, nombrenatural, apellidonatural) FROM stdin;
    public          postgres    false    204   );       ?          0    16905    personaspredios 
   TABLE DATA           k   COPY public.personaspredios (fk_tipoidentificacion, fk_numeroidentificacion, fk_numeropredial) FROM stdin;
    public          postgres    false    208   ?;       ?          0    16887    predios 
   TABLE DATA           k   COPY public.predios (numeropredial, avaluo, nombre, dpto, municipio, construcciones, terrenos) FROM stdin;
    public          postgres    false    207   ?;       ?          0    16944    prediosterrenos 
   TABLE DATA           _   COPY public.prediosterrenos (fk_numeropredial, fk_idterrenos, fk_idconstrucciones) FROM stdin;
    public          postgres    false    209   <       ?          0    16765    terrenos 
   TABLE DATA           }   COPY public.terrenos (idterrenos, areaterrenos, valorterrenos, fuenteagua, tipoterrenos, construccionesterrenos) FROM stdin;
    public          postgres    false    203   6<       _           2606    16885 "   construcciones construcciones_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.construcciones
    ADD CONSTRAINT construcciones_pkey PRIMARY KEY (idconstrucciones);
 L   ALTER TABLE ONLY public.construcciones DROP CONSTRAINT construcciones_pkey;
       public            postgres    false    206            W           2606    16736    dpto dpto_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.dpto
    ADD CONSTRAINT dpto_pkey PRIMARY KEY (iddpto);
 8   ALTER TABLE ONLY public.dpto DROP CONSTRAINT dpto_pkey;
       public            postgres    false    201            Y           2606    16744    municipio municipio_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (idmunicipio);
 B   ALTER TABLE ONLY public.municipio DROP CONSTRAINT municipio_pkey;
       public            postgres    false    202            U           2606    16706    personas personas_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (tipoidentificacion, numeroidentificacion);
 @   ALTER TABLE ONLY public.personas DROP CONSTRAINT personas_pkey;
       public            postgres    false    200    200            ]           2606    16816 (   personasnaturales personasnaturales_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.personasnaturales
    ADD CONSTRAINT personasnaturales_pkey PRIMARY KEY (idpersonasnaturales);
 R   ALTER TABLE ONLY public.personasnaturales DROP CONSTRAINT personasnaturales_pkey;
       public            postgres    false    204            a           2606    16894    predios predios_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.predios
    ADD CONSTRAINT predios_pkey PRIMARY KEY (numeropredial);
 >   ALTER TABLE ONLY public.predios DROP CONSTRAINT predios_pkey;
       public            postgres    false    207            [           2606    16772    terrenos terrenos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.terrenos
    ADD CONSTRAINT terrenos_pkey PRIMARY KEY (idterrenos);
 @   ALTER TABLE ONLY public.terrenos DROP CONSTRAINT terrenos_pkey;
       public            postgres    false    203            b           2606    16745 !   municipio municipio_iddptofk_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT municipio_iddptofk_fkey FOREIGN KEY (iddptofk) REFERENCES public.dpto(iddpto);
 K   ALTER TABLE ONLY public.municipio DROP CONSTRAINT municipio_iddptofk_fkey;
       public          postgres    false    201    202    2903            d           2606    16828 R   personasjudiciales personasjudiciales_tipoidentificacionjudiciales_numeroiden_fkey    FK CONSTRAINT       ALTER TABLE ONLY public.personasjudiciales
    ADD CONSTRAINT personasjudiciales_tipoidentificacionjudiciales_numeroiden_fkey FOREIGN KEY (tipoidentificacionjudiciales, numeroidentificacionjudiciales) REFERENCES public.personas(tipoidentificacion, numeroidentificacion);
 |   ALTER TABLE ONLY public.personasjudiciales DROP CONSTRAINT personasjudiciales_tipoidentificacionjudiciales_numeroiden_fkey;
       public          postgres    false    200    205    2901    205    200            c           2606    16817 Q   personasnaturales personasnaturales_tipoidentificacionnaturales_numeroidenti_fkey    FK CONSTRAINT       ALTER TABLE ONLY public.personasnaturales
    ADD CONSTRAINT personasnaturales_tipoidentificacionnaturales_numeroidenti_fkey FOREIGN KEY (tipoidentificacionnaturales, numeroidentificacionnaturales) REFERENCES public.personas(tipoidentificacion, numeroidentificacion);
 {   ALTER TABLE ONLY public.personasnaturales DROP CONSTRAINT personasnaturales_tipoidentificacionnaturales_numeroidenti_fkey;
       public          postgres    false    200    2901    204    200    204            h           2606    16913 5   personaspredios personaspredios_fk_numeropredial_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.personaspredios
    ADD CONSTRAINT personaspredios_fk_numeropredial_fkey FOREIGN KEY (fk_numeropredial) REFERENCES public.predios(numeropredial);
 _   ALTER TABLE ONLY public.personaspredios DROP CONSTRAINT personaspredios_fk_numeropredial_fkey;
       public          postgres    false    208    2913    207            g           2606    16908 O   personaspredios personaspredios_fk_tipoidentificacion_fk_numeroidentificac_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.personaspredios
    ADD CONSTRAINT personaspredios_fk_tipoidentificacion_fk_numeroidentificac_fkey FOREIGN KEY (fk_tipoidentificacion, fk_numeroidentificacion) REFERENCES public.personas(tipoidentificacion, numeroidentificacion);
 y   ALTER TABLE ONLY public.personaspredios DROP CONSTRAINT personaspredios_fk_tipoidentificacion_fk_numeroidentificac_fkey;
       public          postgres    false    208    208    200    200    2901            e           2606    16895    predios predios_dpto_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.predios
    ADD CONSTRAINT predios_dpto_fkey FOREIGN KEY (dpto) REFERENCES public.dpto(iddpto);
 C   ALTER TABLE ONLY public.predios DROP CONSTRAINT predios_dpto_fkey;
       public          postgres    false    201    207    2903            f           2606    16900    predios predios_municipio_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.predios
    ADD CONSTRAINT predios_municipio_fkey FOREIGN KEY (municipio) REFERENCES public.municipio(idmunicipio);
 H   ALTER TABLE ONLY public.predios DROP CONSTRAINT predios_municipio_fkey;
       public          postgres    false    2905    207    202            k           2606    16957 8   prediosterrenos prediosterrenos_fk_idconstrucciones_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.prediosterrenos
    ADD CONSTRAINT prediosterrenos_fk_idconstrucciones_fkey FOREIGN KEY (fk_idconstrucciones) REFERENCES public.construcciones(idconstrucciones);
 b   ALTER TABLE ONLY public.prediosterrenos DROP CONSTRAINT prediosterrenos_fk_idconstrucciones_fkey;
       public          postgres    false    209    2911    206            j           2606    16952 2   prediosterrenos prediosterrenos_fk_idterrenos_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.prediosterrenos
    ADD CONSTRAINT prediosterrenos_fk_idterrenos_fkey FOREIGN KEY (fk_idterrenos) REFERENCES public.terrenos(idterrenos);
 \   ALTER TABLE ONLY public.prediosterrenos DROP CONSTRAINT prediosterrenos_fk_idterrenos_fkey;
       public          postgres    false    209    2907    203            i           2606    16947 5   prediosterrenos prediosterrenos_fk_numeropredial_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.prediosterrenos
    ADD CONSTRAINT prediosterrenos_fk_numeropredial_fkey FOREIGN KEY (fk_numeropredial) REFERENCES public.predios(numeropredial);
 _   ALTER TABLE ONLY public.prediosterrenos DROP CONSTRAINT prediosterrenos_fk_numeropredial_fkey;
       public          postgres    false    2913    209    207            ?      x?????? ? ?      ?       x?37?K??IUHI?QpN,MN?????? W?o      ?      x?37?47??4?)?)=??+F??? 9?N      ?   ?   x????0D?ۯh??nmo?Ɠ?_??6DQJc?????\&?3 )?v?:`?ϣ$dy??T?@Qӵ?9ca?fp֔A?-K<???
??h?J? AH9??~???SR?ك?p]??i?R]??T?t?#?}??R^?????4?P!?35*?      ?      x?????? ? ?      ?   [   x?3?tv?4426153??????M*JU?K,)-J??t,H???Lɇ	p??[Z????rz??*??fs??$V&*?'?'%q??qqq ?'?      ?   *   x?sv?4426153???46?4?072??015?4?????? tLH      ?   ;   x?36?4?072??015?4?46 N???T?Ē?⒢|Ns3 ??4?4?4?????? ^,?      ?      x?????? ? ?      ?      x?????? ? ?     