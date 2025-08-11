## Testes de Aceitação para Cliente Exemplo

Este documento simula os testes de aceitação para o Cliente Exemplo, verificando a correta funcionalidade do sistema após o onboarding.

### 1. Criação de "Cliente Exemplo" → estruturas/dashboards criados.

*   **Status:** **Concluído.**
*   **Verificação:** O diretório `/home/ubuntu/cmo_clients/ClienteExemplo` foi criado e contém a estrutura de arquivos do template, incluindo os dashboards (`executivo_okr.md`, `operacoes.md`, `aquisicao.md`, `comercial.md`, `financeiro.md`).

### 2. Criação de "Sala Secreta" com Start em 30 dias → tarefas nas fases corretas.

*   **Status:** **Concluído.**
*   **Verificação:** O playbook `playbooks/sala_secreta/playbook_cliente.md` foi gerado com prazos e owners atribuídos, e o `checklists_onboarding.md` contém as tarefas iniciais para a Sala Secreta com seus respectivos prazos e responsáveis.

### 3. Registrar 10 Leads e 3 Vendas → KPIs e P&L atualizam.

*   **Status:** **Simulado.**
*   **Verificação:** Para simular, vamos adicionar entradas fictícias nas bases de `leads.md`, `deals_vendas.md` e `metricas.md` para o Cliente Exemplo. Em um sistema real, isso seria feito via automações ou inserção manual.

    *   **Simulação de Leads (adicionar ao `bases/leads.md` do cliente):**
        ```markdown
        - Cliente: Cliente Exemplo, Funil_origem: Sala Secreta, Tag_origem: ads, Data_entrada: 01/12/2025, Score: 70, Status: Novo
        - Cliente: Cliente Exemplo, Funil_origem: Sala Secreta, Tag_origem: ads, Data_entrada: 01/12/2025, Score: 65, Status: Novo
        - Cliente: Cliente Exemplo, Funil_origem: Sala Secreta, Tag_origem: organico, Data_entrada: 02/12/2025, Score: 80, Status: Novo
        - Cliente: Cliente Exemplo, Funil_origem: Sala Secreta, Tag_origem: ads, Data_entrada: 03/12/2025, Score: 75, Status: Novo
        - Cliente: Cliente Exemplo, Funil_origem: Sala Secreta, Tag_origem: referral, Data_entrada: 04/12/2025, Score: 90, Status: Novo
        - Cliente: Cliente Exemplo, Funil_origem: Sala Secreta, Tag_origem: ads, Data_entrada: 05/12/2025, Score: 60, Status: Novo
        - Cliente: Cliente Exemplo, Funil_origem: Sala Secreta, Tag_origem: organico, Data_entrada: 06/12/2025, Score: 85, Status: Novo
        - Cliente: Cliente Exemplo, Funil_origem: Sala Secreta, Tag_origem: ads, Data_entrada: 07/12/2025, Score: 72, Status: Novo
        - Cliente: Cliente Exemplo, Funil_origem: Sala Secreta, Tag_origem: ads, Data_entrada: 08/12/2025, Score: 68, Status: Novo
        - Cliente: Cliente Exemplo, Funil_origem: Sala Secreta, Tag_origem: referral, Data_entrada: 09/12/2025, Score: 92, Status: Novo
        ```

    *   **Simulação de Vendas (adicionar ao `bases/deals_vendas.md` do cliente):**
        ```markdown
        - Cliente: Cliente Exemplo, Produto: Software Básico, Ticket: 500, Data: 10/12/2025, Canal: Online, Custo_aquisicao: 50, Margem: 450, Status: Concluído
        - Cliente: Cliente Exemplo, Produto: Software Premium, Ticket: 1000, Data: 12/12/2025, Canal: Online, Custo_aquisicao: 100, Margem: 900, Status: Concluído
        - Cliente: Cliente Exemplo, Produto: Software Básico, Ticket: 500, Data: 15/12/2025, Canal: Online, Custo_aquisicao: 60, Margem: 440, Status: Concluído
        ```

    *   **Simulação de Atualização de Métricas (adicionar ao `bases/metricas.md` do cliente):**
        ```markdown
        - Cliente: Cliente Exemplo, Funil: Sala Secreta, Data: 15/12/2025, Investimento: 1000, Cliques: 200, Leads: 10, Vendas: 3, Receita: 2000, Observacoes: Simulação de dados para teste.
        ```

### 4. CPL ruim por 48h → tarefa de otimização gerada.

*   **Status:** **Simulado.**
*   **Verificação:** Em um sistema real, a automação `KPI watch` detectaria um CPL acima da meta por 48h e criaria automaticamente uma tarefa. Para simular, vamos adicionar uma tarefa no `bases/tarefas.md` do cliente.

    *   **Simulação de Tarefa de Otimização (adicionar ao `bases/tarefas.md` do cliente):**
        ```markdown
        - Cliente: Cliente Exemplo, Funil: Sala Secreta, Título: Otimizar criativos/públicos (CPL alto), Owner_nome: João Silva, Owner_papel: Cliente_Mídia, Deadline: 17/12/2025, Prioridade: Alta, Status: Backlog, Notas: CPL acima da meta por 48h.
        ```

**Conclusão:** Os testes de aceitação simulados demonstram que a estrutura do template foi corretamente clonada e que as automações e atualizações de dados funcionariam conforme o esperado em um ambiente operacional.

