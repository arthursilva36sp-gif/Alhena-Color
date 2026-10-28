Membros do Grupo 

Arthur Silva de Jesus RGM-45034133

Marcos Henrique Mota De Souza RGM-45134201

Luiz Henrique da Silva conceição RGM-44648111 

Gabriel Silva Diniz RGM-45618496 

Guilherme Barboza da Silva RGM-46450734

Projeto de Banco de Dados — Alhena Color Anodização

Entrega 2 — Modelagem, Implementação e Análise de Dados

Projeto acadêmico desenvolvido para a Alhena Color Anodização.

⸻

1. Levantamento e Modelagem do Sistema

1.1 Descrição da organização e levantamento de requisitos

1.1.1 Identificação da organização

* Empresa: Alhena Color Anodização
* Segmento: Tratamento e acabamento de perfis de alumínio.
* Ano de fundação: 2002.
* Quantidade de funcionários: 40.
* Endereço: Rua Urutaguá, 147 — Vila Independência, São Paulo — SP, CEP 04223-090.
* E-mail: contato@alhenacolor.com.br
* Telefone: (11) 2068-6691.
* WhatsApp: (11) 99286-8636.
* Site: https://www.alhenacolor.com.br/

A Alhena Color Anodização atua no segmento de tratamento e acabamento de perfis de alumínio, oferecendo diferentes opções de acabamento, como Alto Brilho, Dourado Brilho, Dourado Fosco e Inox.

A empresa possui laboratório próprio e realiza atividades relacionadas ao recebimento, preparação, tratamento, controle de qualidade e expedição dos materiais.

1.1.2 Objetivo do sistema

O objetivo do projeto é desenvolver uma proposta de banco de dados relacional para organizar e acompanhar as informações relacionadas aos pedidos e aos processos produtivos da Alhena Color.

O sistema pretende centralizar os registros, facilitar consultas, acompanhar o andamento das peças e permitir o controle das etapas realizadas, dos funcionários responsáveis, da qualidade e da expedição.

1.1.3 Processos organizacionais identificados

Com base nas informações levantadas sobre as atividades da empresa, foram identificados os seguintes processos:

1. Recebimento: entrada dos materiais e identificação dos pedidos recebidos.
2. Polimento: preparação das peças para as etapas seguintes.
3. Enganchamento: preparação e organização das peças para o tratamento.
4. Anodização: realização do processo de tratamento e acabamento do alumínio.
5. Controle de qualidade: verificação das condições das peças após o tratamento.
6. Expedição: organização e encaminhamento das peças aprovadas.

Esses processos são utilizados como referência para a estruturação do banco de dados.

1.1.4 Necessidades do sistema

O sistema proposto deverá permitir:

* Cadastro e consulta de clientes.
* Registro e acompanhamento de pedidos.
* Organização dos modelos e acabamentos solicitados.
* Controle dos lotes e das peças.
* Registro das etapas produtivas.
* Identificação dos funcionários responsáveis pelas atividades.
* Registro das inspeções de qualidade.
* Controle das peças aprovadas e reprovadas.
* Registro das expedições.
* Consulta ao histórico de produção.

1.1.5 Levantamento por entrevista e observação

O levantamento das informações foi utilizado para compreender a organização, suas atividades e os processos que precisam ser representados no banco de dados.

As informações institucionais e os processos descritos neste documento foram utilizados como base para a modelagem.

Não foram incluídos depoimentos, nomes de entrevistados ou resultados de observações específicas sem registro comprovado.

1.1.6 Escopo do projeto

O projeto contempla a modelagem e a implementação de uma estrutura de banco de dados voltada ao acompanhamento dos pedidos, lotes, peças, processos produtivos, funcionários, controle de qualidade e expedição.

Não fazem parte do escopo principal o controle financeiro, a folha de pagamento, a gestão de recursos humanos e o gerenciamento comercial completo da organização.

1.1.7 Requisitos funcionais

