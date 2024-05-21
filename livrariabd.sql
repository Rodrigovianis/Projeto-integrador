CREATE TABLE editora (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    cidade VARCHAR(45) NOT NULL
);

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    senha VARCHAR(32)
);

CREATE TABLE livro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(120),
    autor VARCHAR(60),
    ano INT,
    preco DOUBLE,
    foto VARCHAR(45),
    idEditora INT,
    FOREIGN KEY (idEditora) REFERENCES editora(id)
);
