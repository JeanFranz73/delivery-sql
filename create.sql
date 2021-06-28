create table cargos
(
	id_cargo serial not null,
	nome varchar(20) not null,
	descricao varchar(50) not null,
	constraint cargos_pkey
		primary key (id_cargo)
);

create table estado
(
	id_estado serial not null,
	nome varchar(20) not null,
	sigla varchar(2),
	constraint estado_pkey
		primary key (id_estado)
);

create table cidade
(
	id_cidade serial not null,
	id_estado integer not null,
	nome varchar(20) not null,
	constraint cidade_pkey
		primary key (id_cidade),
	constraint fk_estado
		foreign key (id_estado) references estado
);

create table cliente
(
	id_cliente serial not null,
	nome varchar(30) not null,
	telefone integer,
	endereco varchar(50),
	id_cidade integer not null,
	constraint cliente_pkey
		primary key (id_cliente),
	constraint fk_cidade
		foreign key (id_cidade) references cidade
);

create table distribuidor
(
	id_distribuidor serial not null,
	nome varchar(30) not null,
	id_cidade integer not null,
	constraint distribuidor_pkey
		primary key (id_distribuidor),
	constraint fk_cidade
		foreign key (id_cidade) references cidade
);

create table estoque_ingred
(
	id_item serial not null,
	nome varchar(20) not null,
	descricao varchar(50),
	quantidade integer,
	constraint estoque_ingred_pkey
		primary key (id_item)
);

create table filial
(
	id_filial serial not null,
	nome varchar(30) not null,
	id_cidade integer not null,
	constraint filial_pkey
		primary key (id_filial),
	constraint fk_cidade
		foreign key (id_cidade) references cidade
);

create table funcionario
(
	id_func serial not null,
	id_filial integer not null,
	id_cargo integer not null,
	nome varchar(20) not null,
	constraint funcionario_pkey
		primary key (id_func),
	constraint fk_cargo
		foreign key (id_cargo) references cargos,
	constraint fk_filial
		foreign key (id_filial) references filial
);

create table nota_compras
(
	id_compra serial not null,
	id_item integer not null,
	id_func integer not null,
	id_dist integer not null,
	data_compra date not null,
	descricao varchar(50),
	constraint nota_compras_pkey
		primary key (id_compra, id_item),
	constraint fk_dist
		foreign key (id_dist) references distribuidor,
	constraint fk_func
		foreign key (id_func) references funcionario,
	constraint fk_item
		foreign key (id_item) references estoque_ingred
);

create table sabor_pizza
(
	id_sabor serial not null,
	nome varchar(30) not null,
	constraint sabor_pizza_pkey
		primary key (id_sabor)
);

create table tamanho_pizza
(
	id_tamanho serial not null,
	nome varchar(20) not null,
	tamanho varchar(30) not null,
	preco integer not null,
	constraint tamanho_pizza_pkey
		primary key (id_tamanho)
);

create table situacao_pedido
(
	id_situacao char not null,
	descricao varchar(20),
	constraint situacao_pedido_pkey
		primary key (id_situacao)
);

create table nota_pedidos
(
	id_pedido serial not null,
	id_func integer not null,
	id_cliente integer not null,
	observacao varchar(50),
	data_pedido date,
	situacao char,
	constraint nota_pedidos_pkey
		primary key (id_pedido),
	constraint fk_cliente
		foreign key (id_cliente) references cliente,
	constraint fk_func
		foreign key (id_func) references funcionario,
	constraint fk_situacao
		foreign key (situacao) references situacao_pedido
);

create table itens_pedido
(
	id_pedido integer not null,
	id_tamanho integer not null,
	id_sabor integer not null,
	quantidade integer not null,
	observacao varchar(50),
	constraint fk_pedido
		foreign key (id_pedido) references nota_pedidos,
	constraint fk_sabor
		foreign key (id_sabor) references sabor_pizza,
	constraint fk_tamanho
		foreign key (id_tamanho) references tamanho_pizza
);