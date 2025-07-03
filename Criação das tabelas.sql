Criação das tabelas

CREATE TABLE aluno (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento INT
);

CREATE TABLE professor (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento INT
);

CREATE TABLE materia (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES professor(id)
);

CREATE TABLE provas (
    id_aluno INT,
    id_materia INT,
    nota FLOAT,
    data_da_prova DATE,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id),
    FOREIGN KEY (id_materia) REFERENCES materia(id)
);

Inserção de dados

 Alunos
INSERT INTO aluno (id, nome, data_nascimento) VALUES
  (1, 'Lucas Martins', 20050312),
  (2, 'Fernanda Rocha', 20040621),
  (3, 'João Pedro Alves', 20050130);

Professor
INSERT INTO professor (id, nome, data_nascimento) VALUES
  (1, 'Eduardo Santana', 19830305);

 Matéria
INSERT INTO materia (id, nome, id_professor) VALUES
  (1, 'História', 1);

Provas
INSERT INTO provas (id_aluno, id_materia, nota, data_da_prova) VALUES
  (1, 1, 7.5, '2025-06-25'),
  (2, 1, 8.8, '2025-06-25'),
  (3, 1, 6.9, '2025-06-25');

Consulta para ver os resultados
SELECT 
  a.nome AS aluno,
  p.nota,
  p.data_da_prova,
  m.nome AS materia,
  prof.nome AS professor
FROM provas p
JOIN aluno a ON p.id_aluno = a.id
JOIN materia m ON p.id_materia = m.id
JOIN professor prof ON m.id_professor = prof.id
WHERE p.id_materia = 1;
