## Automações (Gatilhos & Ações)

Este documento descreve as automações programadas para otimizar os processos do Sistema CMO as a Service, com base em gatilhos específicos e suas respectivas ações.

### Automações de Onboarding:

*   **Gatilho:** Ao criar um novo Cliente com `ICP_OK = sim`.
    *   **Ações:**
        *   Clonar o template geral do sistema para o diretório específico do cliente (`/clientes/Nome_do_Cliente`).
        *   Criar um plano de 12 meses com datas absolutas para o cliente.
        *   Gerar dashboards padrão para o cliente (Executivo, Operações, Aquisição, Comercial, Financeiro).

*   **Gatilho:** Ao criar um novo Funil para um cliente.
    *   **Ações:**
        *   Gerar o playbook específico do funil com tarefas por fase, conforme o `lead time` definido.
        *   Atribuir `Owner_papel` padrão para as tarefas:
            *   Itens de copy/estratégia → Cleiton.
            *   Itens de mídia/design/comercial → placeholders do cliente (Cliente_Mídia, Cliente_Design, Cliente_Comercial).

### Automações de Funil (Sala Secreta):

*   **Gatilho:** Sala Secreta (`-10/-5/-2/-1 dias` antes do evento).
    *   **Ações:**
        *   Enviar lembretes de presença via WhatsApp e e-mail para os inscritos.
        *   Rodar QA (Quality Assurance) para verificar a prontidão do evento.

### Automações de KPI Watch:

*   **Gatilho:** `CPL (Custo por Lead) > meta` por 48 horas consecutivas.
    *   **Ação:** Criar tarefa “Otimizar criativos/públicos” e atribuir a `Cliente_Mídia`.

*   **Gatilho:** `CVR LP (Conversion Rate da Landing Page) < meta` por 7 dias consecutivos.
    *   **Ação:** Criar tarefa “Revisar LP/Oferta/Prova” e atribuir a `Cleiton`.

### Automações de Vendas:

*   **Gatilho:** Registro de uma nova Venda (via webhook ou registro manual).
    *   **Ações:**
        *   Criar um novo `Deal` na base de dados de `Deals/Vendas`.
        *   Adicionar uma tag de `Venda` ao `Lead` correspondente.
        *   Atualizar as bases de dados de `Métricas` e `Financeiro (P&L)` com os dados da venda.

### Automações de Fechamento Mensal:

*   **Gatilho:** Fechamento do mês.
    *   **Ações:**
        *   Consolidar os dados da base de dados `Financeiro (P&L)`.
        *   Gerar o `Relatório Executivo` mensal para o cliente.

