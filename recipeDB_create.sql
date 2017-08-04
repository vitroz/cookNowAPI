-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-08-01 17:27:13.616

-- tables
-- Table: ingrediente
CREATE TABLE ingrediente (
    igr_id serial  NOT NULL,
    igr_nome varchar(30)  NOT NULL,
    igr_tipo varchar(30)  NOT NULL,
    CONSTRAINT ingrediente_pk PRIMARY KEY (igr_id)
);

-- Table: receita
CREATE TABLE receita (
    rct_id serial  NOT NULL,
    rct_criado_em date  NULL,
    rct_nome varchar(80)  NULL,
    rct_dificuldade varchar(20)  NOT NULL,
    rct_prep_tempo int  NULL,
    CONSTRAINT rct_id PRIMARY KEY (rct_id)
);

-- Table: receita_passo
CREATE TABLE receita_passo (
    rcp_num_passo serial  NOT NULL,
    rct_id int  NOT NULL,
    rcp_instrucao varchar(200)  NOT NULL,
    utensilio_utl_id int  NOT NULL,
    CONSTRAINT receita_passo_pk PRIMARY KEY (rcp_num_passo)
);

-- Table: receita_passo_ingrediente
CREATE TABLE receita_passo_ingrediente (
    rpi_quantidade int  NULL,
    rpi_tipo varchar(30)  NOT NULL,
    rct_id int  NOT NULL,
    rcp_num_passo int  NOT NULL,
    igr_id int  NOT NULL
);

-- Table: utensilio
CREATE TABLE utensilio (
    utl_id serial NOT NULL,
    utl_nome varchar(20)  NOT NULL,
    utl_tipo varchar(20)  NOT NULL,
    CONSTRAINT utensilio_pk PRIMARY KEY (utl_id)
);

-- foreign keys
-- Reference: receita_passo_ingrediente_ingrediente (table: receita_passo_ingrediente)
ALTER TABLE receita_passo_ingrediente ADD CONSTRAINT receita_passo_ingrediente_ingrediente
    FOREIGN KEY (igr_id)
    REFERENCES ingrediente (igr_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: receita_passo_ingrediente_receita (table: receita_passo_ingrediente)
ALTER TABLE receita_passo_ingrediente ADD CONSTRAINT receita_passo_ingrediente_receita
    FOREIGN KEY (rct_id)
    REFERENCES receita (rct_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: receita_passo_ingrediente_receita_passo (table: receita_passo_ingrediente)
ALTER TABLE receita_passo_ingrediente ADD CONSTRAINT receita_passo_ingrediente_receita_passo
    FOREIGN KEY (rcp_num_passo)
    REFERENCES receita_passo (rcp_num_passo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: receita_passo_receita (table: receita_passo)
ALTER TABLE receita_passo ADD CONSTRAINT receita_passo_receita
    FOREIGN KEY (rct_id)
    REFERENCES receita (rct_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: receita_passo_utensilio (table: receita_passo)
ALTER TABLE receita_passo ADD CONSTRAINT receita_passo_utensilio
    FOREIGN KEY (utensilio_utl_id)
    REFERENCES utensilio (utl_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.
