Integrantes
Nome completo	RGM	Conta GitHub
Arthur Silva de Jesus	45034133	arthursilva36sp-gif (titular do repositório; confirmar se conta pessoal do integrante)
Gabriel Silva Diniz	45618496	A confirmar pelo grupo
Guilherme Barboza da Silva	46450734	A confirmar pelo grupo
Luiz Henrique da Silva Conceição	44648111	A confirmar pelo grupo
Marcos Henrique Mota de Souza	45134201	A confirmar pelo grupo


1. Caracterização da organização
1.1 Quem é a Alhena Color
A Alhena Color Anodização atua no acabamento e tratamento de superfícies de perfis de alumínio. Segundo a caracterização anteriormente apresentada pelo grupo, a empresa foi fundada em 2002, conta com aproximadamente 40 funcionários e opera com acabamentos comerciais como Alto Brilho, Dourado Brilho, Dourado Fosco e Inox. O responsável deve confirmar a quantidade atual de colaboradores e a distribuição por setor/turno.
- Natureza: empresa privada, com fins lucrativos.
- Local informado nos materiais: Rua Urutaguá, 147, Vila Independência, São Paulo/SP, CEP 04223-090.
- Site apresentado no trabalho: https://www.alhenacolor.com.br/.
- Telefone comercial informado: (11) 2068-6691.
- E-mail divulgado no projeto: contato@alhenacolor.com.br.
- Porte operacional ainda não comprovado: pedidos/mês, lotes/semana, perfis/turno, litros de insumos e volume de expedição. PREENCHER com informação confirmada pela empresa.
1.2 Problemas de informação modelados
A avaliação identificou que o README anterior apresentava problemas genéricos, sem relação clara com requisitos e tabelas. A versão corrigida apresenta riscos operacionais e necessidades de informação. Não afirmar que esses incidentes de fato ocorrem na Alhena Color sem confirmação do responsável.
Código	Necessidade/problema de informação proposto	Como o modelo ajuda	Evidência necessária
P01	Não conseguir relacionar pedido, lote e peça em uma única consulta	PEDIDO, ITEM_PEDIDO, LOTE, PECA; histórico G06	Confirmar procedimento de rastreio atual
P02	Risco de registrar expedição sem aprovação final válida	CONTROLE_QUALIDADE, ITEM_EXPEDICAO, trigger RN12	Validar protocolo de liberação real
P03	Dificuldade de consolidar reprovações e retrabalhos por período	CONTROLE_QUALIDADE, consultas G08 e G17	Confirmar indicadores usados pela qualidade
P04	Falta de visão unificada das etapas ainda pendentes	ETAPA_PROCESSO, EXECUCAO_ETAPA, consulta G19	Confirmar quais etapas são obrigatórias
P05	Orçamentos, pedidos aceitos e prazos sem vínculo sistemático	ORCAMENTO, ITEM_ORCAMENTO, PEDIDO, G20 e G21	Validar fluxo comercial com responsável
P06	Falta de cruzamento entre pedidos, faturamento, pagamentos e documentos fiscais	FATURA, PAGAMENTO, NOTA_FISCAL, G22 e G29	Validar processo fiscal e financeiro
P07	Dificuldade de medir compras e saldo de insumos	COMPRA, ITEM_COMPRA, INSUMO, MOVIMENTACAO_INSUMO, G23 e G28	Validar catálogo, unidade e estoque real
P08	Falta de consulta consolidada das análises de banhos	TANQUE_BANHO, ANALISE_BANHO, G24	Confirmar parâmetros e frequência do laboratório
P09	Dificuldade de organizar referências de destinação de efluentes	REGISTRO_EFLUENTE, G25	Validar exigências e comprovantes com responsável
P10	Lotação de funcionários por setor e turno não rastreável	SETOR, TURNO, LOTACAO_FUNCIONARIO, G26	Confirmar escala e alocação
P11	Capacidade e uso de pentes/suportes não controlados	DISPOSITIVO_ENGANCHAMENTO, USO_DISPOSITIVO, G27, B01	Confirmar restrições dimensionais e capacidade
P12	Histórico de EPI e treinamentos não consolidado	ENTREGA_EPI, TREINAMENTO_SEGURANCA, G31	Confirmar rotinas e normas efetivamente aplicáveis


