--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: delivery; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA delivery;


ALTER SCHEMA delivery OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cargos; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE delivery.cargos (
    id_cargo integer NOT NULL,
    nome character varying(20) NOT NULL,
    descricao character varying(50) NOT NULL
);


ALTER TABLE delivery.cargos OWNER TO postgres;

--
-- Name: cargos_id_cargo_seq; Type: SEQUENCE; Schema: delivery; Owner: postgres
--

CREATE SEQUENCE delivery.cargos_id_cargo_seq
    AS integer
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery.cargos_id_cargo_seq OWNER TO postgres;

--
-- Name: cargos_id_cargo_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE delivery.cargos_id_cargo_seq OWNED BY delivery.cargos.id_cargo;


--
-- Name: cidade; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE delivery.cidade (
    id_cidade integer NOT NULL,
    id_estado integer NOT NULL,
    nome character varying(20) NOT NULL
);


ALTER TABLE delivery.cidade OWNER TO postgres;

--
-- Name: cidade_id_cidade_seq; Type: SEQUENCE; Schema: delivery; Owner: postgres
--

CREATE SEQUENCE delivery.cidade_id_cidade_seq
    AS integer
    START WITH 34
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery.cidade_id_cidade_seq OWNER TO postgres;

--
-- Name: cidade_id_cidade_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE delivery.cidade_id_cidade_seq OWNED BY delivery.cidade.id_cidade;


--
-- Name: cliente; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE delivery.cliente (
    id_cliente integer NOT NULL,
    nome character varying(30) NOT NULL,
    telefone integer,
    endereco character varying(50),
    id_cidade integer NOT NULL
);


ALTER TABLE delivery.cliente OWNER TO postgres;

--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE; Schema: delivery; Owner: postgres
--

CREATE SEQUENCE delivery.cliente_id_cliente_seq
    AS integer
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery.cliente_id_cliente_seq OWNER TO postgres;

--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE delivery.cliente_id_cliente_seq OWNED BY delivery.cliente.id_cliente;


--
-- Name: distribuidor; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE delivery.distribuidor (
    id_distribuidor integer NOT NULL,
    nome character varying(30) NOT NULL,
    id_cidade integer NOT NULL
);


ALTER TABLE delivery.distribuidor OWNER TO postgres;

--
-- Name: distribuidor_id_distribuidor_seq; Type: SEQUENCE; Schema: delivery; Owner: postgres
--

CREATE SEQUENCE delivery.distribuidor_id_distribuidor_seq
    AS integer
    START WITH 31
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery.distribuidor_id_distribuidor_seq OWNER TO postgres;

--
-- Name: distribuidor_id_distribuidor_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE delivery.distribuidor_id_distribuidor_seq OWNED BY delivery.distribuidor.id_distribuidor;


--
-- Name: estado; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE delivery.estado (
    id_estado integer NOT NULL,
    nome character varying(20) NOT NULL,
    sigla character varying(2)
);


ALTER TABLE delivery.estado OWNER TO postgres;

--
-- Name: estado_id_estado_seq; Type: SEQUENCE; Schema: delivery; Owner: postgres
--

CREATE SEQUENCE delivery.estado_id_estado_seq
    AS integer
    START WITH 28
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery.estado_id_estado_seq OWNER TO postgres;

--
-- Name: estado_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE delivery.estado_id_estado_seq OWNED BY delivery.estado.id_estado;


--
-- Name: estoque_ingred; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE delivery.estoque_ingred (
    id_item integer NOT NULL,
    nome character varying(20) NOT NULL,
    descricao character varying(50),
    quantidade integer
);


ALTER TABLE delivery.estoque_ingred OWNER TO postgres;

--
-- Name: estoque_ingred_id_item_seq; Type: SEQUENCE; Schema: delivery; Owner: postgres
--

CREATE SEQUENCE delivery.estoque_ingred_id_item_seq
    AS integer
    START WITH 45
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery.estoque_ingred_id_item_seq OWNER TO postgres;

--
-- Name: estoque_ingred_id_item_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE delivery.estoque_ingred_id_item_seq OWNED BY delivery.estoque_ingred.id_item;


--
-- Name: filial; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE delivery.filial (
    id_filial integer NOT NULL,
    nome character varying(30) NOT NULL,
    id_cidade integer NOT NULL
);


ALTER TABLE delivery.filial OWNER TO postgres;

--
-- Name: filial_id_filial_seq; Type: SEQUENCE; Schema: delivery; Owner: postgres
--

CREATE SEQUENCE delivery.filial_id_filial_seq
    AS integer
    START WITH 28
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery.filial_id_filial_seq OWNER TO postgres;

--
-- Name: filial_id_filial_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE delivery.filial_id_filial_seq OWNED BY delivery.filial.id_filial;


--
-- Name: funcionario; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE delivery.funcionario (
    id_func integer NOT NULL,
    id_filial integer NOT NULL,
    id_cargo integer NOT NULL,
    nome character varying(20) NOT NULL
);


ALTER TABLE delivery.funcionario OWNER TO postgres;

--
-- Name: funcionario_id_func_seq; Type: SEQUENCE; Schema: delivery; Owner: postgres
--

CREATE SEQUENCE delivery.funcionario_id_func_seq
    AS integer
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery.funcionario_id_func_seq OWNER TO postgres;

--
-- Name: funcionario_id_func_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE delivery.funcionario_id_func_seq OWNED BY delivery.funcionario.id_func;


--
-- Name: itens_pedido; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE delivery.itens_pedido (
    id_pedido integer NOT NULL,
    id_tamanho integer NOT NULL,
    id_sabor integer NOT NULL,
    quantidade integer NOT NULL,
    observacao character varying(50)
);


ALTER TABLE delivery.itens_pedido OWNER TO postgres;

--
-- Name: nota_compras; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE delivery.nota_compras (
    id_compra integer NOT NULL,
    id_item integer NOT NULL,
    id_func integer NOT NULL,
    id_dist integer NOT NULL,
    data_compra date NOT NULL,
    descricao character varying(50)
);


ALTER TABLE delivery.nota_compras OWNER TO postgres;

--
-- Name: nota_compras_id_compra_seq; Type: SEQUENCE; Schema: delivery; Owner: postgres
--

CREATE SEQUENCE delivery.nota_compras_id_compra_seq
    AS integer
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery.nota_compras_id_compra_seq OWNER TO postgres;

--
-- Name: nota_compras_id_compra_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE delivery.nota_compras_id_compra_seq OWNED BY delivery.nota_compras.id_compra;


--
-- Name: nota_pedidos; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE delivery.nota_pedidos (
    id_pedido integer NOT NULL,
    id_func integer NOT NULL,
    id_cliente integer NOT NULL,
    observacao character varying(50),
    data_pedido date,
    situacao character(1)
);


ALTER TABLE delivery.nota_pedidos OWNER TO postgres;

--
-- Name: nota_pedidos_id_pedido_seq; Type: SEQUENCE; Schema: delivery; Owner: postgres
--

CREATE SEQUENCE delivery.nota_pedidos_id_pedido_seq
    AS integer
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery.nota_pedidos_id_pedido_seq OWNER TO postgres;

--
-- Name: nota_pedidos_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE delivery.nota_pedidos_id_pedido_seq OWNED BY delivery.nota_pedidos.id_pedido;


--
-- Name: sabor_pizza; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE delivery.sabor_pizza (
    id_sabor integer NOT NULL,
    nome character varying(30) NOT NULL
);


ALTER TABLE delivery.sabor_pizza OWNER TO postgres;

--
-- Name: sabor_pizza_id_sabor_seq; Type: SEQUENCE; Schema: delivery; Owner: postgres
--

CREATE SEQUENCE delivery.sabor_pizza_id_sabor_seq
    AS integer
    START WITH 46
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery.sabor_pizza_id_sabor_seq OWNER TO postgres;

--
-- Name: sabor_pizza_id_sabor_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE delivery.sabor_pizza_id_sabor_seq OWNED BY delivery.sabor_pizza.id_sabor;


--
-- Name: situacao_pedido; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE delivery.situacao_pedido (
    id_situacao character(1) NOT NULL,
    descricao character varying(20)
);


ALTER TABLE delivery.situacao_pedido OWNER TO postgres;

--
-- Name: tamanho_pizza; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE delivery.tamanho_pizza (
    id_tamanho integer NOT NULL,
    nome character varying(20) NOT NULL,
    tamanho character varying(30) NOT NULL,
    preco integer NOT NULL
);


ALTER TABLE delivery.tamanho_pizza OWNER TO postgres;

--
-- Name: tamanho_pizza_id_tamanho_seq; Type: SEQUENCE; Schema: delivery; Owner: postgres
--

CREATE SEQUENCE delivery.tamanho_pizza_id_tamanho_seq
    AS integer
    START WITH 7
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery.tamanho_pizza_id_tamanho_seq OWNER TO postgres;

--
-- Name: tamanho_pizza_id_tamanho_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE delivery.tamanho_pizza_id_tamanho_seq OWNED BY delivery.tamanho_pizza.id_tamanho;


--
-- Name: cargos id_cargo; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.cargos ALTER COLUMN id_cargo SET DEFAULT nextval('delivery.cargos_id_cargo_seq'::regclass);


--
-- Name: cidade id_cidade; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.cidade ALTER COLUMN id_cidade SET DEFAULT nextval('delivery.cidade_id_cidade_seq'::regclass);


--
-- Name: cliente id_cliente; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('delivery.cliente_id_cliente_seq'::regclass);


--
-- Name: distribuidor id_distribuidor; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.distribuidor ALTER COLUMN id_distribuidor SET DEFAULT nextval('delivery.distribuidor_id_distribuidor_seq'::regclass);


--
-- Name: estado id_estado; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.estado ALTER COLUMN id_estado SET DEFAULT nextval('delivery.estado_id_estado_seq'::regclass);


--
-- Name: estoque_ingred id_item; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.estoque_ingred ALTER COLUMN id_item SET DEFAULT nextval('delivery.estoque_ingred_id_item_seq'::regclass);


--
-- Name: filial id_filial; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.filial ALTER COLUMN id_filial SET DEFAULT nextval('delivery.filial_id_filial_seq'::regclass);


--
-- Name: funcionario id_func; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.funcionario ALTER COLUMN id_func SET DEFAULT nextval('delivery.funcionario_id_func_seq'::regclass);


--
-- Name: nota_compras id_compra; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.nota_compras ALTER COLUMN id_compra SET DEFAULT nextval('delivery.nota_compras_id_compra_seq'::regclass);


--
-- Name: nota_pedidos id_pedido; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.nota_pedidos ALTER COLUMN id_pedido SET DEFAULT nextval('delivery.nota_pedidos_id_pedido_seq'::regclass);


--
-- Name: sabor_pizza id_sabor; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.sabor_pizza ALTER COLUMN id_sabor SET DEFAULT nextval('delivery.sabor_pizza_id_sabor_seq'::regclass);


--
-- Name: tamanho_pizza id_tamanho; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.tamanho_pizza ALTER COLUMN id_tamanho SET DEFAULT nextval('delivery.tamanho_pizza_id_tamanho_seq'::regclass);


--
-- Data for Name: cargos; Type: TABLE DATA; Schema: delivery; Owner: postgres
--

INSERT INTO delivery.cargos VALUES (1, 'Gerente', 'Realiza a gerência');
INSERT INTO delivery.cargos VALUES (2, 'Caixa', 'Cuida do dinheiro');
INSERT INTO delivery.cargos VALUES (3, 'Faxineiro', 'Faz a limpeza do ambiente');
INSERT INTO delivery.cargos VALUES (4, 'Motoboy', 'Realiza a entrega do pedido');
INSERT INTO delivery.cargos VALUES (5, 'Chapeiro', 'Cuida da chapa das carnes');
INSERT INTO delivery.cargos VALUES (6, 'Chefe de cozinha', 'Delega as funções dos cozinheiros');
INSERT INTO delivery.cargos VALUES (7, 'Estagiário', 'Aprendiz da designada função');


