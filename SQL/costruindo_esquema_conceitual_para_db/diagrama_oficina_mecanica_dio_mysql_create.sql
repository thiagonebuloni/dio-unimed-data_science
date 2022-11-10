CREATE TABLE `cliente` (
	`id_cliente` int(45) NOT NULL AUTO_INCREMENT,
	`nome` varchar(45) NOT NULL,
	`telefone` varchar(14) NOT NULL,
	`e-mail` varchar(45) NOT NULL,
	`endereco` varchar(45) NOT NULL,
	PRIMARY KEY (`id_cliente`)
);

CREATE TABLE `veiculo` (
	`id_veiculo` int(45) NOT NULL AUTO_INCREMENT,
	`marca` varchar(45) NOT NULL,
	`modelo` varchar(45) NOT NULL,
	`ano` varchar(45) NOT NULL,
	`descricao` varchar(255),
	`combustivel` varchar(10) NOT NULL,
	`id_cliente` int(45) NOT NULL,
	PRIMARY KEY (`id_veiculo`)
);

CREATE TABLE `ordem_servico` (
	`id_os` int(45) NOT NULL AUTO_INCREMENT,
	`data_emissao` DATETIME(14) NOT NULL AUTO_INCREMENT,
	`data_entrega` DATETIME(14) NOT NULL,
	`descricao` varchar(255) NOT NULL,
	`revisao` bool(2) NOT NULL,
	`status` varchar(45) NOT NULL,
	`id_equipe` int(45) NOT NULL,
	`id_cliente` int(45) NOT NULL,
	`id_veiculo` int(45) NOT NULL,
	PRIMARY KEY (`id_os`)
);

CREATE TABLE `orcamento` (
	`id_os` int(45) NOT NULL,
	`valor` DECIMAL(12) NOT NULL,
	`descricao` varchar(45) NOT NULL,
	`id_mao_de_obra` int(45) NOT NULL,
	`id_peca` int(45),
	PRIMARY KEY (`id_os`)
);

CREATE TABLE `equipes` (
	`id_equipe` int(45) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id_equipe`)
);

CREATE TABLE `mecanicos` (
	`id_mecanico` int(45) NOT NULL AUTO_INCREMENT,
	`nome` varchar(45) NOT NULL,
	`endereco` varchar(126) NOT NULL,
	`especialidade` varchar(45) NOT NULL,
	`id_equipe` int(45) NOT NULL,
	PRIMARY KEY (`id_mecanico`)
);

CREATE TABLE `mao_de_obra` (
	`id_mao_de_obra` int(45) NOT NULL AUTO_INCREMENT,
	`descricao` varchar(45) NOT NULL,
	`valor` DECIMAL(12) NOT NULL,
	`tempo_execucao_horas` int(3) NOT NULL,
	PRIMARY KEY (`id_mao_de_obra`)
);

CREATE TABLE `pecas` (
	`id_peca` int(45) NOT NULL AUTO_INCREMENT,
	`descricao` varchar(45) NOT NULL,
	`valor` DECIMAL(12) NOT NULL,
	`veiculo` varbinary(45) NOT NULL,
	PRIMARY KEY (`id_peca`)
);

CREATE TABLE `estoque_pecas` (
	`id_peca` int(45) NOT NULL,
	`quantidade` int(45) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id_peca`)
);

ALTER TABLE `veiculo` ADD CONSTRAINT `veiculo_fk0` FOREIGN KEY (`id_cliente`) REFERENCES `cliente`(`id_cliente`);

ALTER TABLE `ordem_servico` ADD CONSTRAINT `ordem_servico_fk0` FOREIGN KEY (`id_equipe`) REFERENCES `equipes`(`id_equipe`);

ALTER TABLE `ordem_servico` ADD CONSTRAINT `ordem_servico_fk1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente`(`id_cliente`);

ALTER TABLE `ordem_servico` ADD CONSTRAINT `ordem_servico_fk2` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo`(`id_veiculo`);

ALTER TABLE `orcamento` ADD CONSTRAINT `orcamento_fk0` FOREIGN KEY (`id_os`) REFERENCES `ordem_servico`(`id_os`);

ALTER TABLE `orcamento` ADD CONSTRAINT `orcamento_fk1` FOREIGN KEY (`id_mao_de_obra`) REFERENCES `mao_de_obra`(`id_mao_de_obra`);

ALTER TABLE `orcamento` ADD CONSTRAINT `orcamento_fk2` FOREIGN KEY (`id_peca`) REFERENCES `pecas`(`id_peca`);

ALTER TABLE `mecanicos` ADD CONSTRAINT `mecanicos_fk0` FOREIGN KEY (`id_equipe`) REFERENCES `equipes`(`id_equipe`);

ALTER TABLE `estoque_pecas` ADD CONSTRAINT `estoque_pecas_fk0` FOREIGN KEY (`id_peca`) REFERENCES `pecas`(`id_peca`);