Por que a empresa é adequada ao projeto: um pedido pode conter diferentes modelos e acabamentos; peças de um lote passam por várias etapas; pessoas distintas executam e inspecionam; o mesmo pedido possui informações comerciais, produtivas, fiscais e de suporte que se relacionam. Isso cria dependências reais entre entidades, além de casos de auditoria verificáveis por SQL.
1.3 Evidências da organização e entrevista
As fotografias recebidas estão incorporadas ao repositório, e não apenas em links externos:
- [Fotografia do chão de fábrica e pessoas no ambiente](evidencias/visita-chao-de-fabrica.jpeg).
- [Fotografia da visita/apresentação no galpão](evidencias/visita-apresentacao-empresa.jpeg).
Limite do que as imagens provam: representam a presença de pessoas em ambiente industrial. Não identificam de forma autônoma o responsável entrevistado, a data, as respostas ou a autorização para publicação. Essas informações precisam constar no relato e ser validadas pelo grupo. Arquivo de coleta: [levantamento.md](levantamento/levantamento.md).

Obrigatório preencher após conversa com responsável: nome, função, telefone para contato autorizado, data da entrevista, integrantes que compareceram e cinco a dez achados concretos, discriminando o que foi observado do que foi declarado.
2. Processos de negócio
O modelo foi dividido em quatro domínios integrados. Confirmados pelos documentos existentes: recebimento, polimento, enganchamento, anodização, inspeção e expedição. Sugeridos por estudo dos processos típicos do setor e pelas lacunas da avaliação: itens comerciais, compras, faturamento, manutenção, acompanhamento ambiental e administrativo. Cada proposta deve passar por validação de campo.
Código	Processo e dados envolvidos	Situação da informação
PR01	Orçamento: cliente, modelo, acabamento, quantidade, preço, data, validade, status	Hipótese a validar
PR02	Aceite e pedido: cliente, orçamento opcional, data de aceite, prazo, status e itens	Pedido modelado; aceite/prazo a validar
PR03	Recebimento: item do pedido, identificação de lote, peça recebida, data e quantidade	Etapa descrita no levantamento original
PR04	Polimento: peça, etapa, responsável, início, fim, status	Etapa descrita no levantamento original
PR05	Enganchamento: peça, execução, funcionário, dispositivo e quantidade no pente	Etapa descrita; gestão de dispositivo a validar
PR06	Anodização: execução produtiva, acabamento planejado, responsável e datas	Etapa descrita no levantamento original
PR07	Qualidade/retrabalho: peça, inspetor, resultado, data, rejeição, nova execução/reinspeção	Etapa descrita; procedimentos de retrabalho a validar
PR08	Expedição/entrega: expedição, responsável, data, peças liberadas	Etapa descrita no levantamento original
PR09	Faturamento/cobrança: pedido, fatura, vencimento, valor, pagamento, referência de nota fiscal	Hipótese a validar com área financeira
PR10	Compras e fornecedores: fornecedor, compra, item, insumo, custo, status	Hipótese a validar com almoxarifado
PR11	Estoque/consumo de insumos: entrada/saída, unidade de medida, quantidade, mínimo	Hipótese a validar
PR12	Laboratório/manutenção de banhos: tanque, medição, resultado, funcionário, manutenção	Laboratório citado no projeto; rotina a validar
PR13	Efluentes e segurança: data, volume, destinação, EPI, treinamento	Hipótese a validar com meio ambiente/segurança
PR14	Setores e turnos: funcionário, setor, turno, início/fim da lotação	Hipótese a validar com gestão operacional