Código	Descrição
RF01	Permitir o cadastro de clientes.
RF02	Permitir o cadastro e a consulta de pedidos.
RF03	Permitir o registro dos itens de cada pedido.
RF04	Permitir o cadastro de modelos de peças.
RF05	Permitir o cadastro dos tipos de acabamento.
RF06	Permitir o cadastro e o acompanhamento de lotes.
RF07	Permitir o cadastro e a identificação das peças.
RF08	Permitir o cadastro dos processos produtivos e suas etapas.
RF09	Registrar a execução das etapas produtivas.
RF10	Identificar os funcionários responsáveis pelas atividades.
RF11	Registrar os resultados do controle de qualidade.
RF12	Identificar peças aprovadas, reprovadas e encaminhadas para retrabalho.
RF13	Registrar as expedições e as peças encaminhadas.
RF14	Permitir consultas e relatórios sobre o histórico dos processos.

1.1.8 Requisitos não funcionais

Código	Descrição
RNF01	O banco de dados deverá utilizar o SGBD MySQL.
RNF02	Os dados deverão possuir integridade referencial.
RNF03	O acesso às informações deverá considerar critérios de segurança.
RNF04	A estrutura deverá permitir consultas de maneira organizada.
RNF05	O modelo deverá permitir futuras ampliações.
RNF06	O banco deverá evitar duplicidade desnecessária de informações.

1.1.9 Regras de negócio

Código	Regra
RN01	Cada pedido deve estar relacionado a um cliente.
RN02	Um pedido pode possuir vários itens.
RN03	Cada item de pedido deve identificar o modelo e o acabamento solicitado.
RN04	Um item de pedido pode originar um ou mais lotes.
RN05	Um lote pode conter várias peças.
RN06	Cada peça deve estar vinculada a um único lote.
RN07	As peças devem passar pelas etapas produtivas necessárias.
RN08	As atividades produtivas devem possuir registros de execução.
RN09	Os registros de execução devem identificar o funcionário responsável.
RN10	As peças devem passar pelo controle de qualidade após o tratamento.
RN11	Peças reprovadas podem ser encaminhadas para retrabalho e nova avaliação.
RN12	Somente peças aprovadas podem ser liberadas para expedição.

1.1.10 Modelo conceitual revisado

O modelo conceitual foi revisado para representar de maneira organizada os relacionamentos entre clientes, pedidos, itens, modelos, acabamentos, lotes, peças, processos, funcionários, qualidade e expedição.

Os ajustes realizados buscam evitar relacionamentos redundantes e garantir que as informações necessárias possam ser registradas e consultadas.

O diagrama conceitual revisado será apresentado em arquivo separado, utilizando a notação do brModelo.

1.1.11 Correções realizadas em relação à Entrega 1

Elemento	Ajuste realizado	Justificativa
Pedido	Inclusão de ITEM_PEDIDO	Organizar os diferentes itens de um pedido.
Execução produtiva	Inclusão de EXECUCAO_ETAPA	Registrar as etapas realizadas e seus responsáveis.
Polimento, enganchamento e anodização	Representação por etapas do processo	Evitar duplicidade de estruturas de execução.
Controle de qualidade	Relacionamento direto com PECA	Permitir o acompanhamento individual das peças.
Expedição	Inclusão de ITEM_EXPEDICAO	Identificar as peças encaminhadas em cada expedição.
Dispositivo	Retirada do modelo lógico	Não faz parte dos recursos considerados no processo modelado.

⸻

1.2 Conversão do Modelo Conceitual para o Modelo Lógico

A conversão do modelo conceitual para o modelo lógico foi realizada com base nas entidades identificadas na Entrega 1 e nos requisitos levantados para o sistema de gerenciamento dos processos produtivos da Alhena Color.

O modelo lógico foi estruturado para organizar as informações de clientes, pedidos, modelos, acabamentos, lotes, peças, processos produtivos, funcionários, controle de qualidade e expedição.

Entidades e tabelas do modelo lógico

O modelo lógico é composto pelas seguintes 14 tabelas:

1. CLIENTE
2. PEDIDO
3. ITEM_PEDIDO
4. MODELO
5. ACABAMENTO
6. LOTE
7. PECA
8. PROCESSO
9. ETAPA_PROCESSO
10. EXECUCAO_ETAPA
11. FUNCIONARIO
12. CONTROLE_QUALIDADE
13. EXPEDICAO
14. ITEM_EXPEDICAO

Conversão das entidades

Cada entidade do modelo conceitual foi convertida em uma tabela relacional. Seus atributos foram transformados em colunas, e os identificadores foram definidos como chaves primárias (PK).