--
-- Data for Name: cidade; Type: TABLE DATA; Schema: delivery; Owner: postgres
--

INSERT INTO delivery.cidade VALUES (1, 21, 'Lajeado');
INSERT INTO delivery.cidade VALUES (2, 21, 'Encantado');
INSERT INTO delivery.cidade VALUES (3, 21, 'Santa Clara do Sul');
INSERT INTO delivery.cidade VALUES (4, 21, 'Estrela');
INSERT INTO delivery.cidade VALUES (5, 21, 'Porto Alegre');
INSERT INTO delivery.cidade VALUES (6, 21, 'Teutônia');
INSERT INTO delivery.cidade VALUES (7, 21, 'Arroio do Meio');
INSERT INTO delivery.cidade VALUES (8, 21, 'Candelária');
INSERT INTO delivery.cidade VALUES (9, 21, 'Roca Sales');
INSERT INTO delivery.cidade VALUES (10, 21, 'Gramado');
INSERT INTO delivery.cidade VALUES (11, 21, 'Canela');
INSERT INTO delivery.cidade VALUES (12, 21, 'Xangri-lá');
INSERT INTO delivery.cidade VALUES (13, 25, 'São Paulo');
INSERT INTO delivery.cidade VALUES (14, 25, 'Osasco');
INSERT INTO delivery.cidade VALUES (15, 25, 'Guarulhos');
INSERT INTO delivery.cidade VALUES (16, 25, 'Barueri');
INSERT INTO delivery.cidade VALUES (17, 25, 'Cotia');
INSERT INTO delivery.cidade VALUES (18, 25, 'São Roque');
INSERT INTO delivery.cidade VALUES (19, 25, 'Itaquaquecetuba');
INSERT INTO delivery.cidade VALUES (20, 25, 'Mogi das Cruzes');
INSERT INTO delivery.cidade VALUES (21, 19, 'Rio de Janeiro');
INSERT INTO delivery.cidade VALUES (22, 19, 'Niterói');
INSERT INTO delivery.cidade VALUES (23, 19, 'Duque de Caxias');
INSERT INTO delivery.cidade VALUES (24, 19, 'Nova Iguaçu');
INSERT INTO delivery.cidade VALUES (25, 19, 'Itaguaí');
INSERT INTO delivery.cidade VALUES (26, 19, 'São Gonçalo');
INSERT INTO delivery.cidade VALUES (28, 16, 'Curitiba');
INSERT INTO delivery.cidade VALUES (27, 19, 'Santa Cruz');
INSERT INTO delivery.cidade VALUES (30, 16, 'Londrina');
INSERT INTO delivery.cidade VALUES (29, 16, 'Maringá');
INSERT INTO delivery.cidade VALUES (31, 16, 'Cascavel');
INSERT INTO delivery.cidade VALUES (32, 16, 'Chapecó');
INSERT INTO delivery.cidade VALUES (33, 16, 'Xaxim');


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: delivery; Owner: postgres
--

INSERT INTO delivery.cliente VALUES (1, 'Jonas Q. Mann', 940082457, '595-9496 Magnis Av.', 17);
INSERT INTO delivery.cliente VALUES (2, 'Carl Gill', 906754187, 'P.O. Box 628, 8255 Accumsan Rd.', 25);
INSERT INTO delivery.cliente VALUES (3, 'Yen Mcknight', 951065996, 'Ap #131-1486 Massa. St.', 10);
INSERT INTO delivery.cliente VALUES (4, 'Orla D. Cobb', 955098687, '6895 Egestas St.', 15);
INSERT INTO delivery.cliente VALUES (5, 'Odessa A. Short', 985241752, 'Ap #633-4441 Ligula Rd.', 9);
INSERT INTO delivery.cliente VALUES (6, 'Zeph Shepard', 983703525, '853-6362 Lacus, St.', 7);
INSERT INTO delivery.cliente VALUES (7, 'Doris Norman', 970755934, 'Ap #819-8130 A St.', 11);
INSERT INTO delivery.cliente VALUES (8, 'Myra Z. Mason', 906910779, '246-8278 Amet St.', 32);
INSERT INTO delivery.cliente VALUES (9, 'Callum Blanchard', 927755674, 'P.O. Box 167, 3281 Maecenas Ave', 18);
INSERT INTO delivery.cliente VALUES (10, 'Baxter Mckinney', 972181462, '3360 Proin St.', 2);
INSERT INTO delivery.cliente VALUES (11, 'Felix Barrett', 923598919, 'Ap #212-5515 Amet St.', 14);
INSERT INTO delivery.cliente VALUES (12, 'Judah Bentley', 927375048, '800-5725 Augue, Street', 28);
INSERT INTO delivery.cliente VALUES (13, 'Hannah B. Phelps', 960692067, 'Ap #855-8010 Dolor. St.', 25);
INSERT INTO delivery.cliente VALUES (14, 'Kaden Singleton', 979756084, 'P.O. Box 427, 6172 Nunc. St.', 21);
INSERT INTO delivery.cliente VALUES (15, 'Clinton Yates', 934922261, 'P.O. Box 853, 3783 Diam. Road', 2);
INSERT INTO delivery.cliente VALUES (16, 'Upton Sykes', 949917597, 'P.O. Box 403, 714 Elit. Av.', 10);
INSERT INTO delivery.cliente VALUES (17, 'Bevis Cooke', 931108159, '7181 Hendrerit Rd.', 22);
INSERT INTO delivery.cliente VALUES (18, 'Melanie Barber', 934134548, 'P.O. Box 821, 7695 Arcu. Av.', 8);
INSERT INTO delivery.cliente VALUES (19, 'Joel Spencer', 945312740, 'P.O. Box 662, 8020 Dapibus Rd.', 3);
INSERT INTO delivery.cliente VALUES (20, 'Sawyer D. Bender', 923267514, 'Ap #293-2455 Non, Rd.', 16);
INSERT INTO delivery.cliente VALUES (21, 'Blythe Clarke', 989780432, 'P.O. Box 482, 8937 Mus. St.', 29);
INSERT INTO delivery.cliente VALUES (22, 'Basil T. Frye', 999186225, '648-5040 Vel Rd.', 7);
INSERT INTO delivery.cliente VALUES (23, 'Haviva Navarro', 910163368, '602-1369 Rhoncus. Rd.', 2);
INSERT INTO delivery.cliente VALUES (24, 'Janna G. Estes', 989460325, 'Ap #376-3755 Nec, Ave', 1);
INSERT INTO delivery.cliente VALUES (25, 'Dacey F. Hutchinson', 915710417, '901-110 In Rd.', 6);
INSERT INTO delivery.cliente VALUES (26, 'Isaiah U. Knapp', 927515423, 'P.O. Box 525, 456 Nec Rd.', 33);
INSERT INTO delivery.cliente VALUES (27, 'Phelan K. Owen', 915102193, '672-7761 Curabitur Av.', 26);
INSERT INTO delivery.cliente VALUES (28, 'Kennan X. Waller', 946419506, '604-8359 Vel, Rd.', 11);
INSERT INTO delivery.cliente VALUES (29, 'George Richmond', 940381487, 'P.O. Box 522, 3546 Aenean Rd.', 27);
INSERT INTO delivery.cliente VALUES (30, 'Hammett U. Horn', 913075706, 'P.O. Box 788, 4547 Donec St.', 17);
INSERT INTO delivery.cliente VALUES (31, 'Camilla Marshall', 947194646, 'Ap #899-5373 Duis Ave', 18);
INSERT INTO delivery.cliente VALUES (32, 'Jamal D. Doyle', 973165035, '173-8809 Auctor, Road', 17);
INSERT INTO delivery.cliente VALUES (33, 'Calista Walters', 954633706, 'P.O. Box 175, 3797 Odio Road', 3);
INSERT INTO delivery.cliente VALUES (34, 'Selma V. Kinney', 931248799, 'P.O. Box 349, 5339 Quis Rd.', 29);
INSERT INTO delivery.cliente VALUES (35, 'Germaine J. Garcia', 905209560, 'Ap #542-2665 Cras St.', 29);
INSERT INTO delivery.cliente VALUES (36, 'Sopoline Tyler', 977867976, 'Ap #763-2907 Mollis Ave', 5);
INSERT INTO delivery.cliente VALUES (37, 'Brent Dillard', 918806650, '5854 Proin St.', 23);
INSERT INTO delivery.cliente VALUES (38, 'Venus Q. Fitzpatrick', 956417207, '210-2358 Natoque Street', 18);
INSERT INTO delivery.cliente VALUES (39, 'Shoshana Finley', 977757373, 'P.O. Box 742, 9879 Vestibulum Rd.', 6);
INSERT INTO delivery.cliente VALUES (40, 'Upton Wolfe', 992311297, 'Ap #553-5458 Nisi Avenue', 23);
INSERT INTO delivery.cliente VALUES (41, 'TaShya Crosby', 972595810, 'Ap #343-9872 Faucibus St.', 3);
INSERT INTO delivery.cliente VALUES (42, 'Adara N. Frank', 953844467, 'P.O. Box 773, 5423 Orci, St.', 22);
INSERT INTO delivery.cliente VALUES (43, 'Shafira Gordon', 935070840, 'P.O. Box 774, 677 Sed St.', 20);
INSERT INTO delivery.cliente VALUES (44, 'Rashad Prince', 952777889, '450-9678 Cursus Rd.', 1);
INSERT INTO delivery.cliente VALUES (45, 'Zenaida Chen', 912788285, 'Ap #213-8235 Dignissim Ave', 1);
INSERT INTO delivery.cliente VALUES (46, 'Aspen V. Townsend', 951497655, '2879 Erat Rd.', 17);
INSERT INTO delivery.cliente VALUES (47, 'Sydnee Z. Welch', 959069698, 'Ap #700-6917 Sodales St.', 10);
INSERT INTO delivery.cliente VALUES (48, 'Lila Spears', 999251189, 'P.O. Box 450, 9437 Rutrum Rd.', 6);
INSERT INTO delivery.cliente VALUES (49, 'Lucius Tyson', 912737033, '4448 Morbi Avenue', 12);
INSERT INTO delivery.cliente VALUES (50, 'Aspen S. Cohen', 951046279, 'Ap #425-3578 Praesent Rd.', 31);
INSERT INTO delivery.cliente VALUES (51, 'Ciaran H. Good', 946558418, 'Ap #923-4317 Ac St.', 11);
INSERT INTO delivery.cliente VALUES (52, 'Bo Goff', 984677610, 'Ap #534-1864 Enim, Ave', 17);
INSERT INTO delivery.cliente VALUES (53, 'Robert G. Johns', 940780723, 'Ap #370-6725 Leo, St.', 16);
INSERT INTO delivery.cliente VALUES (54, 'Jonah Merrill', 901653520, '3565 Lacus. St.', 32);
INSERT INTO delivery.cliente VALUES (55, 'Kitra Peters', 969693926, '696-6194 Consequat, Avenue', 31);
INSERT INTO delivery.cliente VALUES (56, 'Jelani W. Short', 976869816, 'Ap #357-4852 In St.', 22);
INSERT INTO delivery.cliente VALUES (57, 'Candace V. Valenzuela', 901048008, 'Ap #911-7145 Et Av.', 31);
INSERT INTO delivery.cliente VALUES (58, 'Bryar Dodson', 981447619, '802-8259 Accumsan Av.', 20);
INSERT INTO delivery.cliente VALUES (59, 'Michelle Hamilton', 961096417, 'P.O. Box 189, 6271 Euismod Rd.', 12);
INSERT INTO delivery.cliente VALUES (60, 'Lunea Case', 941883226, '304-4010 Sed St.', 4);
INSERT INTO delivery.cliente VALUES (61, 'Laith Mcdaniel', 953549616, '6738 Ut Rd.', 14);
INSERT INTO delivery.cliente VALUES (62, 'Kim Grimes', 992394045, 'P.O. Box 293, 5441 Velit Street', 1);
INSERT INTO delivery.cliente VALUES (63, 'Acton T. James', 966876410, 'P.O. Box 857, 1754 Tincidunt Ave', 9);
INSERT INTO delivery.cliente VALUES (64, 'Sharon Conley', 915617315, '9482 Ut St.', 9);
INSERT INTO delivery.cliente VALUES (65, 'Naida I. Roy', 909438956, 'P.O. Box 778, 3388 Id Rd.', 7);
INSERT INTO delivery.cliente VALUES (66, 'Hannah I. Ingram', 990501291, 'Ap #804-7022 Cursus. Ave', 24);
INSERT INTO delivery.cliente VALUES (67, 'Dennis C. Davidson', 924608622, 'P.O. Box 290, 1478 Sapien Rd.', 7);
INSERT INTO delivery.cliente VALUES (68, 'Reuben Duffy', 964877550, 'P.O. Box 619, 5258 Montes, Av.', 16);
INSERT INTO delivery.cliente VALUES (69, 'Whoopi G. Sexton', 975375840, '702-4705 Tempor St.', 1);
INSERT INTO delivery.cliente VALUES (70, 'Jamal L. Goodwin', 919249210, '356-2679 Mauris Av.', 29);
INSERT INTO delivery.cliente VALUES (71, 'Kennan Kidd', 974302792, 'P.O. Box 288, 3268 Varius Rd.', 30);
INSERT INTO delivery.cliente VALUES (72, 'Armando G. Gamble', 901074816, 'Ap #170-2350 Porttitor St.', 15);
INSERT INTO delivery.cliente VALUES (73, 'Fallon Y. Langley', 908646743, 'P.O. Box 134, 4526 At Rd.', 13);
INSERT INTO delivery.cliente VALUES (74, 'Kasper Rivas', 952407662, 'Ap #245-4189 In Avenue', 28);
INSERT INTO delivery.cliente VALUES (75, 'Tatiana Morgan', 936654379, '7618 Vel, St.', 2);
INSERT INTO delivery.cliente VALUES (76, 'Ivor Patel', 905211218, 'P.O. Box 255, 1984 Urna Avenue', 22);
INSERT INTO delivery.cliente VALUES (77, 'Grace L. Thomas', 954265290, 'P.O. Box 789, 1258 Lorem St.', 15);
INSERT INTO delivery.cliente VALUES (78, 'Kirsten Powers', 971488409, '3954 Diam Road', 18);
INSERT INTO delivery.cliente VALUES (79, 'Isabelle Bullock', 935780711, 'Ap #783-401 Diam Ave', 9);
INSERT INTO delivery.cliente VALUES (80, 'Zephr L. Shaw', 953237686, '779-1614 Egestas. St.', 7);
INSERT INTO delivery.cliente VALUES (81, 'Rhonda Avila', 915993458, 'Ap #836-507 Ante, Road', 4);
INSERT INTO delivery.cliente VALUES (82, 'Hammett M. Clark', 997064668, '360-9873 Magna Rd.', 16);
INSERT INTO delivery.cliente VALUES (83, 'Channing Willis', 933421949, 'P.O. Box 761, 8901 In, Rd.', 23);
INSERT INTO delivery.cliente VALUES (84, 'Dennis P. Sawyer', 913757255, '502 Quisque Rd.', 5);
INSERT INTO delivery.cliente VALUES (85, 'Ronan Gordon', 979510758, 'P.O. Box 853, 4335 Tortor. Street', 3);
INSERT INTO delivery.cliente VALUES (86, 'Kyra J. Lott', 985424027, 'Ap #601-8102 Duis Ave', 3);
INSERT INTO delivery.cliente VALUES (87, 'Dana I. Mays', 964354955, '9354 Mi St.', 10);
INSERT INTO delivery.cliente VALUES (88, 'Rogan A. Love', 934915863, '101-8079 Magna. Avenue', 12);
INSERT INTO delivery.cliente VALUES (89, 'Samson Salas', 900937024, 'P.O. Box 322, 8573 Venenatis St.', 26);
INSERT INTO delivery.cliente VALUES (90, 'Paloma N. Cortez', 972994792, 'P.O. Box 175, 8616 Mollis Av.', 27);
INSERT INTO delivery.cliente VALUES (91, 'Nigel Hewitt', 927570773, '115-4010 Aliquam Rd.', 7);
INSERT INTO delivery.cliente VALUES (92, 'Francesca V. Ewing', 999059450, '7379 Sodales Street', 24);
INSERT INTO delivery.cliente VALUES (93, 'Vernon R. Jacobs', 940460965, '1991 Pellentesque Rd.', 5);
INSERT INTO delivery.cliente VALUES (94, 'Erasmus Fitzpatrick', 944473401, 'Ap #138-113 Nunc Av.', 11);
INSERT INTO delivery.cliente VALUES (95, 'Madaline Hays', 992833548, '934-5979 In Street', 29);
INSERT INTO delivery.cliente VALUES (96, 'Mannix Mcknight', 992876027, 'P.O. Box 561, 9046 Quisque Rd.', 6);
INSERT INTO delivery.cliente VALUES (97, 'Callum Booth', 915281548, '278-6864 Porttitor Road', 7);
INSERT INTO delivery.cliente VALUES (98, 'Zeus E. Munoz', 977843432, 'Ap #201-4778 Ipsum. St.', 24);
INSERT INTO delivery.cliente VALUES (99, 'Martena Bird', 934551587, '298-386 Faucibus Ave', 20);
INSERT INTO delivery.cliente VALUES (100, 'Brock U. Merrill', 916260611, '765-9153 Mauris St.', 11);


