-- =====================================================
-- PROJETO: ALHENA COLOR ANODIZACAO
-- ENTREGA 2 - BANCO DE DADOS
-- SGBD: MySQL 8.0+
-- Dados ficticios para fins academicos
-- =====================================================
CREATE DATABASE IF NOT EXISTS alhena_color
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE alhena_color;
-- =====================================================
-- 1. EXCLUSAO DAS TABELAS PARA REEXECUCAO DO SCRIPT
-- =====================================================
DROP TABLE IF EXISTS ITEM_EXPEDICAO;
DROP TABLE IF EXISTS EXPEDICAO;
DROP TABLE IF EXISTS CONTROLE_QUALIDADE;
DROP TABLE IF EXISTS EXECUCAO_ETAPA;
DROP TABLE IF EXISTS ETAPA_PROCESSO;
DROP TABLE IF EXISTS PECA;
DROP TABLE IF EXISTS LOTE;
DROP TABLE IF EXISTS ITEM_PEDIDO;
DROP TABLE IF EXISTS PEDIDO;
DROP TABLE IF EXISTS FUNCIONARIO;
DROP TABLE IF EXISTS PROCESSO;
DROP TABLE IF EXISTS ACABAMENTO;
DROP TABLE IF EXISTS MODELO;
DROP TABLE IF EXISTS CLIENTE;
-- =====================================================
-- 2. CRIACAO DAS TABELAS
-- =====================================================
CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    documento VARCHAR(20) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(120),
    endereco VARCHAR(200)
);
CREATE TABLE MODELO (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    nome_modelo VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);
CREATE TABLE ACABAMENTO (
    id_acabamento INT AUTO_INCREMENT PRIMARY KEY,
    nome_acabamento VARCHAR(80) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);
CREATE TABLE FUNCIONARIO (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    cargo VARCHAR(80),
    data_admissao DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'ATIVO',
    CHECK (status IN ('ATIVO', 'INATIVO'))
);
CREATE TABLE PROCESSO (
    id_processo INT AUTO_INCREMENT PRIMARY KEY,
    nome_processo VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);