Os relacionamentos foram estabelecidos por meio de chaves estrangeiras (FK), permitindo conectar as informações e manter a integridade referencial do banco de dados.

As atividades de polimento, enganchamento e anodização são representadas como etapas dos processos produtivos, permitindo registrar sua execução e acompanhar o histórico de cada peça.

Principais relacionamentos do modelo

* CLIENTE e PEDIDO: um cliente pode realizar vários pedidos, e cada pedido pertence a um único cliente.
* PEDIDO e ITEM_PEDIDO: um pedido pode possuir vários itens, e cada item pertence a um único pedido.
* MODELO e ITEM_PEDIDO: um modelo pode estar associado a vários itens de pedidos.
* ACABAMENTO e ITEM_PEDIDO: um acabamento pode estar associado a vários itens de pedidos.
* ITEM_PEDIDO e LOTE: um item de pedido pode originar vários lotes, e cada lote está associado a um único item.
* LOTE e PECA: um lote pode conter várias peças, e cada peça pertence a um único lote.
* PROCESSO e ETAPA_PROCESSO: um processo pode possuir várias etapas, e cada etapa pertence a um processo.
* PECA e EXECUCAO_ETAPA: uma peça pode possuir vários registros de execução de etapas.
* ETAPA_PROCESSO e EXECUCAO_ETAPA: uma etapa pode estar presente em vários registros de execução.
* FUNCIONARIO e EXECUCAO_ETAPA: um funcionário pode ser responsável por várias execuções de etapas.
* PECA e CONTROLE_QUALIDADE: uma peça pode possuir vários registros de controle de qualidade.
* FUNCIONARIO e CONTROLE_QUALIDADE: um funcionário pode realizar vários registros de controle de qualidade.
* EXPEDICAO e ITEM_EXPEDICAO: uma expedição pode conter vários itens.
* PECA e ITEM_EXPEDICAO: uma peça pode estar associada a um registro de expedição.

Justificativa das alterações

Criação da tabela ITEM_PEDIDO: permite organizar os itens de cada pedido individualmente, relacionando cada item ao modelo e ao acabamento solicitado.

Criação da tabela EXECUCAO_ETAPA: permite registrar as etapas realizadas em cada peça, identificando a atividade executada, o funcionário responsável e as informações relacionadas à execução.

Criação da tabela ITEM_EXPEDICAO: permite registrar individualmente as peças incluídas em cada expedição.

Reorganização das atividades produtivas: as atividades de polimento, enganchamento e anodização são representadas por meio das etapas de processo, evitando a duplicação de informações.

Ajuste do controle de qualidade: os registros de inspeção são relacionados diretamente às peças, possibilitando acompanhar aprovações, reprovações e eventuais necessidades de retrabalho.

Generalização e especialização

O modelo lógico não utiliza generalização ou especialização, pois as entidades identificadas podem ser representadas diretamente por tabelas relacionais, sem necessidade de estruturas adicionais para esse recurso.

⸻

1.3 Chaves Primárias e Chaves Estrangeiras

As chaves primárias identificam exclusivamente cada registro de uma tabela. As chaves estrangeiras estabelecem os relacionamentos entre as tabelas e garantem a integridade referencial.

Relação de chaves primárias e estrangeiras

Tabela	Chave Primária (PK)	Chaves Estrangeiras (FK)
CLIENTE	id_cliente	—
PEDIDO	id_pedido	id_cliente
ITEM_PEDIDO	id_item_pedido	id_pedido, id_modelo, id_acabamento
MODELO	id_modelo	—
ACABAMENTO	id_acabamento	—
LOTE	id_lote	id_item_pedido
PECA	id_peca	id_lote
PROCESSO	id_processo	—
ETAPA_PROCESSO	id_etapa	id_processo
EXECUCAO_ETAPA	id_execucao	id_peca, id_etapa, id_funcionario
FUNCIONARIO	id_funcionario	—
CONTROLE_QUALIDADE	id_controle	id_peca, id_funcionario
EXPEDICAO	id_expedicao	—
ITEM_EXPEDICAO	id_item_expedicao	id_expedicao, id_peca

Integridade referencial

A integridade referencial será garantida por meio das restrições de chave estrangeira no MySQL.

Essas restrições impedem que sejam registrados relacionamentos com clientes, pedidos, lotes, peças, processos ou funcionários inexistentes.

