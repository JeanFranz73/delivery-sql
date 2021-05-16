create table if not exists estado
(
    id_estado serial      not null,
    nome      varchar(20) not null,
    primary key (id_estado)
);

create table if not exists cidade
(
    id_cidade serial      not null,
    id_estado int         not null,
    nome      varchar(20) not null,
    primary key (id_cidade),
    constraint fk_estado
        foreign key (id_estado)
            references estado (id_estado)
);

create table if not exists filial
(
    id_filial serial      not null,
    nome      varchar(30) not null,
    id_cidade int         not null,
    primary key (id_filial),
    constraint fk_cidade
        foreign key (id_cidade)
            references cidade (id_cidade)
);

create table if not exists distribuidor
(
    id_distribuidor serial      not null,
    nome            varchar(30) not null,
    id_cidade       int         not null,
    primary key (id_distribuidor),
    constraint fk_cidade
        foreign key (id_cidade)
            references cidade (id_cidade)
);

create table if not exists cliente
(
    id_cliente serial      not null,
    nome       varchar(30) not null,
    telefone   int,
    endereco   varchar(50),
    id_cidade  int         not null,
    primary key (id_cliente),
    constraint fk_cidade
        foreign key (id_cidade)
            references cidade (id_cidade)
);

create table if not exists cargos
(
    id_cargo  serial      not null,
    nome      varchar(20) not null,
    descricao varchar(50) not null,
    primary key (id_cargo)
);

create table if not exists funcionario
(
    id_func   serial      not null,
    id_filial int         not null,
    id_cargo  int         not null,
    nome      varchar(20) not null,
    primary key (id_func),
    constraint fk_filial
        foreign key (id_filial)
            references filial (id_filial),
    constraint fk_cargo
        foreign key (id_cargo)
            references cargos (id_cargo)
);

create table if not exists tamanho_pizza
(
    id_tamanho serial      not null,
    nome       varchar(20) not null,
    tamanho    varchar(30) not null,
    preco      int         not null,
    primary key (id_tamanho)
);

create table if not exists sabor_pizza
(
    id_sabor  serial      not null,
    nome      varchar(30) not null,
    descricao varchar(50) not null,
    primary key (id_sabor)
);

create table if not exists estoque_ingred
(
    id_item   serial      not null,
    nome      varchar(20) not null,
    descricao varchar(50),
    primary key (id_item)
);

create table if not exists nota_compras
(
    id_compra   serial not null,
    id_item     int    not null,
    id_func     int    not null,
    id_dist     int    not null,
    data_compra date   not null,
    descricao   varchar(50),
    primary key (id_compra, id_item),
    constraint fk_func
        foreign key (id_func)
            references funcionario (id_func),
    constraint fk_dist
        foreign key (id_dist)
            references distribuidor (id_distribuidor),
    constraint fk_item
        foreign key (id_item)
            references estoque_ingred (id_item)
);

create table if not exists nota_pedidos
(
    id_pedido   serial not null,
    id_func     int    not null,
    id_cliente  int    not null,
    observacao  varchar(50),
    data_pedido date,
    primary key (id_pedido),
    constraint fk_func
        foreign key (id_func)
            references funcionario (id_func),
    constraint fk_cliente
        foreign key (id_cliente)
            references cliente (id_cliente)
);

create table if not exists itens_pedido
(
    id_pedido  int not null,
    id_tamanho int not null,
    id_sabor   int not null,
    quantidade int not null,
    observacao varchar(50),
    primary key (id_pedido),
    constraint fk_pedido
        foreign key (id_pedido)
            references nota_pedidos (id_pedido),
    constraint fk_tamanho
        foreign key (id_tamanho)
            references tamanho_pizza (id_tamanho),
    constraint fk_sabor
        foreign key (id_sabor)
            references sabor_pizza (id_sabor)
);