CREATE TABLE PEDIDO (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'ABERTO',
    observacao VARCHAR(255),
    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES CLIENTE(id_cliente),
    CHECK (status IN ('ABERTO', 'EM ANDAMENTO', 'CONCLUIDO', 'CANCELADO'))
);
CREATE TABLE ITEM_PEDIDO (
    id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_modelo INT NOT NULL,
    id_acabamento INT NOT NULL,
    quantidade INT NOT NULL,
    observacao VARCHAR(255),
    CONSTRAINT fk_item_pedido_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES PEDIDO(id_pedido),
    CONSTRAINT fk_item_pedido_modelo
        FOREIGN KEY (id_modelo)
        REFERENCES MODELO(id_modelo),
    CONSTRAINT fk_item_pedido_acabamento
        FOREIGN KEY (id_acabamento)
        REFERENCES ACABAMENTO(id_acabamento),
    CHECK (quantidade > 0)
);
CREATE TABLE LOTE (
    id_lote INT AUTO_INCREMENT PRIMARY KEY,
    id_item_pedido INT NOT NULL,
    data_abertura DATE NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'ABERTO',
    observacao VARCHAR(255),
    CONSTRAINT fk_lote_item_pedido
        FOREIGN KEY (id_item_pedido)
        REFERENCES ITEM_PEDIDO(id_item_pedido),
    CHECK (status IN ('ABERTO', 'EM PRODUCAO', 'CONCLUIDO', 'CANCELADO'))
);
CREATE TABLE PECA (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    id_lote INT NOT NULL,
    identificacao VARCHAR(50) NOT NULL UNIQUE,
    data_cadastro DATE NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'EM PRODUCAO',
    CONSTRAINT fk_peca_lote
        FOREIGN KEY (id_lote)
        REFERENCES LOTE(id_lote),
    CHECK (status IN ('EM PRODUCAO', 'AGUARDANDO QUALIDADE', 'APROVADA', 'REPROVADA', 'EXPEDIDA'))
);
CREATE TABLE ETAPA_PROCESSO (
    id_etapa INT AUTO_INCREMENT PRIMARY KEY,
    id_processo INT NOT NULL,
    nome_etapa VARCHAR(100) NOT NULL,
    ordem_etapa INT NOT NULL,
    descricao VARCHAR(255),
    CONSTRAINT fk_etapa_processo
        FOREIGN KEY (id_processo)
        REFERENCES PROCESSO(id_processo),
    UNIQUE (id_processo, ordem_etapa)
);
CREATE TABLE EXECUCAO_ETAPA (
    id_execucao INT AUTO_INCREMENT PRIMARY KEY,
    id_peca INT NOT NULL,
    id_etapa INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME,
    status VARCHAR(30) NOT NULL DEFAULT 'PENDENTE',
    observacao VARCHAR(255),
    CONSTRAINT fk_execucao_peca
        FOREIGN KEY (id_peca)
        REFERENCES PECA(id_peca),
    CONSTRAINT fk_execucao_etapa
        FOREIGN KEY (id_etapa)
        REFERENCES ETAPA_PROCESSO(id_etapa),
    CONSTRAINT fk_execucao_funcionario
        FOREIGN KEY (id_funcionario)
        REFERENCES FUNCIONARIO(id_funcionario),
    CHECK (status IN ('PENDENTE', 'EM ANDAMENTO', 'CONCLUIDA', 'CANCELADA')),
    CHECK (data_fim IS NULL OR data_fim >= data_inicio)
);
CREATE TABLE CONTROLE_QUALIDADE (
    id_controle INT AUTO_INCREMENT PRIMARY KEY,
    id_peca INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_inspecao DATETIME NOT NULL,
    resultado VARCHAR(20) NOT NULL,
    observacao VARCHAR(255),
    CONSTRAINT fk_controle_peca
        FOREIGN KEY (id_peca)
        REFERENCES PECA(id_peca),
    CONSTRAINT fk_controle_funcionario
        FOREIGN KEY (id_funcionario)
        REFERENCES FUNCIONARIO(id_funcionario),
    CHECK (resultado IN ('APROVADA', 'REPROVADA'))
);
CREATE TABLE EXPEDICAO (
    id_expedicao INT AUTO_INCREMENT PRIMARY KEY,
    data_expedicao DATE NOT NULL,
    responsavel VARCHAR(120),
    observacao VARCHAR(255)
);
CREATE TABLE ITEM_EXPEDICAO (
    id_item_expedicao INT AUTO_INCREMENT PRIMARY KEY,
    id_expedicao INT NOT NULL,
    id_peca INT NOT NULL UNIQUE,
    CONSTRAINT fk_item_expedicao_expedicao
        FOREIGN KEY (id_expedicao)
        REFERENCES EXPEDICAO(id_expedicao),
    CONSTRAINT fk_item_expedicao_peca
        FOREIGN KEY (id_peca)
        REFERENCES PECA(id_peca)
);
-- =====================================================
-- 3. VALIDACAO DA QUALIDADE ANTES DA EXPEDICAO
-- =====================================================
DELIMITER //
CREATE TRIGGER trg_validar_peca_expedicao
BEFORE INSERT ON ITEM_EXPEDICAO
FOR EACH ROW
BEGIN
    DECLARE v_aprovada INT DEFAULT 0;
    SELECT COUNT(*)
    INTO v_aprovada
    FROM CONTROLE_QUALIDADE
    WHERE id_peca = NEW.id_peca
      AND resultado = 'APROVADA';
    IF v_aprovada = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Expedicao bloqueada: a peca nao possui aprovacao de qualidade.';
    END IF;
END//
DELIMITER ;
-- =====================================================
-- 4. INSERCAO DE DADOS FICTICIOS
-- =====================================================
INSERT INTO CLIENTE
(nome, documento, telefone, email, endereco)
VALUES
('Cliente Alfa', '11111111111', '(11) 90000-0001',
 'alfa@email.com', 'Sao Paulo - SP'),
('Cliente Beta', '22222222222', '(11) 90000-0002',
 'beta@email.com', 'Santo Andre - SP'),
('Cliente Gama', '33333333333', '(11) 90000-0003',
 'gama@email.com', 'Sao Bernardo do Campo - SP');
