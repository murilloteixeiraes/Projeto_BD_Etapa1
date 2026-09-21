-- Artefato A7: Script de Carga DML - Escola de Idiomas
-- Autor: Murillo

INSERT INTO Pessoa (nif, nome, email, data_nascimento) VALUES 
('P001', 'Ana Clara Silva', 'ana.silva@escola.pt', '1980-05-12'), ('P002', 'Bruno Costa', 'bruno.costa@escola.pt', '1975-08-22'),
('P003', 'Carlos Martins', 'carlos.m@escola.pt', '1990-11-03'), ('P004', 'Diana Rocha', 'diana.r@escola.pt', '1988-02-15'),
('P005', 'Eduardo Lima', 'eduardo.l@escola.pt', '1982-07-30'), ('P006', 'Fernanda Gomes', 'fernanda.g@escola.pt', '1992-09-10'),
('P007', 'Gilberto Sousa', 'gilberto.s@escola.pt', '1979-12-05'), ('P008', 'Helena Neves', 'helena.n@escola.pt', '1985-04-18'),
('P009', 'Igor Mendes', 'igor.m@escola.pt', '1991-06-25'), ('P010', 'Joana Pinto', 'joana.p@escola.pt', '1987-10-08'),
('A001', 'Lucas Andrade', 'lucas.a@aluno.pt', '2005-03-14'), ('A002', 'Mariana Oliveira', 'mariana.o@aluno.pt', '2004-11-20'),
('A003', 'Nuno Ribeiro', 'nuno.r@aluno.pt', '2006-01-10'), ('A004', 'Olívia Ferreira', 'olivia.f@aluno.pt', '2003-09-05'),
('A005', 'Paulo Carvalho', 'paulo.c@aluno.pt', '2002-07-12'), ('A006', 'Quintino Alves', 'quintino.a@aluno.pt', '2005-05-22'),
('A007', 'Rita Mendes', 'rita.m@aluno.pt', '2004-12-11'), ('A008', 'Samuel Castro', 'samuel.c@aluno.pt', '2001-08-28'),
('A009', 'Teresa Dias', 'teresa.d@aluno.pt', '2006-02-15'), ('A010', 'Ulisses Pires', 'ulisses.p@aluno.pt', '2003-04-30'),
('A011', 'Vanda Lopes', 'vanda.l@aluno.pt', '2005-10-18'), ('A012', 'Xavier Cunha', 'xavier.c@aluno.pt', '2002-11-25'),
('A013', 'Zélia Marques', 'zelia.m@aluno.pt', '2004-06-08'), ('A014', 'André Faria', 'andre.f@aluno.pt', '2001-01-03'),
('A015', 'Bárbara Vieira', 'barbara.v@aluno.pt', '2006-09-19'), ('A016', 'Cristiano Tomás', 'cristiano.t@aluno.pt', '2003-05-14'),
('A017', 'Daniela Borges', 'daniela.b@aluno.pt', '2002-12-21'), ('A018', 'Emanuel Barros', 'emanuel.b@aluno.pt', '2005-08-07'),
('A019', 'Fátima Correia', 'fatima.c@aluno.pt', '2004-03-11'), ('A020', 'Gonçalo Machado', 'goncalo.m@aluno.pt', '2001-10-29'),
('A021', 'Hugo Cardoso', 'hugo.c@aluno.pt', '2006-04-02'), ('A022', 'Inês Batista', 'ines.b@aluno.pt', '2003-07-17'),
('A023', 'João Freitas', NULL, '2002-09-24'), 
('A024', 'Lúcia Monteiro', 'lucia.m@aluno.pt', '2005-11-06'), ('A025', 'Miguel Soares', 'miguel.s@aluno.pt', '2004-01-13'),
('A026', 'Natália Reis', 'natalia.r@aluno.pt', '2001-06-20'), ('A027', 'Óscar Tavares', 'oscar.t@aluno.pt', '2006-08-27'),
('A028', 'Patrícia Antunes', 'patricia.a@aluno.pt', '2003-02-09'), ('A029', 'Rui Figueiredo', 'rui.f@aluno.pt', '2002-05-16'),
('A030', 'Sofia Teixeira', 'sofia.t@aluno.pt', '2005-12-31');

