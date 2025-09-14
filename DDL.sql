
-- =============================================
-- Script DDL - Banco de Dados Oficina Mecânica
-- =============================================

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50),
    ano INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Mecanico (
    id_mecanico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    especialidade VARCHAR(100)
);

CREATE TABLE Equipe (
    id_equipe INT PRIMARY KEY AUTO_INCREMENT,
    nome_equipe VARCHAR(100) NOT NULL
);

CREATE TABLE Equipe_Mecanico (
    id_equipe INT,
    id_mecanico INT,
    PRIMARY KEY (id_equipe, id_mecanico),
    FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe),
    FOREIGN KEY (id_mecanico) REFERENCES Mecanico(id_mecanico)
);

CREATE TABLE Ordem_Servico (
    id_os INT PRIMARY KEY AUTO_INCREMENT,
    data_emissao DATE NOT NULL,
    data_conclusao DATE,
    valor_total DECIMAL(10,2),
    status VARCHAR(50),
    id_cliente INT,
    id_veiculo INT,
    id_equipe INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
    FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe)
);

CREATE TABLE Servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(200) NOT NULL,
    valor_referencia DECIMAL(10,2) NOT NULL
);

CREATE TABLE OS_Servico (
    id_os INT,
    id_servico INT,
    quantidade INT NOT NULL DEFAULT 1,
    valor_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_os, id_servico),
    FOREIGN KEY (id_os) REFERENCES Ordem_Servico(id_os),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

CREATE TABLE Peca (
    id_peca INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(200) NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    fornecedor VARCHAR(100)
);

CREATE TABLE OS_Peca (
    id_os INT,
    id_peca INT,
    quantidade INT NOT NULL DEFAULT 1,
    valor_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_os, id_peca),
    FOREIGN KEY (id_os) REFERENCES Ordem_Servico(id_os),
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);
