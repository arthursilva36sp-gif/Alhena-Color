# Projeto de Modelagem de Processos e Banco de Dados — Alhena Color

## 1. Introdução

Este projeto tem como objetivo realizar o levantamento e a modelagem dos principais processos de negócio da empresa Alhena Color, com foco na organização das informações relacionadas à produção, peças, modelos, lotes, processos, funcionários, acabamento e controle de qualidade.

A partir do levantamento realizado, foi desenvolvida uma proposta de modelagem conceitual de banco de dados, representada por meio de um Diagrama Entidade-Relacionamento (DER), além de um fluxograma representando as principais etapas do processo produtivo.

### Objetivos

- Identificar os principais processos realizados pela organização;
- Levantar os requisitos necessários para o sistema;
- Identificar entidades, atributos e relacionamentos;
- Organizar as informações do processo produtivo;
- Desenvolver um modelo conceitual de banco de dados;
- Representar os processos por meio de fluxograma;
- Desenvolver um DER consistente e escalável.

### Escopo

O projeto contempla principalmente os processos relacionados ao recebimento e preparação das peças, polimento, enganchamento, anodização, controle de qualidade e expedição.

---

# 2. Caracterização da Organização

## 2.1 Identificação

**Nome:** Alhena Color Anodização

**Área de atuação:** Anodização, tratamento e acabamento de superfícies de perfis de alumínio.

**Fundação:** 2002.

**Endereço:** R. Urutaguá, 147 - Vila Independência, São Paulo - SP, CEP 04223-090.

**E-mail:** contato@alhenacolor.com.br

**Telefone:** (11) 2068-6691

**WhatsApp:** (11) 99286-8636

**Site:** https://www.alhenacolor.com.br/

A Alhena Color atua no segmento de anodização e tratamento de superfície de perfis de alumínio. Segundo as informações disponibilizadas pela própria empresa, sua história começou em 2002 e sua atuação é voltada à qualidade, inovação e desenvolvimento de acabamentos para alumínio.

A empresa oferece diferentes tipos de acabamento, incluindo Alto Brilho, Dourado Brilho, Dourado Fosco e Inox, entre outros.

## 2.2 Contexto da organização

A Alhena Color atua no segmento de tratamentos e acabamentos de superfície de alumínio.

O processo produtivo envolve diferentes etapas para que as peças recebam o tratamento e acabamento desejados.

Durante o levantamento realizado para este projeto, foram identificadas etapas como polimento, enganchamento, anodização, controle de qualidade e expedição.

A empresa também informa em seu site que possui laboratório próprio e trabalha com processos voltados à qualidade, resistência, durabilidade e estética dos produtos.

## 2.3 Problemas e necessidades identificadas

Durante o levantamento dos processos, identificou-se a necessidade de organizar e centralizar informações relacionadas a:

- Modelos de peças;
- Peças produzidas;
- Lotes de produção;
- Processos realizados;
- Funcionários responsáveis pelas atividades;
- Etapas de acabamento;
- Controle de qualidade;
- Expedição.

A organização dessas informações pode facilitar o acompanhamento da produção, o controle dos lotes e a consulta do histórico dos processos.

## 2.4 Justificativa da escolha da organização

A Alhena Color foi escolhida para o desenvolvimento do projeto por apresentar processos produtivos que podem ser analisados e representados por meio de uma modelagem de banco de dados.

A existência de diferentes etapas de produção permite analisar relacionamentos entre peças, modelos, lotes, funcionários e processos.

Além disso, o segmento de anodização e tratamento de superfície de alumínio apresenta diferentes informações que podem ser organizadas de maneira estruturada em um sistema.

## 2.5 Evidências do levantamento

As informações utilizadas neste projeto foram obtidas por meio da observação dos processos da organização e de informações públicas disponibilizadas pela própria empresa em seu site oficial.

**Endereço:** R. Urutaguá, 147 - Vila Independência, São Paulo - SP, CEP 04223-090.

**E-mail:** contato@alhenacolor.com.br

**Telefone:** (11) 2068-6691

**WhatsApp:** (11) 99286-8636

**Site oficial:** https://www.alhenacolor.com.br/

A empresa informa em seu site que foi fundada em 2002, possui mais de duas décadas de atuação e é especializada em anodização e tratamentos de superfície de perfis de alumínio.

---

# 3. Processos de Negócio

## 3.1 Principais processos identificados

Os principais processos observados são:

1. Recebimento das peças;
2. Polimento;
3. Enganchamento;
4. Anodização;
5. Controle de qualidade;
6. Expedição.

## 3.2 Descrição dos processos

### Recebimento

As peças são recebidas para início do processo produtivo e encaminhadas para as etapas necessárias de preparação e acabamento.

### Polimento

No setor de polimento, as peças de alumínio passam por um processo de preparação e acabamento superficial, buscando melhorar sua superfície e aparência.

Após o polimento, as peças seguem para as próximas etapas do processo.

### Enganchamento

No setor de enganchamento, os funcionários realizam a fixação das peças nos pentes utilizados no processo.

As peças são presas utilizando recursos como arames, patinhas e alicates, de acordo com o tipo de peça.

Essa preparação permite que os conjuntos sejam encaminhados para os banhos químicos da anodização.

### Anodização

Na anodização, as peças passam por um tratamento da superfície do alumínio que proporciona proteção, resistência e acabamento estético.

A empresa informa que a anodização é utilizada para melhorar a durabilidade, resistência e aparência dos produtos de alumínio.

### Controle de qualidade

Após as etapas de tratamento, as peças são verificadas para identificar possíveis problemas relacionados ao acabamento e à qualidade.

Caso seja identificado algum problema, a peça pode ser encaminhada para uma etapa de correção ou retrabalho.

### Expedição

Após a aprovação no controle de qualidade, as peças são preparadas para expedição.

Nessa etapa, os produtos são secos, organizados, embalados e encaminhados para envio.

---

## 3.3 Fluxograma dos processos

O fluxo principal do processo produtivo é:

**Recebimento → Polimento → Enganchamento → Anodização → Controle de Qualidade → Expedição**

Caso seja identificada alguma irregularidade durante o controle de qualidade, a peça pode retornar para uma etapa de retrabalho.

### Fluxograma

![Fluxograma dos processos da Alhena Color](Fluxograma.png)

---

# 4. Requisitos do Sistema

## 4.1 Requisitos Funcionais

### RF01 — Cadastro de modelos

O sistema deve permitir cadastrar e consultar os modelos de peças utilizados pela organização.

### RF02 — Cadastro de peças

O sistema deve permitir registrar as peças e relacioná-las aos seus respectivos modelos.

### RF03 — Controle de lotes

O sistema deve permitir cadastrar e consultar lotes de produção.

### RF04 — Registro de processos

O sistema deve permitir registrar os processos realizados nas peças e nos lotes.

### RF05 — Controle de funcionários

O sistema deve permitir registrar os funcionários responsáveis pelas atividades.

### RF06 — Registro do enganchamento

O sistema deve permitir registrar as informações relacionadas ao enganchamento das peças.

### RF07 — Controle de qualidade

O sistema deve permitir registrar os resultados das verificações de qualidade.

### RF08 — Controle de expedição

O sistema deve permitir registrar as informações relacionadas à preparação e expedição dos produtos.

### RF09 — Consulta de informações

O sistema deve permitir consultar o histórico das peças, lotes e processos realizados.

---

## 4.2 Requisitos Não Funcionais

### RNF01 — Segurança

O sistema deve restringir o acesso às informações de acordo com o nível de permissão dos usuários.

### RNF02 — Usabilidade

O sistema deve possuir uma interface simples e fácil de utilizar.

### RNF03 — Integridade

As informações armazenadas devem manter relacionamentos consistentes entre as entidades.

### RNF04 — Disponibilidade

As informações devem estar disponíveis para consulta sempre que necessário.

### RNF05 — Escalabilidade

O modelo deve permitir a inclusão de novos processos, modelos, peças e funcionários futuramente.

---

# 5. Regras de Negócio

### RN01

Cada peça deve estar associada a um modelo.

### RN02

Um lote pode possuir diversas peças.

### RN03

Uma peça pode passar por diferentes etapas do processo produtivo.

### RN04

O processo de produção deve respeitar a sequência definida pela organização.

### RN05

As peças devem ser preparadas no enganchamento antes de serem encaminhadas para a anodização.

### RN06

O controle de qualidade deve ser realizado após as etapas de tratamento previstas no processo.

### RN07

Peças que não forem aprovadas no controle de qualidade podem ser encaminhadas para retrabalho.

### RN08

Somente peças aprovadas devem ser encaminhadas para a expedição.

### RN09

Os funcionários podem ser responsáveis pela execução de determinadas atividades do processo.

---

# 6. Dicionário de Dados Conceitual (Preliminar)

