
--Este comando apaga o banco de dados "uvv" se ele existir.--
DROP DATABASE IF EXISTS uvv;

--Este comando apaga o usuário "thiago" se ele existir.--
DROP USER IF EXISTS thiago;

--Este comando apaga o esquema "lojas" se ele existir.--


--Este comando cria o usuário "thiago" e a senha.
CREATE USER thiago WITH PASSWORD 'computacaoraiz' CREATEDB;

--Este comando cria o banco de dados "uvv".--
CREATE DATABASE uvv
owner thiago
template template0
encoding 'UTF8'
lc_collate 'pt_BR.UTF-8'
lc_ctype 'pt_BR.UTF-8'
allow_connections TRUE;

--Este comando cria o comentário do banco de dados "uvv".--
COMMENT ON DATABASE uvv                                         IS 'Banco de dados das Lojas UVV.';

--Este comando usa o bando de dados "uvv" e o usuário "thiago" sem pedir a senha para login; faz a troca de conexão.--
\c 'dbname=uvv user=thiago password=computacaoraiz';

--Este comando cria o esquema "lojas".--
CREATE SCHEMA lojas AUTHORIZATION thiago;
ALTER USER thiago 
SET SEARCH_PATH TO lojas, "$user", public;
SET SEARCH_PATH TO lojas, "$user", public;

--Este comando cria a tabela "produtos", suas colunas e a chave primária.--
CREATE TABLE produtos (
                produto_id                                      NUMERIC(38)    NOT NULL,
                nome                                            VARCHAR(255)   NOT NULL,
                preco_unitario                                  NUMERIC(10,2),
                detalhes                                        BYTEA,
                imagem                                          BYTEA,
                imagem_mime_type                                VARCHAR(512),
                imagem_arquivo                                  VARCHAR(512),
                imagem_charset                                  VARCHAR(512),
                imagem_ultima_atualizacao                       DATE,
                CONSTRAINT produtos_pk                          PRIMARY KEY (produto_id)
);

--Estes comandos criam os comentários da tabela "produtos" e das colunas.--
COMMENT ON TABLE produtos                                       IS 'Tabela com as informações dos produtos das Lojas UVV.';
COMMENT ON COLUMN produtos.produto_id                           IS 'Identificação do produto.';
COMMENT ON COLUMN produtos.nome                                 IS 'Nome do produto.';
COMMENT ON COLUMN produtos.preco_unitario                       IS 'Preço unitário dos produtos das Lojas UVV.';
COMMENT ON COLUMN produtos.detalhes                             IS 'Detalhes dos produtos.';
COMMENT ON COLUMN produtos.imagem                               IS 'Imagem dos produtos.';
COMMENT ON COLUMN produtos.imagem_mime_type                     IS 'Tipo de dado que as imagens dos produtos contém.';
COMMENT ON COLUMN produtos.imagem_arquivo                       IS 'Arquivo onde está localizado as imagens dos produtos.';
COMMENT ON COLUMN produtos.imagem_charset                       IS 'Codificação dos caracteres das imagens dos produtos.';
COMMENT ON COLUMN produtos.imagem_ultima_atualizacao            IS 'Última atualização das imagens dos produtos.';

--Este comando cria a tabela "lojas", suas colunas e a chave primária.--
CREATE TABLE lojas (
                loja_id                                         NUMERIC(38)    NOT NULL,
                nome                                            VARCHAR(255)   NOT NULL,
                endereco_web                                    VARCHAR(100),
                endereco_fisico                                 VARCHAR(512),
                latitude                                        NUMERIC,
                longitude                                       NUMERIC,
                logo                                            BYTEA,
                logo_mime_type                                  VARCHAR(512),
                logo_arquivo                                    VARCHAR(512),
                logo_charset                                    VARCHAR(512),
                logo_ultima_atualizacao                         DATE,
                CONSTRAINT lojas_pk                             PRIMARY KEY (loja_id)
);

