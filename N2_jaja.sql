PGDMP  8    7            
    {           dron    16.0    16.0 %    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24576    dron    DATABASE     x   CREATE DATABASE dron WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE dron;
                postgres    false            �            1259    24577 
   asistencia    TABLE     �   CREATE TABLE public.asistencia (
    id_asistencia numeric NOT NULL,
    fecha date,
    hora character(100),
    estado character(100)
);
    DROP TABLE public.asistencia;
       public         heap    postgres    false            �            1259    24582    faltas    TABLE     �   CREATE TABLE public.faltas (
    id_falta numeric NOT NULL,
    id_tipo_falta numeric,
    fecha date NOT NULL,
    motivo character(100),
    rut_obrero character(100),
    hora character(30) NOT NULL
);
    DROP TABLE public.faltas;
       public         heap    postgres    false            �            1259    24587    kit    TABLE     V   CREATE TABLE public.kit (
    id_kit numeric NOT NULL,
    tipo_kit character(100)
);
    DROP TABLE public.kit;
       public         heap    postgres    false            �            1259    24592    login    TABLE     O   CREATE TABLE public.login (
    id_rol numeric,
    password character(100)
);
    DROP TABLE public.login;
       public         heap    postgres    false            �            1259    24597    obrero    TABLE     �   CREATE TABLE public.obrero (
    rut_obrero character(100) NOT NULL,
    nombre character(100),
    email character(100),
    id_asistencia numeric,
    tipo_kit numeric
);
    DROP TABLE public.obrero;
       public         heap    postgres    false            �            1259    24602    rol    TABLE     �   CREATE TABLE public.rol (
    id_rol numeric NOT NULL,
    rut_obreros character(100),
    rut_staff character(100),
    rol character(100)
);
    DROP TABLE public.rol;
       public         heap    postgres    false            �            1259    24607 	   ruta_dron    TABLE     �   CREATE TABLE public.ruta_dron (
    id_ruta numeric NOT NULL,
    coordenada_inicio character(100),
    coordenada_final character(100)
);
    DROP TABLE public.ruta_dron;
       public         heap    postgres    false            �            1259    24612    staff    TABLE     z   CREATE TABLE public.staff (
    rut_staff character(100) NOT NULL,
    nombre character(100),
    email character(100)
);
    DROP TABLE public.staff;
       public         heap    postgres    false            �            1259    24615    tipo_faltas    TABLE     f   CREATE TABLE public.tipo_faltas (
    id_tipo_falta numeric NOT NULL,
    tipo_falta character(20)
);
    DROP TABLE public.tipo_faltas;
       public         heap    postgres    false            �          0    24577 
   asistencia 
   TABLE DATA           H   COPY public.asistencia (id_asistencia, fecha, hora, estado) FROM stdin;
    public          postgres    false    215   T'       �          0    24582    faltas 
   TABLE DATA           Z   COPY public.faltas (id_falta, id_tipo_falta, fecha, motivo, rut_obrero, hora) FROM stdin;
    public          postgres    false    216   �'       �          0    24587    kit 
   TABLE DATA           /   COPY public.kit (id_kit, tipo_kit) FROM stdin;
    public          postgres    false    217   >(       �          0    24592    login 
   TABLE DATA           1   COPY public.login (id_rol, password) FROM stdin;
    public          postgres    false    218   �(       �          0    24597    obrero 
   TABLE DATA           T   COPY public.obrero (rut_obrero, nombre, email, id_asistencia, tipo_kit) FROM stdin;
    public          postgres    false    219   �(       �          0    24602    rol 
   TABLE DATA           B   COPY public.rol (id_rol, rut_obreros, rut_staff, rol) FROM stdin;
    public          postgres    false    220   M)       �          0    24607 	   ruta_dron 
   TABLE DATA           Q   COPY public.ruta_dron (id_ruta, coordenada_inicio, coordenada_final) FROM stdin;
    public          postgres    false    221   �)       �          0    24612    staff 
   TABLE DATA           9   COPY public.staff (rut_staff, nombre, email) FROM stdin;
    public          postgres    false    222   A*       �          0    24615    tipo_faltas 
   TABLE DATA           @   COPY public.tipo_faltas (id_tipo_falta, tipo_falta) FROM stdin;
    public          postgres    false    223   �*       :           2606    24621    asistencia Asistencia_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.asistencia
    ADD CONSTRAINT "Asistencia_pkey" PRIMARY KEY (id_asistencia);
 F   ALTER TABLE ONLY public.asistencia DROP CONSTRAINT "Asistencia_pkey";
       public            postgres    false    215            <           2606    24623    faltas Faltas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.faltas
    ADD CONSTRAINT "Faltas_pkey" PRIMARY KEY (id_falta);
 >   ALTER TABLE ONLY public.faltas DROP CONSTRAINT "Faltas_pkey";
       public            postgres    false    216            D           2606    24625    ruta_dron Ruta Dron_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.ruta_dron
    ADD CONSTRAINT "Ruta Dron_pkey" PRIMARY KEY (id_ruta);
 D   ALTER TABLE ONLY public.ruta_dron DROP CONSTRAINT "Ruta Dron_pkey";
       public            postgres    false    221            >           2606    24627    kit kit_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.kit
    ADD CONSTRAINT kit_pkey PRIMARY KEY (id_kit);
 6   ALTER TABLE ONLY public.kit DROP CONSTRAINT kit_pkey;
       public            postgres    false    217            @           2606    24629    obrero obrero_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.obrero
    ADD CONSTRAINT obrero_pkey PRIMARY KEY (rut_obrero);
 <   ALTER TABLE ONLY public.obrero DROP CONSTRAINT obrero_pkey;
       public            postgres    false    219            B           2606    24631    rol rol_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);
 6   ALTER TABLE ONLY public.rol DROP CONSTRAINT rol_pkey;
       public            postgres    false    220            F           2606    24633    staff staff_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (rut_staff);
 :   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_pkey;
       public            postgres    false    222            H           2606    24635    tipo_faltas tipo_faltas_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.tipo_faltas
    ADD CONSTRAINT tipo_faltas_pkey PRIMARY KEY (id_tipo_falta);
 F   ALTER TABLE ONLY public.tipo_faltas DROP CONSTRAINT tipo_faltas_pkey;
       public            postgres    false    223            I           2606    24636 	   faltas fk    FK CONSTRAINT        ALTER TABLE ONLY public.faltas
    ADD CONSTRAINT fk FOREIGN KEY (id_tipo_falta) REFERENCES public.tipo_faltas(id_tipo_falta);
 3   ALTER TABLE ONLY public.faltas DROP CONSTRAINT fk;
       public          postgres    false    4680    216    223            L           2606    24641 	   obrero fk    FK CONSTRAINT     k   ALTER TABLE ONLY public.obrero
    ADD CONSTRAINT fk FOREIGN KEY (tipo_kit) REFERENCES public.kit(id_kit);
 3   ALTER TABLE ONLY public.obrero DROP CONSTRAINT fk;
       public          postgres    false    4670    217    219            K           2606    24646    login fk    FK CONSTRAINT     h   ALTER TABLE ONLY public.login
    ADD CONSTRAINT fk FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol);
 2   ALTER TABLE ONLY public.login DROP CONSTRAINT fk;
       public          postgres    false    218    4674    220            M           2606    24651 
   obrero fk1    FK CONSTRAINT        ALTER TABLE ONLY public.obrero
    ADD CONSTRAINT fk1 FOREIGN KEY (id_asistencia) REFERENCES public.asistencia(id_asistencia);
 4   ALTER TABLE ONLY public.obrero DROP CONSTRAINT fk1;
       public          postgres    false    215    219    4666            J           2606    24656 
   faltas fk1    FK CONSTRAINT     u   ALTER TABLE ONLY public.faltas
    ADD CONSTRAINT fk1 FOREIGN KEY (rut_obrero) REFERENCES public.obrero(rut_obrero);
 4   ALTER TABLE ONLY public.faltas DROP CONSTRAINT fk1;
       public          postgres    false    4672    216    219            N           2606    24661    rol fk_obrero    FK CONSTRAINT     y   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT fk_obrero FOREIGN KEY (rut_obreros) REFERENCES public.obrero(rut_obrero);
 7   ALTER TABLE ONLY public.rol DROP CONSTRAINT fk_obrero;
       public          postgres    false    4672    219    220            O           2606    24666    rol fk_staff    FK CONSTRAINT     t   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT fk_staff FOREIGN KEY (rut_staff) REFERENCES public.staff(rut_staff);
 6   ALTER TABLE ONLY public.rol DROP CONSTRAINT fk_staff;
       public          postgres    false    220    4678    222            �   6   x�3�4202�54 "N+c΀���Լ�TZZ�eDwo9���W