Justificativa de processos não detalhados: folha de pagamento, admissão completa em RH, contabilidade fiscal oficial, automação de banhos e emissão real de NF-e não fazem parte da implementação acadêmica. Se existirem na rotina, precisam ser reconhecidos como interfaces ou sistemas externos: não afirmar que a empresa não os realiza. A base ampliada foi projetada para receber referências e análises, não substituir ERP, equipamentos industriais, sistema fiscal ou controles legalmente exigidos.
3. Requisitos do sistema
3.1 Requisitos funcionais — com dados envolvidos
Código	Requisito detalhado	Estado
RF01	Cadastrar clientes com nome, documento único, contato e endereço.	Núcleo
RF02	Registrar pedido com cliente, data, status e observações.	Núcleo
RF03	Cadastrar itens de pedido com modelo, acabamento, quantidade positiva e observação.	Núcleo
RF04	Manter modelos com nome único e descrição.	Núcleo
RF05	Manter acabamentos com nome único e descrição.	Núcleo
RF06	Registrar lote por item do pedido, com data e status.	Núcleo
RF07	Registrar peça com código único, lote, data e situação.	Núcleo
RF08	Cadastrar processos e etapas com nome, ordem e obrigatoriedade.	Núcleo
RF09	Registrar execução por peça, etapa, funcionário, início, fim, status e observação.	Núcleo
RF10	Registrar funcionário com nome, cargo, data de admissão e status.	Núcleo
RF11	Registrar inspeção com peça, funcionário, data, resultado e observações.	Núcleo
RF12	Manter histórico de reinspeção após retrabalho.	Núcleo (não automatiza retrabalho)
RF13	Registrar remessa com responsável, data e peças, exigindo liberação pela RN12.	Núcleo
RF14	Emitir relatórios de rastreabilidade, qualidade e expedição por consultas SQL.	Núcleo
RF15	Registrar orçamento com cliente, validade, status e itens cotados com preço.	Extensão
RF16	Relacionar pedido a orçamento e registrar aceite e prazo, quando existir.	Extensão
RF17	Consultar pedidos em aberto com prazo ultrapassado.	Extensão
RF18	Registrar fatura, pagamentos e referência documental de nota fiscal por pedido.	Extensão
RF19	Cadastrar fornecedores, compras, itens adquiridos e preços unitários.	Extensão
RF20	Cadastrar insumos, unidade, mínimo, movimentos de estoque e saldos calculados.	Extensão
RF21	Cadastrar tanque/banho com código, finalidade, capacidade e estado.	Extensão
RF22	Registrar análises do banho com tanque, funcionário, data, pH, temperatura e resultado.	Extensão
RF23	Registrar evento de efluente com volume, data, destinação e referência de comprovante.	Extensão
RF24	Registrar manutenções com tanque, data, responsável, tipo e descrição.	Extensão
RF25	Cadastrar setores, turnos e histórico de lotação dos funcionários.	Extensão
RF26	Cadastrar dispositivos de enganchamento e vincular uso às execuções e quantidades.	Extensão
RF27	Registrar entregas de EPI e treinamentos com colaborador e data.	Extensão


3.2 Requisitos não funcionais
Código	Descrição mensurável/proposta
RNF01	Persistir em MySQL/MariaDB compatível com constraints e InnoDB, definindo versão mínima efetivamente testada.
RNF02	Usar utf8mb4, evitar duplicidade por PK, UQ e FKs, e registrar instantes em tipos temporais.
RNF03	Garantir que toda alteração produza resposta explícita; consultas de leitura não podem modificar dados.
RNF04	Minimizar acesso a dados pessoais; aplicar perfis e registros de acesso numa eventual aplicação. Não implementado.
RNF05	Validar desempenho das consultas em ambiente real antes de prometer tempo de resposta.
RNF06	Manter nomenclatura padronizada (id_, FK, prefixos para consultas G/A/B) e documentação versionada.
RNF07	Permitir reexecução controlada em ambiente de testes; nunca executar script destrutivo em produção.
RNF08	Manter separação entre dados fictícios de teste, dados públicos e informações internas não autorizadas.


