**MATA60 - Banco de Dados**  
Prof. Robespierre Pita  
robespierre.pita@ufba.br

## Executando o Projeto

1. O projeto necessita do Make e do Podman
2. Entre na pasta databasae `cd database`
3. Execute `make` para o Build e Seeding do Banco de Dados
4. Exucte `make connect` para se Conectar ao Banco

## Trilha Prática

### 1. Modelando a base de dados

#### 1.1. Problema

Alice e Bob são sócios de uma rede de mercearias inteligentes, chamada CompraEsperta. As suas lojas são conteiners adapdatos, climatizados e automatizados que ficam espalhados por condomínios em todas as capitais do país. Cada estabelecimento tem um conjunto produtos que variam entre guloseimas, alimentos prontos (congelados), ingredientes de última hora para receitas comuns, utensílios para o lar, etc. Tudo para prover uma comodidade aos clientes. Não existem funcionários alocados na loja, todos os produtos são marcados com um dispositivo de RFID que, depois de pagos, tem saída liberada do conteiner. O pagamento é feito em terminais de auto-atendimento que são operados pelos próprios clientes. Em seu core-business, modelos de inteligência artificial são responsáveis por definir os melhores locais para estabelecer depósitos que vão armazenar os produtos de reposição das lojas de cada cidade. Esta otimização garante uma diminuição substantiva dos custos, permitindo que a CompraEsperta consiga repôr rapidamente os estoques de cada loja e estabeleça uma proximidade com os fornecedores que ofereçam preços mais competitivos. Os depósitos contam com uma área de armazenamento maior, garantindo que a empresa compre insumos em grande quantidade e negocie os valores com seus fornecedores. No último ano, o número médio de contêiners por capital subiu de 1 para 4.6, tornando proibitivo o controle do estoque através de planilhas. Alice e Bob decidiram então contratar uma empresa de engenharia de software para construir um Sistema de Informação sob medida. Este sistema será responsável por controlar o estoque dos contêiners e depósitos. Quando uma loja atinge o estoque mínimo de um conjunto de produtos, ou quando o depósito está desabastecido, o sistema dispara automaticamente ordens de compra para fornecedores ou de reposição para funcionários da logística. Os principais requisitos do sistema são expostos a seguir.

#### 1.2. Requisitos do Sistema de Informação

- **RF1:** O sistema deve controlar o estoque geral da empresa. Desta forma, a distinção entre depósitos ou lojas deve estar determinada em cada localização de um determinado item/produto.  Ou seja, os produtos em depósito ou lojas são determinados por um atributo de localização.
- **RF2:** O controle do estoque é feito a partir de produtos individuais ou porções. Apesar da compra ser feita por lotes e caixas, o sistema deve considerar apenas unidades em seus registros e relatórios.
- **RF3:** Cada produto individual está associado a uma tag RFID. O status desta tag determinará se um produto ainda está disponível em estoque ou não.
- **RF4:** O sistema deve ser capaz de controlar os fornecedores de cada produto. Multiplas empresas podem fornecer um ou mais items. Fornecedores cuja a data de ultima compra seja maior de 180 dias deve ser considerada inativa.
- **RF5:** O sistema deve ser capaz de prover relatórios que informem: **i)** o nível de estoque para cada categoria de produtos em cada loja ou depósito; **ii)** os fornecedores mais frequentes, com menores custos para cada categoria de produtos; **iii)** as lojas com maior vazão de produtos num período; **iv)** produtos com maior proximidade de vencimento; etc.
- **RF6:** a categoria de produtos tem estoque mínimo e maximo associado. Estes números são distintos para lojas e depósitos.

Novos requisitos podem surgir no decorrer do desenvolvimento do sistema.

#### 1.3. Delimitação do mini-mundo para o banco de dados

O banco de dados relacional para suportar as operações deste sistema de informação deve contar
com as seguintes entidades e atributos:

- **tbl_produto:** tabela que concentra informações sobre os itens individuais que compõem o acervo/estoque da empresa.
  - `cp_id_produto [int, incremental]`: código identificador do produto individal. Único e incremental.
  - `nm_prod [str, 60 caracteres]`: nome do produto, conforme normas técnicas para integração em notas fiscais (Norma Técnica 2021.004 – v.133).
  - `cd_ean_prod [str, 12 caracteres]`: código de barras do produto, conforme padrão EAN.
  - `ce_rfid [int, 8 bytes]`: chave estrangeira que define o rfid do produto.
  - `ce_categoria_principal [int, 8 bytes]`: chave estrangeira que define a categoria principal do produto.
  - `ce_categoria_secundaria [int, 8 bytes]`: chave estrangeira que define a categoria secundária do produto.

- **tbl_rfid:** taela que concentra informações sobre os dispositivos de identificação individual dos produtos.
  - `cp_id_dispositivo [int, 8 bytes]`: chave primária que identifica dispositivo.
  - `ind_venda_dispositivo [bool, 1 byte]`: flag que indica se produto já foi vendido (1 = vendido, 0 = em estoque).

- **tbl_categoria:** tabela que concentra informações sobre as categorias de cada produto.
  - `cp_cod_categoria [int, 4 bytes]`: chave primária que identifica a categoria de cada produto.
  - `nm_categoria [str, 20 caracteres]`: nome da categoria.

- **tbl_estabelecimento:** tabela que concentra informações dos estabelecimentos (lojas e depósitos)
  - `cp_cod_estab [int, 8 bytes]`: chave primária que identifica o estabelecimento.
  - `nm_estab [str, 60 caracteres]`: nome do estabelecimento.
  - `cnpj_estab [str, 60 caracteres]`: CNPJ do estebelecimento, em caso de filial ou empresa parceira.
  - `localizacao_estab [float vector, 8 espaços]`: vetor com latitude e longitude dos 4 pontos que delimitam o espaço do estabelecimento no espaço geográfico.
  - `endereco_estab [str, 200 caracteres]`: endereço do estabelecimento.
  - `UF_estab [str, 2 caracteres]`: código IBGE da UF do establecimento.
  - `cidade_estab [str, 5 caracteres]`: código IBGE da cidade do establecimento.

- **tbl_funcionario:** tabela que concentra informações sobre os funcionários responsáveis pela reposição do estoque nas lojas e depósitos.
  - `cp_cod_func [int, 8 bytes]`: chave primária que identifica o funcionário.
  - `nm_func [str, 200 caracteres]`: nome completo do funcionário.
  - `cpf_func [str, 11 caracteres]`: CPF do funcionário.
  - `funcao_func [str, 40 caracteres]`: função do funcionário.

- **tbl_fornecedor:** tabela que concentra informações sobre os fornecedores dos produtos individuais.
  - `cp_cod_forn [int, 8 bytes]`: chave primária que identifica o fornecedor.
  - `cnpj_forn [str, 14 bytes]`: CNPJ do fornecedor.
  - `localizacao_forn [float vector, 8 espaços]`: vetor com latitude e longitude dos 4 pontos que delimitam o espaço do fornecedor no espaço geográfico.
  - `endereco_forn [str, 200 caracteres]`: endereço fornecedor.
  - `UF_forn [str, 2 caracteres]`: código IBGE da UF do fornecedor.
  - `cidade_forn [str, 5 caracteres]`: código IBGE da cidade do fornecedor.

As relações entre estas entidades deve seguir as regras a seguir:

#### Regras de relacionamento

- Um fornecedor pode fornecer nenhum ou vários produtos. Produtos podem ser fornecidos por mais de um fornecedor. As relações entre fornecedores e produtos deve gerar informações sobre o preço de venda, data de venda e data de vencimento.
- Um produto só pode ser identificado por um único RFID. RFID são consumidos por apenas um produto.
- Uma mesma categoria pode rotular mais de um produto. Um produto pode ter apenas uma categoria principal e outra secundária.
- Um estabelecimento vende ou distribui vários produtos e um mesmo produto pode ser oferecido por vários estabelecimentos. As relações entre estabelecimentos e produtos deve gerar informações sobre itens comprados, preços e data de venda e outros atributos pertinentes.

### Modelagem Inicial