INSERT INTO Professor (nif_professor, numero_contrato) VALUES 
('P001', 'PROF-2023-01'), ('P002', 'PROF-2023-02'), ('P003', 'PROF-2023-03'), ('P004', 'PROF-2023-04'),
('P005', 'PROF-2023-05'), ('P006', 'PROF-2024-01'), ('P007', 'PROF-2024-02'), ('P008', 'PROF-2024-03'),
('P009', 'PROF-2025-01'), ('P010', 'PROF-2025-02');

INSERT INTO Aluno (nif_aluno, data_registo) VALUES 
('A001', '2023-01-15'), ('A002', '2023-01-16'), ('A003', '2023-02-10'), ('A004', '2023-03-05'),
('A005', '2023-04-12'), ('A006', '2023-05-20'), ('A007', '2023-06-11'), ('A008', '2023-07-22'),
('A009', '2023-08-30'), ('A010', '2023-09-14'), ('A011', '2024-01-10'), ('A012', '2024-02-18'),
('A013', '2024-03-25'), ('A014', '2024-04-03'), ('A015', '2024-05-09'), ('A016', '2024-06-16'),
('A017', '2024-07-21'), ('A018', '2024-08-05'), ('A019', '2024-09-12'), ('A020', '2024-10-19'),
('A021', '2025-01-08'), ('A022', '2025-02-14'), ('A023', '2025-03-22'), ('A024', '2025-04-29'),
('A025', '2025-05-07'), ('A026', '2025-06-15'), ('A027', '2025-07-23'), ('A028', '2025-08-11'),
('A029', '2025-09-02'), ('A030', '2025-10-10');

INSERT INTO Idioma (nome_idioma) VALUES 
('Inglês'), ('Espanhol'), ('Francês'), ('Alemão'), ('Italiano');

INSERT INTO Nivel (id_idioma, descricao, id_nivel_prerequisito) VALUES 
(1, 'A1 - Iniciante', NULL), (1, 'A2 - Básico', 1), (1, 'B1 - Intermediário', 2),
(2, 'A1 - Iniciante', NULL), (2, 'A2 - Básico', 4), (2, 'B1 - Intermediário', 5),
(3, 'A1 - Iniciante', NULL), (3, 'A2 - Básico', 7), (3, 'B1 - Intermediário', 8);

INSERT INTO Habilitacao (nif_professor, id_idioma, data_certificacao, grau_proficiencia) VALUES
('P001', 1, '2020-05-10', 'C2'), ('P002', 2, '2019-11-20', 'C1'),
('P003', 3, '2021-02-15', 'C2'), ('P004', 1, '2018-08-30', 'C1'),
('P004', 2, '2020-12-05', 'B2'), ('P005', 4, '2017-06-18', 'C2');

INSERT INTO Sala (capacidade_maxima, localizacao) VALUES 
(15, 'Bloco A'), (20, 'Bloco A'), (25, 'Bloco B'), (10, 'Bloco B'), (12, 'Bloco C'), 
(30, 'Bloco C'), (15, 'Bloco D'), (20, 'Bloco D'), (25, 'Bloco E'), (10, 'Bloco E');

INSERT INTO Turma (id_nivel, id_sala, data_inicio, data_fim) VALUES
(1, 1, '2025-02-01', '2025-06-30'), (2, 2, '2025-02-01', '2025-06-30'),
(4, 3, '2025-02-01', '2025-06-30'), (7, 4, '2025-02-01', '2025-06-30'),
(3, 5, '2025-02-01', '2025-06-30'), (5, 6, '2025-02-01', '2025-06-30'),
(1, 7, '2025-09-01', '2026-01-31'), (2, 8, '2025-09-01', '2026-01-31'),
(4, 9, '2025-09-01', '2026-01-31'), (8, 10, '2025-09-01', '2026-01-31'),
(1, 1, '2024-02-01', '2024-06-30'), (2, 2, '2024-02-01', '2024-06-30'),
(4, 3, '2024-02-01', '2024-06-30'), (7, 4, '2024-02-01', '2024-06-30'),
(3, 5, '2024-02-01', '2024-06-30'), (5, 6, '2024-02-01', '2024-06-30'),
(1, 7, '2024-09-01', '2025-01-31'), (2, 8, '2024-09-01', '2025-01-31'),
(4, 9, '2024-09-01', '2025-01-31'), (8, 10, '2024-09-01', '2025-01-31'),
(1, 1, '2026-02-01', '2026-06-30'), (2, 2, '2026-02-01', '2026-06-30'),
(4, 3, '2026-02-01', '2026-06-30'), (7, 4, '2026-02-01', '2026-06-30'),
(3, 5, '2026-02-01', '2026-06-30'), (5, 6, '2026-02-01', '2026-06-30');