4. Regras de negócio — condições concretas e restrições
As regras operacionais abaixo são regras do protótipo; onde indicado, a regra é proposta e precisa ser validada com a organização. Uma cardinalidade por si só não substitui uma regra operacional.
Código	Regra / condição	Como é verificada	Estado
RN01	Um pedido não pode ser registrado com cliente inexistente.	FK PEDIDO.id_cliente	Implementada
RN02	A quantidade solicitada por item deve ser maior que zero.	CHECK(quantidade>0)	Implementada
RN03	Um item só pode apontar para modelo/acabamento cadastrado.	FKs em ITEM_PEDIDO	Implementada
RN04	Lote deve estar associado a item de pedido real, sem lote órfão.	FK LOTE.id_item_pedido	Implementada
RN05	Código identificador de peça não pode se repetir.	UNIQUE(identificacao)	Implementada
RN06	Horário final de execução não pode anteceder seu início.	CHECK em EXECUCAO_ETAPA	Implementada
RN07	Etapas obrigatórias precisam estar concluídas antes da inspeção liberadora da expedição.	Trigger RN12	Implementada na liberação
RN08	Inspeção deve guardar peça, inspetor, data e resultado válido.	FKs, NOT NULL e CHECK	Implementada
RN09	Reprovação pode gerar retrabalho e reinspeção mantendo histórico.	Múltiplas linhas; consulta G17	Suportada (sem fluxo automático)
RN10	Só pode sair peça de status APROVADA, com última inspeção aprovada e cronologia válida.	Trigger trg_bi_item_expedicao_validar	Testada no MySQL (PEC-002)
RN11	Uma peça não pode ser vinculada duas vezes a expedições.	UNIQUE(id_peca) em ITEM_EXPEDICAO	Implementada
RN12	Liberação para expedição exige aprovação e etapas obrigatórias concluídas; depois muda a situação para EXPEDIDA.	Triggers BEFORE/AFTER	Testada no bloqueio; demais cenários pendentes
RN13	Situações de pedido, peça, inspeção e lote devem usar valores controlados.	CHECK nas tabelas	Implementada
RN14	Quantidade de peças registradas deve ser comparada à quantidade solicitada.	Auditoria A06	Só detecta, não bloqueia
RN15	Orçamento possui validade posterior ou igual à emissão e itens positivos.	CHECK / FK	Estrutura proposta
RN16	Pedido originado de orçamento deve pertencer ao mesmo cliente e derivar de orçamento aceito.	Auditoria B03 para cliente; aceite ainda sem trigger	Parcial / a validar
RN17	Prazo prometido deve ser registrado no pedido aceito.	Campos e consulta G21	Parcial / a validar
RN18	Fatura e pagamentos precisam manter valores não negativos/positivos e status controlado.	CHECK em FATURA/PAGAMENTO	Estrutura proposta
RN19	Movimentação não pode consumir estoque gerando saldo negativo.	Auditoria B02	Apenas detecta; não bloqueia
RN20	Análises de tanques devem registrar responsável e resultado, e limites reais precisam ser definidos pelo laboratório.	FKs e CHECK de pH	Parcial / a validar
RN21	Capacidade declarada do dispositivo não pode ser ultrapassada em um registro de uso.	Auditoria B01	Apenas detecta; não bloqueia
RN22	Efluentes devem ter data, volume positivo, destinação e referência documental quando exigida.	NOT NULL, CHECK; comprovante facultativo	Parcial / a validar
RN23	Lotação e turno devem ser identificáveis por período, sem data final anterior ao início.	FKs, CHECK	Estrutura proposta
RN24	EPI e treinamento devem ser registrados, conforme obrigações e práticas efetivamente aplicáveis.	Cadastros ENTREGA_EPI, TREINAMENTO_SEGURANCA	A validar; sem bloqueio
RN25	Dados pessoais e acesso por cargo devem observar LGPD e autorização organizacional.	Matriz proposta no dicionário	Não implementada
RN26	Cada item de compra deve ter quantidade positiva, preço não negativo e fornecedor identificado.	CHECKs e FKs	Estrutura proposta
RN27	Referência fiscal no banco não substitui emissão/validação real de documento fiscal.	Restrição metodológica	Não é emissão fiscal