INSERT INTO MODELO (nome_modelo, descricao)
VALUES
('Perfil Retangular', 'Modelo ficticio de perfil de aluminio'),
('Perfil Redondo', 'Modelo ficticio de perfil de aluminio'),
('Perfil Quadrado', 'Modelo ficticio de perfil de aluminio');
INSERT INTO ACABAMENTO (nome_acabamento, descricao)
VALUES
('Alto Brilho', 'Acabamento de alto brilho'),
('Dourado Brilho', 'Acabamento dourado brilhante'),
('Dourado Fosco', 'Acabamento dourado fosco'),
('Inox', 'Acabamento com aparencia inox');
INSERT INTO FUNCIONARIO
(nome, cargo, data_admissao, status)
VALUES
('Funcionario A', 'Producao', '2025-01-10', 'ATIVO'),
('Funcionario B', 'Producao', '2025-02-15', 'ATIVO'),
('Funcionario C', 'Qualidade', '2025-03-20', 'ATIVO'),
('Funcionario D', 'Expedicao', '2025-04-05', 'ATIVO');
INSERT INTO PROCESSO (nome_processo, descricao)
VALUES
('Preparacao', 'Preparacao das pecas'),
('Tratamento', 'Tratamento e acabamento do aluminio'),
('Finalizacao', 'Controle e finalizacao das pecas');
INSERT INTO PEDIDO
(id_cliente, data_pedido, status, observacao)
VALUES
(1, '2026-09-01', 'EM ANDAMENTO', 'Pedido academico ficticio'),
(2, '2026-09-05', 'EM ANDAMENTO', 'Pedido academico ficticio'),
(3, '2026-09-10', 'ABERTO', 'Pedido academico ficticio');
INSERT INTO ITEM_PEDIDO
(id_pedido, id_modelo, id_acabamento, quantidade, observacao)
VALUES
(1, 1, 1, 2, 'Item ficticio'),
(1, 2, 2, 2, 'Item ficticio'),
(2, 3, 3, 2, 'Item ficticio'),
(3, 1, 4, 2, 'Item ficticio');
INSERT INTO LOTE
(id_item_pedido, data_abertura, status, observacao)
VALUES
(1, '2026-09-02', 'EM PRODUCAO', 'Lote ficticio 1'),
(2, '2026-09-03', 'EM PRODUCAO', 'Lote ficticio 2'),
(3, '2026-09-06', 'EM PRODUCAO', 'Lote ficticio 3'),
(4, '2026-09-11', 'ABERTO', 'Lote ficticio 4');
INSERT INTO PECA
(id_lote, identificacao, data_cadastro, status)
VALUES
(1, 'PEC-001', '2026-09-02', 'APROVADA'),
(1, 'PEC-002', '2026-09-02', 'REPROVADA'),
(2, 'PEC-003', '2026-09-03', 'APROVADA'),
(2, 'PEC-004', '2026-09-03', 'AGUARDANDO QUALIDADE'),
(3, 'PEC-005', '2026-09-06', 'APROVADA'),
(3, 'PEC-006', '2026-09-06', 'EM PRODUCAO'),
(4, 'PEC-007', '2026-09-11', 'EM PRODUCAO'),
(4, 'PEC-008', '2026-09-11', 'EM PRODUCAO');
INSERT INTO ETAPA_PROCESSO
(id_processo, nome_etapa, ordem_etapa, descricao)
VALUES
(1, 'Recebimento', 1, 'Entrada dos materiais'),
(1, 'Polimento', 2, 'Preparacao das pecas'),
(1, 'Enganchamento', 3, 'Preparacao para tratamento'),
(2, 'Anodizacao', 4, 'Tratamento do aluminio'),
(3, 'Controle de qualidade', 5, 'Inspecao das pecas'),
(3, 'Expedicao', 6, 'Encaminhamento das pecas');
INSERT INTO EXECUCAO_ETAPA
(id_peca, id_etapa, id_funcionario, data_inicio, data_fim, status, observacao)
VALUES
(1, 1, 1, '2026-09-02 08:00:00', '2026-09-02 08:30:00', 'CONCLUIDA', 'Recebimento concluido'),
(1, 2, 1, '2026-09-02 09:00:00', '2026-09-02 09:30:00', 'CONCLUIDA', 'Polimento concluido'),
(1, 3, 2, '2026-09-02 10:00:00', '2026-09-02 10:30:00', 'CONCLUIDA', 'Enganchamento concluido'),
(1, 4, 2, '2026-09-02 11:00:00', '2026-09-02 12:00:00', 'CONCLUIDA', 'Anodizacao concluida'),
(2, 1, 1, '2026-09-02 08:00:00', '2026-09-02 08:30:00', 'CONCLUIDA', 'Recebimento concluido'),
(2, 2, 1, '2026-09-02 09:00:00', '2026-09-02 09:30:00', 'CONCLUIDA', 'Polimento concluido'),
(2, 3, 2, '2026-09-02 10:00:00', '2026-09-02 10:30:00', 'CONCLUIDA', 'Enganchamento concluido'),
(2, 4, 2, '2026-09-02 11:00:00', '2026-09-02 12:00:00', 'CONCLUIDA', 'Anodizacao concluida'),
(3, 1, 1, '2026-09-03 08:00:00', '2026-09-03 08:30:00', 'CONCLUIDA', 'Recebimento concluido'),
(3, 2, 1, '2026-09-03 09:00:00', '2026-09-03 09:30:00', 'CONCLUIDA', 'Polimento concluido'),
(3, 3, 2, '2026-09-03 10:00:00', '2026-09-03 10:30:00', 'CONCLUIDA', 'Enganchamento concluido'),
(3, 4, 2, '2026-09-03 11:00:00', '2026-09-03 12:00:00', 'CONCLUIDA', 'Anodizacao concluida');
INSERT INTO CONTROLE_QUALIDADE
(id_peca, id_funcionario, data_inspecao, resultado, observacao)
VALUES
(1, 3, '2026-09-02 14:00:00', 'APROVADA', 'Inspecao ficticia aprovada'),
(2, 3, '2026-09-02 14:30:00', 'REPROVADA', 'Inspecao ficticia reprovada'),
(3, 3, '2026-09-03 14:00:00', 'APROVADA', 'Inspecao ficticia aprovada'),
(5, 3, '2026-09-06 14:00:00', 'APROVADA', 'Inspecao ficticia aprovada');
INSERT INTO EXPEDICAO
(data_expedicao, responsavel, observacao)
VALUES
('2026-09-04', 'Funcionario D', 'Expedicao academica ficticia'),
('2026-09-07', 'Funcionario D', 'Expedicao academica ficticia');
INSERT INTO ITEM_EXPEDICAO
(id_expedicao, id_peca)
VALUES
(1, 1),
(1, 3),
(2, 5);
-- =====================================================
-- 5. CONSULTAS GERENCIAIS
-- =====================================================
-- G01: Pedidos por cliente
SELECT
    c.nome AS cliente,
    p.id_pedido,
    p.data_pedido,
    p.status
