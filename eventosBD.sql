
CREATE TABLE eventos (
    evento_id INT AUTO_INCREMENT PRIMARY KEY,  
    nome VARCHAR(255) NOT NULL,  
    data DATE NOT NULL,  
    local VARCHAR(255) NOT NULL,  
    descricao TEXT,  
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);


CREATE TABLE participantes (
    participante_id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255) NOT NULL,  
    email VARCHAR(255) NOT NULL UNIQUE, 
    telefone VARCHAR(20), 
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE evento_participante (
    evento_id INT,  
    participante_id INT,  
    PRIMARY KEY (evento_id, participante_id), 
    FOREIGN KEY (evento_id) REFERENCES eventos(evento_id) ON DELETE CASCADE, 
    FOREIGN KEY (participante_id) REFERENCES participantes(participante_id) ON DELETE CASCADE 
);
INSERT INTO eventos (nome, data, local, descricao) 
VALUES ('Fórum de Inovação', '2024-12-18', 'Auditório da Universidade', 'Um evento para discutir as últimas inovações em tecnologia.');
INSERT INTO participantes (nome, email, telefone);

VALUES ('Maria Oliveira', 'maria.oliveira@example.com', '987654321');

INSERT INTO evento_participante (evento_id, participante_id)
VALUES (1, 1);  
