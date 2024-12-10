-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para final
CREATE DATABASE IF NOT EXISTS `final` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `final`;

-- Copiando estrutura para tabela final.eventos
CREATE TABLE IF NOT EXISTS `eventos` (
  `evento_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `local` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`evento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela final.eventos: ~2 rows (aproximadamente)
INSERT INTO `eventos` (`evento_id`, `nome`, `data`, `local`, `descricao`, `criado_em`) VALUES
	(1, 'Joao Victor', '2007-06-01', 'Ana Jacinta', 'comparecer no local as 19:30', '2024-12-10 18:40:29'),
	(2, 'Fórum de Inovação', '2024-12-18', 'Auditório da Universidade', 'Um evento para discutir as últimas inovações em tecnologia.', '2024-12-10 18:46:20'),
	(13, 'aaa', '1896-06-30', 'aaa', 'AAAA', '2024-12-10 18:52:37');

-- Copiando estrutura para tabela final.evento_participante
CREATE TABLE IF NOT EXISTS `evento_participante` (
  `evento_id` int(11) NOT NULL,
  `participante_id` int(11) NOT NULL,
  PRIMARY KEY (`evento_id`,`participante_id`),
  KEY `participante_id` (`participante_id`),
  CONSTRAINT `evento_participante_ibfk_1` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`evento_id`) ON DELETE CASCADE,
  CONSTRAINT `evento_participante_ibfk_2` FOREIGN KEY (`participante_id`) REFERENCES `participantes` (`participante_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela final.evento_participante: ~1 rows (aproximadamente)
INSERT INTO `evento_participante` (`evento_id`, `participante_id`) VALUES
	(1, 1);

-- Copiando estrutura para tabela final.participantes
CREATE TABLE IF NOT EXISTS `participantes` (
  `participante_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`participante_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela final.participantes: ~2 rows (aproximadamente)
INSERT INTO `participantes` (`participante_id`, `nome`, `email`, `telefone`, `criado_em`) VALUES
	(1, 'arianny Moura', 'arianny@gmail.com', '982145635', '2024-12-10 18:40:59'),
	(2, 'Maria Oliveira', 'maria.oliveira@gmail.com', '987654321', '2024-12-10 18:46:46');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