--
-- Data for Name: distribuidor; Type: TABLE DATA; Schema: delivery; Owner: postgres
--

INSERT INTO delivery.distribuidor VALUES (1, 'Damon Alimentos', 5);
INSERT INTO delivery.distribuidor VALUES (2, 'Deborah Produtos', 29);
INSERT INTO delivery.distribuidor VALUES (3, 'Judith Produtos', 16);
INSERT INTO delivery.distribuidor VALUES (4, 'Gary Produtos', 13);
INSERT INTO delivery.distribuidor VALUES (5, 'Lillith Alimentos', 24);
INSERT INTO delivery.distribuidor VALUES (6, 'Gretchen Produtos', 11);
INSERT INTO delivery.distribuidor VALUES (7, 'Burke Alimentos', 13);
INSERT INTO delivery.distribuidor VALUES (8, 'Tatiana Alimentos', 8);
INSERT INTO delivery.distribuidor VALUES (9, 'Leonard Produtos', 30);
INSERT INTO delivery.distribuidor VALUES (10, 'Kenyon Produtos', 29);
INSERT INTO delivery.distribuidor VALUES (11, 'Cole Alimentos', 30);
INSERT INTO delivery.distribuidor VALUES (12, 'Paul Produtos', 11);
INSERT INTO delivery.distribuidor VALUES (13, 'Rebekah Alimentos', 11);
INSERT INTO delivery.distribuidor VALUES (14, 'Leonard Produtos', 22);
INSERT INTO delivery.distribuidor VALUES (15, 'Bernard Produtos', 16);
INSERT INTO delivery.distribuidor VALUES (16, 'Theodore Produtos', 24);
INSERT INTO delivery.distribuidor VALUES (17, 'Desirae Alimentos', 33);
INSERT INTO delivery.distribuidor VALUES (18, 'Clayton Produtos', 2);
INSERT INTO delivery.distribuidor VALUES (19, 'Rhona Alimentos', 30);
INSERT INTO delivery.distribuidor VALUES (20, 'Daria Produtos', 12);
INSERT INTO delivery.distribuidor VALUES (21, 'Baker Produtos', 22);
INSERT INTO delivery.distribuidor VALUES (22, 'Grady Produtos', 6);
INSERT INTO delivery.distribuidor VALUES (23, 'Ella Alimentos', 26);
INSERT INTO delivery.distribuidor VALUES (24, 'Erica Produtos', 5);
INSERT INTO delivery.distribuidor VALUES (25, 'Elmo Alimentos', 13);
INSERT INTO delivery.distribuidor VALUES (26, 'Alea Produtos', 23);
INSERT INTO delivery.distribuidor VALUES (27, 'Leslie Produtos', 19);
INSERT INTO delivery.distribuidor VALUES (28, 'Jenna Produtos', 5);
INSERT INTO delivery.distribuidor VALUES (29, 'Raja Produtos', 24);
INSERT INTO delivery.distribuidor VALUES (30, 'Judah Alimentos', 10);


--
-- Data for Name: estado; Type: TABLE DATA; Schema: delivery; Owner: postgres
--

INSERT INTO delivery.estado VALUES (1, 'Acre', 'AC');
INSERT INTO delivery.estado VALUES (2, 'Alagoas', 'AL');
INSERT INTO delivery.estado VALUES (3, 'Amapá', 'AP');
INSERT INTO delivery.estado VALUES (4, 'Amazonas', 'AM');
INSERT INTO delivery.estado VALUES (5, 'Bahia', 'BA');
INSERT INTO delivery.estado VALUES (6, 'Ceará', 'CE');
INSERT INTO delivery.estado VALUES (7, 'Distrito Federal', 'DF');
INSERT INTO delivery.estado VALUES (8, 'Espírito Santo', 'ES');
INSERT INTO delivery.estado VALUES (9, 'Goiás', 'GO');
INSERT INTO delivery.estado VALUES (10, 'Maranhão', 'MA');
INSERT INTO delivery.estado VALUES (11, 'Mato Grosso', 'MT');
INSERT INTO delivery.estado VALUES (12, 'Mato Grosso do Sul', 'MS');
INSERT INTO delivery.estado VALUES (13, 'Minas Gerais', 'MG');
INSERT INTO delivery.estado VALUES (14, 'Pará', 'PA');
INSERT INTO delivery.estado VALUES (15, 'Paraíba', 'PB');
INSERT INTO delivery.estado VALUES (16, 'Paraná', 'PR');
INSERT INTO delivery.estado VALUES (17, 'Pernambuco', 'PE');
INSERT INTO delivery.estado VALUES (18, 'Piauí', 'PI');
INSERT INTO delivery.estado VALUES (19, 'Rio de Janeiro', 'RJ');
INSERT INTO delivery.estado VALUES (20, 'Rio Grande do Norte', 'RN');
INSERT INTO delivery.estado VALUES (21, 'Rio Grande do Sul', 'RS');
INSERT INTO delivery.estado VALUES (22, 'Rondônia', 'RO');
INSERT INTO delivery.estado VALUES (23, 'Roraima', 'RR');
INSERT INTO delivery.estado VALUES (24, 'Santa Catarina', 'SC');
INSERT INTO delivery.estado VALUES (25, 'São Paulo', 'SP');
INSERT INTO delivery.estado VALUES (26, 'Sergipe', 'SE');
INSERT INTO delivery.estado VALUES (27, 'Tocantins', 'TO');


--
-- Data for Name: estoque_ingred; Type: TABLE DATA; Schema: delivery; Owner: postgres
--