Aspectos ambientais, fiscais e de segurança do trabalho: devem ser tratados como requisitos reais somente após confirmação com setor/assessoria responsável. Não afirmar licenças específicas, atendimento a normas regulamentadoras, limites de banho, obrigação de NF na mesma data da saída ou comprovação de destinação apenas pelo cadastro.
5. Dicionário de dados conceitual e técnico
- [**Dicionário em HTML**](Dicionario_de_Dados_Alhena_Color.html) — formato solicitado para não-GTI; contém as 35 tabelas, tipos SQL, chaves, obrigatoriedade, padrões, índices/restrições, fluxos, cardinalidades e sugestões de acesso.
- [**Dicionário em Markdown**](Dicionario_de_Dados_Alhena_Color.md) — alternativa para GTI e para versionamento no GitHub.
O relatório recebido menciona GTI, mas a disciplina foi informada como Ciência da Computação. Como a regra do professor diferencia formatos, ambos são disponibilizados, para que o grupo use aquele exigido para sua turma.
6. Modelagem conceitual: entidades e relacionamentos
Em lugar de misturar FKs dentro do DER, as entidades conceituais são apresentadas com retângulos, relacionamentos em losangos, atributos identificadores sublinhados dentro dos retângulos e cardinalidades mínima e máxima. Por legibilidade, o DER foi dividido em quatro módulos que fazem parte de um único modelo integrado:
1. [**Visão geral única: DER integrado com 35 entidades (SVG para ampliar)**](diagramas/DER_INTEGRADO_35_ENTIDADES.svg).
2. [DER núcleo — clientes, pedidos e produção](diagramas/01_DER_Nucleo.png).
3. [DER comercial — orçamentos, faturamento e referências fiscais](diagramas/02_DER_Comercial.png).
4. [DER compras, fornecedores e estoque](diagramas/03_DER_Compras_Estoque.png).
5. [DER laboratório, efluentes, RH, dispositivo e segurança](diagramas/04_DER_Apoio_Seguranca.png).
Os diagramas foram elaborados programaticamente em Graphviz, com notação visual de entidades/losangos e cardinalidades (mín,máx); não são arquivos nativos do brModelo. Se o professor exigir entrega editável nativa em brModelo, o grupo precisará reproduzi-los nessa ferramenta. O modelo lógico, ao contrário do conceitual, possui FKs.

Entidades associativas e por que existem: ITEM_PEDIDO (quantidade/modelo/acabamento); ITEM_ORCAMENTO (quantidade/preço); ITEM_COMPRA (quantidade e preço do insumo); ITEM_EXPEDICAO (quais peças saíram em cada remessa); LOTACAO_FUNCIONARIO (colaborador/setor/turno com período); USO_DISPOSITIVO (quantidade associada à execução de enganchamento). Estas entidades guardam dados próprios do relacionamento e não apenas nomes de FKs.

