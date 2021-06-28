/*

Universidade do Vale do Taquari – UNIVATES 
Banco de Dados 
Trabalho: Implementação de um Banco de Dados 
Professor: Evandro Franzen 
 
Integrantes: Fernando Halmenschlager Filter (703692), Jean Pedro Franz (683064) 

*/


/* 1 - Criar uma consulta que retorne quantos clientes cada filial possue.
       Devem ser mostrados o nome, a cidade e a quantidade de clientes da filial. */
   -- GROUP BY

select f.nome              as filial,
       cid.nome            as cidade,
       count(c.id_cliente) as qntd_clientes
from cliente c,
     cidade cid,
     filial f
where c.id_cidade = cid.id_cidade
  and cid.id_cidade = f.id_cidade
group by f.nome, cid.nome;

/* 2 - Queremos saber quais queijos precisam ser repostos no estoque, ou seja,
       que possuam a quantidade menor que 10 e com qual distribuidor pode ser comprado.
       Mostre o ID, nome, a quantidade atual do item no estoque e nome do distribuidor. */

select e.id_item,
       e.nome as ingrediente,
       e.quantidade,
       d.nome as distribuidor
from estoque_ingred e,
     nota_compras n,
     distribuidor d
where e.id_item = n.id_item
  and n.id_dist = d.id_distribuidor;

/* 3 - Precisamos saber a quantidade de movimentações das compras e pedidos das pizzarias
       do RS em determinado período. Criar uma função que receba a data inicial, data final
       e sigla do estado, retornando o nome da filial, a data dos pedidos e a data das compras. */
    -- TYPE, PROCEDURE

create type t_movFilialPeriodo as
(
    nome_filial  varchar(30),
    qntd_pedidos int,
    qntd_compras int
);

create or replace function f_movFilialPeriodo(dataInicial date, dataFinal date, siglaEstado varchar(2))
    returns setof t_movFilialPeriodo
as
$$
select f.nome              as filial,
       count(np.id_pedido) as pedidos,
       count(nc.id_compra) as compras
from filial f,
     cidade c,
     estado e,
     funcionario func,
     nota_compras nc
         full outer join nota_pedidos np on nc.id_func = np.id_func
where func.id_func = nc.id_func
  and f.id_cidade = c.id_cidade
  and c.id_estado = e.id_estado
  and e.sigla = siglaEstado
  and f.id_filial = func.id_filial
  and nc.data_compra between dataInicial and dataFinal
group by f.nome;

$$ language sql;

/* 4 - Criar uma consulta que mostre a lista de serviços de funcionários.
       Retornar o id e o nome o funcionário, o nome do seu cargo, o id da filial em que ele trabalha
       e a quantidade de pedidos que ele já realizou. Ordenar pelo id do funcionário */
   -- GROUP BY, ORDER BY, COUNT()

select f.id_func,
       f.nome              as funcionario,
       c.nome              as cargo,
       f.id_filial,
       count(np.id_pedido) as qntd_pedidosRealizados
from funcionario f,
     cargos c,
     nota_pedidos np
where f.id_cargo = c.id_cargo
  and f.id_func = np.id_func
group by f.id_func, c.nome
order by f.id_func;

/* 5 - Efetuar uma consulta que liste todos os pedidos feitos de pizzas com frango. Deve ser mostrado
        o id do pedido, o nome do tamanho, o preço, o sabor da pizza, observação do item pedido, sendo ela
        vazia ou não, e data do pedido. Ordene pela data */
   -- LEFT JOIN, LIKE, ORDER BY

select i.id_pedido,
       t.nome as tamanho,
       t.preco,
       s.nome as sabor,
       i.observacao,
       np.data_pedido
from itens_pedido i
         left join
     nota_pedidos np on i.id_pedido = np.id_pedido,
     tamanho_pizza t,
     sabor_pizza s
where i.id_tamanho = t.id_tamanho
  and i.id_sabor = s.id_sabor
  and s.nome like '%Frango%'
order by np.data_pedido;

/* 6 - Precisamos saber das informações dos clientes de um determinado estado. Crie uma procedure
       que receba a sigla do estado. Retorne o id, nome, telefone, o nome da cidade e o
       último pedido feito pelo cliente. Ordene pela data em forma decrescente */
   -- TYPE, PROCEDURE, 

create type t_infoCliente as
(
    id_cliente   int,
    nome_cliente varchar(30),
    telefone     int,
    nome_cid     varchar(20),
    ult_pedido   date
);

create or replace function f_infoClientes(siglaEstado varchar(2))
    returns setof t_infoCliente
as
$$
select c.id_cliente,
       c.nome              as cliente,
       c.telefone,
       cid.nome            as cidade,
       max(np.data_pedido) as ult_pedido
from cliente c,
     cidade cid,
     estado e,
     nota_pedidos np
where c.id_cidade = cid.id_cidade
  and cid.id_estado = e.id_estado
  and e.sigla = siglaEstado
  and np.id_cliente = c.id_cliente
group by c.id_cliente, cid.nome
order by ult_pedido desc;
$$ language sql;

select *
from f_infoClientes('RS');