INSERT INTO delivery.estoque_ingred VALUES (2, 'Mussarela', 'Queijo', NULL);
INSERT INTO delivery.estoque_ingred VALUES (3, 'Tomate', 'Fruta', NULL);
INSERT INTO delivery.estoque_ingred VALUES (4, 'Rês', 'Carne', NULL);
INSERT INTO delivery.estoque_ingred VALUES (5, 'Frango', 'Carne', NULL);
INSERT INTO delivery.estoque_ingred VALUES (6, 'Cebola', 'Legume', NULL);
INSERT INTO delivery.estoque_ingred VALUES (7, 'Bacon', 'Carne', NULL);
INSERT INTO delivery.estoque_ingred VALUES (8, 'Cheddar', 'Queijo', NULL);
INSERT INTO delivery.estoque_ingred VALUES (9, 'Alho', 'Legume', NULL);
INSERT INTO delivery.estoque_ingred VALUES (10, 'Coração de Galinha', 'Carne', NULL);
INSERT INTO delivery.estoque_ingred VALUES (11, 'Pimentão', 'Legume', NULL);
INSERT INTO delivery.estoque_ingred VALUES (12, 'Ovo', 'Outros', NULL);
INSERT INTO delivery.estoque_ingred VALUES (13, 'Filé', 'Carne', NULL);
INSERT INTO delivery.estoque_ingred VALUES (14, 'Gorgonzola', 'Queijo', NULL);
INSERT INTO delivery.estoque_ingred VALUES (15, 'Milho', 'Legume', NULL);
INSERT INTO delivery.estoque_ingred VALUES (16, 'Atum', 'Carne', NULL);
INSERT INTO delivery.estoque_ingred VALUES (17, 'Batata Palha', 'Outros', NULL);
INSERT INTO delivery.estoque_ingred VALUES (18, 'Catupiry', 'Queijo', NULL);
INSERT INTO delivery.estoque_ingred VALUES (19, 'Lombo', 'Carne', NULL);
INSERT INTO delivery.estoque_ingred VALUES (20, 'Provolone', 'Queijo', NULL);
INSERT INTO delivery.estoque_ingred VALUES (22, 'Filé Mignon', 'Carne', NULL);
INSERT INTO delivery.estoque_ingred VALUES (23, 'Palmito', 'Legume', NULL);
INSERT INTO delivery.estoque_ingred VALUES (24, 'Parmesão', 'Queijo', NULL);
INSERT INTO delivery.estoque_ingred VALUES (25, 'Charque', 'Carne', NULL);
INSERT INTO delivery.estoque_ingred VALUES (26, 'Ricota', 'Queijo', NULL);
INSERT INTO delivery.estoque_ingred VALUES (27, 'Manjericão', 'Especiaria', NULL);
INSERT INTO delivery.estoque_ingred VALUES (28, 'Pepperoni', 'Carne', NULL);
INSERT INTO delivery.estoque_ingred VALUES (29, 'Azeite de Oliva', 'Especiaria', NULL);
INSERT INTO delivery.estoque_ingred VALUES (30, 'Farinha', 'Outros', NULL);
INSERT INTO delivery.estoque_ingred VALUES (31, 'Chocolate Preto', 'Doce', NULL);
INSERT INTO delivery.estoque_ingred VALUES (32, 'Chocolate Branco', 'Doce', NULL);
INSERT INTO delivery.estoque_ingred VALUES (33, 'Noz', 'Fruta', NULL);
INSERT INTO delivery.estoque_ingred VALUES (34, 'Coco', 'Fruta', NULL);
INSERT INTO delivery.estoque_ingred VALUES (35, 'Canela', 'Especiaria', NULL);
INSERT INTO delivery.estoque_ingred VALUES (36, 'Orégano', 'Especiaria', NULL);
INSERT INTO delivery.estoque_ingred VALUES (37, 'Morango', 'Fruta', NULL);
INSERT INTO delivery.estoque_ingred VALUES (38, 'Banana', 'Fruta', NULL);
INSERT INTO delivery.estoque_ingred VALUES (39, 'Goiaba', 'Fruta', NULL);
INSERT INTO delivery.estoque_ingred VALUES (40, 'M&M', 'Doce', NULL);
INSERT INTO delivery.estoque_ingred VALUES (41, 'Kit Kat', 'Doce', NULL);
INSERT INTO delivery.estoque_ingred VALUES (42, 'Sorvete', 'Doce', NULL);
INSERT INTO delivery.estoque_ingred VALUES (43, 'Figo', 'Fruta', NULL);
INSERT INTO delivery.estoque_ingred VALUES (44, 'Pêssego', 'Fruta', NULL);
INSERT INTO delivery.estoque_ingred VALUES (21, 'Rúcula', 'Especiaria', NULL);
INSERT INTO delivery.estoque_ingred VALUES (1, 'Granulado', 'Doce', NULL);


--
-- Data for Name: filial; Type: TABLE DATA; Schema: delivery; Owner: postgres
--

INSERT INTO delivery.filial VALUES (1, 'Pizzaria Platanus', 3);
INSERT INTO delivery.filial VALUES (2, 'Basileus Pizzaria', 2);
INSERT INTO delivery.filial VALUES (3, 'Pizzaria Coliseu', 14);
INSERT INTO delivery.filial VALUES (4, 'Napolis Pizzas', 30);
INSERT INTO delivery.filial VALUES (5, 'Roma Delivery', 10);
INSERT INTO delivery.filial VALUES (6, 'Pizza do Dianho', 8);
INSERT INTO delivery.filial VALUES (7, 'Toscana Pizzaria Delivery', 2);
INSERT INTO delivery.filial VALUES (8, 'Pizzaria Marasca', 9);
INSERT INTO delivery.filial VALUES (9, 'Di Nápoli', 1);
INSERT INTO delivery.filial VALUES (10, 'Nosto Sabor Delivery', 3);
INSERT INTO delivery.filial VALUES (11, 'Veneza Pizzaria', 13);
INSERT INTO delivery.filial VALUES (12, 'Recanto Verde', 22);
INSERT INTO delivery.filial VALUES (13, 'Scur Pizzaria', 10);
INSERT INTO delivery.filial VALUES (14, 'Originale Pizzas', 29);
INSERT INTO delivery.filial VALUES (15, 'Pizzaria DaHora', 1);
INSERT INTO delivery.filial VALUES (16, 'Chef Leon', 16);
INSERT INTO delivery.filial VALUES (17, 'De Casa Pizzaria', 2);
INSERT INTO delivery.filial VALUES (18, 'Da Cheff Delivery', 23);
INSERT INTO delivery.filial VALUES (19, 'Bráz Pizzaria', 7);
INSERT INTO delivery.filial VALUES (20, 'Treviso Pizzas', 28);
INSERT INTO delivery.filial VALUES (21, 'Baviera Delivery', 25);
INSERT INTO delivery.filial VALUES (22, 'Firenze Pizzaria', 13);
INSERT INTO delivery.filial VALUES (23, 'D''Itália', 11);
INSERT INTO delivery.filial VALUES (24, 'Pizzaria Milano', 26);
INSERT INTO delivery.filial VALUES (25, 'Sweiss Pizza', 20);
INSERT INTO delivery.filial VALUES (26, 'Giovanni Giorgio Pizzas', 32);
INSERT INTO delivery.filial VALUES (27, 'Mamma Mia Delivery', 12);


--
-- Data for Name: funcionario; Type: TABLE DATA; Schema: delivery; Owner: postgres
--