```mermaid
erDiagram
    %% Entidades
    tbl_produto {
        int cp_id_produto PK "Código identificador"
        string nm_prod "Nome do produto (60 caracteres)"
        string cd_ean_prod "Código de barras (12 caracteres)"
        int ce_rfid FK "Chave estrangeira do RFID"
        int ce_categoria_principal FK "Categoria principal"
        int ce_categoria_secundaria FK "Categoria secundária"
    }

    tbl_rfid {
        int cp_id_dispositivo PK "Chave primária do dispositivo"
        bool ind_venda_dispositivo "Indicador de venda (1=venda, 0=estoque)"
    }

    tbl_categoria {
        int cp_cod_categoria PK "Código da categoria"
        string nm_categoria "Nome da categoria (20 caracteres)"
    }

    tbl_estabelecimento {
        int cp_cod_estab PK "Código do estabelecimento"
        string nm_estab "Nome do estabelecimento (60 caracteres)"
        string cnpj_estab "CNPJ do estabelecimento (60 caracteres)"
        float localizacao_estab[8] "Vetor de localização (8 espaços)"
        string endereco_estab "Endereço (200 caracteres)"
        string UF_estab "Código IBGE da UF (2 caracteres)"
        string cidade_estab "Código IBGE da cidade (5 caracteres)"
    }

    tbl_funcionario {
        int cp_cod_func PK "Código do funcionário"
        string nm_func "Nome completo do funcionário (200 caracteres)"
        string cpf_func "CPF do funcionário (11 caracteres)"
        string funcao_func "Função do funcionário (40 caracteres)"
    }

    tbl_fornecedor {
        int cp_cod_forn PK "Código do fornecedor"
        string cnpj_forn "CNPJ do fornecedor (14 caracteres)"
        float localizacao_forn[8] "Vetor de localização do fornecedor (8 espaços)"
        string endereco_forn "Endereço do fornecedor (200 caracteres)"
        string UF_forn "Código IBGE da UF do fornecedor (2 caracteres)"
        string cidade_forn "Código IBGE da cidade do fornecedor (5 caracteres)"
    }

    %% Relacionamentos
    tbl_produto ||--o{ tbl_rfid : "Possui RFID"
    tbl_produto ||--o{ tbl_categoria : "Possui categorias"
    tbl_produto ||--o{ tbl_fornecedor : "Fornecido por"
```

### Trilha prática 1

Com base na descrição do Sistema de Informação:
1. Sugira novas tabelas, variáveis, relacionamentos ou requisitos.
2. Use o BrModelo para criar os modelos conceitual e lógico do banco de dados.
3. Crie o SQL DDL do banco modelado.
4. Popule as tabelas com pelo menos 200 registros.


#### Elaboração

Abaixo segue a descrição e motivação da Tabela e sua formação inicial:

---
Como cada ordem de compra de um produto por fornecedor devem conter informações adicionais e é uma relação de **P x F**, deve existir uma tabela auxiliar para persistir essas relações e seus dados auxiliares.

- **tbl_ordem_compra:** tabela que concentra informações sobre as ordens de compra, relacionando produtos e fornecedores, bem como os detalhes da transação.
  - `cp_id_ordem [int, incremental]`: código identificador da ordem de compra. Único e incremental.
  - `ce_produto [int, 8 bytes]`: chave estrangeira que define o produto relacionado à ordem de compra. Refere-se ao `cp_id_produto` da **tbl_produto**.
  - `ce_fornecedor [int, 8 bytes]`: chave estrangeira que define o fornecedor relacionado à ordem de compra. Refere-se ao `cp_cod_forn` da **tbl_fornecedor**.
  - `dt_venda [date]`: data da venda do produto, indicando quando a transação foi realizada.
  - `dt_vencimento [date]`: data de vencimento do pagamento da ordem de compra.
  - `preco_por_quantidade [float, 10,2]`: preço total considerando a quantidade de produtos comprados, com até duas casas decimais.
  - `quantidade [int, 8 bytes]`: quantidade de produtos comprados nesta ordem de compra.

---

Como o sistema deve ter informações individuais por produto, então vale a criação de uma distinção de uma classe de itens ( produtos ) e os itens ( um elemento do grupo de produtos ). Além disso, deverá tratar as transferências dos itens de forma rastreável. Segue as adaptações e adições necessárias: 