\1z\\\ ��<      �   �   x�ݑ=
�0�g����~���F�.��`h����o!��%��z�=}<!Q��^�����P�߀��EV���y�a�6���L#�m�;�khi*Jƛǻ���3��^Ru���A7�Cx��>��l��F�[-X�s���-��Wg�y5.��      �   C   x�3�tJ,�L�W�)�2���IIL�/��5Ɯ�9��%E�ə�%�4�Ƅ�5/-3��������� Y�=�      �   %   x�3�4426Q�1�2��5���Ƅ>֘�ǚ=... t�A�      �   w   x�32�32c]#N猢����<Z� �$f�^q~I~�CbNin^~�^irj^IQb�^r�rr�C��1��"�Ԣ�ļ�|ZY �$j�^QbRb^b-ӈӘ+F��� BfA      �   �   x����1Fk{�,K� !ZX�C�S
��h��W�|�k��� 1RT|tF����4Y�:��%�'+��r�0�@A����z�K�vẊ���ə�ⳑ��������wXFN)T_�LpZn,��5�6���)�r��'B�7�A�C      �   E   x�3�4400�14�
� � �A���
.#NS�/́�%�|􋡑���&3sZ١����� �6�      �   �   x���;1D��{�X���t�p o�lPB8�~���.��F���h�Ҡs�$I�}��V	Jd9���
��wf� }$���u}*�c�<�{�4����$x�ˍbQ�x��a}��?cN%p�j�%i��Z����      �   +   x�3��I-KU@\F���)�E�)�(�Ɯ�@�E�h�c���� !��     