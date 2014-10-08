create database IF NOT EXISTS `govdb`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: govdb
-- ------------------------------------------------------
-- Server version	5.5.20
--
use govdb;

-- Table structure for table `Cidadao`
--
DROP TABLE IF EXISTS `Cidadao`;
create table Cidadao(
	cpf int not null primary key auto_increment,
	nome varchar(80) not null,
	telefone varchar(14),
	dt_nascimento date not null,
	cep char(9),
	cidade varchar(45),
	endereco varchar(150),
	bairro varchar(45),
	status_atividade boolean
);

LOCK TABLES `Cidadao` WRITE;
INSERT INTO `Cidadao` VALUES (1, 'Alex', '11-9999-9999', '1989-01-04','40405-000','Sao Paulo','Av Paulista, 1010','Paraiso', true);
INSERT INTO `Cidadao` VALUES (2, 'Joao', '11-8888-9999', '1978-01-04','40405-000','Sao Paulo','Av Paulista, 10','Tatuape', true);
INSERT INTO `Cidadao` VALUES (3, 'Maria', '11-7777-9999', '1975-01-04','40405-000','Sao Paulo','Av Paulista, 15','Sao Caetano', true);
INSERT INTO `Cidadao` VALUES (4, 'Pedro', '11-666-9999', '1972-01-04','40405-000','Sao Paulo','Av Paulista, 20','Penha', true);
INSERT INTO `Cidadao` VALUES (5, 'Joana', '41-999-9999', '1969-01-04','40405-000','Sao Paulo','Av Paulista, 1010','Belo Horizonte', true);
INSERT INTO `Cidadao` VALUES (6, 'Pablo', '11-9999-8888', '1967-01-04','40405-000','Sao Paulo','Av Paulista, 1010','Paraiso', false);

UNLOCK TABLES;
