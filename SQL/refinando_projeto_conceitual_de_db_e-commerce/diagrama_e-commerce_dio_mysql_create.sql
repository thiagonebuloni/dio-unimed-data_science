CREATE TABLE `cliente` (
	`id_cliente` INT(45) NOT NULL AUTO_INCREMENT,
	`nome` varchar(45) NOT NULL,
	`identificacao` varchar(14) NOT NULL UNIQUE,
	`endereco` varchar(45) NOT NULL AUTO_INCREMENT,
	`n_cartao_credito` varchar(16) NOT NULL UNIQUE,
	`telefone` varchar(9) NOT NULL,
	`e-mail` varchar(45) NOT NULL,
	PRIMARY KEY (`id_cliente`)
);

CREATE TABLE `pedido` (
	`id_pedido` INT(45) NOT NULL AUTO_INCREMENT,
	`status_pedido` varchar(45) NOT NULL,
	`descricao` varchar(45) NOT NULL,
	`id_cliente` INT NOT NULL,
	`frete` FLOAT NOT NULL,
	`data_pedido` DATETIME(14) NOT NULL,
	`forma_pagamento` varchar(16) NOT NULL,
	PRIMARY KEY (`id_pedido`)
);

CREATE TABLE `produto` (
	`id_produto` INT(45) NOT NULL AUTO_INCREMENT,
	`categoria` varchar(45) NOT NULL,
	`descricao` varchar(45) NOT NULL,
	`valor` DECIMAL(45) NOT NULL,
	PRIMARY KEY (`id_produto`)
);

CREATE TABLE `fornecedor` (
	`id_fornecedor` INT(45) NOT NULL AUTO_INCREMENT,
	`razao_social` varchar(45) NOT NULL UNIQUE,
	`cnpj` varchar(14) NOT NULL UNIQUE,
	PRIMARY KEY (`id_fornecedor`)
);

CREATE TABLE `disponibiliza_produto` (
	`fornecedor_id_fornecedor` INT(45) NOT NULL,
	`produto_id_produto` INT(45) NOT NULL
);

CREATE TABLE `estoque` (
	`id_estoque` INT(45) NOT NULL AUTO_INCREMENT,
	`local` varchar(45) NOT NULL,
	PRIMARY KEY (`id_estoque`)
);

CREATE TABLE `relacao_produto_estoque` (
	`produto_id_produto` INT(45) NOT NULL,
	`estoque_id_estoque` INT(45) NOT NULL,
	`quantidade` INT(45) NOT NULL
);

CREATE TABLE `relacao_produto_pedido` (
	`produto_id_produto` INT NOT NULL,
	`pedido_id_pedido` INT NOT NULL,
	`quantidade` varchar(45) NOT NULL
);

CREATE TABLE `terceiro_vendedor` (
	`id_terceiro` INT NOT NULL AUTO_INCREMENT,
	`nome_razao_social` varchar(45) NOT NULL,
	`local` varchar(45) NOT NULL,
	`identificacao` varchar(45) NOT NULL UNIQUE,
	PRIMARY KEY (`id_terceiro`)
);

CREATE TABLE `produtos_vendedor_terceiro` (
	`terceiro_vendedor_ir_terceiro` INT NOT NULL,
	`produto_id_produto` INT NOT NULL,
	`quantidade` INT NOT NULL
);

CREATE TABLE `entrega` (
	`id_entrega` INT(45) NOT NULL AUTO_INCREMENT,
	`pedido_id_pedido` INT(45) NOT NULL,
	`cliente_id_cliente` INT(45) NOT NULL,
	`status` varchar(45) NOT NULL,
	`cod_rastreio` varchar(45) NOT NULL,
	PRIMARY KEY (`id_entrega`)
);

CREATE TABLE `cartao_credito` (
	`n_cartao_credito` varchar(16) NOT NULL,
	`data_expiracao` varchar(4) NOT NULL,
	`nome_cliente_cartao` varchar(20) NOT NULL,
	`cliente_id_cliente` INT(45) NOT NULL,
	PRIMARY KEY (`n_cartao_credito`)
);

ALTER TABLE `cliente` ADD CONSTRAINT `cliente_fk0` FOREIGN KEY (`n_cartao_credito`) REFERENCES `cartao_credito`(`n_cartao_credito`);

ALTER TABLE `pedido` ADD CONSTRAINT `pedido_fk0` FOREIGN KEY (`id_cliente`) REFERENCES `cliente`(`id_cliente`);

ALTER TABLE `pedido` ADD CONSTRAINT `pedido_fk1` FOREIGN KEY (`forma_pagamento`) REFERENCES `cliente`(`n_cartao_credito`);

ALTER TABLE `disponibiliza_produto` ADD CONSTRAINT `disponibiliza_produto_fk0` FOREIGN KEY (`fornecedor_id_fornecedor`) REFERENCES `fornecedor`(`id_fornecedor`);

ALTER TABLE `disponibiliza_produto` ADD CONSTRAINT `disponibiliza_produto_fk1` FOREIGN KEY (`produto_id_produto`) REFERENCES `produto`(`id_produto`);

ALTER TABLE `relacao_produto_estoque` ADD CONSTRAINT `relacao_produto_estoque_fk0` FOREIGN KEY (`produto_id_produto`) REFERENCES `produto`(`id_produto`);

ALTER TABLE `relacao_produto_estoque` ADD CONSTRAINT `relacao_produto_estoque_fk1` FOREIGN KEY (`estoque_id_estoque`) REFERENCES `estoque`(`id_estoque`);

ALTER TABLE `relacao_produto_pedido` ADD CONSTRAINT `relacao_produto_pedido_fk0` FOREIGN KEY (`produto_id_produto`) REFERENCES `produto`(`id_produto`);

ALTER TABLE `relacao_produto_pedido` ADD CONSTRAINT `relacao_produto_pedido_fk1` FOREIGN KEY (`pedido_id_pedido`) REFERENCES `pedido`(`id_pedido`);

ALTER TABLE `produtos_vendedor_terceiro` ADD CONSTRAINT `produtos_vendedor_terceiro_fk0` FOREIGN KEY (`terceiro_vendedor_ir_terceiro`) REFERENCES `terceiro_vendedor`(`id_terceiro`);

ALTER TABLE `produtos_vendedor_terceiro` ADD CONSTRAINT `produtos_vendedor_terceiro_fk1` FOREIGN KEY (`produto_id_produto`) REFERENCES `produto`(`id_produto`);

ALTER TABLE `entrega` ADD CONSTRAINT `entrega_fk0` FOREIGN KEY (`pedido_id_pedido`) REFERENCES `pedido`(`id_pedido`);

ALTER TABLE `entrega` ADD CONSTRAINT `entrega_fk1` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `cliente`(`id_cliente`);

ALTER TABLE `cartao_credito` ADD CONSTRAINT `cartao_credito_fk0` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `cliente`(`id_cliente`);













