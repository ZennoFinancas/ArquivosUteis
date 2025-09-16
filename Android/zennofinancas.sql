-- Estrutura para tabela `usuarios`
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `username` varchar(12) NOT NULL,
  `email` varchar(60) NOT NULL,
  `numero` varchar(14) NOT NULL,
  `senha_hash` varchar(60) NOT NULL,
  `ultimo_login` datetime NOT NULL,
  `criado_em` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Estrutura para tabela `categorias`
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `nome` varchar(25) NOT NULL,
  `tipo` varchar(7) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `fk_categorias_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Estrutura para tabela `gastos`
DROP TABLE IF EXISTS `gastos`;
CREATE TABLE IF NOT EXISTS `gastos` (
  `id_gasto` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_categoria` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descricao` varchar(25) DEFAULT NULL,
  `data_gasto` date NOT NULL,
  `status_pagamento` varchar(8) NOT NULL,
  PRIMARY KEY (`id_gasto`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `fk_gastos_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  CONSTRAINT `fk_gastos_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Estrutura para tabela `receitas`
DROP TABLE IF EXISTS `receitas`;
CREATE TABLE IF NOT EXISTS `receitas` (
  `id_receita` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_categoria` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descricao` varchar(25) DEFAULT NULL,
  `data_receita` date NOT NULL,
  PRIMARY KEY (`id_receita`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `fk_receitas_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  CONSTRAINT `fk_receitas_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Estrutura para tabela `objetivos`
DROP TABLE IF EXISTS `objetivos`;
CREATE TABLE IF NOT EXISTS `objetivos` (
  `id_objetivo` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `nome` varchar(25) NOT NULL,
  `valor_desejado` decimal(10,2) NOT NULL,
  `data_objetivo` date NOT NULL,
  `criado_em` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_objetivo`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `fk_objetivos_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Estrutura para tabela `aportes_objetivo`
DROP TABLE IF EXISTS `aportes_objetivo`;
CREATE TABLE IF NOT EXISTS `aportes_objetivo` (
  `id_aporte` int NOT NULL AUTO_INCREMENT,
  `id_objetivo` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descricao_aporte` varchar(25) NOT NULL,
  `data_aporte` date NOT NULL,
  PRIMARY KEY (`id_aporte`),
  KEY `id_objetivo` (`id_objetivo`),
  CONSTRAINT `fk_aportes_objetivo` FOREIGN KEY (`id_objetivo`) REFERENCES `objetivos` (`id_objetivo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;