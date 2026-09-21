-- Artefato A8: Consultas de Verificação - Escola de Idiomas
-- Autor: Murillo

-- ==========================================
-- CATEGORIA 1: BÁSICAS
-- ==========================================

-- Pergunta: Quais são os nomes e e-mails de todos os alunos registados, ordenados alfabeticamente por nome?
SELECT p.nome, p.email 
FROM Pessoa p JOIN Aluno a ON p.nif = a.nif_aluno ORDER BY p.nome ASC;

-- Pergunta: Quais são os professores cujo nome contém "Silva", exibindo o respetivo nome e número de contrato?
SELECT p.nome, prof.numero_contrato 
FROM Pessoa p JOIN Professor prof ON p.nif = prof.nif_professor WHERE p.nome LIKE '%Silva%';

-- Pergunta: Quais são os identificadores, datas de início e datas de fim de todas as turmas iniciadas no ano de 2024?
SELECT id_turma, data_inicio, data_fim 
FROM Turma WHERE data_inicio BETWEEN '2024-01-01' AND '2024-12-31';

-- Pergunta: Quais são as matrículas (NIF do aluno, ID da turma e estado atual) associadas especificamente às turmas 1, 2 e 3?
SELECT nif_aluno, id_turma, estado_atual
FROM Matricula WHERE id_turma IN (1, 2, 3);

-- Pergunta: Quais são os alunos (NIF e nome) que se encontram registados no sistema sem um endereço de e-mail associado?
SELECT p.nif, p.nome 
FROM Pessoa p JOIN Aluno a ON p.nif = a.nif_aluno WHERE p.email IS NULL;

-- ==========================================
-- CATEGORIA 2: JUNÇÕES E AGREGAÇÃO
-- ==========================================

-- Pergunta: Qual é a relação detalhada das turmas, exibindo o ID da turma, o nome do idioma e a descrição do nível associado?
SELECT t.id_turma, i.nome_idioma, n.descricao AS nivel_descricao
FROM Turma t 
JOIN Nivel n ON t.id_nivel = n.id_nivel
JOIN Idioma i ON n.id_idioma = i.id_idioma;

-- Pergunta: Quais são todos os idiomas e os respetivos níveis existentes, garantindo a exibição de idiomas mesmo que ainda não tenham níveis criados?
SELECT i.nome_idioma, n.descricao AS nivel
FROM Idioma i LEFT JOIN Nivel n ON i.id_idioma = n.id_idioma;

-- Pergunta: Quais são os idiomas que possuem estritamente mais de 3 turmas associadas, mostrando o idioma e o total de turmas?
SELECT i.nome_idioma, COUNT(t.id_turma) AS total_turmas
FROM Turma t 
JOIN Nivel n ON t.id_nivel = n.id_nivel
JOIN Idioma i ON n.id_idioma = i.id_idioma
GROUP BY i.nome_idioma HAVING COUNT(t.id_turma) > 3;

-- Pergunta: Qual é a média das notas finais dos alunos em cada turma, considerando apenas as matrículas com estado "Concluída"?
SELECT t.id_turma, AVG(m.nota_final) AS media_notas
FROM Turma t JOIN Matricula m ON t.id_turma = m.id_turma
WHERE m.estado_atual = 'Concluída' GROUP BY t.id_turma;

-- Pergunta: Qual é a hierarquia de pré-requisitos entre os níveis, mostrando o nível atual e o respetivo nível que serve de pré-requisito?
SELECT n1.descricao AS nivel_atual, n2.descricao AS pre_requisito
FROM Nivel n1 LEFT JOIN Nivel n2 ON n1.id_nivel_prerequisito = n2.id_nivel;

-- ==========================================
-- CATEGORIA 3: AVANÇADAS
-- ==========================================

-- Pergunta: Quais são os alunos cuja nota final numa turma foi superior à média geral de notas dessa mesma turma?
SELECT p.nome, m1.id_turma, m1.nota_final
FROM Matricula m1 JOIN Pessoa p ON m1.nif_aluno = p.nif
WHERE m1.nota_final > (
    SELECT AVG(m2.nota_final) FROM Matricula m2
    WHERE m2.id_turma = m1.id_turma AND m2.nota_final IS NOT NULL
);

-- Pergunta: Quais são os idiomas registados no sistema que ainda não têm nenhuma turma associada?
SELECT i.nome_idioma
FROM Idioma i
WHERE NOT EXISTS (
    SELECT 1 FROM Turma t 
    JOIN Nivel n ON t.id_nivel = n.id_nivel 
    WHERE n.id_idioma = i.id_idioma
);

-- Pergunta: Quais são os alunos registados que nunca realizaram nenhuma matrícula em turmas da escola?
SELECT p.nome, a.data_registo
FROM Pessoa p JOIN Aluno a ON p.nif = a.nif_aluno
WHERE NOT EXISTS (
    SELECT 1 FROM Matricula m WHERE m.nif_aluno = a.nif_aluno
);

-- Pergunta: Qual é a taxa de sucesso e o total de aprovações (nota >= 70) agrupados por idioma para as turmas concluídas?
SELECT i.nome_idioma, 
       COUNT(m.id_matricula) AS total_matriculas,
       SUM(CASE WHEN m.nota_final >= 70 THEN 1 ELSE 0 END) AS total_aprovados,
       (SUM(CASE WHEN m.nota_final >= 70 THEN 1 ELSE 0 END) * 100.0 / COUNT(m.id_matricula)) AS taxa_sucesso
FROM Idioma i
JOIN Nivel n ON i.id_idioma = n.id_idioma
JOIN Turma t ON n.id_nivel = t.id_nivel
JOIN Matricula m ON t.id_turma = m.id_turma
WHERE m.estado_atual = 'Concluída'
GROUP BY i.nome_idioma;

-- Pergunta: Quais são os professores certificados com graus C1 ou C2 que estão associados a idiomas com turmas ativas no futuro?
SELECT DISTINCT p.nome, i.nome_idioma, h.grau_proficiencia
FROM Pessoa p
JOIN Professor prof ON p.nif = prof.nif_professor
JOIN Habilitacao h ON prof.nif_professor = h.nif_professor
JOIN Idioma i ON h.id_idioma = i.id_idioma
WHERE h.grau_proficiencia IN ('C1', 'C2')
AND EXISTS (
    SELECT 1 FROM Turma t 
    JOIN Nivel n ON t.id_nivel = n.id_nivel 
    WHERE n.id_idioma = i.id_idioma 
    AND t.data_fim >= CURRENT_DATE
);
