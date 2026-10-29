# Dicionário de Dados --- Alhena Color

**Projeto:** Sistema de gerenciamento dos processos da Alhena Color\
**Versão:** 1.0 --- documento preliminar para a Entrega 2

> **Observação:** este dicionário é uma base conceitual. Os atributos e
> regras devem permanecer alinhados ao DER e aos requisitos definidos no
> projeto.

## 1. CLIENTE

**Definição:** pessoa ou empresa que solicita serviços ou realiza
pedidos.\
**Atributos sugeridos:** `id_cliente` (identificador),
`nome_razao_social`, `cpf_cnpj`, `telefone`, `email`, `endereco`.\
**Regra:** cada cliente deve possuir um identificador único.

## 2. PEDIDO

**Definição:** solicitação de serviço ou produção registrada para um
cliente.\
**Atributos sugeridos:** `id_pedido`, `id_cliente`, `data_pedido`,
`prazo_previsto`, `status`, `observacoes`.\
**Regra:** todo pedido deve estar associado a um cliente.

## 3. LOTE

**Definição:** conjunto de peças agrupadas para identificação e
acompanhamento durante o processo produtivo.\
**Atributos sugeridos:** `id_lote`, `id_pedido`, `data_entrada`,
`quantidade_total`, `status`.\
**Regra:** cada lote deve possuir identificação única e estar vinculado
ao pedido correspondente.

## 4. MODELO

**Definição:** tipo ou referência comercial do perfil de alumínio
processado.\
**Atributos sugeridos:** `id_modelo`, `codigo_modelo`, `descricao`,
`comprimento`, `observacoes`.\
**Regra:** o código do modelo deve identificar cada modelo de forma
única.

## 5. PEÇA

**Definição:** unidade física de perfil ou componente de alumínio que
passa pelas etapas produtivas.\
**Atributos sugeridos:** `id_peca`, `id_lote`, `id_modelo`,
`quantidade`, `situacao`.\
**Regra:** cada peça ou registro de peça deve permitir rastrear o lote e
o modelo correspondente.

## 6. POLIMENTO

**Definição:** etapa de preparação da superfície do alumínio antes das
etapas seguintes, quando aplicável.\
**Atributos sugeridos:** `id_polimento`, `id_lote`, `id_funcionario`,
`data_inicio`, `data_fim`, `resultado`, `observacoes`.\
**Regra:** o registro deve permitir identificar o lote processado e o
resultado da etapa.

## 7. ENGANCHAMENTO

**Definição:** etapa em que as peças são fixadas em dispositivos para
seguirem para os processos químicos.\
**Atributos sugeridos:** `id_enganchamento`, `id_lote`,
`id_funcionario`, `id_dispositivo`, `data_hora`, `quantidade_pecas`,
`observacoes`.\
**Regra:** o registro deve indicar o lote e o dispositivo utilizado.

## 8. DISPOSITIVO

**Definição:** suporte utilizado para prender e transportar peças
durante as etapas do processo.\
**Atributos sugeridos:** `id_dispositivo`, `codigo_dispositivo`, `tipo`,
`capacidade`, `situacao`.\
**Regra:** cada dispositivo deve possuir código único e situação
identificável.

## 9. ANODIZAÇÃO

**Definição:** processo de tratamento eletroquímico que forma uma camada
de óxido na superfície do alumínio.\
**Atributos sugeridos:** `id_anodizacao`, `id_lote`, `data_inicio`,
`data_fim`, `parametros_processo`, `resultado`, `observacoes`.\
**Regra:** cada registro deve estar relacionado ao lote processado e
permitir consultar o resultado.

## 10. PROCESSO

**Definição:** conjunto organizado de etapas necessárias para tratar e
acompanhar um lote.\
**Atributos sugeridos:** `id_processo`, `id_lote`, `data_abertura`,
`data_conclusao`, `status`.\
**Regra:** o processo deve permitir acompanhar o andamento do lote.

## 11. ETAPA_PROCESSO

**Definição:** etapa individual que compõe um processo produtivo.\
**Atributos sugeridos:** `id_etapa`, `id_processo`, `nome_etapa`,
`ordem`, `data_inicio`, `data_fim`, `status`.\
**Regra:** cada etapa deve estar vinculada a um processo e possuir uma
ordem definida.

## 12. ACABAMENTO

**Definição:** tipo de acabamento solicitado ou aplicado ao perfil de
alumínio.\
**Atributos sugeridos:** `id_acabamento`, `nome`, `descricao`, `cor`,
`especificacao`.\
**Regra:** cada acabamento deve possuir identificação própria e
descrição suficiente para diferenciá-lo.

## 13. FUNCIONÁRIO

**Definição:** colaborador responsável por executar, acompanhar ou
registrar atividades.\
**Atributos sugeridos:** `id_funcionario`, `nome`, `matricula`, `cargo`,
`setor`, `situacao`.\
**Regra:** cada funcionário deve possuir matrícula ou identificador
único.

## 14. CONTROLE_QUALIDADE

**Definição:** registro da inspeção realizada para verificar se o lote
atende aos critérios de qualidade.\
**Atributos sugeridos:** `id_controle`, `id_lote`, `id_funcionario`,
`data_inspecao`, `resultado`, `observacoes`.\
**Regra:** cada inspeção deve identificar o lote avaliado, o responsável
e o resultado.

## 15. EXPEDIÇÃO

**Definição:** etapa de conferência e liberação dos materiais para
entrega ou retirada.\
**Atributos sugeridos:** `id_expedicao`, `id_lote`, `data_expedicao`,
`quantidade_liberada`, `responsavel`, `status`.\
**Regra:** a expedição deve estar vinculada ao lote e registrar a
quantidade liberada.

------------------------------------------------------------------------

## Regras gerais de dados

1.  Cada entidade deve possuir uma chave primária (`id_...`) única.
2.  Os relacionamentos entre entidades devem utilizar chaves
    estrangeiras de acordo com o DER do projeto.
3.  Datas devem ser registradas em formato consistente.
4.  Quantidades devem ser numéricas e não negativas.
5.  Status e resultados devem usar valores padronizados para evitar
    registros inconsistentes.
6.  Os atributos apresentados são sugestões preliminares e devem ser
    conferidos com o DER e os requisitos aprovados na disciplina.