## CLIENTE

**Definição:** Representa o cliente relacionado aos pedidos ou produtos da organização.

**Principais atributos:**
- id_cliente
- nome
- telefone
- e-mail

**Regra associada:** Um cliente pode estar relacionado a um ou mais pedidos.

---

## PEDIDO

**Definição:** Representa uma solicitação de produção ou fornecimento realizada por um cliente.

**Principais atributos:**
- id_pedido
- data_pedido
- status
- id_cliente

**Regra associada:** Um pedido pertence a um cliente e pode possuir diferentes itens.

---

## LOTE

**Definição:** Representa um conjunto de peças processadas em uma mesma ordem ou etapa de produção.

**Principais atributos:**
- id_lote
- data_entrada
- quantidade
- status

**Regra associada:** Um lote pode conter várias peças.

---

## MODELO

**Definição:** Representa o modelo ou tipo de peça produzido.

**Principais atributos:**
- id_modelo
- codigo_modelo
- descricao
- dimensao

**Regra associada:** Um modelo pode estar associado a várias peças.

---

## PEÇA

**Definição:** Representa uma peça de alumínio submetida ao processo produtivo.

**Principais atributos:**
- id_peca
- codigo_peca
- descricao
- dimensao
- id_modelo
- id_lote

**Regra associada:** Cada peça deve estar associada a um modelo e a um lote.

---

## POLIMENTO

**Definição:** Representa a etapa de preparação e acabamento superficial realizada nas peças.

**Principais atributos:**
- id_polimento
- data_inicio
- data_fim
- observacao
- status

**Regra associada:** As peças podem passar pelo processo de polimento antes das etapas seguintes.

---

## ENGANCHAMENTO

**Definição:** Representa a etapa em que as peças são fixadas nos pentes para serem encaminhadas aos processos de tratamento.

**Principais atributos:**
- id_enganchamento
- data
- pente
- quantidade
- observacao

**Regra associada:** As peças devem ser preparadas e fixadas adequadamente antes da anodização.

---

## DISPOSITIVO

**Definição:** Representa recursos utilizados para auxiliar na preparação e movimentação das peças no processo.

**Principais atributos:**
- id_dispositivo
- tipo
- descricao
- status

**Regra associada:** Os dispositivos devem estar disponíveis e adequados para utilização no processo.

---

## ANODIZAÇÃO

**Definição:** Representa o processo de tratamento da superfície do alumínio, incluindo acabamento e coloração.

**Principais atributos:**
- id_anodizacao
- data
- cor
- acabamento
- status
- observacao

**Regra associada:** As peças devem estar preparadas antes de serem encaminhadas para a anodização.

---

## PROCESSO

**Definição:** Representa um processo realizado durante a produção.

**Principais atributos:**
- id_processo
- nome
- descricao
- status

**Regra associada:** Um processo pode possuir diferentes etapas.

---

## ETAPA_PROCESSO

**Definição:** Representa uma etapa específica de um processo produtivo.

**Principais atributos:**
- id_etapa
- nome
- ordem
- descricao
- status

**Regra associada:** As etapas devem seguir a ordem definida para o processo.

---

## ACABAMENTO

**Definição:** Representa o tipo de acabamento aplicado à peça.

**Principais atributos:**
- id_acabamento
- descricao
- cor
- tipo

**Regra associada:** Um acabamento pode estar relacionado a diferentes peças.

---

## FUNCIONÁRIO

**Definição:** Representa os funcionários envolvidos na execução dos processos.

**Principais atributos:**
- id_funcionario
- nome
- cargo
- setor

**Regra associada:** Um funcionário pode executar ou acompanhar diferentes processos.

---

## CONTROLE_QUALIDADE

**Definição:** Representa o registro da avaliação da qualidade das peças após o processo produtivo.

**Principais atributos:**
- id_controle
- data
- resultado
- observacao
- status

**Regra associada:** O resultado da inspeção deve indicar se a peça foi aprovada ou necessita de retrabalho.

---

## EXPEDIÇÃO

**Definição:** Representa a etapa final de preparação e envio dos produtos.

**Principais atributos:**
- id_expedicao
- data
- quantidade
- status
- observacao

**Regra associada:** Somente produtos liberados pelo controle de qualidade devem ser encaminhados para expedição.

---

# 7. Modelagem Conceitual

A modelagem conceitual foi desenvolvida com o objetivo de representar as principais informações envolvidas no processo produtivo da Alhena Color.