--Estes comandos criam os comentários da tabela "lojas" e das colunas.--
COMMENT ON TABLE lojas                                          IS 'Tabela com as informações das Lojas UVV.';
COMMENT ON COLUMN lojas.loja_id                                 IS 'Identificação da loja.';
COMMENT ON COLUMN lojas.nome                                    IS 'Nome da loja.';
COMMENT ON COLUMN lojas.endereco_web                            IS 'Endereço do site das Lojas UVV.';
COMMENT ON COLUMN lojas.endereco_fisico                         IS 'Endereço físico das Lojas UVV.';
COMMENT ON COLUMN lojas.latitude                                IS 'Localização latitudinal das Lojas UVV.';
COMMENT ON COLUMN lojas.longitude                               IS 'Localização longitudinal das Lojas UVV.';
COMMENT ON COLUMN lojas.logo                                    IS 'Logo das Lojas UVV.';
COMMENT ON COLUMN lojas.logo_mime_type                          IS 'Tipo de dado que a logo das Lojas UVV contém.';
COMMENT ON COLUMN lojas.logo_arquivo                            IS 'Arquivo onde está localizado a logo das Lojas UVV.';
COMMENT ON COLUMN lojas.logo_charset                            IS 'Codificação de caracteres da logo das Lojas UVV.';
COMMENT ON COLUMN lojas.logo_ultima_atualizacao                 IS 'Última atualização da logo.';

--Este comando cria a tabela "estoques", suas colunas e a chave primária.--
CREATE TABLE estoques (
                estoque_id                                      NUMERIC(38)    NOT NULL,
                loja_id                                         NUMERIC(38)    NOT NULL,
                produto_id                                      NUMERIC(38)    NOT NULL,
                quantidade                                      NUMERIC(38)    NOT NULL,
                CONSTRAINT estoques_pk                          PRIMARY KEY (estoque_id)
);

--Estes comandos criam os comentários da tabela "estoques" e das colunas.--
COMMENT ON TABLE estoques                                       IS 'Tabela com as informações dos produtos nos estoques.';
COMMENT ON COLUMN estoques.estoque_id                           IS 'Identificação do estoque.';
COMMENT ON COLUMN estoques.loja_id                              IS 'Identificação da loja.';
COMMENT ON COLUMN estoques.produto_id                           IS 'Identificação do produto.';
COMMENT ON COLUMN estoques.quantidade                           IS 'Quantidade de produtos nos estoques.';

--Este comando cria a tabela "clientes", suas colunas e a chave primária.--
CREATE TABLE clientes (
                cliente_id                                      NUMERIC(38)    NOT NULL,
                email                                           VARCHAR(255)   NOT NULL,
                nome                                            VARCHAR(255)   NOT NULL,
                telefone1                                       VARCHAR(20),
                telefone2                                       VARCHAR(20),
                telefone3                                       VARCHAR(20),
                CONSTRAINT clientes_pk                          PRIMARY KEY (cliente_id)
);

--Estes comandos criam os comentários da tabela "clientes" e das colunas.--
COMMENT ON TABLE clientes                                       IS 'Tabela com as informações dos clientes das Lojas UVV.';
COMMENT ON COLUMN clientes.cliente_id                           IS 'Número do cliente.';
COMMENT ON COLUMN clientes.email                                IS 'Email do cliente.';
COMMENT ON COLUMN clientes.nome                                 IS 'Nome do cliente.';
COMMENT ON COLUMN clientes.telefone1                            IS 'Opção número 1 de telefone do cliente.';
COMMENT ON COLUMN clientes.telefone2                            IS 'Opção número 2 de telefone do cliente.';
COMMENT ON COLUMN clientes.telefone3                            IS 'Opção número 3 de telefone do cliente.';

--Este comando cria a tabela "envios", suas colunas e a chave primária.--
CREATE TABLE envios (
                envio_id                                        NUMERIC(38)    NOT NULL,
                loja_id                                         NUMERIC(38)    NOT NULL,
                cliente_id                                      NUMERIC(38)    NOT NULL,
                endereco_entrega                                VARCHAR(512)   NOT NULL,
                status                                          VARCHAR(15)    NOT NULL,
                CONSTRAINT envios_pk                            PRIMARY KEY (envio_id)
);

--Estes comandos criam os comentários da tabela "envios" e das colunas.--
COMMENT ON TABLE envios                                         IS 'Tabela com as informações de envios das Lojas UVV.';
COMMENT ON COLUMN envios.envio_id                               IS 'Identificação do envio.';
COMMENT ON COLUMN envios.loja_id                                IS 'Identificação da loja.';
COMMENT ON COLUMN envios.cliente_id                             IS 'Número do cliente.';
COMMENT ON COLUMN envios.endereco_entrega                       IS 'Informações sobre o endereço da entrega.';
COMMENT ON COLUMN envios.status                                 IS 'Situação do envio.';

