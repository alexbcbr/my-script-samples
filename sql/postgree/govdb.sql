--create table cidadao(id integer, nome varchar(30), endereco varchar(40));
--insert into cidadao values(1, 'Alex', 'av paulista, 1000');
--insert into cidadao values(2, 'Joao', 'av paulista, 1000');
--insert into cidadao values(3, 'Maria', 'av paulista, 1000');
--insert into cidadao values(6, 'Pedro-bi', 'av paulista, 1000');


delete from cidadao where id < 5;

select * from cidadao;