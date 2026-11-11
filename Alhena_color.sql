GROUP BY DATE_FORMAT(ultima.data_inspecao,'%Y-%m') ORDER BY mes;

-- G14 | Pergunta: Quantas pecas foram expedidas por mes?
-- Atende: KPI03 / P03
SELECT DATE_FORMAT(ex.data_expedicao,'%Y-%m') AS mes, COUNT(*) AS pecas_expedidas
FROM EXPEDICAO ex JOIN ITEM_EXPEDICAO ie ON ie.id_expedicao=ex.id_expedicao
GROUP BY DATE_FORMAT(ex.data_expedicao,'%Y-%m') ORDER BY mes;

-- G15 | Pergunta: Qual a duracao media em minutos de cada etapa concluida?
-- Atende: KPI04 / P04
SELECT ep.nome_etapa, COUNT(*) AS execucoes,
ROUND(AVG(TIMESTAMPDIFF(MINUTE,ee.data_inicio,ee.data_fim)),1) AS media_minutos
FROM EXECUCAO_ETAPA ee JOIN ETAPA_PROCESSO ep ON ep.id_etapa=ee.id_etapa
WHERE ee.status='CONCLUIDA' AND ee.data_fim IS NOT NULL
GROUP BY ep.id_etapa,ep.nome_etapa ORDER BY ep.id_etapa;

-- G16 | Pergunta: Quantas pecas por cliente estao em producao?
-- Atende: P04
SELECT c.nome,COUNT(pe.id_peca) AS pecas_em_producao
FROM CLIENTE c JOIN PEDIDO p ON p.id_cliente=c.id_cliente
JOIN ITEM_PEDIDO ip ON ip.id_pedido=p.id_pedido
JOIN LOTE l ON l.id_item_pedido=ip.id_item_pedido
JOIN PECA pe ON pe.id_lote=l.id_lote WHERE pe.status='EM PRODUCAO'
GROUP BY c.id_cliente,c.nome ORDER BY pecas_em_producao DESC;

-- G17 | Pergunta: Qual a taxa de pecas retrabalhadas entre as inspecionadas, por mes?
-- Atende: KPI05 / P02/P03
SELECT DATE_FORMAT(cq.data_inspecao,'%Y-%m') AS mes,
COUNT(DISTINCT cq.id_peca) AS pecas_inspecionadas,
COUNT(DISTINCT CASE WHEN EXISTS (
    SELECT 1 FROM CONTROLE_QUALIDADE cq2 WHERE cq2.id_peca=cq.id_peca
      AND cq2.resultado='REPROVADA') AND EXISTS (
    SELECT 1 FROM CONTROLE_QUALIDADE cq3 WHERE cq3.id_peca=cq.id_peca
      AND cq3.resultado='APROVADA' AND cq3.data_inspecao>(
        SELECT MIN(cq4.data_inspecao) FROM CONTROLE_QUALIDADE cq4
        WHERE cq4.id_peca=cq.id_peca AND cq4.resultado='REPROVADA'))
    THEN cq.id_peca END) AS pecas_retrabalhadas,
ROUND(100.0 * COUNT(DISTINCT CASE WHEN EXISTS (
    SELECT 1 FROM CONTROLE_QUALIDADE cr WHERE cr.id_peca=cq.id_peca
      AND cr.resultado='REPROVADA') AND EXISTS (
    SELECT 1 FROM CONTROLE_QUALIDADE ca WHERE ca.id_peca=cq.id_peca
      AND ca.resultado='APROVADA' AND ca.data_inspecao > (
        SELECT MIN(c0.data_inspecao) FROM CONTROLE_QUALIDADE c0 WHERE c0.id_peca=cq.id_peca AND c0.resultado='REPROVADA'))
    THEN cq.id_peca END) / NULLIF(COUNT(DISTINCT cq.id_peca),0),1) AS taxa_retrabalho_pct
FROM CONTROLE_QUALIDADE cq GROUP BY DATE_FORMAT(cq.data_inspecao,'%Y-%m') ORDER BY mes;

-- G18 | Pergunta: Qual a quantidade atual de lotes por status?
-- Atende: KPI06 / P03
SELECT status, COUNT(*) AS total_lotes FROM LOTE GROUP BY status ORDER BY status;