Cardinalidades: encontram-se também numa tabela completa na seção 3 do dicionário. Ex.: cliente (0,N) realiza pedido (1,1); pedido (0,N) possui item (1,1); peça (0,1) entra em item de expedição (1,1). Os máximos e mínimos representam o modelo atual; algumas obrigações de negócio (como um pedido aceito possuir itens) exigem verificações adicionais e não são garantidas só por FK.
6.1 Escolhas técnicas com alternativas consideradas
Decisão	Alternativa descartada	Motivo da escolha
Separar ITEM_PEDIDO de PEDIDO	Gravar um único modelo/acabamento diretamente no pedido	Um pedido pode ter mais de uma combinação de modelo, acabamento e quantidade.
Separar ETAPA_PROCESSO e EXECUCAO_ETAPA	Criar tabelas independentes para polimento, enganchamento e anodização	Evita repetição de campos de horário, funcionário e situação e permite cadastrar novas etapas sem recriar o esquema.
Inspecionar por PECA	Guardar um único resultado por lote	Um lote pode conter peças aprovadas e reprovadas; cada peça precisa de histórico de reinspeção.
Criar ITEM_EXPEDICAO	Guardar id_expedicao diretamente em cada peça	Permite representar a relação entre remessa e diversas peças, com unicidade por peça e histórico.
Usar MOVIMENTACAO_INSUMO	Atualizar apenas um saldo único na tabela INSUMO	O saldo calculado conserva o histórico de entradas e saídas e facilita auditoria.
Guardar ANALISE_BANHO separadamente	Armazenar apenas o último pH na tabela do tanque	Mantém histórico datado das medições e eventuais revisões.
Histórico de lotação	Guardar apenas setor e turno no cadastro de funcionário	Permite observar alterações de setor/turno ao longo do tempo.


6.2 Normalização 1FN, 2FN e 3FN
1FN: um pedido com dois modelos não recebe duas listas na mesma célula; cada combinação fica numa linha de ITEM_PEDIDO com quantidade própria. Da mesma forma, várias inspeções de uma peça geram várias linhas em CONTROLE_QUALIDADE.

2FN: atributos não-chave devem depender da chave inteira, quando esta for composta. Nas associativas, atributos como quantidade e preco_unitario pertencem ao item relacionado, e não apenas ao fornecedor ou ao pedido isoladamente. Como as tabelas usam PKs artificiais simples (id_...), não há dependência de parte da PK, mas é necessário conferir também as chaves candidatas/composições de negócio.

3FN: dados do cliente permanecem em CLIENTE; os pedidos contêm apenas uma referência ao cliente. O nome do fornecedor fica em FORNECEDOR, não replicado em COMPRA; características da etapa ficam em ETAPA_PROCESSO, enquanto horários reais ficam em EXECUCAO_ETAPA. Isso evita dependências transitivas e mudanças inconsistentes de atributos cadastrais.

Limites da normalização: a 3FN é uma hipótese defensável pelo esquema, não um certificado automático. Cabe ao grupo testar dependências funcionais com regras validadas. Uma chave artificial em cada tabela, sozinha, não prova normalização.
7. SQL e implementação
7.1 Banco testado versus extensão proposta
- [**01 — Base validada, 14 tabelas**](docs/alhena_color_base_validada.sql): é a mesma versão central já importada pelo grupo, incluindo 180 peças fictícias, 45 lotes, 634 execuções, 19 consultas gerenciais (G01–`G19`), oito auditorias (A01–`A08`) e triggers de expedição. Os números são demonstração acadêmica, não medição real da empresa.
- [**02 — Extensão organizacional, +21 tabelas**](docs/02_extensao_organizacional.sql): agrega orçamento, financeiro, fiscal documental, compras, estoque de insumos, laboratório, ambiente, manutenção, setorização e segurança. Não testada em MySQL no seu computador.
- [**03 — Dados fictícios complementares**](docs/03_dados_complementares.sql): exemplifica os novos domínios com valores completamente simulados.
- [**Script integrado, destrutivo e AINDA NÃO TESTADO (35 tabelas)**](docs/Alhena_Color_35_Tabelas_COMPLETO_NAO_TESTADO.sql): agrupa a base e a extensão para uma implantação nova num banco de teste isolado. Não execute no banco já validado sem backup.
- [**04 — Consultas complementares**](docs/04_consultas_complementares.sql): G20–`G31` e auditorias B01–`B03` para as necessidades P05–P12.
Sequência no banco que você já possui: NÃO executar novamente o arquivo 01. Ele usa DROP TABLE. Fazer backup e executar somente 02, depois 03, depois 04, um por vez. Não executar a extensão diretamente antes da apresentação sem testar e ter cópia do banco. A versão anterior de 14 tabelas, já comprovada pelo grupo, é suficiente para as demonstrações que já funcionaram.