INSERT INTO Matricula (nif_aluno, id_turma, data_matricula, estado_atual, nota_final) VALUES
('A001', 11, '2024-01-15', 'Concluída', 85.5), ('A002', 11, '2024-01-16', 'Concluída', 72.0),
('A003', 11, '2024-01-17', 'Concluída', 90.0), ('A004', 11, '2024-01-18', 'Concluída', 65.0),
('A005', 11, '2024-01-19', 'Concluída', 78.5), ('A006', 12, '2024-01-15', 'Concluída', 88.0),
('A007', 12, '2024-01-16', 'Concluída', 92.5), ('A008', 12, '2024-01-17', 'Concluída', 55.0),
('A009', 12, '2024-01-18', 'Concluída', 71.0), ('A010', 12, '2024-01-19', 'Concluída', 84.0),
('A011', 13, '2024-01-15', 'Concluída', 75.0), ('A012', 13, '2024-01-16', 'Concluída', 80.0),
('A013', 13, '2024-01-17', 'Concluída', 68.0), ('A014', 13, '2024-01-18', 'Concluída', 95.0),
('A015', 13, '2024-01-19', 'Cancelada', NULL), ('A016', 14, '2024-01-15', 'Concluída', 77.0),
('A017', 14, '2024-01-16', 'Concluída', 81.0), ('A018', 14, '2024-01-17', 'Concluída', 89.0),
('A019', 14, '2024-01-18', 'Concluída', 70.0), ('A020', 14, '2024-01-19', 'Trancada', NULL),
('A001', 17, '2024-08-20', 'Concluída', 82.0), ('A002', 17, '2024-08-21', 'Concluída', 74.5),
('A003', 17, '2024-08-22', 'Concluída', 91.0), ('A005', 17, '2024-08-23', 'Concluída', 79.0),
('A006', 18, '2024-08-20', 'Concluída', 85.0), ('A007', 18, '2024-08-21', 'Concluída', 94.0),
('A009', 18, '2024-08-22', 'Concluída', 73.0), ('A010', 18, '2024-08-23', 'Concluída', 86.0),
('A001', 1, '2025-01-10', 'Ativa', NULL),     ('A002', 1, '2025-01-11', 'Ativa', NULL),
('A003', 1, '2025-01-12', 'Ativa', NULL),     ('A005', 1, '2025-01-13', 'Ativa', NULL),
('A006', 2, '2025-01-10', 'Ativa', NULL),     ('A007', 2, '2025-01-11', 'Ativa', NULL);

INSERT INTO HistoricoEstadoMatricula (id_matricula, data_alteracao, estado_anterior, estado_novo)
SELECT id_matricula, data_matricula, NULL, 'Ativa' FROM Matricula;

INSERT INTO HistoricoEstadoMatricula (id_matricula, data_alteracao, estado_anterior, estado_novo)
SELECT id_matricula, DATE_ADD(data_matricula, INTERVAL 4 MONTH), 'Ativa', estado_atual 
FROM Matricula WHERE estado_atual IN ('Concluída', 'Cancelada', 'Trancada');

INSERT INTO ContatoEmergencia (nif_aluno, tipo_contato, nome_contato, telefone) VALUES 
('A001', 'Mãe', 'Maria Silva', '910000001'), ('A001', 'Pai', 'José Silva', '910000002'),
('A002', 'Irmão', 'Pedro Costa', '910000003'), ('A003', 'Tia', 'Ana Martins', '910000004');