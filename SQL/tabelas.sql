CREATE TABLE public."Area" (
    nome "char" NOT NULL,
    "tamanho X" bigint,
    "tamanho Y" bigint,
    descricao text
);


ALTER TABLE public."Area" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 24646)
-- Name: Quadrado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Quadrado" (
)
INHERITS (public."Area");


ALTER TABLE public."Quadrado" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 24623)
-- Name: TipoDePersonagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TipoDePersonagem" (
    "idPersonagem" bigint NOT NULL,
    "tipoPersonagem" name
);


ALTER TABLE public."TipoDePersonagem" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24669)
-- Name: Aliado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Aliado" (
    velocidade integer,
    vida integer,
    ataque integer,
    nome_completo name NOT NULL
)
INHERITS (public."TipoDePersonagem", public."Quadrado");


ALTER TABLE public."Aliado" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24706)
-- Name: Inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Inventario" (
    "ID" bigint NOT NULL,
    tamanho integer
);


ALTER TABLE public."Inventario" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24711)
-- Name: InventarioArmazenaItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InventarioArmazenaItem" (
    id_instancia bigint
)
INHERITS (public."Inventario");


ALTER TABLE public."InventarioArmazenaItem" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24714)
-- Name: InstanciaDeItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InstanciaDeItem" (
    "IdItem" bigint
)
INHERITS (public."InventarioArmazenaItem");


ALTER TABLE public."InstanciaDeItem" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24717)
-- Name: tipoDeItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."tipoDeItem" (
    "tipoItem" name
)
INHERITS (public."InstanciaDeItem");


ALTER TABLE public."tipoDeItem" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24726)
-- Name: ArmaBranca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ArmaBranca" (
    descricao text,
    "Valor" real,
    dano integer,
    local name
)
INHERITS (public."tipoDeItem");


ALTER TABLE public."ArmaBranca" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24720)
-- Name: Armadura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Armadura" (
    descricao text,
    valor real,
    defesa integer
)
INHERITS (public."tipoDeItem");


ALTER TABLE public."Armadura" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24652)
-- Name: Civil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Civil" (
    nome_completo name NOT NULL
)
INHERITS (public."Area", public."TipoDePersonagem");


ALTER TABLE public."Civil" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24773)
-- Name: Heroi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Heroi" (
    velocidade integer,
    vida integer,
    "XP" integer,
    moedas integer
)
INHERITS (public."Quadrado", public."InventarioArmazenaItem", public."Armadura");


ALTER TABLE public."Heroi" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24677)
-- Name: InstanciaDeAliado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InstanciaDeAliado" (
    "idInstanciaAliado" bigint NOT NULL
)
INHERITS (public."TipoDePersonagem");


ALTER TABLE public."InstanciaDeAliado" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24779)
-- Name: HeroiAjudaAliado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HeroiAjudaAliado" (
)
INHERITS (public."Heroi", public."InstanciaDeAliado");


ALTER TABLE public."HeroiAjudaAliado" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24661)
-- Name: Inimigo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Inimigo" (
    nome_completo name NOT NULL,
    velocidade integer,
    vida integer,
    ataque integer
)
INHERITS (public."TipoDePersonagem", public."Quadrado");


ALTER TABLE public."Inimigo" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24633)
-- Name: InstanciaDeInimigo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InstanciaDeInimigo" (
    "idInstanciaInimigo" bigint NOT NULL
)
INHERITS (public."TipoDePersonagem");


ALTER TABLE public."InstanciaDeInimigo" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24744)
-- Name: consumivel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumivel (
    descricao text,
    valor real,
    efeito name,
    local name
)
INHERITS (public."tipoDeItem");


ALTER TABLE public.consumivel OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24785)
-- Name: InimigoPossuiUtilitario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InimigoPossuiUtilitario" (
)
INHERITS (public."InstanciaDeInimigo", public.consumivel);


ALTER TABLE public."InimigoPossuiUtilitario" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24626)
-- Name: InstanciaDeCivil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InstanciaDeCivil" (
    "idInstanciaCivil" bigint NOT NULL
)
INHERITS (public."TipoDePersonagem");


ALTER TABLE public."InstanciaDeCivil" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24682)
-- Name: ItemSeLocalizaEmQuadrado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ItemSeLocalizaEmQuadrado" (
    "idInstancia" bigint NOT NULL
)
INHERITS (public."Quadrado");


ALTER TABLE public."ItemSeLocalizaEmQuadrado" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24690)
-- Name: Mercado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Mercado" (
    "ID" bigint NOT NULL
)
INHERITS (public."Area");


