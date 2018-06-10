-- MySQL Workbench Forward Engineering


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cel0enk8omsybxvx
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cel0enk8omsybxvx
-- -----------------------------------------------------

DROP DATABASE IF EXISTS cel0enk8omsybxvx;

CREATE SCHEMA IF NOT EXISTS `cel0enk8omsybxvx` DEFAULT CHARACTER SET latin1 ;
USE `cel0enk8omsybxvx` ;

-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`avaliacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`avaliacao` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`avaliacao` (
  `id_avaliacao` INT(11) NOT NULL AUTO_INCREMENT,
  `nota` INT(11) NULL DEFAULT NULL,
  `comentario` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_avaliacao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`banco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`banco` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`banco` (
  `id_banco` INT(11) NOT NULL AUTO_INCREMENT,
  `numero_banco` INT(11) NULL DEFAULT NULL,
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_banco`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`pais` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`pais` (
  `id_pais` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  `sigla` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`estado` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`estado` (
  `id_estado` INT(11) NOT NULL AUTO_INCREMENT,
  `id_pais` INT(11) NOT NULL,
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  `uf` CHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado`),
  INDEX `id_pais` (`id_pais` ASC),
  CONSTRAINT `estado_ibfk_1`
    FOREIGN KEY (`id_pais`)
    REFERENCES `cel0enk8omsybxvx`.`pais` (`id_pais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`cidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`cidade` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`cidade` (
  `id_cidade` INT(11) NOT NULL AUTO_INCREMENT,
  `id_estado` INT(11) NOT NULL,
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cidade`),
  INDEX `id_estado` (`id_estado` ASC),
  CONSTRAINT `cidade_ibfk_1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `cel0enk8omsybxvx`.`estado` (`id_estado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`perfil` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`perfil` (
  `id_perfil` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_perfil`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`pessoa_fisica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`pessoa_fisica` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`pessoa_fisica` (
  `id_pessoa_fisica` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  `dt_nascimento` DATE NULL DEFAULT NULL,
  `cpf` VARCHAR(12) NULL DEFAULT NULL,
  `sexo` CHAR(2) NULL DEFAULT NULL,
  `login` VARCHAR(255) NULL DEFAULT NULL,
  `senha` VARCHAR(255) NULL DEFAULT NULL,
  `imagem_pessoa` VARCHAR(255) NULL DEFAULT NULL,
  `id_perfil` INT(11) NULL,
  `ativo` TINYINT(1) NULL DEFAULT '1',
  `id_cidade` INT(11) NULL,
  `id_estado` INT(11) NULL,
  `nome_pai` VARCHAR(100) NULL DEFAULT NULL,
  `nome_mae` VARCHAR(100) NULL DEFAULT NULL,
  `imagem_frente_documento` VARCHAR(255) NULL DEFAULT NULL,
  `imagem_verso_documento` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pessoa_fisica`),
  INDEX `fk_pessoa_fisica_perfil1_idx` (`id_perfil` ASC),
  INDEX `fk_pessoa_fisica_cidade1_idx` (`id_cidade` ASC),
  INDEX `fk_pessoa_fisica_estado1_idx` (`id_estado` ASC),
  CONSTRAINT `fk_pessoa_fisica_cidade1`
    FOREIGN KEY (`id_cidade`)
    REFERENCES `cel0enk8omsybxvx`.`cidade` (`id_cidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_fisica_estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `cel0enk8omsybxvx`.`estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_fisica_perfil1`
    FOREIGN KEY (`id_perfil`)
    REFERENCES `cel0enk8omsybxvx`.`perfil` (`id_perfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

ALTER TABLE `pessoa_fisica`
  ADD UNIQUE INDEX `UX_LOGIN` (`login`);

-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`cartao_credito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`cartao_credito` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`cartao_credito` (
  `id_cartao` INT(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT(11) NOT NULL,
  `numero_cartao` BIGINT(20) NULL DEFAULT NULL,
  `nome_titular` VARCHAR(255) NULL DEFAULT NULL,
  `dt_validade` DATETIME NULL DEFAULT NULL,
  `codigo_seguranca` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cartao`),
  INDEX `id_pessoa` (`id_pessoa` ASC),
  CONSTRAINT `cartao_credito_ibfk_1`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `cel0enk8omsybxvx`.`pessoa_fisica` (`id_pessoa_fisica`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`categoria` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`categoria` (
  `id_categoria` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  `taxa` FLOAT NOT NULL,
  `imagem_categoria` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`conta_bancaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`conta_bancaria` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`conta_bancaria` (
  `id_conta_bancaria` INT(11) NOT NULL AUTO_INCREMENT,
  `id_banco` INT(11) NOT NULL,
  `numero_agencia` INT(11) NULL DEFAULT NULL,
  `numero_conta` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_conta_bancaria`),
  INDEX `id_banco` (`id_banco` ASC),
  CONSTRAINT `conta_bancaria_ibfk_1`
    FOREIGN KEY (`id_banco`)
    REFERENCES `cel0enk8omsybxvx`.`banco` (`id_banco`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`tipo_contato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`tipo_contato` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`tipo_contato` (
  `id_tipo_contato` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_contato`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`contato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`contato` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`contato` (
  `id_contato` INT(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT(11) NOT NULL,
  `id_tipo_contato` INT(11) NOT NULL,
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_contato`),
  INDEX `id_tipo_contato` (`id_tipo_contato` ASC),
  CONSTRAINT `contato_ibfk_1`
    FOREIGN KEY (`id_tipo_contato`)
    REFERENCES `cel0enk8omsybxvx`.`tipo_contato` (`id_tipo_contato`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`contratante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`contratante` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`contratante` (
  `id_contratante` INT(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT(11) NOT NULL,
  PRIMARY KEY (`id_contratante`),
  INDEX `id_pessoa` (`id_pessoa` ASC),
  CONSTRAINT `contratante_ibfk_1`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `cel0enk8omsybxvx`.`pessoa_fisica` (`id_pessoa_fisica`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`contratante_avaliacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`contratante_avaliacao` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`contratante_avaliacao` (
  `id_contratante_avaliacao` INT(11) NOT NULL AUTO_INCREMENT,
  `id_contratante` INT(11) NOT NULL,
  `id_avaliacao` INT(11) NOT NULL,
  PRIMARY KEY (`id_contratante_avaliacao`),
  INDEX `id_contratante` (`id_contratante` ASC),
  INDEX `id_avaliacao` (`id_avaliacao` ASC),
  CONSTRAINT `contratante_avaliacao_ibfk_1`
    FOREIGN KEY (`id_contratante`)
    REFERENCES `cel0enk8omsybxvx`.`contratante` (`id_contratante`),
  CONSTRAINT `contratante_avaliacao_ibfk_2`
    FOREIGN KEY (`id_avaliacao`)
    REFERENCES `cel0enk8omsybxvx`.`avaliacao` (`id_avaliacao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`necessidade_especial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`necessidade_especial` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`necessidade_especial` (
  `id_necessidade_especial` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_necessidade_especial`),
  UNIQUE INDEX `id_necessidade_especial_UNIQUE` (`id_necessidade_especial` ASC),
  UNIQUE INDEX `descricao_UNIQUE` (`descricao` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`contratante_necessidade_especial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`contratante_necessidade_especial` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`contratante_necessidade_especial` (
  `id_contratante_necessidade_especial` INT(11) NOT NULL AUTO_INCREMENT,
  `necessidade_especial_id_necessidade_especial` INT(11) NOT NULL,
  `contratante_id_contratante` INT(11) NOT NULL,
  PRIMARY KEY (`id_contratante_necessidade_especial`),
  INDEX `fk_contratante_necessidade_especial_necessidade_especial1_idx` (`necessidade_especial_id_necessidade_especial` ASC),
  INDEX `fk_contratante_necessidade_especial_contratante1_idx` (`contratante_id_contratante` ASC),
  CONSTRAINT `fk_contratante_necessidade_especial_contratante1`
    FOREIGN KEY (`contratante_id_contratante`)
    REFERENCES `cel0enk8omsybxvx`.`contratante` (`id_contratante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contratante_necessidade_especial_necessidade_especial1`
    FOREIGN KEY (`necessidade_especial_id_necessidade_especial`)
    REFERENCES `cel0enk8omsybxvx`.`necessidade_especial` (`id_necessidade_especial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`prestador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`prestador` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`prestador` (
  `id_prestador` INT(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT(11) NOT NULL,
  `id_conta_bancaria` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_prestador`),
  INDEX `id_pessoa` (`id_pessoa` ASC),
  INDEX `id_conta_bancaria` (`id_conta_bancaria` ASC),
  CONSTRAINT `prestador_ibfk_1`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `cel0enk8omsybxvx`.`pessoa_fisica` (`id_pessoa_fisica`),
  CONSTRAINT `prestador_ibfk_2`
    FOREIGN KEY (`id_conta_bancaria`)
    REFERENCES `cel0enk8omsybxvx`.`conta_bancaria` (`id_conta_bancaria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`servico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`servico` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`servico` (
  `id_servico` INT(11) NOT NULL AUTO_INCREMENT,
  `id_prestador` INT(11) NOT NULL,
  `id_categoria` INT(11) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `valor` FLOAT NOT NULL,
  `detalhe` VARCHAR(100) NULL DEFAULT NULL,
  `ativo` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`id_servico`),
  INDEX `id_prestador` (`id_prestador` ASC),
  INDEX `id_categoria` (`id_categoria` ASC),
  CONSTRAINT `servico_ibfk_1`
    FOREIGN KEY (`id_prestador`)
    REFERENCES `cel0enk8omsybxvx`.`prestador` (`id_prestador`),
  CONSTRAINT `servico_ibfk_2`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `cel0enk8omsybxvx`.`categoria` (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`dia_disponivel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`dia_disponivel` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`dia_disponivel` (
  `id_dia_disponivel` INT(11) NOT NULL AUTO_INCREMENT,
  `id_servico` INT(11) NOT NULL,
  `nr_dia` INT(11) NULL DEFAULT NULL,
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_dia_disponivel`),
  INDEX `id_servico` (`id_servico` ASC),
  CONSTRAINT `dia_disponivel_ibfk_1`
    FOREIGN KEY (`id_servico`)
    REFERENCES `cel0enk8omsybxvx`.`servico` (`id_servico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`endereco` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`endereco` (
  `id_endereco` INT(11) NOT NULL AUTO_INCREMENT,
  `id_cidade` INT(11) NOT NULL,
  `id_pessoa` INT(11) NOT NULL,
  `bairro` VARCHAR(255) NULL DEFAULT NULL,
  `rua` VARCHAR(12) NULL DEFAULT NULL,
  `numero` INT(11) NULL DEFAULT NULL,
  `complemento` VARCHAR(255) NULL DEFAULT NULL,
  `cep` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_endereco`),
  INDEX `id_cidade` (`id_cidade` ASC),
  INDEX `id_pessoa` (`id_pessoa` ASC),
  CONSTRAINT `endereco_ibfk_1`
    FOREIGN KEY (`id_cidade`)
    REFERENCES `cel0enk8omsybxvx`.`cidade` (`id_cidade`),
  CONSTRAINT `endereco_ibfk_2`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `cel0enk8omsybxvx`.`pessoa_fisica` (`id_pessoa_fisica`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`estado_operacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`estado_operacao` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`estado_operacao` (
  `id_estado_operacao` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado_operacao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`forma_pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`forma_pagamento` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`forma_pagamento` (
  `id_forma_pagamento` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_forma_pagamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`horario_disponivel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`horario_disponivel` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`horario_disponivel` (
  `id_horario_disponivel` INT(11) NOT NULL AUTO_INCREMENT,
  `id_dia_disponivel` INT(11) NOT NULL,
  `horario_inicio` TIME NOT NULL,
  `horario_fim` TIME NOT NULL,
  PRIMARY KEY (`id_horario_disponivel`),
  INDEX `id_dia_disponivel` (`id_dia_disponivel` ASC),
  CONSTRAINT `horario_disponivel_ibfk_1`
    FOREIGN KEY (`id_dia_disponivel`)
    REFERENCES `cel0enk8omsybxvx`.`dia_disponivel` (`id_dia_disponivel`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`servico_avaliacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`servico_avaliacao` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`servico_avaliacao` (
  `id_servico_avaliacao` INT(11) NOT NULL AUTO_INCREMENT,
  `id_servico` INT(11) NOT NULL,
  `id_avaliacao` INT(11) NOT NULL,
  PRIMARY KEY (`id_servico_avaliacao`),
  INDEX `id_servico` (`id_servico` ASC),
  INDEX `id_avaliacao` (`id_avaliacao` ASC),
  CONSTRAINT `servico_avaliacao_ibfk_1`
    FOREIGN KEY (`id_servico`)
    REFERENCES `cel0enk8omsybxvx`.`servico` (`id_servico`),
  CONSTRAINT `servico_avaliacao_ibfk_2`
    FOREIGN KEY (`id_avaliacao`)
    REFERENCES `cel0enk8omsybxvx`.`avaliacao` (`id_avaliacao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cel0enk8omsybxvx`.`servico_solicitado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`servico_solicitado` ;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`servico_solicitado` (
  `id_servico_solicitacao` INT(11) NOT NULL AUTO_INCREMENT,
  `id_servico` INT(11) NOT NULL,
  `id_contratante` INT(11) NOT NULL,
  `id_forma_pagamento` INT(11) NOT NULL,
  `id_estado_operacao` INT(11) NOT NULL,
  `horario_inicio` TIME NULL DEFAULT NULL,
  `horario_fim` TIME NULL DEFAULT NULL,
  `dia_solicitacao` DATE NULL DEFAULT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`id_servico_solicitacao`),
  INDEX `id_servico` (`id_servico` ASC),
  INDEX `id_contratante` (`id_contratante` ASC),
  INDEX `id_forma_pagamento` (`id_forma_pagamento` ASC),
  INDEX `id_estado_operacao` (`id_estado_operacao` ASC),
  CONSTRAINT `servico_solicitado_ibfk_1`
    FOREIGN KEY (`id_servico`)
    REFERENCES `cel0enk8omsybxvx`.`servico` (`id_servico`),
  CONSTRAINT `servico_solicitado_ibfk_2`
    FOREIGN KEY (`id_contratante`)
    REFERENCES `cel0enk8omsybxvx`.`contratante` (`id_contratante`),
  CONSTRAINT `servico_solicitado_ibfk_3`
    FOREIGN KEY (`id_forma_pagamento`)
    REFERENCES `cel0enk8omsybxvx`.`forma_pagamento` (`id_forma_pagamento`),
  CONSTRAINT `servico_solicitado_ibfk_4`
    FOREIGN KEY (`id_estado_operacao`)
    REFERENCES `cel0enk8omsybxvx`.`estado_operacao` (`id_estado_operacao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

DROP TABLE IF EXISTS `cel0enk8omsybxvx`.`estado_pessoa_fisica`;

CREATE TABLE IF NOT EXISTS `cel0enk8omsybxvx`.`estado_pessoa_fisica` (
  id_estado_pessoa_fisica int primary key auto_increment,
  descricao varchar(100)
) Engine=innoDB;

ALTER TABLE `pessoa_fisica`
  CHANGE COLUMN `ativo` `id_estado_pessoa_fisica` INT NULL DEFAULT '1' AFTER `id_perfil`;

ALTER TABLE `pessoa_fisica`
  ADD CONSTRAINT `fk_estado_pessoa_fisica` FOREIGN KEY (`id_estado_pessoa_fisica`) REFERENCES `estado_pessoa_fisica` (`id_estado_pessoa_fisica`) ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE `contato`
  ADD CONSTRAINT `fk_contato_pessoa_fisica` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa_fisica` (`id_pessoa_fisica`) ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE `horario_disponivel`
DROP FOREIGN KEY `horario_disponivel_ibfk_1`;
ALTER TABLE `horario_disponivel`
ADD CONSTRAINT `horario_disponivel_ibfk_1` FOREIGN KEY (`id_dia_disponivel`) REFERENCES `dia_disponivel` (`id_dia_disponivel`) ON DELETE CASCADE;

USE `cel0enk8omsybxvx` ;

-- -----------------------------------------------------
-- function obter_avaliacao_prestador
-- -----------------------------------------------------
USE `cel0enk8omsybxvx`;
DROP function IF EXISTS `cel0enk8omsybxvx`.`obter_avaliacao_prestador`;

DELIMITER $$
USE `cel0enk8omsybxvx`$$
CREATE  FUNCTION `obter_avaliacao_prestador`(`id_prestador_p` INT) RETURNS float
BEGIN
	DECLARE retorno float;
	
	select
		avg(a.nota)
	into
		retorno
	from
		avaliacao a,
		servico_avaliacao sa
	where a.id_avaliacao = sa.id_avaliacao
	and sa.id_servico in (select id_servico from servico where id_prestador = id_prestador_p);
	
	if (retorno is null) then
		set retorno = 0;
	end if;
	
	return retorno;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function obter_avaliacao_servico
-- -----------------------------------------------------

USE `cel0enk8omsybxvx`;
DROP function IF EXISTS `cel0enk8omsybxvx`.`obter_avaliacao_servico`;

DELIMITER $$
USE `cel0enk8omsybxvx`$$
CREATE  FUNCTION `obter_avaliacao_servico`(`id_servico_p` INT) RETURNS float
BEGIN
	DECLARE retorno float;
	
	select
		avg(a.nota)
	into
		retorno
	from
		avaliacao a,
		servico_avaliacao sa
	where a.id_avaliacao = sa.id_avaliacao
	and sa.id_servico = id_servico_p;
	
	if (retorno is null) then
		set retorno = 0;
	end if;
	
	return retorno;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function obter_avaliacao_contratante
-- -----------------------------------------------------

USE `cel0enk8omsybxvx`;
DROP function IF EXISTS `cel0enk8omsybxvx`.`obter_avaliacao_contratante`;

DELIMITER $$
USE `cel0enk8omsybxvx`$$
CREATE  FUNCTION `obter_avaliacao_contratante`(`id_contratante_p` INT) RETURNS float
BEGIN
DECLARE retorno float;
	
	select
		avg(a.nota)
	into
		retorno
	from
		avaliacao a,
		contratante_avaliacao ca
	where a.id_avaliacao = ca.id_avaliacao
	and ca.id_contratante = id_contratante_p;
	
	if (retorno is null) then
		set retorno = 0;
	end if;
	
	return retorno;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure inativar_servicos_prestador
-- -----------------------------------------------------

USE `cel0enk8omsybxvx`;
DROP PROCEDURE IF EXISTS `cel0enk8omsybxvx`.`inativar_servicos_prestador`;

DELIMITER $$
USE `cel0enk8omsybxvx`$$

CREATE  PROCEDURE `inativar_servicos_prestador`(
	IN `id_prestador_p` INT

)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN

	update servico
	set ativo = 0
	where id_prestador = id_prestador_p;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- trigger pessoa_fisica_after_update
-- -----------------------------------------------------

USE `cel0enk8omsybxvx`;
DROP TRIGGER IF EXISTS `cel0enk8omsybxvx`.`pessoa_fisica_after_update`;

DELIMITER $$
USE `cel0enk8omsybxvx`$$

CREATE TRIGGER `pessoa_fisica_after_update` AFTER UPDATE ON `pessoa_fisica` FOR EACH ROW BEGIN
declare id_prestador_v int;

	if (new.id_estado_pessoa_fisica = 2) then		
		select
			id_prestador
		into
			id_prestador_v
		from
			prestador p
		where 
			p.id_pessoa = new.id_pessoa_fisica;
			
		if (id_prestador_v > 0) then
			call inativar_servicos_prestador(id_prestador_v);
		end if;
	end if;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- trigger servico_solicitado_before_insert
-- -----------------------------------------------------

USE `cel0enk8omsybxvx`;
DROP TRIGGER IF EXISTS `cel0enk8omsybxvx`.`servico_solicitado_before_insert`;

DELIMITER $$
USE `cel0enk8omsybxvx`$$
CREATE TRIGGER `servico_solicitado_before_insert` BEFORE INSERT ON `servico_solicitado` FOR EACH ROW BEGIN
	DECLARE novoValor Float;

	select 
		s.valor 
	into
		novoValor
	from 
		servico s 
	where 
		s.id_servico = new.id_servico;
	
	set new.valor = novoValor;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function obter_avaliacao
-- -----------------------------------------------------

USE `cel0enk8omsybxvx`;
DROP function IF EXISTS `cel0enk8omsybxvx`.`obter_avaliacao`;

DELIMITER $$
USE `cel0enk8omsybxvx`$$
CREATE  FUNCTION `obter_avaliacao`(`ie_opcao_p` CHAR, `id_opcao_p` INT) RETURNS float
BEGIN
	/*
		S - Serviço
		C - Contratante
    P - Prestador
	*/		
	return 
		case (ie_opcao_p) 
			when ('S') then
				obter_avaliacao_servico(id_opcao_p)
			when ('C') then
				obter_avaliacao_contratante(id_opcao_p)
      when ('P') then
        obter_avaliacao_prestador(id_opcao_p)
			else
				0
		end;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function obter_se_pode_excluir
-- -----------------------------------------------------

USE `cel0enk8omsybxvx`;
DROP function IF EXISTS `cel0enk8omsybxvx`.`obter_se_pode_excluir`;

DELIMITER $$
USE `cel0enk8omsybxvx`$$
CREATE  FUNCTION `obter_se_pode_excluir`(`id_prestador_p` INT) RETURNS varchar(1)
BEGIN
  DECLARE retorno varchar(1);
  
  select
    case
      when count(1) = 0 then 'S'
      else 'N'
    end
  into
    retorno
  from
    servico_solicitado ss,
    servico s
  where ss.id_servico = s.id_servico
  and s.id_prestador = id_prestador_p
  and ss.id_estado_operacao not in (2, 5, 6); /*Reprovado, Executado, Finalizado*/
  
  return retorno;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function obter_quantidade_servicos
-- -----------------------------------------------------

USE `cel0enk8omsybxvx`;
DROP function IF EXISTS `cel0enk8omsybxvx`.`obter_quantidade_servicos`;

DELIMITER $$
USE `cel0enk8omsybxvx`$$
CREATE  FUNCTION `obter_quantidade_servicos`(`id_servico_p` INT) RETURNS int(11)
BEGIN
  DECLARE retorno INT;
  
  select
    count(*)
  into
    retorno
  from
    servico_solicitado ss
  where ss.id_servico = id_servico_p;
  
  return retorno;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