-- G19 | Pergunta: Quais pecas ainda tem etapas obrigatorias sem conclusao?
-- Atende: P04 / RN07
SELECT pe.identificacao,COUNT(ep.id_etapa) AS etapas_pendentes
FROM PECA pe CROSS JOIN ETAPA_PROCESSO ep
WHERE ep.obrigatoria=1 AND NOT EXISTS (
 SELECT 1 FROM EXECUCAO_ETAPA ee WHERE ee.id_peca=pe.id_peca AND ee.id_etapa=ep.id_etapa
 AND ee.status='CONCLUIDA' AND ee.data_fim IS NOT NULL)
GROUP BY pe.id_peca,pe.identificacao ORDER BY etapas_pendentes DESC,pe.id_peca;

-- AUDITORIA (A01-A08):

-- A01 | Auditoria: Pecas sem historico algum de execucao (inclui recem-registradas)
-- Verifica: RN08
SELECT pe.identificacao FROM PECA pe LEFT JOIN EXECUCAO_ETAPA ee ON ee.id_peca=pe.id_peca
WHERE ee.id_execucao IS NULL ORDER BY pe.id_peca;

-- A02 | Auditoria: Pecas sem inspecao (inclui itens ainda em producao)
-- Verifica: RN10
SELECT pe.identificacao FROM PECA pe LEFT JOIN CONTROLE_QUALIDADE cq ON cq.id_peca=pe.id_peca
WHERE cq.id_controle IS NULL ORDER BY pe.id_peca;

-- A03 | Auditoria: Pecas cuja ULTIMA inspecao as reprovou
-- Verifica: RN11
SELECT c.id_peca,pe.identificacao,c.data_inspecao FROM CONTROLE_QUALIDADE c
JOIN PECA pe ON pe.id_peca=c.id_peca
WHERE c.id_controle=(SELECT c2.id_controle FROM CONTROLE_QUALIDADE c2
 WHERE c2.id_peca=c.id_peca ORDER BY c2.data_inspecao DESC,c2.id_controle DESC LIMIT 1)
 AND c.resultado='REPROVADA';

-- A04 | Auditoria: Alguma peca expedida sem ULTIMA aprovacao?
-- Verifica: RN12
SELECT pe.identificacao FROM ITEM_EXPEDICAO ie JOIN PECA pe ON pe.id_peca=ie.id_peca
WHERE NOT EXISTS (SELECT 1 FROM CONTROLE_QUALIDADE cq WHERE cq.id_peca=pe.id_peca
 AND cq.id_controle=(SELECT c2.id_controle FROM CONTROLE_QUALIDADE c2 WHERE c2.id_peca=pe.id_peca
 ORDER BY c2.data_inspecao DESC,c2.id_controle DESC LIMIT 1)
 AND cq.resultado='APROVADA');

-- A05 | Auditoria: Existe etapa concluida sem data de fim?
-- Verifica: RN08
SELECT id_execucao,id_peca FROM EXECUCAO_ETAPA
WHERE status='CONCLUIDA' AND data_fim IS NULL;

-- A06 | Auditoria: Ha divergencia entre quantidade solicitada e pecas cadastradas?
-- Verifica: RN14
SELECT ip.id_item_pedido,ip.quantidade,COUNT(pe.id_peca) AS cadastradas
FROM ITEM_PEDIDO ip LEFT JOIN LOTE l ON l.id_item_pedido=ip.id_item_pedido
LEFT JOIN PECA pe ON pe.id_lote=l.id_lote
GROUP BY ip.id_item_pedido,ip.quantidade
HAVING ip.quantidade<>COUNT(pe.id_peca);

-- A07 | Auditoria: Alguma peca expedida nao concluiu as etapas obrigatorias antes da inspecao?
-- Verifica: RN07/RN12
SELECT pe.identificacao FROM ITEM_EXPEDICAO ie JOIN PECA pe ON pe.id_peca=ie.id_peca
WHERE EXISTS (SELECT 1 FROM ETAPA_PROCESSO ep WHERE ep.obrigatoria=1
 AND NOT EXISTS (SELECT 1 FROM EXECUCAO_ETAPA ee WHERE ee.id_peca=pe.id_peca
 AND ee.id_etapa=ep.id_etapa AND ee.status='CONCLUIDA' AND ee.data_fim IS NOT NULL));

-- A08 | Auditoria: Ha peca expedida com status divergente?
-- Verifica: RN12
SELECT pe.identificacao,pe.status FROM ITEM_EXPEDICAO ie
JOIN PECA pe ON pe.id_peca=ie.id_peca WHERE pe.status<>'EXPEDIDA';