- **tbl_produto:** tabela que concentra informações gerais sobre os produtos que compõem o acervo da empresa. Cada produto pode ter múltiplos itens específicos (unidades individuais).
  - `cp_id_produto [int, incremental]`: código identificador do produto. Único e incremental.
  - `nm_prod [str, 60 caracteres]`: nome do produto, conforme normas técnicas para integração em notas fiscais (Norma Técnica 2021.004 – v.133).
  - `cd_ean_prod [str, 12 caracteres]`: código de barras do produto, conforme padrão EAN.
  - `ce_categoria_principal [int, 8 bytes]`: chave estrangeira que define a categoria principal do produto.
  - `ce_categoria_secundaria [int, 8 bytes]`: chave estrangeira que define a categoria secundária do produto.

- **tbl_item:** tabela que concentra informações sobre os itens individuais relacionados aos produtos (unidades individuais no estoque). Cada item pertence a um produto da tabela **tbl_produto**.
  - `cp_id_item [int, incremental]`: código identificador do item individual. Único e incremental.
  - `ce_lote_venda [int, 8 bytes]`: chave estrangeira que define o lote de venda ao qual o item pertence. Refere-se ao `cp_id_ordem` da **tbl_ordem_compra**.
  - `code_rfid [str]`: código do dispositivo RFID
  - `status [int, 8 bytes]`: status de venda do item

- **tbl_transacao:** tabela que concentra informações sobre as transações realizadas para os itens individuais. Isso inclui compras, transferências e vendas.
  - `cp_id_transacao [int, incremental]`: código identificador da transação. Único e incremental.
  - `ce_item [int, 8 bytes]`: chave estrangeira que define o item envolvido na transação. Refere-se ao `cp_id_item` da **tbl_item**.
  - `dt_transacao [date]`: data em que a transação foi realizada.
  - `tp_transacao [string, 20 caracteres]`: tipo da transação, podendo ser "compra", "transferencia" ou "venda".
  - `ce_estab_origem [int, 8 bytes]`: chave estrangeira que define o estabelecimento de origem da transação. Refere-se ao `cp_cod_estab` da **tbl_estabelecimento**. Pode ser nulo (por exemplo, em uma compra).
  - `ce_funcionario [int, 8 bytes]`: chave estrangeira que define o funcionário que executará a transação


---

Para tornar o controle do estoque mais preciso, cabe a adequação de um requisito. No qual, o controle de estoque pelo estabelecimento será dado por produto ao invés de por cateoria. Segue abaixo a nova tabela:

- **tbl_estoque:** tabela que concentra informações sobre o controle de estoque de cada produto em cada estabelecimento, com limites mínimos e máximos de quantidade.
  - `cp_id_estoque [int, incremental]`: código identificador do controle de estoque. Único e incremental.
  - `ce_produto [int, 8 bytes]`: chave estrangeira que define o produto cujo estoque está sendo controlado. Refere-se ao `cp_id_produto` da **tbl_produto**.
  - `ce_estabelecimento [int, 8 bytes]`: chave estrangeira que define o estabelecimento ao qual o estoque pertence. Refere-se ao `cp_cod_estab` da **tbl_estabelecimento**.
  - `qtd_min_estoque [int, 8 bytes]`: quantidade mínima de estoque que deve ser mantida no estabelecimento para o produto.
  - `qtd_max_estoque [int, 8 bytes]`: quantidade máxima de estoque permitida no estabelecimento para o produto.


##### Modelagem BR Modelo

Em seguida seguem as modelagens:

1. Modelagem Conceitual

![Modelagem Conceitual](concept.png)

1. Modelagem Lógica

![Modelagem Lógica](logical.png)

### Tuning e Indexação

Na elaboração do projeto, foram criados **dois schemas** distintos: o **inicial** e o **final**, com a evolução entre eles para buacar melhorias significativas em performance e consistência dos dados.  

---

#### **Schema Inicial**
O schema inicial representava uma **modelagem básica** das tabelas de um sistema de logística de alimentos, sem otimizações. Algumas características do schema inicial incluem:

- **Falta de indexação:** As tabelas não possuíam índices para acelerar consultas frequentes.
- **Ausência de constraints únicos:** Não havia garantias de unicidade para colunas, como:
  - `cpf` em `employees`;
  - `ean` em `products`;
  - `cnpj` em `suppliers`.
- **Integridade referencial limitada:** Relações entre tabelas careciam de restrições explícitas por meio de `FOREIGN KEY`.

