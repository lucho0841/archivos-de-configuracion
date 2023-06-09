PGDMP     /    )                {            postgres    15.2 (Debian 15.2-1.pgdg110+1)    15.2 )    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    5    postgres    DATABASE     s   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE postgres;
                postgres    false            ,           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3371            �            1259    16408    feeder    TABLE     �   CREATE TABLE public.feeder (
    id integer NOT NULL,
    serial text NOT NULL,
    name character varying(50) NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.feeder;
       public         heap    postgres    false            �            1259    16407    feeder_id_seq    SEQUENCE     �   CREATE SEQUENCE public.feeder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.feeder_id_seq;
       public          postgres    false    217            -           0    0    feeder_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.feeder_id_seq OWNED BY public.feeder.id;
          public          postgres    false    216            �            1259    16419    pet    TABLE     �   CREATE TABLE public.pet (
    id integer NOT NULL,
    name text NOT NULL,
    weight numeric,
    species character varying(50),
    feeder_id integer,
    user_id integer NOT NULL
);
    DROP TABLE public.pet;
       public         heap    postgres    false            �            1259    16418 
   pet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.pet_id_seq;
       public          postgres    false    219            .           0    0 
   pet_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.pet_id_seq OWNED BY public.pet.id;
          public          postgres    false    218            �            1259    16433    pet_schedule    TABLE     �   CREATE TABLE public.pet_schedule (
    id integer NOT NULL,
    "time" time without time zone NOT NULL,
    portion numeric NOT NULL,
    pet_id integer NOT NULL
);
     DROP TABLE public.pet_schedule;
       public         heap    postgres    false            �            1259    16432    pet_schedule_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pet_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pet_schedule_id_seq;
       public          postgres    false    221            /           0    0    pet_schedule_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.pet_schedule_id_seq OWNED BY public.pet_schedule.id;
          public          postgres    false    220            �            1259    24637    t_e    TABLE     +   CREATE TABLE public.t_e (
    docs text
);
    DROP TABLE public.t_e;
       public         heap    postgres    false            �            1259    16397    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    full_name text NOT NULL,
    phone_number character varying(15) NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16396    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    215            0           0    0    user_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE public.user_id_seq OWNED BY public.users.id;
          public          postgres    false    214            |           2604    16411 	   feeder id    DEFAULT     f   ALTER TABLE ONLY public.feeder ALTER COLUMN id SET DEFAULT nextval('public.feeder_id_seq'::regclass);
 8   ALTER TABLE public.feeder ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            }           2604    16422    pet id    DEFAULT     `   ALTER TABLE ONLY public.pet ALTER COLUMN id SET DEFAULT nextval('public.pet_id_seq'::regclass);
 5   ALTER TABLE public.pet ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            ~           2604    16436    pet_schedule id    DEFAULT     r   ALTER TABLE ONLY public.pet_schedule ALTER COLUMN id SET DEFAULT nextval('public.pet_schedule_id_seq'::regclass);
 >   ALTER TABLE public.pet_schedule ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            {           2604    16400    users id    DEFAULT     c   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215                       0    16408    feeder 
   TABLE DATA           ;   COPY public.feeder (id, serial, name, user_id) FROM stdin;
    public          postgres    false    217   �*       "          0    16419    pet 
   TABLE DATA           L   COPY public.pet (id, name, weight, species, feeder_id, user_id) FROM stdin;
    public          postgres    false    219   "+       $          0    16433    pet_schedule 
   TABLE DATA           C   COPY public.pet_schedule (id, "time", portion, pet_id) FROM stdin;
    public          postgres    false    221   �+       %          0    24637    t_e 
   TABLE DATA           #   COPY public.t_e (docs) FROM stdin;
    public          postgres    false    222   8,                 0    16397    users 
   TABLE DATA           M   COPY public.users (id, full_name, phone_number, email, password) FROM stdin;
    public          postgres    false    215   U,       1           0    0    feeder_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.feeder_id_seq', 9, true);
          public          postgres    false    216            2           0    0 
   pet_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.pet_id_seq', 10, true);
          public          postgres    false    218            3           0    0    pet_schedule_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.pet_schedule_id_seq', 29, true);
          public          postgres    false    220            4           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 10, true);
          public          postgres    false    214            �           2606    16406    users email 
   CONSTRAINT     G   ALTER TABLE ONLY public.users
    ADD CONSTRAINT email UNIQUE (email);
 5   ALTER TABLE ONLY public.users DROP CONSTRAINT email;
       public            postgres    false    215            �           2606    16415    feeder feeder_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.feeder
    ADD CONSTRAINT feeder_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.feeder DROP CONSTRAINT feeder_pkey;
       public            postgres    false    217            �           2606    16426    pet pet_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.pet
    ADD CONSTRAINT pet_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.pet DROP CONSTRAINT pet_pkey;
       public            postgres    false    219            �           2606    16440    pet_schedule pet_schedule_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.pet_schedule
    ADD CONSTRAINT pet_schedule_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.pet_schedule DROP CONSTRAINT pet_schedule_pkey;
       public            postgres    false    221            �           2606    16417    feeder serial 
   CONSTRAINT     J   ALTER TABLE ONLY public.feeder
    ADD CONSTRAINT serial UNIQUE (serial);
 7   ALTER TABLE ONLY public.feeder DROP CONSTRAINT serial;
       public            postgres    false    217            �           2606    16404    users user_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT user_pkey;
       public            postgres    false    215            �           2606    16427    pet feeder_id_fk    FK CONSTRAINT     r   ALTER TABLE ONLY public.pet
    ADD CONSTRAINT feeder_id_fk FOREIGN KEY (feeder_id) REFERENCES public.feeder(id);
 :   ALTER TABLE ONLY public.pet DROP CONSTRAINT feeder_id_fk;
       public          postgres    false    217    3204    219            �           2606    16441    pet_schedule pet_id_fk    FK CONSTRAINT     r   ALTER TABLE ONLY public.pet_schedule
    ADD CONSTRAINT pet_id_fk FOREIGN KEY (pet_id) REFERENCES public.pet(id);
 @   ALTER TABLE ONLY public.pet_schedule DROP CONSTRAINT pet_id_fk;
       public          postgres    false    219    3208    221            �           2606    16446    pet user_id_fk    FK CONSTRAINT     w   ALTER TABLE ONLY public.pet
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;
 8   ALTER TABLE ONLY public.pet DROP CONSTRAINT user_id_fk;
       public          postgres    false    215    3202    219            �           2606    16539    feeder user_id_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.feeder
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;
 ;   ALTER TABLE ONLY public.feeder DROP CONSTRAINT user_id_fk;
       public          postgres    false    3202    215    217                �   x�U�A
�0����S����&KQ��p���)���V���F��$�2�ڰ����bY��RГ�6k�#�#������_���\��ay������G�uNmf���x
�tvɞ;"zy�-�      "   �   x�E�A
�0D��O��$ml���B�m7	�m��7�^�T��|�gf���5��Pm؟!��s�EJ��A�:��QCQ�+"U2��T��e�~8=�?�;��b?��PY���3��l!�[L�-8#���K�f������K"�;4�      $   `   x�U���0C�f�
L�|f��s�Ti%_xz�0���Q�b�0�>#i(B�qF��@ñ$DVؘ��so-0�,�:�=_y�'Y�:�!"7`��      %      x������ � �         �  x�m�˒�@ E��W�p4�4��H�� �Ce�h#-�#�t�>��U��U���=���*
�T�4t����� �,���?�:�N�������C0�����tVwr�Q��0o#X��T��q��{�Ʌ5��*"n�x`|$/��ĺ����Ch���VƥKS}�]�"-f܎Z�U6��Y��~�ey�Y�XN��v�9��#�{L���rY~�����n�&��C�-
������n��(y��"�Z9�ʇ��7�`�U}�\t���eul"!��JjF9D�JA��q�W!����ہ��jz�r;�j��w����lw�|Ox	�H�x}���w������ܭԴ��"	>ei�~�Zt���?��z�N���*WY��W�g�9�oI����     