FROM CLIENTE c
INNER JOIN PEDIDO p
    ON c.id_cliente = p.id_cliente
ORDER BY c.nome;
-- G02: Itens por pedido
SELECT
    p.id_pedido,
    m.nome_modelo,
    a.nome_acabamento,
    ip.quantidade
FROM PEDIDO p
INNER JOIN ITEM_PEDIDO ip
    ON p.id_pedido = ip.id_pedido
INNER JOIN MODELO m
    ON ip.id_modelo = m.id_modelo
INNER JOIN ACABAMENTO a
    ON ip.id_acabamento = a.id_acabamento;
-- G03: Lotes por pedido
SELECT
    p.id_pedido,
    l.id_lote,
    l.data_abertura,
    l.status
FROM PEDIDO p
INNER JOIN ITEM_PEDIDO ip
    ON p.id_pedido = ip.id_pedido
INNER JOIN LOTE l
    ON ip.id_item_pedido = l.id_item_pedido;
-- G04: Pecas por lote
SELECT
    l.id_lote,
    pe.identificacao,
    pe.status
FROM LOTE l
INNER JOIN PECA pe
    ON l.id_lote = pe.id_lote;
-- G05: Pecas por acabamento
SELECT
    a.nome_acabamento,
    COUNT(pe.id_peca) AS quantidade_pecas
FROM ACABAMENTO a
INNER JOIN ITEM_PEDIDO ip
    ON a.id_acabamento = ip.id_acabamento
INNER JOIN LOTE l
    ON ip.id_item_pedido = l.id_item_pedido
INNER JOIN PECA pe
    ON l.id_lote = pe.id_lote
GROUP BY a.id_acabamento, a.nome_acabamento;
-- G06: Historico produtivo das pecas
SELECT
    pe.identificacao,
    ep.nome_etapa,
    f.nome AS funcionario,
    ee.data_inicio,
    ee.data_fim,
    ee.status