As operações de exclusão e atualização deverão respeitar os vínculos existentes, evitando a perda indevida de informações históricas.

⸻

1.4 Normalização do Banco de Dados

A normalização foi aplicada para organizar as informações, reduzir redundâncias e evitar problemas de inserção, atualização e exclusão de dados.

Primeira Forma Normal (1FN)

A primeira forma normal determina que cada campo deve armazenar um único valor, sem listas ou grupos repetidos.

No modelo proposto, cada registro possui uma identificação própria e os atributos são organizados em campos individuais.

Segunda Forma Normal (2FN)

A segunda forma normal exige que todos os atributos não-chave dependam integralmente da chave primária.

As informações foram separadas em tabelas específicas, evitando que dados de clientes, pedidos, modelos, acabamentos e funcionários sejam repetidos desnecessariamente.

Terceira Forma Normal (3FN)

A terceira forma normal busca eliminar dependências transitivas entre atributos que não são chaves.

As informações foram organizadas de forma que cada tabela armazene dados referentes à sua própria entidade.

Por exemplo, os dados de clientes permanecem na tabela CLIENTE, enquanto as informações dos pedidos ficam na tabela PEDIDO.

Resultado da normalização

A estrutura proposta busca atender às três formas normais, proporcionando maior organização, consistência e facilidade de manutenção dos dados.

⸻

1.5 Justificativas Técnicas

A estrutura do banco de dados foi definida considerando a necessidade de acompanhar as informações desde o pedido do cliente até a expedição das peças.

As principais decisões técnicas foram:

* Separação das entidades: permite organizar os dados de acordo com suas responsabilidades.
* Utilização de chaves primárias: garante a identificação individual dos registros.
* Utilização de chaves estrangeiras: mantém os relacionamentos entre as tabelas.
* Criação de ITEM_PEDIDO: permite que um pedido contenha diferentes modelos e acabamentos.
* Criação de EXECUCAO_ETAPA: possibilita registrar o histórico produtivo de cada peça.
* Criação de ITEM_EXPEDICAO: permite identificar as peças encaminhadas em cada expedição.
* Controle de qualidade individual: possibilita acompanhar os resultados das inspeções de cada peça.
* Normalização: reduz a repetição de informações e facilita a manutenção.
* MySQL: foi escolhido como sistema gerenciador de banco de dados por oferecer suporte a tabelas relacionais, restrições, consultas e operações de manipulação de dados.

A liberação para expedição deverá considerar a aprovação registrada no controle de qualidade, garantindo que peças reprovadas não sejam encaminhadas como aprovadas.

⸻

1.6 Proposta de Business Intelligence e Inteligência Artificial

A utilização de Business Intelligence (BI) e Inteligência Artificial (IA) poderá contribuir para a análise dos dados produtivos e para o acompanhamento dos indicadores da empresa.

A proposta é utilizar as informações armazenadas no banco de dados para gerar consultas, relatórios e indicadores que auxiliem na tomada de decisões.

Indicadores propostos

Código	Indicador	Objetivo
KPI01	Quantidade de pedidos cadastrados	Acompanhar a entrada de pedidos.
KPI02	Quantidade de lotes registrados	Acompanhar a formação dos lotes.
KPI03	Quantidade de peças cadastradas	Identificar o volume de peças controladas.
KPI04	Peças aprovadas no controle de qualidade	Acompanhar os resultados das inspeções.
KPI05	Peças reprovadas no controle de qualidade	Identificar ocorrências de reprovação.
KPI06	Quantidade de peças expedidas	Acompanhar os encaminhamentos realizados.

Consultas gerenciais propostas

Código	Consulta	Objetivo
G01	Pedidos por cliente	Identificar os pedidos registrados para cada cliente.
G02	Itens por pedido	Consultar os itens associados a cada pedido.
G03	Lotes por pedido	Acompanhar a divisão dos pedidos em lotes.
G04	Peças por lote	Consultar as peças pertencentes a cada lote.
G05	Peças por acabamento	Analisar a distribuição dos acabamentos solicitados.
G06	Histórico produtivo das peças	Consultar as etapas executadas em cada peça.
G07	Atividades por funcionário	Identificar as execuções registradas por funcionário.
G08	Resultado do controle de qualidade	Consultar aprovações e reprovações.
G09	Peças pendentes de aprovação	Identificar peças sem aprovação registrada.
G10	Peças aprovadas para expedição	Identificar peças liberadas pelo controle de qualidade.
G11	Histórico de expedição	Consultar as peças encaminhadas em cada expedição.