ALTER TABLE public."Mercado" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 24698)
-- Name: MercadoPossuiItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MercadoPossuiItem" (
    "IdMercado" bigint NOT NULL
)
INHERITS (public."Mercado");


ALTER TABLE public."MercadoPossuiItem" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24791)
-- Name: Vantagens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vantagens" (
    vantagem text
)
INHERITS (public."Armadura");


ALTER TABLE public."Vantagens" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24732)
-- Name: arco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arco (
    descricao text,
    valor real,
    dano integer,
    qtdeflechas integer,
    local name
)
INHERITS (public."tipoDeItem");


ALTER TABLE public.arco OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24738)
-- Name: bombas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bombas (
    descricao text,
    valor real,
    dano integer,
    alcance real,
    local name
)
INHERITS (public."tipoDeItem");


ALTER TABLE public.bombas OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24750)
-- Name: missao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.missao (
    "Nome" name NOT NULL,
    "Dificuldade" integer,
    "idTarefa" bigint[],
    "idHeroi" bigint
);


ALTER TABLE public.missao OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24759)
-- Name: recompensa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recompensa (
    recompensa real NOT NULL
)
INHERITS (public.missao);


ALTER TABLE public.recompensa OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24767)
-- Name: tarefa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarefa (
    objetivo text
)
INHERITS (public.missao);


ALTER TABLE public.tarefa OWNER TO postgres;

--
-- TOC entry 2810 (class 2606 OID 24676)
-- Name: Aliado Aliado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aliado"
    ADD CONSTRAINT "Aliado_pkey" PRIMARY KEY (nome_completo);


--
-- TOC entry 2804 (class 2606 OID 24645)
-- Name: Area Area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Area"
    ADD CONSTRAINT "Area_pkey" PRIMARY KEY (nome);


--
-- TOC entry 2806 (class 2606 OID 24659)
-- Name: Civil Civil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_pkey" PRIMARY KEY (nome_completo);


--
-- TOC entry 2808 (class 2606 OID 24668)
-- Name: Inimigo Inimigo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inimigo"
    ADD CONSTRAINT "Inimigo_pkey" PRIMARY KEY (nome_completo);


--
-- TOC entry 2812 (class 2606 OID 24681)
-- Name: InstanciaDeAliado InstanciaDeAliado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstanciaDeAliado"
    ADD CONSTRAINT "InstanciaDeAliado_pkey" PRIMARY KEY ("idInstanciaAliado");


--
-- TOC entry 2800 (class 2606 OID 24630)
-- Name: InstanciaDeCivil InstanciaDeCivil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstanciaDeCivil"
    ADD CONSTRAINT "InstanciaDeCivil_pkey" PRIMARY KEY ("idInstanciaCivil");


--
-- TOC entry 2802 (class 2606 OID 24637)
-- Name: InstanciaDeInimigo InstanciaDeInimigo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstanciaDeInimigo"
    ADD CONSTRAINT "InstanciaDeInimigo_pkey" PRIMARY KEY ("idInstanciaInimigo");


--
-- TOC entry 2820 (class 2606 OID 24710)
-- Name: Inventario Inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inventario"
    ADD CONSTRAINT "Inventario_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2814 (class 2606 OID 24689)
-- Name: ItemSeLocalizaEmQuadrado ItemSeLocalizaEmQuadrado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ItemSeLocalizaEmQuadrado"
    ADD CONSTRAINT "ItemSeLocalizaEmQuadrado_pkey" PRIMARY KEY ("idInstancia");


--
-- TOC entry 2818 (class 2606 OID 24705)
-- Name: MercadoPossuiItem MercadoPossuiItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MercadoPossuiItem"
    ADD CONSTRAINT "MercadoPossuiItem_pkey" PRIMARY KEY ("IdMercado");


--
-- TOC entry 2816 (class 2606 OID 24697)
-- Name: Mercado Mercado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mercado"
    ADD CONSTRAINT "Mercado_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2798 (class 2606 OID 24632)
-- Name: TipoDePersonagem TipoDePersonagem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoDePersonagem"
    ADD CONSTRAINT "TipoDePersonagem_pkey" PRIMARY KEY ("idPersonagem");


--
-- TOC entry 2822 (class 2606 OID 24757)
-- Name: missao missao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.missao
    ADD CONSTRAINT missao_pkey PRIMARY KEY ("Nome");


--
-- TOC entry 2824 (class 2606 OID 24766)
-- Name: recompensa recompensa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recompensa
    ADD CONSTRAINT recompensa_pkey PRIMARY KEY (recompensa);