INSERT INTO delivery.funcionario VALUES (1, 1, 7, 'MacKensie I. Reid');
INSERT INTO delivery.funcionario VALUES (2, 6, 4, 'Kylan S. Rosales');
INSERT INTO delivery.funcionario VALUES (3, 1, 7, 'Odysseus O. Pugh');
INSERT INTO delivery.funcionario VALUES (4, 2, 1, 'Marshall S. Valencia');
INSERT INTO delivery.funcionario VALUES (5, 1, 5, 'Destiny X. Kidd');
INSERT INTO delivery.funcionario VALUES (6, 6, 6, 'Walter H. Rosario');
INSERT INTO delivery.funcionario VALUES (7, 6, 4, 'Aspen H. Ortiz');
INSERT INTO delivery.funcionario VALUES (8, 2, 3, 'Scarlet O. Horton');
INSERT INTO delivery.funcionario VALUES (9, 9, 7, 'Winter D. Chapman');
INSERT INTO delivery.funcionario VALUES (10, 7, 3, 'Charles K. Wade');
INSERT INTO delivery.funcionario VALUES (11, 7, 1, 'Isabella Y. Pope');
INSERT INTO delivery.funcionario VALUES (12, 10, 6, 'Yoshi T. Mccarthy');
INSERT INTO delivery.funcionario VALUES (13, 9, 4, 'Christian Y. Savage');
INSERT INTO delivery.funcionario VALUES (14, 4, 4, 'Moana B. Gonzales');
INSERT INTO delivery.funcionario VALUES (15, 3, 7, 'Cairo X. Mcgee');
INSERT INTO delivery.funcionario VALUES (16, 10, 3, 'Hop Z. Obrien');
INSERT INTO delivery.funcionario VALUES (17, 6, 4, 'Declan D. Mccoy');
INSERT INTO delivery.funcionario VALUES (18, 6, 1, 'Buffy U. Swanson');
INSERT INTO delivery.funcionario VALUES (19, 3, 6, 'Katell G. Robbins');
INSERT INTO delivery.funcionario VALUES (20, 5, 1, 'Larissa D. Rich');
INSERT INTO delivery.funcionario VALUES (21, 10, 5, 'Mira S. Hoover');
INSERT INTO delivery.funcionario VALUES (22, 4, 4, 'Clare U. Dunlap');
INSERT INTO delivery.funcionario VALUES (23, 8, 7, 'Aristotle I. Goff');
INSERT INTO delivery.funcionario VALUES (24, 3, 7, 'Gloria C. Bright');
INSERT INTO delivery.funcionario VALUES (25, 5, 5, 'Wade H. Johns');
INSERT INTO delivery.funcionario VALUES (26, 2, 2, 'Gwendolyn C. Rowland');
INSERT INTO delivery.funcionario VALUES (27, 7, 2, 'Zelda F. Suarez');
INSERT INTO delivery.funcionario VALUES (28, 9, 2, 'Gray N. Ryan');
INSERT INTO delivery.funcionario VALUES (29, 6, 4, 'Nolan E. Randall');
INSERT INTO delivery.funcionario VALUES (30, 5, 6, 'Harding Q. Estes');
INSERT INTO delivery.funcionario VALUES (31, 3, 7, 'Allistair Q. Huphrey');
INSERT INTO delivery.funcionario VALUES (32, 6, 7, 'Lucius N. Curtis');
INSERT INTO delivery.funcionario VALUES (33, 3, 6, 'Cade F. Medina');
INSERT INTO delivery.funcionario VALUES (34, 7, 1, 'Charissa Z. Evans');
INSERT INTO delivery.funcionario VALUES (35, 9, 5, 'Kylan F. Estrada');
INSERT INTO delivery.funcionario VALUES (36, 1, 6, 'Mannix V. Dennis');
INSERT INTO delivery.funcionario VALUES (37, 7, 3, 'Cassady Z. Day');
INSERT INTO delivery.funcionario VALUES (38, 7, 7, 'Oscar O. Reese');
INSERT INTO delivery.funcionario VALUES (39, 6, 3, 'Castor Q. Haynes');
INSERT INTO delivery.funcionario VALUES (40, 10, 4, 'Oliver J. Hartman');
INSERT INTO delivery.funcionario VALUES (41, 8, 2, 'Jenette V. Sanchez');
INSERT INTO delivery.funcionario VALUES (42, 9, 7, 'Orlando T. Stone');
INSERT INTO delivery.funcionario VALUES (43, 5, 2, 'Carson K. Gilliam');
INSERT INTO delivery.funcionario VALUES (44, 10, 7, 'Theodore Cleveland');
INSERT INTO delivery.funcionario VALUES (45, 2, 6, 'Gloria Y. Nelson');
INSERT INTO delivery.funcionario VALUES (46, 6, 1, 'Hedy C. Oneal');
INSERT INTO delivery.funcionario VALUES (47, 9, 2, 'Tanek L. Gentry');
INSERT INTO delivery.funcionario VALUES (48, 4, 2, 'Rudyard A. Newman');
INSERT INTO delivery.funcionario VALUES (49, 6, 2, 'Gavin W. Brooks');
INSERT INTO delivery.funcionario VALUES (50, 7, 5, 'Kimberly Y. Ramos');
INSERT INTO delivery.funcionario VALUES (51, 6, 2, 'Lila M. Finch');
INSERT INTO delivery.funcionario VALUES (52, 6, 2, 'Karina R. Mayo');
INSERT INTO delivery.funcionario VALUES (53, 9, 2, 'Orla E. Zimmerman');
INSERT INTO delivery.funcionario VALUES (54, 2, 4, 'Michelle R. Howe');
INSERT INTO delivery.funcionario VALUES (55, 3, 2, 'Chester U. Moon');
INSERT INTO delivery.funcionario VALUES (56, 1, 7, 'Cody A. Ellis');
INSERT INTO delivery.funcionario VALUES (57, 6, 5, 'Phelan J. Colon');
INSERT INTO delivery.funcionario VALUES (58, 2, 4, 'Dahlia F. Walton');
INSERT INTO delivery.funcionario VALUES (59, 2, 1, 'Dolan O. Harding');
INSERT INTO delivery.funcionario VALUES (60, 10, 4, 'Sigourney Delacruz');
INSERT INTO delivery.funcionario VALUES (61, 6, 6, 'Mara S. Sanders');
INSERT INTO delivery.funcionario VALUES (62, 8, 6, 'Claire G. Floyd');
INSERT INTO delivery.funcionario VALUES (63, 6, 2, 'Stacey U. Joseph');
INSERT INTO delivery.funcionario VALUES (64, 10, 4, 'Zelenia Y. Bray');
INSERT INTO delivery.funcionario VALUES (65, 4, 6, 'Quinlan C. Alston');
INSERT INTO delivery.funcionario VALUES (66, 8, 1, 'Mechelle C. Mathews');
INSERT INTO delivery.funcionario VALUES (67, 5, 2, 'Sonia K. Frederick');
INSERT INTO delivery.funcionario VALUES (68, 2, 2, 'Cadman T. Weeks');
INSERT INTO delivery.funcionario VALUES (69, 2, 4, 'Dalton L. Adkins');
INSERT INTO delivery.funcionario VALUES (70, 3, 3, 'Callum M. Small');
INSERT INTO delivery.funcionario VALUES (71, 1, 2, 'Dora W. Blair');
INSERT INTO delivery.funcionario VALUES (72, 1, 7, 'Zia A. Nieves');
INSERT INTO delivery.funcionario VALUES (73, 5, 2, 'Sandra H. Logan');
INSERT INTO delivery.funcionario VALUES (74, 1, 5, 'Stephen B. Moreno');
INSERT INTO delivery.funcionario VALUES (75, 5, 7, 'Maryam Fitzpatrick');
INSERT INTO delivery.funcionario VALUES (76, 5, 1, 'Damian I. Roberts');
INSERT INTO delivery.funcionario VALUES (77, 9, 3, 'Hall Z. King');
INSERT INTO delivery.funcionario VALUES (78, 4, 5, 'Karly W. Snyder');
INSERT INTO delivery.funcionario VALUES (79, 3, 3, 'Brett E. Vazquez');
INSERT INTO delivery.funcionario VALUES (80, 6, 5, 'Chase Y. Frederick');
INSERT INTO delivery.funcionario VALUES (81, 6, 6, 'Lunea F. Martinez');
INSERT INTO delivery.funcionario VALUES (82, 6, 3, 'Stephen G. Campbell');
INSERT INTO delivery.funcionario VALUES (83, 2, 1, 'Tatum X. Holland');
INSERT INTO delivery.funcionario VALUES (84, 7, 7, 'Zeus Y. Edwards');
INSERT INTO delivery.funcionario VALUES (85, 7, 4, 'Malcolm V. Gross');
INSERT INTO delivery.funcionario VALUES (86, 8, 2, 'Skyler E. Whitehead');
INSERT INTO delivery.funcionario VALUES (87, 1, 2, 'Branden Z. Sloan');
INSERT INTO delivery.funcionario VALUES (88, 8, 4, 'Freya M. Lowery');
INSERT INTO delivery.funcionario VALUES (89, 8, 5, 'Cooper M. Chavez');
INSERT INTO delivery.funcionario VALUES (90, 2, 4, 'Julian O. Webb');
INSERT INTO delivery.funcionario VALUES (91, 7, 2, 'Allistair M. Bridges');
INSERT INTO delivery.funcionario VALUES (92, 5, 3, 'Hashim H. Stephens');
INSERT INTO delivery.funcionario VALUES (93, 7, 1, 'Jessamine M. Holder');
INSERT INTO delivery.funcionario VALUES (94, 8, 4, 'Ifeoma H. Bender');
INSERT INTO delivery.funcionario VALUES (95, 4, 7, 'Charde C. Beach');
INSERT INTO delivery.funcionario VALUES (96, 3, 1, 'Aaron E. Albert');
INSERT INTO delivery.funcionario VALUES (97, 5, 3, 'Ebony X. Underwood');
INSERT INTO delivery.funcionario VALUES (98, 8, 3, 'Ima D. Riggs');
INSERT INTO delivery.funcionario VALUES (99, 2, 6, 'Remedios W. Warren');
INSERT INTO delivery.funcionario VALUES (100, 1, 4, 'Wing L. Greene');


--
-- Data for Name: itens_pedido; Type: TABLE DATA; Schema: delivery; Owner: postgres
--