Essa abordagem inicial foi realizada para efeito  de prototipação e análise, mas apresenta limitações de performance e consistência em um ambiente real de produção.

---

#### **Schema Final**
O schema final introduziu melhorias na estrutura do banco, com foco em:

1. **Consistência dos dados:** Uso de chaves primárias, constraints únicas e relacionamentos bem definidos.
2. **Performance:** Implementação de índices simples, compostos e únicos para acelerar buscas e garantir integridade.
3. **Redução de redundâncias:** Eliminação de duplicidade de dados e garantia de normalização com o uso de referências fortes.

---

#### **Principais Alterações Realizadas**
| **Tabela**          | **Alterações Implementadas**                                                                                       |
|----------------------|-------------------------------------------------------------------------------------------------------------------|
| **`categories`**     | - Definição de `id` como `PRIMARY KEY`. <br> - Coluna `code` agora é `UNIQUE` para evitar duplicidade.            |
| **`employees`**      | - Definição de `id` como `PRIMARY KEY`. <br> - `cpf` marcado como `UNIQUE` para garantir unicidade.               |
| **`locations`**      | - Definição de `id` como `PRIMARY KEY`.                                                                          |
| **`products`**       | - Adição de chaves estrangeiras (`FOREIGN KEY`) para `primary_id` e `secondary_id`. <br> - `ean` marcado como `UNIQUE`. |
| **`suppliers`**      | - `id` definido como `PRIMARY KEY`. <br> - Colunas críticas como `cnpj`, `code` e `location_id` agora são `UNIQUE`. <br> - Adição de `FOREIGN KEY` para `location_id`. |
| **`purchase_orders`**| - `supplier_id` e `product_id` agora possuem chaves estrangeiras (`FOREIGN KEY`).                                |
| **`items`**          | - `purchase_order_id` agora vinculado com `FOREIGN KEY`.                                                        |
| **`places`**         | - `location_id` agora possui uma chave estrangeira (`FOREIGN KEY`). <br> - `cnpj` marcado como `UNIQUE`.        |
| **`configurations`** | - Definição de um índice composto `UNIQUE (place_id, product_id)` para evitar duplicidade de configuração.        |
| **`transactions`**   | - Adição de chaves estrangeiras (`FOREIGN KEY`) para `item_id`, `place_id` e `employee_id`.                      |

---

#### **Resultados Obtidos**
- **Garantia de Consistência:**
  - Constraints únicos garantem que entidades não sejam duplicadas e fujam do requisito inicial, como CPFs, CNPJs e códigos de produtos.
- **Conformidade com Boas Práticas:**
  - Chaves primárias e estrangeiras assegurando a integridade referencial entre tabelas.
  - Normalização reduzindo redundâncias e favorecendo a organização dos dados.
- **Escalabilidade:**
  - A estrutura otimizada do schema suporta crescimento do banco de dados com maior eficiência sem trazer uma perda linear na performance das consultas com base no crescimento dos dados.
- **Performance Melhorada:**
  - A implementação de índices acelera as consultas, principalmente em tabelas com **grandes volumes de dados**. (*)
---