Proposta de utilização de Inteligência Artificial

A Inteligência Artificial poderá ser utilizada futuramente para analisar os dados históricos e identificar padrões que auxiliem no acompanhamento da produção.

Entre as possibilidades estão:

* Identificação de etapas com maior quantidade de reprovações.
* Análise de ocorrências recorrentes no controle de qualidade.
* Identificação de tendências nos resultados das inspeções.
* Apoio à elaboração de relatórios gerenciais.
* Análise de indicadores de produção e expedição.

A utilização dessas ferramentas dependerá da existência de dados históricos suficientes e confiáveis.

Rastreabilidade entre indicadores e consultas SQL

Os indicadores KPI01 a KPI06 serão construídos a partir das consultas gerenciais correspondentes.

As consultas G01 a G11 deverão utilizar as tabelas do modelo lógico, permitindo rastrear a origem das informações apresentadas nos relatórios.

⸻

2. Modelo Lógico

O modelo lógico representa a organização das tabelas, seus atributos, chaves primárias e chaves estrangeiras.

O diagrama deverá ser elaborado utilizando a notação do brModelo e deverá apresentar os relacionamentos entre as 14 tabelas do banco de dados.

Tabelas do modelo lógico

* CLIENTE
* PEDIDO
* ITEM_PEDIDO
* MODELO
* ACABAMENTO
* LOTE
* PECA
* PROCESSO
* ETAPA_PROCESSO
* EXECUCAO_ETAPA
* FUNCIONARIO
* CONTROLE_QUALIDADE
* EXPEDICAO
* ITEM_EXPEDICAO

Relacionamentos principais

O modelo deverá representar os relacionamentos entre clientes e pedidos, pedidos e itens, itens e lotes, lotes e peças, processos e etapas, peças e execuções, funcionários e atividades, peças e controle de qualidade, além das relações entre expedições e peças.

O diagrama lógico deverá manter correspondência com as chaves apresentadas na seção 1.3 e com a estrutura implementada no script SQL.

Arquivo previsto: Modelo-Logico-Alhena-Color.png

⸻

3. Implementação do Banco de Dados em MySQL

A implementação deverá utilizar o MySQL como sistema gerenciador de banco de dados.

O script SQL deverá contemplar a criação do banco, das tabelas, das chaves primárias, das chaves estrangeiras, das restrições de integridade e dos registros de exemplo.

3.1 Estrutura do banco

O banco de dados será denominado:

alhena_color

3.2 Estrutura das tabelas

O script deverá criar as 14 tabelas definidas no modelo lógico:

1. CLIENTE
2. PEDIDO
3. ITEM_PEDIDO
4. MODELO
5. ACABAMENTO
6. LOTE
7. PECA
8. PROCESSO
9. ETAPA_PROCESSO
10. EXECUCAO_ETAPA
11. FUNCIONARIO
12. CONTROLE_QUALIDADE
13. EXPEDICAO
14. ITEM_EXPEDICAO

3.3 Restrições e integridade

A implementação deverá utilizar:

* PRIMARY KEY para identificação dos registros.
* FOREIGN KEY para relacionamentos entre tabelas.
* NOT NULL para campos obrigatórios.
* UNIQUE para informações que não podem ser repetidas.
* CHECK para validações de valores permitidos, quando aplicável.
* Tipos de dados adequados para cada atributo.

3.4 Inserção de dados

O banco deverá possuir dados fictícios para demonstrar o funcionamento das operações.

Os registros utilizados na apresentação e nos testes deverão ser identificados como dados acadêmicos fictícios, sem representar informações reais de clientes ou da produção da empresa.

A massa de dados deverá contemplar diferentes clientes, pedidos, modelos, acabamentos, lotes, peças, funcionários, execuções, resultados de qualidade e expedições.

3.5 Operações SQL

O script deverá demonstrar:

* Criação do banco de dados.
* Criação das tabelas.
* Inserção de registros.
* Consultas utilizando SELECT.
* Consultas utilizando JOIN.
* Atualização de registros utilizando UPDATE.
* Exclusão controlada utilizando DELETE.
* Consultas gerenciais G01 a G11.
* Consultas de auditoria A01 em diante.