/* 7 - Elabore um trigger que, ao ser adicionado um novo pedido, o coloca com a situação
       pendente e adiciona a data atual. */
   -- TRIGGER, PROCEDURE

create trigger t_statusPedido
    after insert
    on nota_pedidos
    for each row
execute procedure f_statusPedido();

create or replace function f_statusPedido()
    returns trigger
as
$$
declare
    idPedido int;
begin

    select max(np.id_pedido)
    into idPedido
    from nota_pedidos np;

    update nota_pedidos
    set data_pedido = current_date,
        situacao    = 'P'
    where id_pedido = idPedido;

    return null;

end;
$$ language plpgsql;

/* 8 - Para manter uma boa gestão, elabore uma trigger que, ao ser adicionado um novo pedido,
       o último pedido do cliente deve estar finalizada, para assim, não haver fraudes. */

create trigger t_verificaCliente
    after insert
    on nota_pedidos
    for each row
execute procedure f_verificaCliente();

create or replace function f_verificaCliente()
    returns trigger
as
$$
declare
    idPedido  int;
    sitPedido char;
begin

    select max(id_pedido), situacao
    into idPedido, sitPedido
    from nota_pedidos
    where id_cliente = new.id_cliente
    group by situacao;

    if (sitPedido <> 'F') then
        raise exception 'Impossível realizar novo pedido pois, o último pedido ainda está aberto.';
    end if;

    return null;

end;
$$ language plpgsql;

/* 9 - Escreva a quantidade de itens feitos nas pizzarias de cada cidade. Criar uma visão
   que faça a soma dos itens de cada cidade separadamente. Realize uma consulta que retorne
   o id, nome e quantidade de itens de cada cidade e ordene pela quantidade de itens. */

create or replace view v_qntdItensCidades(qntdItens, idCidade)
as
select sum(i.quantidade), c.id_cidade
from cidade c,
     itens_pedido i,
     funcionario func,
     filial f,
     nota_pedidos np
where np.id_pedido = i.id_pedido
  and f.id_cidade = c.id_cidade
  and func.id_filial = f.id_filial
  and np.id_func = func.id_func
group by c.id_cidade;

select v.idCidade, c.nome, v.qntdItens
from cidade c,
     v_qntdItensCidades v
where c.id_cidade = v.idCidade
order by v.qntdItens;

/* 10 - Diga o nome dos clientes que fizeram pedidos no primeiro semestre de 2018 e de 2019. Elabore uma visão para cada ano,
   informando quantos pedidos cada cliente fez. Realize uma consulta que retorne o nome do cliente, a quantidade de pedidos
   feitos em cada semestre. Caso algum cliente não fez pedido em alguns dos semestres, este deve retornar nulo, porém,
   se não houver pedidos em nenhum dos dois, não deve ser retornado. */

create or replace view v_pedidos1s_2018 (qntdPedidos2018, idCliente)
as
select sum(id_pedido), id_cliente
from nota_pedidos
where data_pedido between '2018-01-01' and '2018-06-30'
group by id_cliente;

create or replace view v_pedidos1s_2019 (qntdPedidos2019, idCliente)
as
select sum(id_pedido), id_cliente
from nota_pedidos
where data_pedido between '2019-01-01' and '2019-06-30'
group by id_cliente;

select c.nome, v2018.qntdPedidos2018, v2019.qntdPedidos2019
from cliente c
         left join v_pedidos1s_2018 v2018 on v2018.idCliente = c.id_cliente
         left join v_pedidos1s_2019 v2019 on v2019.idCliente = c.id_cliente
where (v2018.qntdPedidos2018 is not null or v2019.qntdPedidos2019 is not null);

/* 11 - Crie uma consulta de todos os distribuidores do Paraná, retornando o ID e nome do distribuidor,
   o nome de sua cidade, a quantidade de compras feitas por ele e a soma dos itens vendidos.
   Utilize o operador IN na seleção do estado em que reside o distribuidor. */

select d.id_distribuidor,
       d.nome              as distrubuidor,
       c.nome              as cidade,
       count(nc.id_compra) as qntd_compras,
       sum(nc.id_item)     as soma_itens
from nota_compras nc,
     distribuidor d,
     cidade c
where nc.id_dist = d.id_distribuidor
  and d.id_cidade = c.id_cidade
  and c.id_estado in (select id_estado
                      from estado
                      where id_estado = 16)
group by d.id_distribuidor, c.nome;

/* 12 - Elabore uma consulta de todos os pedidos feitos em filiais que não possuem "Pizza" em seu nome.
   Retorne o ID do pedido e da filial e o nome do Funcionário responsável e seu cargo, ordene pelo ID do
   pedido. Utilize o operador NOT IN para consultar o nome das filiais. */

select np.id_pedido,
       f.id_filial,
       f.nome as funcionario,
       c.nome as cargo
from nota_pedidos np,
     funcionario f,
     cargos c
where np.id_func = f.id_func
  and f.id_cargo = c.id_cargo
  and f.id_filial not in (select id_filial
                          from filial
                          where nome like '%Pizza%')
order by np.id_pedido;