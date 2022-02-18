create database desafiokoppex2
default character set utf8
default collate utf8_general_ci;

create table if not exists tb_infracoes(
id_infracoes int not null auto_increment,
situacao enum('y','n') not null,
velocidade_permitida decimal(5,2) not null,
velocidade_media decimal(5,2) not null,
dia date not null,
primary key (id_infracoes)
)default charset = utf8;

create table if not exists tb_remesssa(
id_remessa int not null auto_increment,
id_infracoes int not null,
total_multa double not null,
primary key (id_remessa),
foreign  key (id_infracoes) 
references tb_infracoes(id_infracoes)
)default charset = utf8;
 
 -- Busca 01
 
select tb_infracoes.velocidade_media, tb_infracoes.velocidade_permitida
from tb_infracoes inner join tb_remesssa
order by id_infracoes, velocidade_media >= velocidade_permitida;

-- Busca 02

select tb_infracoes.id_infracoes, tb_infracoes.situacao, tb_remesssa.total_multa
from tb_infracoes inner join tb_remesssa
order by situacao;
