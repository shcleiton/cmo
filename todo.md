## Tarefas para o Sistema CMO as a Service

### Fase 1: Configurar a estrutura de diretórios e arquivos do template
- [ ] Criar o diretório principal para o template: `/home/ubuntu/cmo_template`
- [x] Criar o arquivo `todo.md`
- [x] Criar subdiretórios para cada seção principal (e.g., `bases`, `playbooks`, `automacoes`, `dashboards`)

### Fase 2: Criar a página raiz e definir as bases de dados do template
- [x] Criar o arquivo da página raiz (`index.md` ou similar) com o título e introdução.
- [x] Criar arquivos Markdown para cada base de dados (Clientes, Funis, Campanhas, Leads, Deals/Vendas, Assets, Tarefas, Métricas, Experimentos, Financeiro).
- [x] Preencher cada arquivo de base de dados com os campos chave definidos no documento.

### Fase 3: Desenvolver os templates e playbooks dos funis
- [x] Criar subdiretórios para cada tipo de funil (Sala Secreta, Low Ticket, VSL, Lançamento, High Ticket).
- [x] Para cada funil, criar um arquivo de playbook com a estrutura padrão (Objetivo, Pré-requisitos, Fases, Checklists, Cronograma, KPIs, Riscos+mitigação, QA, Pós-game).
- [x] Preencher os checklists resumo para cada funil.

### Fase 4: Definir as atribuições de papéis e automações do template
- [x] Criar um arquivo para as atribuições de papéis (Estrategista, Copy, Cliente_Mídia, Cliente_Design, Cliente_Comercial).
- [x] Criar um arquivo para as automações, detalhando os gatilhos e ações (Clonar template, Gerar playbook, Lembretes, KPI watch, Venda, Fechamento mensal).

### Fase 5: Configurar os dashboards, KPIs e rituais do template
- [x] Criar um arquivo para a descrição dos dashboards (Executivo, Operações, Aquisição, Comercial, Financeiro).
- [x] Criar um arquivo para os KPIs e suas fórmulas.
- [x] Criar um arquivo para os rituais, SLAs e QA.
- [x] Criar um arquivo para a nomenclatura e versões.

### Fase 6: Simular o processo de onboarding de um novo cliente
- [ ] Criar um script ou sequência de comandos para simular o onboarding.
- [ ] Coletar os dados de onboarding de um cliente exemplo.
- [ ] Executar a clonagem do template para o cliente exemplo.
- [ ] Disparar a primeira execução automática (Plano 12 meses, Gantt, Playbook Sala Secreta, Checklists, Dashboards).
- [ ] Simular testes de aceitação (criação de cliente exemplo, funil, leads/vendas, CPL ruim).

### Fase 7: Apresentar os resultados da criação do template e da simulação de onboarding
- [ ] Gerar o link da página raiz do template.
- [ ] Apresentar as visões dos dashboards gerados.
- [ ] Listar as automações ativas.
- [ ] Apresentar o checklist de QA.
- [ ] Fornecer um resumo do processo e dos resultados.

