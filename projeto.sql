DROP DATABASE IF EXISTS mecanica;
CREATE DATABASE mecanica;
USE mecanica;

CREATE TABLE funcionario (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL
,cpf VARCHAR(20) NOT NULL UNIQUE
,telefone VARCHAR(20) NOT NULL UNIQUE
,tipo_funcionario VARCHAR(255) NOT NULL
);

INSERT INTO funcionario (nome, cpf, telefone, tipo_funcionario) VALUES ('JOÃO', '123.456.789-10','1234-5678','GERENTE');
INSERT INTO funcionario (nome, cpf, telefone, tipo_funcionario) VALUES ('RICARDO','109.876.543-21','8765-4321','MECANICO');
INSERT INTO funcionario (nome, cpf, telefone, tipo_funcionario) VALUES ('MARIA','235.472.214.-12','4002-8922','SECRETARIA');

CREATE TABLE cliente (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL
,cpf VARCHAR(20) NOT NULL UNIQUE
,telefone VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO cliente (nome, cpf, telefone) VALUES ('AMANDA', '127.436.759-10','1234-5678');
INSERT INTO cliente (nome, cpf, telefone) VALUES ('JONES','129.836.563-91','8765-4321');
INSERT INTO cliente (nome, cpf, telefone) VALUES ('RODRICK','247.432.714.-12','4002-8922');

CREATE TABLE agendamento (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,data_serv DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,valor DECIMAL(8,2)
,funcionario_id INT NOT NULL
,cliente_id INT NOT NULL
,FOREIGN KEY (funcionario_id) REFERENCES funcionario (id)
,FOREIGN KEY (cliente_id) REFERENCES cliente (id)
);

INSERT INTO agendamento (valor, funcionario_id, cliente_id) VALUES (100, 1, 3);
INSERT INTO agendamento (valor, funcionario_id, cliente_id) VALUES (250, 3, 2);
INSERT INTO agendamento (valor, funcionario_id, cliente_id) VALUES (75, 2, 1);

CREATE TABLE servico (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,servico VARCHAR(255)
,data_estimada_entrega DATETIME NOT NULL
,funcionario_id INT NOT NULL
,agendamento_id INT NOT NULL
,FOREIGN KEY (funcionario_id) REFERENCES funcionario (id)
,FOREIGN KEY (agendamento_id) REFERENCES agendamento (id)
);

INSERT INTO servico (servico, data_estimada_entrega, funcionario_id, agendamento_id) VALUES ('REVISAO','2023-05-22', 1, 3);
INSERT INTO servico (servico, data_estimada_entrega, funcionario_id, agendamento_id) VALUES ('TROCA DE OLEO','2023-02-23', 3, 2);
INSERT INTO servico (servico, data_estimada_entrega, funcionario_id, agendamento_id) VALUES ('CABEÇOTE ESTOURADO','2023-07-27', 2, 1);

CREATE TABLE veiculo(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,marca VARCHAR(255) NOT NULL UNIQUE
,modelo VARCHAR(255) NOT NULL UNIQUE
,ano CHAR(4) NOT NULL
,placa CHAR(7) NOT NULL UNIQUE
,cliente_id INT NOT NULL
,servico_id INT NOT NULL
,FOREIGN KEY (cliente_id) REFERENCES cliente (id)
,FOREIGN KEY (servico_id) REFERENCES servico (id)
);

INSERT INTO veiculo (marca, modelo, ano, placa, cliente_id, servico_id) VALUES ('VOLKSWAGEN','SAVEIRO', 2012, 1265342, 1, 3);
INSERT INTO veiculo (marca, modelo, ano, placa, cliente_id, servico_id) VALUES ('FIAT','UNO', 2010, 7654321, 3, 2);
INSERT INTO veiculo (marca, modelo, ano, placa, cliente_id, servico_id) VALUES ('CHEVROLET','ASTRA', 2015, 1234567, 2, 1);

CREATE TABLE pagamento(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,tipo_pagamento VARCHAR(255) NOT NULL
,pagamento DECIMAL(8,2) NOT NULL
,data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP
,agendamento_id INT NOT NULL
,FOREIGN KEY (agendamento_id) REFERENCES agendamento (id)
);

INSERT INTO pagamento (tipo_pagamento, pagamento, agendamento_id) VALUES ('A VISTA NO DINHEIRO', 100,  3);
INSERT INTO pagamento (tipo_pagamento, pagamento, agendamento_id) VALUES ('CREDITO NO CARTÃO', 250, 2);
INSERT INTO pagamento (tipo_pagamento, pagamento, agendamento_id) VALUES ('DEBITO NO CARTÃO', 75, 1);

SELECT * FROM funcionario;
SELECT * FROM cliente;
SELECT * FROM agendamento;
SELECT * FROM servico;
SELECT * FROM veiculo;
SELECT * FROM pagamento;