FROM PECA pe
INNER JOIN EXECUCAO_ETAPA ee
    ON pe.id_peca = ee.id_peca
INNER JOIN ETAPA_PROCESSO ep
    ON ee.id_etapa = ep.id_etapa
INNER JOIN FUNCIONARIO f
    ON ee.id_funcionario = f.id_funcionario
ORDER BY pe.identificacao, ee.data_inicio;
-- G07: Atividades por funcionario
SELECT
    f.nome AS funcionario,
    COUNT(ee.id_execucao) AS total_execucoes
FROM FUNCIONARIO f
LEFT JOIN EXECUCAO_ETAPA ee
    ON f.id_funcionario = ee.id_funcionario
GROUP BY f.id_funcionario, f.nome;
-- G08: Resultado do controle de qualidade
SELECT
    resultado,
    COUNT(*) AS quantidade
FROM CONTROLE_QUALIDADE
GROUP BY resultado;
-- G09: Pecas pendentes de aprovacao
SELECT
    pe.id_peca,
    pe.identificacao,
    pe.status
FROM PECA pe
WHERE NOT EXISTS (
    SELECT 1
    FROM CONTROLE_QUALIDADE cq
    WHERE cq.id_peca = pe.id_peca
      AND cq.resultado = 'APROVADA'
);
-- G10: Pecas aprovadas para expedicao
SELECT
    pe.identificacao,
    cq.data_inspecao,
    cq.resultado
FROM PECA pe
INNER JOIN CONTROLE_QUALIDADE cq
    ON pe.id_peca = cq.id_peca
WHERE cq.resultado = 'APROVADA';
-- G11: Historico de expedicao
SELECT
    ex.id_expedicao,
    ex.data_expedicao,
    pe.identificacao,
    ex.responsavel
FROM EXPEDICAO ex
INNER JOIN ITEM_EXPEDICAO ie
    ON ex.id_expedicao = ie.id_expedicao
INNER JOIN PECA pe
    ON ie.id_peca = pe.id_peca
ORDER BY ex.data_expedicao;
-- =====================================================
-- 6. CONSULTAS DE AUDITORIA
-- =====================================================
-- A01: Pecas sem execucao de etapas
SELECT
    pe.id_peca,
    pe.identificacao
FROM PECA pe
LEFT JOIN EXECUCAO_ETAPA ee
    ON pe.id_peca = ee.id_peca
WHERE ee.id_execucao IS NULL;
-- A02: Pecas sem controle de qualidade
SELECT
    pe.id_peca,
    pe.identificacao
FROM PECA pe
LEFT JOIN CONTROLE_QUALIDADE cq
    ON pe.id_peca = cq.id_peca
WHERE cq.id_controle IS NULL;
-- A03: Pecas reprovadas
SELECT
    pe.identificacao,
    cq.data_inspecao,
    cq.observacao
FROM PECA pe
INNER JOIN CONTROLE_QUALIDADE cq
    ON pe.id_peca = cq.id_peca
WHERE cq.resultado = 'REPROVADA';
-- A04: Pecas expedidas sem aprovacao
SELECT
    pe.identificacao,
    ie.id_expedicao
FROM ITEM_EXPEDICAO ie
INNER JOIN PECA pe
    ON ie.id_peca = pe.id_peca
WHERE NOT EXISTS (
    SELECT 1
    FROM CONTROLE_QUALIDADE cq
    WHERE cq.id_peca = pe.id_peca
      AND cq.resultado = 'APROVADA'
);
-- A05: Execucoes sem data de conclusao
SELECT
    id_execucao,
    id_peca,
    id_etapa,
    status
FROM EXECUCAO_ETAPA
WHERE status = 'CONCLUIDA'
  AND data_fim IS NULL;
-- =====================================================
-- 7. EXEMPLOS DE UPDATE E DELETE
-- =====================================================
-- Exemplo de atualizacao:
-- Atualiza a observacao de um cliente.
UPDATE CLIENTE
SET endereco = 'Endereco atualizado para teste'
WHERE id_cliente = 1;
-- Exemplo de exclusao controlada:
-- A exclusao abaixo so deve ser executada se o pedido
-- nao possuir itens vinculados.
-- DELETE FROM PEDIDO
-- WHERE id_pedido = 999;
-- =====================================================
-- FIM DO SCRIPT
-- =====================================================