As entidades foram definidas considerando os principais elementos observados durante o levantamento dos processos.

### Principais entidades

- Cliente
- Pedido
- Lote
- Modelo
- Peça
- Polimento
- Enganchamento
- Dispositivo
- Anodização
- Processo
- Etapa_Processo
- Acabamento
- Funcionário
- Controle_Qualidade
- Expedição

O relacionamento entre essas entidades permite representar o caminho das peças desde sua entrada no processo produtivo até a expedição.

---

# 8. Diagrama Entidade-Relacionamento (DER)

O DER apresenta as entidades, atributos, relacionamentos e cardinalidades definidos para representar o funcionamento da organização.

O modelo foi estruturado buscando manter a organização das informações e permitir futuras ampliações do sistema.

### DER da Alhena Color

![Diagrama Entidade-Relacionamento da Alhena Color](DER.png)

---

# 9. Justificativa Técnica

A utilização de um modelo entidade-relacionamento permite organizar os dados da organização de maneira estruturada.

A separação das informações em diferentes entidades evita a concentração de muitos dados em uma única estrutura e facilita a manutenção e consulta das informações.

As entidades relacionadas aos processos produtivos permitem acompanhar as diferentes etapas pelas quais uma peça pode passar.

A utilização de identificadores próprios para as entidades facilita a identificação dos registros e seus relacionamentos.

As cardinalidades foram definidas de acordo com o funcionamento esperado dos processos, buscando representar a relação entre modelos, peças, lotes, processos, funcionários e controle de qualidade.

O modelo também foi pensado de forma que possa ser ampliado futuramente com novos processos, setores e informações.

---

# 10. Uso de Inteligência Artificial

Durante o desenvolvimento deste projeto foi utilizada Inteligência Artificial como ferramenta de apoio.

### Ferramenta utilizada

**ChatGPT — OpenAI**

### Etapas em que a IA foi utilizada

A ferramenta foi utilizada como apoio para:

- Organização das informações;
- Estruturação do README;
- Sugestões para requisitos funcionais e não funcionais;
- Organização das regras de negócio;
- Apoio na identificação de entidades e atributos;
- Apoio na elaboração da modelagem conceitual;
- Organização e descrição do DER;
- Revisão e melhoria da apresentação do trabalho.

### Exemplos de prompts utilizados

> "Monte o DER completo da Alhena Color, com as entidades, atributos, relacionamentos e cardinalidades."

> "Adicione ao DER os setores de polimento, enganchamento, anodização e expedição."

> "Crie um fluxograma representando o processo produtivo da Alhena Color."

> "Organize as informações do trabalho em um README para GitHub."

### Validação das informações

As sugestões fornecidas pela Inteligência Artificial foram analisadas e adaptadas de acordo com as informações levantadas sobre os processos da organização.

As informações relacionadas aos processos reais da empresa foram consideradas a partir do levantamento realizado pelo grupo.

A IA foi utilizada como ferramenta de apoio, não substituindo a análise e a validação das informações pelos integrantes do grupo.

---

# 11. Conclusão

O desenvolvimento deste projeto possibilitou compreender como os processos de uma organização podem ser analisados e transformados em uma estrutura de dados organizada.

A partir do levantamento realizado na Alhena Color, foram identificadas etapas importantes do processo produtivo, como polimento, enganchamento, anodização, controle de qualidade e expedição.

A modelagem conceitual desenvolvida por meio do DER permite representar as principais entidades e seus relacionamentos, proporcionando uma base para uma futura implementação de banco de dados.

Além disso, o fluxograma facilita a visualização da sequência dos processos e contribui para uma melhor compreensão do funcionamento da organização.

---

# 12. Referências

- ALHENA COLOR. Empresa. Disponível em: https://www.alhenacolor.com.br/empresa
- ALHENA COLOR. Contato. Disponível em: https://www.alhenacolor.com.br/contato
- ALHENA COLOR. Anodização de Alumínio. Disponível em: https://www.alhenacolor.com.br/informacoes/anodizacao-de-aluminio
- ALHENA COLOR. Tratamento de Superfície de Alumínio. Disponível em: https://www.alhenacolor.com.br/informacoes/tratamento-de-superficie-de-aluminio
- Material didático da disciplina de Modelagem e Banco de Dados — UNICID.
- Informações levantadas durante a pesquisa e observação dos processos da organização.
- OpenAI. ChatGPT. Ferramenta de Inteligência Artificial utilizada como apoio ao desenvolvimento do projeto.