Práticas de segurança: os scripts contêm dados fictícios, mas uma importação pode alterar ou apagar os registros de um banco de teste. Trabalhe sempre em uma cópia e nunca em uma base de produção. O arquivo 02 foi escrito para não excluir as 14 tabelas existentes; ele ainda altera três colunas de PEDIDO, portanto requer validação em um clone.
7.2 Rastreabilidade da correção
Apontamento do relatório	Correção documentada
Caracterização superficial, sem porte	Incluídos ~40 colaboradores conforme arquivo anterior; volumes reais identificados como pendentes, sem inventar.
Processos só da produção (~46%)	Processos PR01–PR14 incluindo comercial, compras, laboratório, ambiente e apoio (confirmar presencialmente).
Requisitos genéricos e sem clientes/pedidos	RF01–RF27 com campos, relações e estados de implementação.
Regras parecidas com cardinalidades	RN01–RN27 como condições verificáveis, apontando restrição, auditoria ou lacuna.
Dicionário insuficiente	HTML/MD por coluna, tipos, FKs, obrigatoriedade, domínio, índice, cardinalidade e acesso proposto.
DER sem mínimos e com FKs	Quatro diagramas conceituais com (mín,máx) e sem FKs.
Justificativas genéricas	Tabela de decisões/alternativas em 6.1 e exemplos de normalização.
Uso de IA incompleto	Registro em seção 8 com fonte, prompt conhecido, ajustes e perguntas ainda a recuperar.
Links inexistentes	Caminhos relativos apontam para arquivos incluídos neste pacote.
Membros antes do título	Título agora abre o README; membros em seção organizada.


8. Uso de inteligência artificial — registro transparente
Ferramentas e etapas conhecidas: materiais anteriores e relatório de avaliação indicam apoio de ChatGPT ao levantamento, à produção de DER/fluxograma e à organização textual; nesta revisão também houve assistência de IA na redação, comparação dos critérios, formulação do modelo lógico complementar, SQL e diagramas. Não atribuir sem prova o uso de outras ferramentas a integrantes específicos.
Campo exigido	Registro ou pendência
Ferramenta e etapa	ChatGPT — revisão documental, análise de cobertura, modelagem complementar, estruturação SQL e diagramação; anteriormente, criação inicial de DER e fluxograma, conforme relatório.
Motivação	Corrigir falta de cardinalidade mínima, FKs indevidas no DER, escopo estreito e dicionário incompleto.
Prompt(s)	O relatório menciona início aproximado “Monte o DER completo da Alhena Color…”. Os prompts antigos completos devem ser recuperados do histórico do grupo; não foram inventados. Nesta revisão, a solicitação foi corrigir o trabalho conforme o relatório de avaliação recebido.
Resposta gerada	Proposta de modelo ampliado com 21 tabelas adicionais, DER conceitual modular, dicionário por coluna, relatórios e consultas SQL para áreas não contempladas.
Fontes consultadas e validadas	Documentos da Entrega 1 e Entrega 2, SQL e README fornecidos, fotos da visita, relatório de avaliação, GitHub do grupo e testes de importação/consulta informados pelo grupo. Rotinas de compras, segurança, meio ambiente e normas ainda NÃO foram confirmadas em campo.
Trechos corrigidos/rejeitados	Rejeitada a ideia de incluir FKs no DER conceitual; substituída justificativa genérica por decisões concretas; valores e resultados industriais não confirmados foram marcados como simulação.
Justificativa da escolha final	Estrutura modular preserva o banco de 14 tabelas testado e permite validar extensões sem destruir o progresso; consultas sustentam os problemas P01–P12.
Reflexão crítica	A IA pode sugerir processos que não existem naquela fábrica, leis aplicadas incorretamente, consultas incompatíveis e cardinalidades não observadas. Isso exige validação com responsável, revisão humana, testes no MySQL e documentação das decisões.


