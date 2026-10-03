# 💳 NeoCred — Credit Risk & Loan Portfolio Dashboard

Uma solução end-to-end de Business Intelligence desenvolvida para avaliar a **gestão de risco de crédito**, analisar inadimplência da carteira e identificar o perfil demográfico e comportamental de tomadores de empréstimo da **NeoCred**.

<p align="center"> <img width="577" height="324" alt="img_dashboard_powerbi" src="https://github.com/user-attachments/assets/exemplo-dashboard-neocred" /> </p>

---

💡 **Experimente na prática!** Você não precisa baixar nenhuma base de dados para navegar no painel. Acesse a versão interativa diretamente na web pelo link abaixo:

[`🌐 Acesse o Dashboard Interativo`](https://app.powerbi.com/view?r=seu-link-aqui)

[`📁 Acesse o Repositório no GitHub`](https://github.com/pauloviniciusrsouza/neocred-credit-risk-dashboard.git)

[`📽️ Assista ao Vídeo Demonstrativo na Publicação do LinkedIn`](https://lnkd.in/p/seu-link-linkedin)

---

## 📌 1. Visão Geral do Projeto, Contexto & Objetivos

No mercado de crédito, o equilíbrio entre a expansão da carteira e a contenção do risco de inadimplência (*default*) é o pilar central da saúde financeira. Conceder crédito sem uma análise minuciosa do perfil do tomador pode comprometer severamente o capital da instituição.

A escolha da base de dados forneceu um panorama rico em variáveis demográficas, financeiras e de histórico prévio de crédito. Durante o processo de exploração e prototipação, algumas métricas e objetivos iniciais foram recalibrados em função das limitações dos dados e do aprofundamento do estudo. No entanto, o foco analítico permaneceu firme ao longo de todo o desenvolvimento.

Desenvolvi este **Dashboard Executivo e Interativo** no Power BI abastecido por uma arquitetura no PostgreSQL (view `vw_credit_risk`), projetado para responder às seguintes perguntas estratégicas:

* A concessão de empréstimos está sendo realizada de forma **consciente ou negligente** em relação aos perfis de risco?
* Quais finalidades de empréstimo (`loan_intent`) representam o maior volume financeiro e as maiores taxas percentuais de inadimplência?
* Como a renda anual, a idade e a taxa de juros aplicada se correlacionam com a taxa de *default*?
* Clientes com histórico prévio de restrição no nome (`cb_person_default_on_file`) apresentam inadimplência proporcionalmente maior no contrato atual?

---

## 🎨 2. Design & A Evolução da Prototipagem (4 Etapas)

A construção da interface e da experiência do usuário (UX/UI) passou por quatro fases bem definidas. Esse processo incremental foi fundamental para refinar as métricas e ajustar a disposição dos visuais à medida que a compreensão dos dados amadurecia.

### 🖊️ Etapa 1: Papel e Caneta
* **O que foi feito:** Esboço inicial dos KPIs principais, mapas mentais sobre o fluxo de crédito e rascunho visual básico das três páginas.
* **Motivo:** Estruturar as ideias sem limitações tecnológicas e definir a hierarquia da informação de forma rápida.
* **O que ficou para trás:** Gráficos complexos e métricas secundárias que poluíam o fluxo visual inicial.

### 🖌️ Etapa 2: Excalidraw
* **O que foi feito:** Wireframe estrutural detalhado dos painéis, definindo o grid, o alinhamento dos cartões de KPI e o posicionamento das visões analíticas.
* **Motivo:** Organizar a disposição dos componentes na tela antes de aplicar estilos de cores e marcas.
* **O que ficou para trás:** Layouts rígidos que não permitiam boa leitura em telas menores e agrupamentos de filtros que causavam redundância.

### 🎨 Etapa 3: Figma
* **O que foi feito:** Criação do protótipo de alta fidelidade, prototipagem visual das três telas, aplicação do *Design System*, paleta de cores direcionada ao setor financeiro e definição dos fundos (*backgrounds*).
* **Motivo:** Garantir uma estética limpa, moderna e pronta para produção no Power BI.
* **O que ficou para trás:** Elementos visuais puramente decorativos que não agregavam valor direto à tomada de decisão.

### 📊 Etapa 4: Power BI & Refinamentos
* **O que foi feito:** Construção final do relatório interativo, aplicação de filtros dinâmicos em *Dropdown*, padronização das dicas de ferramenta (*tooltips* no formato "O que o gráfico mostra / Como interpretar") e tratamento de exceções em DAX.
* **Motivo:** Transformar o protótipo em uma ferramenta decisória pronta, robusta e livre de erros de contexto ao aplicar filtros cruzados.

---

## 🎯 3. Principais Insights de Negócio (Data Insights)

A análise aprofundada da carteira revelou padrões claros sobre o comportamento de crédito:

* **O Maior Driver de Risco (`DEBTCONSOLIDATION`):** A consolidação de dívidas lidera isoladamente a taxa de inadimplência da carteira (~33%), além de concentrar o maior volume de capital financeiro em risco.
* **Segmento Médico (`MEDICAL`):** Empréstimos voltados para despesas médicas também apresentam taxas de inadimplência elevadas (~32%). Ambos os casos (`DEBTCONSOLIDATION` e `MEDICAL`) mostram uma forte propensão ao calote devido à sua natureza emergencial: o cliente toma o crédito para quitar uma dívida anterior ou cobrir uma urgência de saúde, já sob estresse financeiro prévio.
* **Faixa Etária & Empregabilidade:** A inadimplência concentra-se expressivamente entre clientes de **20 a 30 anos** e com menor tempo de registro empregatício, evidenciando menor estabilidade financeira nessa fase da vida profissional.
* **Histórico Prévio Negativado:** Tomadores com histórico prévio de restrição ao crédito (`cb_person_default_on_file = Y`) mantêm uma taxa de inadimplência proporcionalmente superior aos clientes com histórico limpo, validando o peso dessa variável na concessão.

---

## 🏗️ 4. Arquitetura da Solução & Engenharia no Power BI