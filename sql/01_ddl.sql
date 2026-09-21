-- Artefato A6: Script Físico DDL - Escola de Idiomas
-- Autor: Murillo

CREATE TABLE Pessoa (
    nif VARCHAR(20) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    data_nascimento DATE NOT NULL,
    CONSTRAINT pk_pessoa PRIMARY KEY (nif),
    CONSTRAINT uq_email UNIQUE (email)
);

CREATE TABLE Professor (
    nif_professor VARCHAR(20) NOT NULL,
    numero_contrato VARCHAR(50) NOT NULL,
    CONSTRAINT pk_professor PRIMARY KEY (nif_professor),
    CONSTRAINT fk_prof_pessoa FOREIGN KEY (nif_professor) REFERENCES Pessoa(nif) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uq_contrato UNIQUE (numero_contrato)
);

CREATE TABLE Aluno (
    nif_aluno VARCHAR(20) NOT NULL,
    data_registo DATE NOT NULL,
    CONSTRAINT pk_aluno PRIMARY KEY (nif_aluno),
    CONSTRAINT fk_aluno_pessoa FOREIGN KEY (nif_aluno) REFERENCES Pessoa(nif) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ContatoEmergencia (
    nif_aluno VARCHAR(20) NOT NULL,
    tipo_contato VARCHAR(20) NOT NULL,
    nome_contato VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    CONSTRAINT pk_contato_emergencia PRIMARY KEY (nif_aluno, tipo_contato),
    CONSTRAINT fk_contato_aluno FOREIGN KEY (nif_aluno) REFERENCES Aluno(nif_aluno) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Idioma (
    id_idioma INT AUTO_INCREMENT PRIMARY KEY,
    nome_idioma VARCHAR(50) NOT NULL,
    CONSTRAINT uq_nome_idioma UNIQUE (nome_idioma)
);

CREATE TABLE Nivel (
    id_nivel INT AUTO_INCREMENT PRIMARY KEY,
    id_idioma INT NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    id_nivel_prerequisito INT,
    CONSTRAINT fk_nivel_idioma FOREIGN KEY (id_idioma) REFERENCES Idioma(id_idioma) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_autorrelacionamento_nivel FOREIGN KEY (id_nivel_prerequisito) REFERENCES Nivel(id_nivel) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Habilitacao (
    nif_professor VARCHAR(20) NOT NULL,
    id_idioma INT NOT NULL,
    data_certificacao DATE NOT NULL,
    grau_proficiencia VARCHAR(20),
    CONSTRAINT pk_habilitacao PRIMARY KEY (nif_professor, id_idioma),
    CONSTRAINT fk_hab_prof FOREIGN KEY (nif_professor) REFERENCES Professor(nif_professor) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_hab_idioma FOREIGN KEY (id_idioma) REFERENCES Idioma(id_idioma) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Sala (
    id_sala INT AUTO_INCREMENT PRIMARY KEY,
    capacidade_maxima INT NOT NULL,
    localizacao VARCHAR(60),
    CONSTRAINT ck_capacidade CHECK (capacidade_maxima > 0)
);

CREATE TABLE Turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_nivel INT NOT NULL,
    id_sala INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    CONSTRAINT fk_turma_nivel FOREIGN KEY (id_nivel) REFERENCES Nivel(id_nivel) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_turma_sala FOREIGN KEY (id_sala) REFERENCES Sala(id_sala) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ck_datas_turma CHECK (data_fim > data_inicio)
);

CREATE TABLE Matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    nif_aluno VARCHAR(20) NOT NULL,
    id_turma INT NOT NULL,
    data_matricula DATE NOT NULL,
    estado_atual VARCHAR(20) NOT NULL,
    nota_final DECIMAL(5,2),
    CONSTRAINT uq_matricula UNIQUE (nif_aluno, id_turma),
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (nif_aluno) REFERENCES Aluno(nif_aluno) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_matricula_turma FOREIGN KEY (id_turma) REFERENCES Turma(id_turma) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ck_estado CHECK (estado_atual IN ('Ativa', 'Trancada', 'Concluída', 'Cancelada')),
    CONSTRAINT ck_nota CHECK (nota_final IS NULL OR (nota_final >= 0 AND nota_final <= 100))
);

CREATE TABLE HistoricoEstadoMatricula (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT NOT NULL,
    data_alteracao DATETIME NOT NULL,
    estado_anterior VARCHAR(20),
    estado_novo VARCHAR(20) NOT NULL,
    CONSTRAINT fk_historico_matricula FOREIGN KEY (id_matricula) REFERENCES Matricula(id_matricula) ON DELETE CASCADE ON UPDATE CASCADE
);