--Este comando cria a tabela "pedidos", suas colunas e a chave primária.--
CREATE TABLE pedidos (
                pedido_id                                       NUMERIC(38)    NOT NULL,
                data_hora                                       TIMESTAMP      NOT NULL,
                cliente_id                                      NUMERIC(38)    NOT NULL,
                status                                          VARCHAR(15)    NOT NULL,
                loja_id                                         NUMERIC(38)    NOT NULL,
                CONSTRAINT pedidos_pk                           PRIMARY KEY (pedido_id)
);

--Estes comandos criam os comentários da tabela "pedidos" e das colunas.--
COMMENT ON TABLE pedidos                                        IS 'Tabela com as informações dos pedidos das Lojas UVV.';
COMMENT ON COLUMN pedidos.pedido_id                             IS 'Identificação do pedido.';
COMMENT ON COLUMN pedidos.data_hora                             IS 'Data e hora que o pedido foi feito.';
COMMENT ON COLUMN pedidos.cliente_id                            IS 'Número do cliente.';
COMMENT ON COLUMN pedidos.status                                IS 'Situação do pedido.';
COMMENT ON COLUMN pedidos.loja_id                               IS 'Identificação da loja.';

--Este comando cria a tabela "pedidos_itens", suas colunas e a chave primária.--
CREATE TABLE pedidos_itens (
                pedido_id                                       NUMERIC(38)    NOT NULL,
                produto_id                                      NUMERIC(38)    NOT NULL,
                numero_da_linha                                 NUMERIC(38)    NOT NULL,
                preco_unitario                                  NUMERIC(10,2)  NOT NULL,
                quantidade                                      NUMERIC(38)    NOT NULL,
                envio_id                                        NUMERIC(38),
                CONSTRAINT pedidos_itens_pk                     PRIMARY KEY (pedido_id, produto_id)
);

--Estes comandos criam os comentários da tabela "pedidos_itens" e das colunas.--
COMMENT ON TABLE pedidos_itens                                  IS 'Tabela sobre os itens pedidos pelos clientes.';
COMMENT ON COLUMN pedidos_itens.pedido_id                       IS 'Identificação do pedido.';
COMMENT ON COLUMN pedidos_itens.produto_id                      IS 'Identificação do produto.';
COMMENT ON COLUMN pedidos_itens.numero_da_linha                 IS 'Numeração da linha dos itens pedidos.';
COMMENT ON COLUMN pedidos_itens.preco_unitario                  IS 'Preço unitário dos itens pedidos pelos clientes.';
COMMENT ON COLUMN pedidos_itens.quantidade                      IS 'Quantidade de itens pedidos pelos clientes.';
COMMENT ON COLUMN pedidos_itens.envio_id                        IS 'Identificação do envio.';

--Estes comandos criam as chaves estrangeiras das tabelas do bando de dados.--
ALTER TABLE estoques                                            ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens                                       ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE envios                                              ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos                                             ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE estoques                                            ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos                                             ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE envios                                              ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens                                       ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens                                       ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Este comando cria uma restrição onde o preço unitário não pode ser negativo.--
ALTER TABLE produtos                                            ADD CONSTRAINT produtos_preco_nao_negativo_check CHECK (preco_unitario >= 0);

--Este comando cria uma restrição onde a quantidade não pode ser negativa.--
ALTER TABLE estoques                                            ADD CONSTRAINT quantidade_naonegativo_check CHECK (quantidade >= 0);

--Este comando cria uma restrição onde o status dos pedidos só pode aceitar os seguintes valores (cancelado, completo, aberto, pago, reembolsado, enviado).--
ALTER TABLE pedidos                                             ADD CONSTRAINT status_pedidos_validos_check CHECK (status IN ('CANCELADO', 'COMPLETO', 'ABERTO', 'PAGO', 'REEMBOLSADO', 'ENVIADO'));

--Este comando cria uma restrição onde o status dos envios só pode aceitar os seguintes valores (criado, enviado, trânsito, entregue).--
ALTER TABLE envios                                              ADD CONSTRAINT status_envios_check CHECK (status IN('CRIADO', 'ENVIADO', 'TRANSITO', 'ENTREGUE'));

--Este comando cria uma restrição onde faz com que pelo menos uma das colunas de endereço (físico ou web) estejam preenchidas.--
ALTER TABLE lojas                                               ADD CONSTRAINT enderecos_preenchidos_check CHECK ((endereco_web IS NOT NULL) OR (endereco_fisico IS NOT NULL));
