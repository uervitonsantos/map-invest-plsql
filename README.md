# Scripts PL/SQL para Configuração do Banco de Dados

Este repositório contém scripts PL/SQL utilizados para criar e configurar o banco de dados do projeto.

## Visão Geral

Os arquivos aqui fornecidos são scripts PL/SQL que podem ser executados em um ambiente Oracle Database para criar e configurar a estrutura do banco de dados necessária para o projeto.

## Estrutura do Repositório

- `create_tables.sql`: Este script cria as tabelas necessárias para armazenar os dados do projeto.
- `create_indexes.sql`: Este script cria os índices para otimizar o desempenho das consultas.
- `create_constraints.sql`: Este script adiciona as restrições de integridade referencial entre as tabelas.
- `create_sequences.sql`: Este script define as sequências para geração de chaves primárias.
- `populate_data.sql`: Este script popula as tabelas com dados iniciais, se necessário.

## Utilização

Para utilizar os scripts:

1. Conecte-se a um banco de dados Oracle.
2. Execute os scripts na ordem indicada acima, utilizando um cliente SQL ou ferramenta similar.

Certifique-se de revisar os scripts e personalizá-los conforme necessário para atender aos requisitos específicos do seu projeto e ambiente de banco de dados.

## Contribuições

Contribuições são bem-vindas! Se você identificar melhorias nos scripts existentes ou quiser adicionar novos scripts úteis, sinta-se à vontade para enviar uma solicitação de pull.

## Licença

Este projeto é licenciado sob a [MIT License](LICENSE).