Os dados agregados podem ser consultados diretamente na [planilha disponibilizada](https://docs.google.com/spreadsheets/d/1oazARfbI_yA5pa_RHgOJ9OIRChtanrrmdRs7X-7Q1Z8). Como demonstrado, algumas queries apresentaram perdas de performance com diferenças mínimas em suas médias. No entanto, o saldo geral do projeto é **positivo**, resultando em uma melhora significativa na performance acumulada.

- O tempo total de execução obtido como ganho geral foi de **74,53634 ms**, considerando a soma das médias.
- Observa-se que a maior piora ocorreu nas queries:
  - **transactions.sql**
  - **missed_products.sql**  
  Ambas têm como característica comum o alto volume de operações na tabela **transactions**, o que contribuiu para uma média geral de **10 ms** de piora.

- Por outro lado, a maior melhora absoluta foi observada na query **transactions_most_items.sql**.
---

- **Queries com piora menor que 0,01ms:** Apesar de estarem marcadas como "Piora", as diferenças são insignificantes para o uso em produção.


### View Tables

Foram criadas duas View Tables para simplificar o gerenciamento de estoque e vendas, para análise e a tomada de decisão. Segue as descrições das views:

---

#### **1. `pending_transactions`**

Essa View Table tem como objetivo identificar necessidades de ajuste de estoque em diferentes locais, considerando os limites mínimo e máximo configurados para cada produto. Ela calcula o estoque atual de cada produto por local e sugere ajustes, seja para suprir déficits de estoque ou redistribuir excessos. Essa view será útil para planejar futuras transações de entrada ou saída de produtos e manter o equilíbrio de estoque considerando as configurações registradas.

---

#### **2. `most_sold_products`**

Essa View Table foca na análise de vendas, listando os produtos mais vendidos em cada local. Ela agrupa as informações com base nos itens marcados como vendidos e considera o local final de venda com base nas transações mais recentes. Essa visão é uma ferramenta para identificar padrões de consumo por local, apoiar decisões sobre reposição de estoque e definir estratégias de vendas.

---

### Procedures

As **procedures** descritas abaixo foram desenvolvidas, abrangendo operações de atualização, geração de itens, e movimentação de produtos entre locais.

---

#### 1. Atualização de Views Materializadas

Essa procedure atualiza todas as materialized views existentes no banco de dados. É útil para manter as views sincronizadas com os dados mais recentes sem a necessidade de atualizá-las manualmente.

---

#### 2. Geração de Itens para uma Ordem de Compra

Essa procedure é responsável por gerar itens individuais associados a uma ordem de compra, respeitando os limites estabelecidos pela quantidade da ordem. Além disso, ela registra as transações iniciais desses itens para o local especificado.

---

#### 3. Movimentação de Produtos

Essa procedure movimenta produtos de um local de origem para um local de destino, registrando cada transação. Ela também verifica a disponibilidade de itens no local de origem antes de realizar a movimentação.

---

### Instrução de Uso

Esta seção descreve o passo a passo para inicializar o projeto e utilizar seus recursos, tanto no banco de dados quanto na CLI em Python. 

---

#### Requisitos Necessários

Certifique-se de que sua máquina possui os seguintes recursos instalados:

1. **Python 3.8+** - Para executar a CLI do projeto.
2. **Podman** - Para gerenciar containers.
3. **Make** - Para facilitar a inicialização do banco de dados.

---

#### Inicialização do Banco de Dados
A pasta `database` contém os arquivos referentes ao banco de dados e um arquivo `Makefile` que automatiza as etapas de build e inicialização.

1. **Navegue para a pasta do banco de dados:**
   ```bash
   cd database
   ```

2. **Construa a imagem do banco de dados:**
   ```bash
   make build
   ```

3. **Inicie o container do banco de dados:**
   ```bash
   make start
   ```
   Isso iniciará o container com a configuração padrão.

4. **(Nota) Caso deseje inicializar a versão do Schema não otimizado para testes, basta executar o seguinte comando:**
   ```bash
   make start_bad
   ```

5. **Conecte-se ao banco de dados via CLI (opcional):**
   Caso necessite realizar interações diretas ou testes no PostgreSQL, utilize o comando abaixo:
   ```bash
   make connect
   ```

---

#### Configuração e Execução da CLI
A CLI do projeto está localizada na pasta `app`. 

Foi construída a CLI para automatizar a execução das Queries de Tuning.

Siga os passos abaixo para configurá-la:

1. **Navegue para a pasta da CLI:**
   ```bash
   cd app
   ```

2. **Instale as dependências do projeto:**
   Certifique-se de que o Python está instalado e execute o comando:
   ```bash
   pip install -r requirements.txt
   ```

3. **Execute a CLI:**
   Para iniciar a interface de linha de comando, rode:
   ```bash
   python main.py
   ```

> **Nota:** A CLI depende do banco de dados estar em execução. Certifique-se de que o container do banco foi iniciado com sucesso antes de executar este comando.

---

#### Destaque para o Uso Direto do Banco
Caso deseje realizar interações diretas com o banco de dados, o acesso é facilitado com o comando `make connect` dentro da pasta `database`. Isso abrirá o terminal do PostgreSQL, permitindo comandos SQL diretos.

Exemplo de conexão:
```bash
make connect
```

No prompt do PostgreSQL, é possível executar comandos como:
```sql
SELECT * FROM items;
```

---