INSERT INTO delivery.itens_pedido VALUES (50, 6, 37, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (22, 1, 32, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (80, 2, 40, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (61, 2, 32, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (20, 2, 44, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (5, 3, 38, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (29, 6, 43, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (42, 4, 15, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (77, 5, 39, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (77, 5, 39, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (70, 3, 7, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (78, 4, 42, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (45, 5, 26, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (5, 6, 25, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (10, 6, 43, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (53, 6, 30, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (31, 3, 9, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (34, 6, 12, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (52, 3, 5, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (81, 2, 28, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (34, 1, 43, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (68, 5, 40, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (19, 2, 16, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (53, 4, 23, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (95, 2, 45, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (87, 1, 11, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (6, 6, 33, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (100, 2, 27, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (86, 4, 5, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (91, 3, 31, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (16, 6, 6, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (8, 2, 16, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (66, 6, 15, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (91, 2, 40, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (59, 1, 43, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (98, 5, 22, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (83, 3, 23, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (14, 6, 37, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (15, 3, 24, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (39, 2, 20, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (18, 6, 1, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (11, 2, 7, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (37, 1, 15, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (31, 3, 7, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (87, 3, 29, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (16, 3, 26, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (3, 1, 32, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (72, 1, 34, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (51, 2, 29, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (83, 6, 38, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (85, 1, 24, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (98, 4, 43, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (4, 4, 15, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (90, 2, 6, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (80, 5, 20, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (56, 5, 17, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (22, 4, 4, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (15, 1, 30, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (51, 2, 27, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (29, 6, 13, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (72, 3, 34, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (48, 1, 1, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (41, 3, 13, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (7, 3, 44, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (35, 5, 27, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (17, 2, 4, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (91, 4, 39, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (97, 2, 20, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (13, 2, 42, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (12, 1, 32, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (74, 4, 25, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (74, 4, 18, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (27, 5, 4, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (37, 2, 41, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (93, 2, 36, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (30, 1, 3, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (24, 5, 2, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (60, 5, 22, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (54, 2, 28, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (85, 5, 26, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (21, 3, 18, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (41, 3, 34, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (64, 4, 39, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (91, 4, 4, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (18, 1, 15, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (76, 3, 18, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (40, 4, 24, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (79, 4, 30, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (12, 3, 12, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (29, 1, 18, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (43, 3, 24, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (70, 3, 30, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (22, 2, 43, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (69, 5, 31, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (42, 4, 7, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (88, 5, 34, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (89, 6, 22, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (33, 6, 1, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (76, 4, 21, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (98, 2, 5, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (2, 5, 15, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (23, 5, 37, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (45, 5, 15, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (52, 3, 6, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (57, 5, 14, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (99, 5, 31, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (45, 5, 42, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (6, 3, 43, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (66, 1, 12, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (68, 4, 31, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (70, 6, 7, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (2, 2, 21, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (93, 4, 34, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (52, 4, 22, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (69, 4, 1, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (44, 4, 18, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (56, 1, 31, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (31, 6, 8, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (91, 2, 29, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (77, 4, 32, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (24, 5, 7, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (31, 4, 32, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (7, 4, 32, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (16, 4, 20, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (18, 6, 6, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (48, 3, 2, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (77, 4, 19, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (32, 5, 28, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (17, 6, 41, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (86, 1, 22, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (84, 5, 17, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (70, 2, 2, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (47, 5, 6, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (79, 2, 22, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (75, 1, 7, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (59, 3, 35, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (51, 6, 40, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (87, 1, 31, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (17, 6, 8, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (42, 4, 9, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (23, 6, 37, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (78, 2, 34, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (89, 5, 10, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (58, 6, 13, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (39, 2, 38, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (40, 6, 43, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (24, 4, 2, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (22, 5, 9, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (68, 3, 45, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (18, 3, 13, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (62, 4, 36, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (67, 1, 15, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (38, 2, 3, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (82, 3, 20, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (4, 6, 28, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (100, 6, 19, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (83, 5, 25, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (24, 6, 16, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (35, 1, 28, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (23, 6, 43, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (64, 5, 32, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (92, 5, 4, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (7, 1, 6, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (69, 6, 37, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (7, 2, 22, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (46, 5, 15, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (93, 2, 1, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (62, 5, 24, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (46, 1, 17, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (60, 5, 12, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (82, 6, 9, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (47, 6, 10, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (20, 4, 29, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (68, 4, 20, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (71, 3, 39, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (65, 1, 18, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (78, 4, 31, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (90, 5, 9, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (18, 2, 10, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (43, 4, 7, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (87, 3, 36, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (81, 3, 43, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (63, 2, 41, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (67, 4, 9, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (32, 6, 13, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (82, 4, 26, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (55, 5, 25, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (84, 3, 45, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (33, 5, 39, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (96, 3, 38, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (99, 3, 22, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (56, 3, 18, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (67, 4, 31, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (34, 5, 6, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (58, 6, 24, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (94, 6, 42, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (69, 6, 33, 3, NULL);
INSERT INTO delivery.itens_pedido VALUES (100, 3, 13, 1, NULL);
INSERT INTO delivery.itens_pedido VALUES (45, 1, 19, 2, NULL);
INSERT INTO delivery.itens_pedido VALUES (20, 5, 21, 2, NULL);


--
-- Data for Name: nota_compras; Type: TABLE DATA; Schema: delivery; Owner: postgres
--

INSERT INTO delivery.nota_compras VALUES (1, 15, 11, 18, '2019-04-04', 'in, dolor.');
INSERT INTO delivery.nota_compras VALUES (2, 16, 99, 7, '2019-11-19', 'mollis. Duis');
INSERT INTO delivery.nota_compras VALUES (3, 44, 95, 27, '2019-02-21', 'odio semper cursus. Integer');
INSERT INTO delivery.nota_compras VALUES (4, 17, 6, 1, '2019-12-14', 'lectus sit');
INSERT INTO delivery.nota_compras VALUES (5, 19, 69, 24, '2020-12-05', 'vel, venenatis vel,');
INSERT INTO delivery.nota_compras VALUES (6, 36, 80, 15, '2020-07-08', 'vehicula');
INSERT INTO delivery.nota_compras VALUES (7, 14, 17, 8, '2018-01-26', 'eu neque pellentesque');
INSERT INTO delivery.nota_compras VALUES (8, 25, 83, 8, '2019-11-10', 'diam. Sed diam lorem,');
INSERT INTO delivery.nota_compras VALUES (9, 17, 30, 9, '2020-07-15', 'ipsum nunc id');
INSERT INTO delivery.nota_compras VALUES (10, 33, 59, 11, '2018-07-08', 'in, hendrerit');
INSERT INTO delivery.nota_compras VALUES (11, 14, 67, 19, '2020-10-08', 'Nam');
INSERT INTO delivery.nota_compras VALUES (12, 32, 32, 7, '2019-11-18', 'sit amet lorem');
INSERT INTO delivery.nota_compras VALUES (13, 26, 54, 3, '2019-09-19', 'odio, auctor');
INSERT INTO delivery.nota_compras VALUES (14, 29, 19, 29, '2019-01-29', 'enim diam vel arcu.');
INSERT INTO delivery.nota_compras VALUES (15, 7, 78, 5, '2020-08-07', 'semper auctor. Mauris vel');
INSERT INTO delivery.nota_compras VALUES (16, 38, 54, 25, '2019-10-09', 'dignissim pharetra.');
INSERT INTO delivery.nota_compras VALUES (17, 44, 30, 21, '2020-11-02', 'eleifend egestas. Sed');
INSERT INTO delivery.nota_compras VALUES (18, 21, 89, 4, '2018-07-26', 'et netus et malesuada');
INSERT INTO delivery.nota_compras VALUES (19, 11, 85, 11, '2020-07-16', 'Sed nunc est,');
INSERT INTO delivery.nota_compras VALUES (20, 6, 98, 29, '2018-01-15', 'vitae semper egestas, urna');
INSERT INTO delivery.nota_compras VALUES (21, 8, 98, 28, '2018-02-25', 'tempor diam dictum sapien.');
INSERT INTO delivery.nota_compras VALUES (22, 38, 15, 4, '2020-11-01', 'adipiscing elit. Curabitur');
INSERT INTO delivery.nota_compras VALUES (23, 30, 24, 19, '2018-11-11', 'nec urna suscipit');
INSERT INTO delivery.nota_compras VALUES (24, 24, 32, 13, '2019-01-30', 'placerat, augue.');
INSERT INTO delivery.nota_compras VALUES (25, 3, 14, 19, '2018-12-15', 'iaculis quis, pede.');
INSERT INTO delivery.nota_compras VALUES (26, 25, 48, 22, '2018-02-04', 'scelerisque');
INSERT INTO delivery.nota_compras VALUES (27, 37, 25, 14, '2020-12-14', 'vitae odio');
INSERT INTO delivery.nota_compras VALUES (28, 13, 95, 16, '2018-06-30', 'iaculis, lacus');
INSERT INTO delivery.nota_compras VALUES (29, 5, 79, 24, '2018-11-14', 'nulla vulputate dui,');
INSERT INTO delivery.nota_compras VALUES (30, 35, 11, 25, '2018-01-05', 'tellus');
INSERT INTO delivery.nota_compras VALUES (31, 35, 4, 21, '2020-01-30', 'lorem. Donec elementum,');
INSERT INTO delivery.nota_compras VALUES (32, 23, 17, 11, '2019-09-14', 'pede ac urna.');
INSERT INTO delivery.nota_compras VALUES (33, 20, 46, 25, '2019-12-10', 'et magnis');
INSERT INTO delivery.nota_compras VALUES (34, 35, 70, 10, '2020-02-26', 'a, facilisis non,');
INSERT INTO delivery.nota_compras VALUES (35, 27, 61, 27, '2019-10-18', 'Phasellus vitae mauris');
INSERT INTO delivery.nota_compras VALUES (36, 30, 73, 15, '2019-09-13', 'faucibus lectus, a sollicitudin');
INSERT INTO delivery.nota_compras VALUES (37, 29, 27, 2, '2019-08-16', 'viverra. Donec tempus,');
INSERT INTO delivery.nota_compras VALUES (38, 33, 35, 10, '2019-07-28', 'sagittis felis. Donec');
INSERT INTO delivery.nota_compras VALUES (39, 1, 12, 21, '2020-11-16', 'sagittis lobortis');
INSERT INTO delivery.nota_compras VALUES (40, 29, 4, 29, '2019-10-18', 'Praesent');
INSERT INTO delivery.nota_compras VALUES (41, 6, 42, 3, '2020-10-28', 'velit egestas lacinia. Sed');
INSERT INTO delivery.nota_compras VALUES (42, 31, 15, 10, '2018-10-12', 'Sed eu');
INSERT INTO delivery.nota_compras VALUES (43, 36, 85, 6, '2020-08-01', 'sapien');
INSERT INTO delivery.nota_compras VALUES (44, 11, 56, 4, '2019-01-14', 'hendrerit neque. In ornare');
INSERT INTO delivery.nota_compras VALUES (45, 39, 85, 16, '2020-04-25', 'Nulla facilisis. Suspendisse');
INSERT INTO delivery.nota_compras VALUES (46, 6, 66, 3, '2019-06-16', 'at');
INSERT INTO delivery.nota_compras VALUES (47, 38, 18, 6, '2020-05-08', 'malesuada vel, convallis');
INSERT INTO delivery.nota_compras VALUES (48, 34, 35, 14, '2020-08-27', 'Aenean gravida nunc');
INSERT INTO delivery.nota_compras VALUES (49, 1, 57, 20, '2020-01-29', 'Nullam velit');
INSERT INTO delivery.nota_compras VALUES (50, 10, 64, 23, '2020-05-09', 'tincidunt aliquam arcu. Aliquam');
INSERT INTO delivery.nota_compras VALUES (51, 15, 90, 23, '2018-10-05', 'nulla ante,');
INSERT INTO delivery.nota_compras VALUES (52, 36, 87, 4, '2020-09-22', 'justo. Proin');
INSERT INTO delivery.nota_compras VALUES (53, 16, 11, 4, '2019-04-28', 'Integer sem');
INSERT INTO delivery.nota_compras VALUES (54, 12, 42, 5, '2018-09-29', 'Morbi vehicula. Pellentesque tincidunt');
INSERT INTO delivery.nota_compras VALUES (55, 9, 6, 7, '2018-08-16', 'neque tellus,');
INSERT INTO delivery.nota_compras VALUES (56, 23, 6, 11, '2018-01-14', 'mauris sit amet lorem');
INSERT INTO delivery.nota_compras VALUES (57, 43, 2, 17, '2018-05-10', 'Vestibulum ante');
INSERT INTO delivery.nota_compras VALUES (58, 13, 60, 10, '2019-12-21', 'vitae diam. Proin');
INSERT INTO delivery.nota_compras VALUES (59, 7, 15, 10, '2018-08-07', 'nibh.');
INSERT INTO delivery.nota_compras VALUES (60, 5, 46, 1, '2019-08-27', 'neque. Nullam nisl. Maecenas');
INSERT INTO delivery.nota_compras VALUES (61, 2, 61, 23, '2018-10-18', 'lacus. Quisque purus sapien,');
INSERT INTO delivery.nota_compras VALUES (62, 38, 61, 7, '2020-12-07', 'placerat,');
INSERT INTO delivery.nota_compras VALUES (63, 42, 76, 23, '2018-03-26', 'orci.');
INSERT INTO delivery.nota_compras VALUES (64, 19, 9, 7, '2018-02-01', 'erat nonummy');
INSERT INTO delivery.nota_compras VALUES (65, 13, 79, 15, '2020-11-23', 'Nullam ut');
INSERT INTO delivery.nota_compras VALUES (66, 42, 48, 9, '2018-11-12', 'tincidunt adipiscing. Mauris');
INSERT INTO delivery.nota_compras VALUES (67, 44, 65, 1, '2020-12-17', 'dolor egestas');
INSERT INTO delivery.nota_compras VALUES (68, 42, 85, 30, '2020-03-24', 'Sed id');
INSERT INTO delivery.nota_compras VALUES (69, 6, 41, 30, '2020-02-15', 'at, velit. Cras lorem');
INSERT INTO delivery.nota_compras VALUES (70, 1, 93, 12, '2020-01-11', 'Proin');
INSERT INTO delivery.nota_compras VALUES (71, 18, 95, 20, '2020-06-09', 'sollicitudin');
INSERT INTO delivery.nota_compras VALUES (72, 34, 94, 21, '2018-02-28', 'nulla at');
INSERT INTO delivery.nota_compras VALUES (73, 31, 53, 20, '2018-04-13', 'Donec at arcu. Vestibulum');
INSERT INTO delivery.nota_compras VALUES (74, 33, 52, 2, '2019-09-29', 'sapien. Nunc pulvinar');
INSERT INTO delivery.nota_compras VALUES (75, 13, 41, 25, '2018-04-05', 'ornare lectus justo eu');
INSERT INTO delivery.nota_compras VALUES (76, 43, 68, 12, '2019-10-07', 'et malesuada');
INSERT INTO delivery.nota_compras VALUES (77, 30, 52, 6, '2020-11-20', 'adipiscing non, luctus sit');
INSERT INTO delivery.nota_compras VALUES (78, 6, 55, 30, '2019-05-02', 'enim. Sed');
INSERT INTO delivery.nota_compras VALUES (79, 4, 38, 30, '2018-05-29', 'et');
INSERT INTO delivery.nota_compras VALUES (80, 9, 2, 12, '2019-07-11', 'scelerisque neque.');
INSERT INTO delivery.nota_compras VALUES (81, 23, 11, 12, '2020-09-05', 'vehicula risus. Nulla eget');
INSERT INTO delivery.nota_compras VALUES (82, 4, 72, 3, '2018-02-17', 'semper erat, in');
INSERT INTO delivery.nota_compras VALUES (83, 4, 51, 2, '2020-03-28', 'Etiam imperdiet dictum');
INSERT INTO delivery.nota_compras VALUES (84, 22, 82, 28, '2019-01-30', 'tellus.');
INSERT INTO delivery.nota_compras VALUES (85, 25, 61, 3, '2019-07-24', 'porttitor interdum.');
INSERT INTO delivery.nota_compras VALUES (86, 24, 95, 24, '2019-04-13', 'nibh.');
INSERT INTO delivery.nota_compras VALUES (87, 16, 58, 9, '2019-05-03', 'Pellentesque ut ipsum');
INSERT INTO delivery.nota_compras VALUES (88, 27, 83, 29, '2019-01-29', 'sit amet metus.');
INSERT INTO delivery.nota_compras VALUES (89, 19, 89, 29, '2019-11-24', 'tellus');
INSERT INTO delivery.nota_compras VALUES (90, 21, 60, 16, '2018-07-16', 'mi lorem,');
INSERT INTO delivery.nota_compras VALUES (91, 34, 3, 12, '2020-05-15', 'Curabitur dictum.');
INSERT INTO delivery.nota_compras VALUES (92, 44, 32, 23, '2019-02-04', 'habitant morbi tristique senectus');
INSERT INTO delivery.nota_compras VALUES (93, 14, 86, 25, '2018-11-29', 'scelerisque');
INSERT INTO delivery.nota_compras VALUES (94, 18, 72, 6, '2019-05-11', 'dolor, nonummy ac, feugiat');
INSERT INTO delivery.nota_compras VALUES (95, 37, 68, 27, '2019-11-26', 'lorem. Donec elementum,');
INSERT INTO delivery.nota_compras VALUES (96, 18, 53, 22, '2019-03-09', 'nec, eleifend non, dapibus');
INSERT INTO delivery.nota_compras VALUES (97, 19, 85, 29, '2019-10-07', 'Proin non massa non');
INSERT INTO delivery.nota_compras VALUES (98, 41, 56, 4, '2020-11-08', 'ipsum ac mi eleifend');
INSERT INTO delivery.nota_compras VALUES (99, 34, 53, 27, '2020-02-11', 'Aliquam auctor, velit eget');
INSERT INTO delivery.nota_compras VALUES (100, 7, 22, 21, '2020-12-03', 'Donec at arcu. Vestibulum');


--
-- Data for Name: nota_pedidos; Type: TABLE DATA; Schema: delivery; Owner: postgres
--

INSERT INTO delivery.nota_pedidos VALUES (2, 46, 76, NULL, '2018-06-07', 'E');
INSERT INTO delivery.nota_pedidos VALUES (36, 38, 3, NULL, '2020-11-08', 'R');
INSERT INTO delivery.nota_pedidos VALUES (37, 72, 11, NULL, '2018-05-09', 'A');
INSERT INTO delivery.nota_pedidos VALUES (38, 32, 42, NULL, '2018-05-09', 'E');
INSERT INTO delivery.nota_pedidos VALUES (39, 75, 100, NULL, '2018-07-14', 'F');
INSERT INTO delivery.nota_pedidos VALUES (40, 31, 41, NULL, '2020-12-22', 'P');
INSERT INTO delivery.nota_pedidos VALUES (41, 44, 58, NULL, '2018-04-01', 'C');
INSERT INTO delivery.nota_pedidos VALUES (42, 23, 51, NULL, '2019-11-20', 'R');
INSERT INTO delivery.nota_pedidos VALUES (43, 84, 16, NULL, '2020-11-06', 'A');
INSERT INTO delivery.nota_pedidos VALUES (44, 3, 95, NULL, '2018-11-21', 'E');
INSERT INTO delivery.nota_pedidos VALUES (45, 15, 41, NULL, '2020-10-10', 'F');
INSERT INTO delivery.nota_pedidos VALUES (46, 56, 83, NULL, '2020-10-06', 'P');
INSERT INTO delivery.nota_pedidos VALUES (47, 9, 79, NULL, '2018-04-17', 'C');
INSERT INTO delivery.nota_pedidos VALUES (48, 1, 5, NULL, '2018-02-07', 'R');
INSERT INTO delivery.nota_pedidos VALUES (49, 59, 15, NULL, '2018-11-02', 'A');
INSERT INTO delivery.nota_pedidos VALUES (50, 46, 57, NULL, '2020-08-05', 'E');
INSERT INTO delivery.nota_pedidos VALUES (51, 11, 10, NULL, '2020-07-29', 'F');
INSERT INTO delivery.nota_pedidos VALUES (52, 4, 68, NULL, '2020-07-03', 'P');
INSERT INTO delivery.nota_pedidos VALUES (53, 96, 25, NULL, '2020-03-29', 'C');
INSERT INTO delivery.nota_pedidos VALUES (54, 18, 30, NULL, '2019-03-17', 'R');
INSERT INTO delivery.nota_pedidos VALUES (55, 20, 51, NULL, '2019-03-13', 'A');
INSERT INTO delivery.nota_pedidos VALUES (56, 83, 91, NULL, '2020-07-31', 'E');
INSERT INTO delivery.nota_pedidos VALUES (57, 76, 59, NULL, '2018-01-22', 'F');
INSERT INTO delivery.nota_pedidos VALUES (58, 34, 55, NULL, '2020-11-26', 'P');
INSERT INTO delivery.nota_pedidos VALUES (59, 93, 76, NULL, '2019-03-01', 'C');
INSERT INTO delivery.nota_pedidos VALUES (60, 66, 17, NULL, '2020-07-08', 'R');
INSERT INTO delivery.nota_pedidos VALUES (61, 71, 69, NULL, '2020-01-02', 'A');
INSERT INTO delivery.nota_pedidos VALUES (62, 63, 33, NULL, '2018-07-23', 'E');
INSERT INTO delivery.nota_pedidos VALUES (63, 47, 32, NULL, '2019-02-07', 'F');
INSERT INTO delivery.nota_pedidos VALUES (64, 48, 23, NULL, '2019-06-27', 'P');
INSERT INTO delivery.nota_pedidos VALUES (65, 49, 73, NULL, '2020-02-24', 'C');
INSERT INTO delivery.nota_pedidos VALUES (66, 55, 40, NULL, '2020-02-28', 'R');
INSERT INTO delivery.nota_pedidos VALUES (67, 51, 8, NULL, '2019-04-01', 'A');
INSERT INTO delivery.nota_pedidos VALUES (68, 52, 60, NULL, '2020-06-15', 'E');
INSERT INTO delivery.nota_pedidos VALUES (69, 53, 18, NULL, '2020-01-20', 'F');
INSERT INTO delivery.nota_pedidos VALUES (70, 43, 15, NULL, '2020-01-30', 'P');
INSERT INTO delivery.nota_pedidos VALUES (71, 87, 15, NULL, '2019-12-11', 'C');
INSERT INTO delivery.nota_pedidos VALUES (72, 68, 78, NULL, '2020-09-23', 'R');
INSERT INTO delivery.nota_pedidos VALUES (73, 91, 24, NULL, '2020-05-28', 'A');
INSERT INTO delivery.nota_pedidos VALUES (74, 26, 57, NULL, '2020-07-29', 'E');
INSERT INTO delivery.nota_pedidos VALUES (75, 27, 50, NULL, '2018-03-13', 'F');
INSERT INTO delivery.nota_pedidos VALUES (76, 28, 66, NULL, '2018-08-04', 'P');
INSERT INTO delivery.nota_pedidos VALUES (77, 86, 83, NULL, '2019-10-12', 'C');
INSERT INTO delivery.nota_pedidos VALUES (78, 67, 45, NULL, '2019-10-26', 'R');
INSERT INTO delivery.nota_pedidos VALUES (79, 41, 45, NULL, '2018-04-29', 'A');
INSERT INTO delivery.nota_pedidos VALUES (80, 73, 74, NULL, '2020-10-27', 'E');
INSERT INTO delivery.nota_pedidos VALUES (81, 24, 37, NULL, '2020-04-24', 'F');
INSERT INTO delivery.nota_pedidos VALUES (82, 95, 76, NULL, '2019-03-14', 'P');
INSERT INTO delivery.nota_pedidos VALUES (83, 42, 47, NULL, '2018-09-16', 'C');
INSERT INTO delivery.nota_pedidos VALUES (84, 38, 85, NULL, '2019-07-16', 'R');
INSERT INTO delivery.nota_pedidos VALUES (85, 72, 33, NULL, '2019-07-29', 'A');
INSERT INTO delivery.nota_pedidos VALUES (86, 32, 21, NULL, '2019-09-15', 'E');
INSERT INTO delivery.nota_pedidos VALUES (87, 75, 69, NULL, '2018-07-01', 'F');
INSERT INTO delivery.nota_pedidos VALUES (88, 31, 100, NULL, '2018-03-11', 'P');
INSERT INTO delivery.nota_pedidos VALUES (89, 44, 14, NULL, '2020-05-14', 'C');
INSERT INTO delivery.nota_pedidos VALUES (90, 23, 22, NULL, '2018-06-22', 'R');
INSERT INTO delivery.nota_pedidos VALUES (91, 84, 64, NULL, '2019-09-10', 'A');
INSERT INTO delivery.nota_pedidos VALUES (92, 3, 26, NULL, '2018-03-31', 'E');
INSERT INTO delivery.nota_pedidos VALUES (93, 15, 50, NULL, '2018-06-25', 'F');
INSERT INTO delivery.nota_pedidos VALUES (94, 56, 76, NULL, '2019-12-28', 'P');
INSERT INTO delivery.nota_pedidos VALUES (95, 9, 84, NULL, '2019-04-09', 'C');
INSERT INTO delivery.nota_pedidos VALUES (96, 1, 31, NULL, '2020-02-05', 'R');
INSERT INTO delivery.nota_pedidos VALUES (97, 59, 96, NULL, '2018-04-21', 'A');
INSERT INTO delivery.nota_pedidos VALUES (98, 46, 100, NULL, '2019-04-28', 'E');
INSERT INTO delivery.nota_pedidos VALUES (99, 11, 11, NULL, '2019-10-27', 'F');
INSERT INTO delivery.nota_pedidos VALUES (100, 4, 20, NULL, '2020-12-21', 'P');
INSERT INTO delivery.nota_pedidos VALUES (1, 59, 79, NULL, '2018-04-23', 'A');
INSERT INTO delivery.nota_pedidos VALUES (3, 11, 25, NULL, '2019-12-09', 'F');
INSERT INTO delivery.nota_pedidos VALUES (4, 4, 4, NULL, '2020-06-02', 'P');
INSERT INTO delivery.nota_pedidos VALUES (5, 96, 77, NULL, '2019-10-21', 'C');
INSERT INTO delivery.nota_pedidos VALUES (6, 18, 31, NULL, '2020-12-10', 'R');
INSERT INTO delivery.nota_pedidos VALUES (7, 20, 81, NULL, '2018-03-10', 'A');
INSERT INTO delivery.nota_pedidos VALUES (8, 83, 74, NULL, '2018-09-07', 'E');
INSERT INTO delivery.nota_pedidos VALUES (9, 76, 61, NULL, '2020-09-08', 'F');
INSERT INTO delivery.nota_pedidos VALUES (10, 34, 3, NULL, '2019-03-04', 'P');
INSERT INTO delivery.nota_pedidos VALUES (11, 93, 80, NULL, '2018-01-26', 'C');
INSERT INTO delivery.nota_pedidos VALUES (12, 66, 38, NULL, '2020-08-29', 'R');
INSERT INTO delivery.nota_pedidos VALUES (13, 71, 54, NULL, '2020-02-18', 'A');
INSERT INTO delivery.nota_pedidos VALUES (14, 63, 9, NULL, '2018-10-20', 'E');
INSERT INTO delivery.nota_pedidos VALUES (15, 47, 86, NULL, '2020-08-14', 'F');
INSERT INTO delivery.nota_pedidos VALUES (16, 48, 8, NULL, '2020-01-30', 'P');
INSERT INTO delivery.nota_pedidos VALUES (17, 49, 17, NULL, '2020-11-20', 'C');
INSERT INTO delivery.nota_pedidos VALUES (18, 55, 60, NULL, '2020-05-23', 'R');
INSERT INTO delivery.nota_pedidos VALUES (19, 51, 100, NULL, '2018-01-15', 'A');
INSERT INTO delivery.nota_pedidos VALUES (20, 52, 77, NULL, '2020-03-17', 'E');
INSERT INTO delivery.nota_pedidos VALUES (21, 53, 34, NULL, '2019-02-02', 'F');
INSERT INTO delivery.nota_pedidos VALUES (22, 43, 46, NULL, '2019-11-13', 'P');
INSERT INTO delivery.nota_pedidos VALUES (23, 87, 22, NULL, '2018-07-13', 'C');
INSERT INTO delivery.nota_pedidos VALUES (24, 68, 76, NULL, '2019-01-26', 'R');
INSERT INTO delivery.nota_pedidos VALUES (25, 91, 62, NULL, '2018-02-27', 'A');
INSERT INTO delivery.nota_pedidos VALUES (26, 26, 91, NULL, '2018-12-20', 'E');
INSERT INTO delivery.nota_pedidos VALUES (27, 27, 36, NULL, '2018-03-30', 'F');
INSERT INTO delivery.nota_pedidos VALUES (28, 28, 44, NULL, '2020-01-27', 'P');
INSERT INTO delivery.nota_pedidos VALUES (29, 86, 20, NULL, '2020-03-21', 'C');
INSERT INTO delivery.nota_pedidos VALUES (30, 67, 59, NULL, '2018-05-16', 'R');
INSERT INTO delivery.nota_pedidos VALUES (31, 41, 19, NULL, '2018-12-22', 'A');
INSERT INTO delivery.nota_pedidos VALUES (32, 73, 28, NULL, '2020-02-15', 'E');
INSERT INTO delivery.nota_pedidos VALUES (33, 24, 87, NULL, '2019-10-21', 'F');
INSERT INTO delivery.nota_pedidos VALUES (34, 95, 7, NULL, '2018-03-11', 'P');
INSERT INTO delivery.nota_pedidos VALUES (35, 42, 87, NULL, '2020-04-24', 'C');


--
-- Data for Name: sabor_pizza; Type: TABLE DATA; Schema: delivery; Owner: postgres
--

INSERT INTO delivery.sabor_pizza VALUES (1, 'Calabresa');
INSERT INTO delivery.sabor_pizza VALUES (2, 'Atum');
INSERT INTO delivery.sabor_pizza VALUES (3, 'Bacon');
INSERT INTO delivery.sabor_pizza VALUES (4, 'Moda da Casa');
INSERT INTO delivery.sabor_pizza VALUES (5, 'Margherita');
INSERT INTO delivery.sabor_pizza VALUES (6, 'Frango com Catupiry');
INSERT INTO delivery.sabor_pizza VALUES (7, 'Filé Mignon');
INSERT INTO delivery.sabor_pizza VALUES (8, 'Portuguesa');
INSERT INTO delivery.sabor_pizza VALUES (9, 'Quatro Queijos');
INSERT INTO delivery.sabor_pizza VALUES (10, 'Coração');
INSERT INTO delivery.sabor_pizza VALUES (11, 'Milho');
INSERT INTO delivery.sabor_pizza VALUES (12, 'Brócolis');
INSERT INTO delivery.sabor_pizza VALUES (13, 'Strogonoff de Rês');
INSERT INTO delivery.sabor_pizza VALUES (14, 'Strogonoff de Frango');
INSERT INTO delivery.sabor_pizza VALUES (15, 'Alho e Óleo');
INSERT INTO delivery.sabor_pizza VALUES (16, 'Filé Acebolado');
INSERT INTO delivery.sabor_pizza VALUES (17, 'Baiana');
INSERT INTO delivery.sabor_pizza VALUES (18, 'Napolitana');
INSERT INTO delivery.sabor_pizza VALUES (19, 'Rúcula com Tomate Seco');
INSERT INTO delivery.sabor_pizza VALUES (20, 'Filé com Batata Palha');
INSERT INTO delivery.sabor_pizza VALUES (21, 'Frango com Batata Palha');
INSERT INTO delivery.sabor_pizza VALUES (22, 'Filé ao Quatro Queijos');
INSERT INTO delivery.sabor_pizza VALUES (23, 'Cheddar e Bacon');
INSERT INTO delivery.sabor_pizza VALUES (24, 'Pepperoni');
INSERT INTO delivery.sabor_pizza VALUES (25, 'Charque');
INSERT INTO delivery.sabor_pizza VALUES (26, 'Lombo com Catupiry');
INSERT INTO delivery.sabor_pizza VALUES (27, 'Canadense');
INSERT INTO delivery.sabor_pizza VALUES (28, 'Cinco Queijos');
INSERT INTO delivery.sabor_pizza VALUES (29, 'Palmito');
INSERT INTO delivery.sabor_pizza VALUES (30, 'Chocolate Preto');
INSERT INTO delivery.sabor_pizza VALUES (31, 'Chocolate Branco');
INSERT INTO delivery.sabor_pizza VALUES (32, 'Chocolate Preto com Nozes');
INSERT INTO delivery.sabor_pizza VALUES (33, 'Chocolate Branco com Nozes');
INSERT INTO delivery.sabor_pizza VALUES (34, 'M&M''s');
INSERT INTO delivery.sabor_pizza VALUES (35, 'Kit Kat');
INSERT INTO delivery.sabor_pizza VALUES (36, 'Sorvete');
INSERT INTO delivery.sabor_pizza VALUES (37, 'Banana e Canela');
INSERT INTO delivery.sabor_pizza VALUES (38, 'Romeu e Julieta');
INSERT INTO delivery.sabor_pizza VALUES (39, 'Chocolate Preto com Morango');
INSERT INTO delivery.sabor_pizza VALUES (40, 'Chocolate Branco com Morango');
INSERT INTO delivery.sabor_pizza VALUES (41, 'Prestígio');
INSERT INTO delivery.sabor_pizza VALUES (42, 'Brigadeiro');
INSERT INTO delivery.sabor_pizza VALUES (43, 'Beijinho');
INSERT INTO delivery.sabor_pizza VALUES (44, 'Califórnia');
INSERT INTO delivery.sabor_pizza VALUES (45, 'Vegetariana');


--
-- Data for Name: situacao_pedido; Type: TABLE DATA; Schema: delivery; Owner: postgres
--

INSERT INTO delivery.situacao_pedido VALUES ('A', 'Atrasado');
INSERT INTO delivery.situacao_pedido VALUES ('E', 'Entregando');
INSERT INTO delivery.situacao_pedido VALUES ('F', 'Finalizado');
INSERT INTO delivery.situacao_pedido VALUES ('P', 'Pendente');
INSERT INTO delivery.situacao_pedido VALUES ('C', 'Cancelado');
INSERT INTO delivery.situacao_pedido VALUES ('R', 'Reservado');


--
-- Data for Name: tamanho_pizza; Type: TABLE DATA; Schema: delivery; Owner: postgres
--

INSERT INTO delivery.tamanho_pizza VALUES (1, 'Broto', '25', 20);
INSERT INTO delivery.tamanho_pizza VALUES (2, 'Pequena', '30', 25);
INSERT INTO delivery.tamanho_pizza VALUES (3, 'Média', '35', 30);
INSERT INTO delivery.tamanho_pizza VALUES (4, 'Grande', '40', 35);
INSERT INTO delivery.tamanho_pizza VALUES (5, 'Família', '45', 40);
INSERT INTO delivery.tamanho_pizza VALUES (6, 'Gigante', '50', 45);


--
-- Name: cargos_id_cargo_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('delivery.cargos_id_cargo_seq', 7, true);


--
-- Name: cidade_id_cidade_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('delivery.cidade_id_cidade_seq', 35, true);


--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('delivery.cliente_id_cliente_seq', 100, true);


--
-- Name: distribuidor_id_distribuidor_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('delivery.distribuidor_id_distribuidor_seq', 30, true);


--
-- Name: estado_id_estado_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('delivery.estado_id_estado_seq', 28, true);


--
-- Name: estoque_ingred_id_item_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('delivery.estoque_ingred_id_item_seq', 44, true);


--
-- Name: filial_id_filial_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('delivery.filial_id_filial_seq', 27, true);


--
-- Name: funcionario_id_func_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('delivery.funcionario_id_func_seq', 1, false);


--
-- Name: nota_compras_id_compra_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('delivery.nota_compras_id_compra_seq', 1, false);


--
-- Name: nota_pedidos_id_pedido_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('delivery.nota_pedidos_id_pedido_seq', 107, true);


--
-- Name: sabor_pizza_id_sabor_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('delivery.sabor_pizza_id_sabor_seq', 3, true);


--
-- Name: tamanho_pizza_id_tamanho_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('delivery.tamanho_pizza_id_tamanho_seq', 1, true);


--
-- Name: cargos cargos_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (id_cargo);


--
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id_cidade);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- Name: distribuidor distribuidor_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.distribuidor
    ADD CONSTRAINT distribuidor_pkey PRIMARY KEY (id_distribuidor);


--
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id_estado);


--
-- Name: estoque_ingred estoque_ingred_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.estoque_ingred
    ADD CONSTRAINT estoque_ingred_pkey PRIMARY KEY (id_item);


--
-- Name: filial filial_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.filial
    ADD CONSTRAINT filial_pkey PRIMARY KEY (id_filial);


--
-- Name: funcionario funcionario_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id_func);


--
-- Name: nota_compras nota_compras_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.nota_compras
    ADD CONSTRAINT nota_compras_pkey PRIMARY KEY (id_compra, id_item);


--
-- Name: nota_pedidos nota_pedidos_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.nota_pedidos
    ADD CONSTRAINT nota_pedidos_pkey PRIMARY KEY (id_pedido);


--
-- Name: sabor_pizza sabor_pizza_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.sabor_pizza
    ADD CONSTRAINT sabor_pizza_pkey PRIMARY KEY (id_sabor);


--
-- Name: situacao_pedido situacao_pedido_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.situacao_pedido
    ADD CONSTRAINT situacao_pedido_pkey PRIMARY KEY (id_situacao);


--
-- Name: tamanho_pizza tamanho_pizza_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.tamanho_pizza
    ADD CONSTRAINT tamanho_pizza_pkey PRIMARY KEY (id_tamanho);


--
-- Name: funcionario fk_cargo; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.funcionario
    ADD CONSTRAINT fk_cargo FOREIGN KEY (id_cargo) REFERENCES delivery.cargos(id_cargo);


--
-- Name: distribuidor fk_cidade; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.distribuidor
    ADD CONSTRAINT fk_cidade FOREIGN KEY (id_cidade) REFERENCES delivery.cidade(id_cidade);


--
-- Name: cliente fk_cidade; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.cliente
    ADD CONSTRAINT fk_cidade FOREIGN KEY (id_cidade) REFERENCES delivery.cidade(id_cidade);


--
-- Name: filial fk_cidade; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.filial
    ADD CONSTRAINT fk_cidade FOREIGN KEY (id_cidade) REFERENCES delivery.cidade(id_cidade);


--
-- Name: nota_pedidos fk_cliente; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.nota_pedidos
    ADD CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES delivery.cliente(id_cliente);


--
-- Name: nota_compras fk_dist; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.nota_compras
    ADD CONSTRAINT fk_dist FOREIGN KEY (id_dist) REFERENCES delivery.distribuidor(id_distribuidor);


--
-- Name: cidade fk_estado; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.cidade
    ADD CONSTRAINT fk_estado FOREIGN KEY (id_estado) REFERENCES delivery.estado(id_estado);


--
-- Name: funcionario fk_filial; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.funcionario
    ADD CONSTRAINT fk_filial FOREIGN KEY (id_filial) REFERENCES delivery.filial(id_filial);


--
-- Name: nota_compras fk_func; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.nota_compras
    ADD CONSTRAINT fk_func FOREIGN KEY (id_func) REFERENCES delivery.funcionario(id_func);


--
-- Name: nota_pedidos fk_func; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.nota_pedidos
    ADD CONSTRAINT fk_func FOREIGN KEY (id_func) REFERENCES delivery.funcionario(id_func);


--
-- Name: nota_compras fk_item; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.nota_compras
    ADD CONSTRAINT fk_item FOREIGN KEY (id_item) REFERENCES delivery.estoque_ingred(id_item);


--
-- Name: itens_pedido fk_pedido; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.itens_pedido
    ADD CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES delivery.nota_pedidos(id_pedido);


--
-- Name: itens_pedido fk_sabor; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.itens_pedido
    ADD CONSTRAINT fk_sabor FOREIGN KEY (id_sabor) REFERENCES delivery.sabor_pizza(id_sabor);


--
-- Name: nota_pedidos fk_situacao; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.nota_pedidos
    ADD CONSTRAINT fk_situacao FOREIGN KEY (situacao) REFERENCES delivery.situacao_pedido(id_situacao);


--
-- Name: itens_pedido fk_tamanho; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY delivery.itens_pedido
    ADD CONSTRAINT fk_tamanho FOREIGN KEY (id_tamanho) REFERENCES delivery.tamanho_pizza(id_tamanho);


--
-- PostgreSQL database dump complete
--