3.6 Consultas de auditoria

As consultas de auditoria deverão permitir verificar a consistência das informações, incluindo:

* Registros sem relacionamento válido.
* Peças sem execução de etapas.
* Peças sem controle de qualidade.
* Peças reprovadas.
* Peças sem aprovação para expedição.
* Registros de expedição e suas respectivas peças.

A implementação deverá impedir que peças sem aprovação sejam liberadas para expedição.

Arquivo previsto: alhena_color.sql

⸻

4. Dicionário de Dados

O dicionário de dados deverá apresentar a descrição das tabelas e de seus respectivos campos.

Para cada atributo deverão ser identificados:

* Nome do campo.
* Tipo de dado.
* Tamanho, quando aplicável.
* Chave primária ou estrangeira.
* Obrigatoriedade.
* Descrição da informação armazenada.

O dicionário deverá manter correspondência com o modelo lógico e com o script SQL.

Arquivo previsto: Dicionario-de-Dados-Alhena-Color.html

⸻

5. Evidências e Organização do Repositório

O repositório deverá reunir os documentos, diagramas e arquivos necessários para demonstrar o desenvolvimento do projeto.

Estrutura proposta

Alhena-Color/
│
├── README.md
│
├── DER-Alhena-Color.png
│
├── Modelo-Logico-Alhena-Color.png
│
├── Fluxograma-Alhena-Color.jpeg
│
├── Dicionario-de-Dados-Alhena-Color.html
│
├── alhena_color.sql
│
├── Levantamento-de-Campo.md
│
├── Evidencias/
│   ├── evidencia-01.png
│   ├── evidencia-02.png
│   └── evidencia-03.png
│
└── Apresentacao/
    └── Apresentacao-Entrega-2.pdf

Evidências do desenvolvimento

As evidências deverão demonstrar as etapas de desenvolvimento do projeto, incluindo:

* Diagramas elaborados.
* Estrutura das tabelas.
* Relacionamentos do banco de dados.
* Execução do script SQL.
* Resultados das consultas.
* Organização dos arquivos no GitHub.

As imagens deverão corresponder às atividades efetivamente realizadas pela equipe.

Histórico de desenvolvimento

O histórico de commits do GitHub deverá demonstrar a evolução do projeto, identificando as alterações realizadas ao longo do desenvolvimento.

⸻

6. Utilização de Inteligência Artificial

A Inteligência Artificial foi utilizada como ferramenta de apoio ao desenvolvimento do projeto, auxiliando na organização das informações, revisão textual, estruturação da modelagem e elaboração de propostas para consultas SQL.

As ferramentas de IA podem auxiliar na identificação de inconsistências e na revisão técnica, mas as decisões finais devem ser analisadas e validadas pelos integrantes da equipe.

Aplicações de IA no projeto

* Organização e revisão da documentação.
* Apoio à identificação de relacionamentos entre entidades.
* Revisão das chaves primárias e estrangeiras.
* Apoio à normalização do banco de dados.
* Elaboração e revisão de consultas SQL.
* Organização dos indicadores gerenciais.
* Apoio à preparação da apresentação.

Os conteúdos gerados com auxílio de IA deverão ser revisados e testados antes de serem considerados definitivos.

⸻

7. Considerações Finais

O desenvolvimento deste projeto permitiu aplicar conceitos de modelagem de dados, normalização, relacionamentos, integridade referencial e implementação de banco de dados relacional.

A proposta foi estruturada considerando os processos produtivos da Alhena Color Anodização, desde o registro dos pedidos até o controle de qualidade e a expedição das peças.

A organização das informações em tabelas relacionadas permite construir uma estrutura capaz de armazenar dados de maneira consistente e facilitar consultas sobre as atividades realizadas.

Além da implementação técnica, o projeto demonstra a importância do planejamento e da organização dos dados para apoiar o acompanhamento dos processos e a tomada de decisões.

A utilização de consultas gerenciais e indicadores também permite explorar os dados armazenados e propor melhorias futuras no acompanhamento das atividades da empresa.

⸻

Projeto acadêmico — Alhena Color Anodização

Entrega 2 — Banco de Dados