Responsabilidades do grupo: completar prompts efetivamente usados em cada etapa, decisões rejeitadas pelos alunos, fontes consultadas individualmente e confirmações da empresa. Não ocultar a participação de IA e não alegar que conteúdo não revisado pelo grupo é comprovado.
9. Consultas gerenciais, KPI e rastreabilidade
Problema	Indicador ou resposta	Tabelas	Consulta
P01	Etapas e responsáveis por peça	PECA, EXECUCAO_ETAPA, FUNCIONARIO, ETAPA_PROCESSO	G06
P02	Expedições sem validação final de qualidade	ITEM_EXPEDICAO, PECA, CONTROLE_QUALIDADE	A04
P03	Inspeções aprovadas/reprovadas	CONTROLE_QUALIDADE	G08
P04	Pendências de etapas obrigatórias	PECA, ETAPA_PROCESSO, EXECUCAO_ETAPA	G19
P05	Orçamentos por status e pedidos fora do prazo	ORCAMENTO, PEDIDO	G20 e G21
P06	Pedidos sem documentação fiscal e saldos de cobrança	PEDIDO, NOTA_FISCAL, FATURA, PAGAMENTO	G22 e G29
P07	Insumos abaixo do mínimo	INSUMO, MOVIMENTACAO_INSUMO	G23
P08	Medições por tanque e resultado	TANQUE_BANHO, ANALISE_BANHO	G24
P09	Volume documentado de efluentes por mês	REGISTRO_EFLUENTE	G25
P10	Colaboradores por setor e turno	LOTACAO_FUNCIONARIO, SETOR, TURNO	G26
P11	Uso e capacidade dos dispositivos	USO_DISPOSITIVO, DISPOSITIVO_ENGANCHAMENTO	G27 e B01
P12	Entrega de EPI/treinamento por funcionário	ENTREGA_EPI, TREINAMENTO_SEGURANCA	G31


KPIs do projeto devem ter fórmula, período e, se possível, meta validada. Exemplos calculáveis: taxa de aprovação por mês = inspeções aprovadas / inspeções do mês (G17 exige definição distinta: retrabalhos); pedidos recebidos/mês (G12); peças expedidas/mês (G14); saldo de insumos (G23); total de efluentes documentados/mês (G25). Métricas hipotéticas não devem ser apresentadas como indicadores reais já adotados pela empresa.
10. Proposta de arquitetura analítica para BI/IA
Os registros podem apoiar painéis de acompanhamento de produção, qualidade, pedidos, estoque e manutenção. Uma futura análise preditiva precisaria de dados históricos reais, representativos, consentidos e com definições claras; nenhum modelo preditivo foi implementado. Não usar “IA” como sinônimo de consulta SQL ou gráfico estático.
11. Organização do repositório e entrega
Este pacote contém o README na raiz; Dicionário em HTML e MD; diagramas PNG e SVG; scripts em docs/; comprovantes fotográficos JPEG em evidencias/; roteiro de campo em levantamento/; notas e checklist em apoio/.

Antes de enviar: atualizar os arquivos na branch main, verificar todos os links Markdown no GitHub, confirmar contas e contribuição real dos integrantes e testar a extensão caso decidam incorporá-la à Entrega 2. A mera existência do pacote não altera os commits do repositório do grupo.
12. Referências e limites
- Materiais fornecidos pelo professor: Esqueleto Entrega 1 (Modelo Conceitual) e Esqueleto Entrega 2 (SQL e apresentação).
- Arquivos originais do grupo: README, SQL, dicionário, DER e fluxograma.
- Relatório de avaliação compartilhado no chat, com apontamentos sobre cobertura, cardinalidades, documentação, IA e evidências.
- Repositório original: https://github.com/arthursilva36sp-gif/Alhena-Color.
- Site informado no material: https://www.alhenacolor.com.br/.
