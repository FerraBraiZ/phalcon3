/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE SCHEMA IF NOT EXISTS `Phalcon3`;

USE `Phalcon3`;

# Dump of table channel_forward
# ------------------------------------------------------------

DROP TABLE IF EXISTS `channel_forward`;

CREATE TABLE `channel_forward` (
  `forward_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID do envio de mensagem para outro serviço',
  `channel_id` bigint(20) unsigned NOT NULL COMMENT 'ID do canal de acesso ao chat',
  `environment` varchar(50) NOT NULL COMMENT 'Ambiente de acesso a esta chave',
  `forward_to` varchar(50) NOT NULL COMMENT 'Identificação do serviço para onde a mensagem será enviada',
  `forward_url` varchar(255) NOT NULL COMMENT 'URL do endpoint do serviço para onde serão enviadas as mensagens',
  `forward_username` varchar(255) DEFAULT NULL COMMENT 'Usuário de acesso ao endpoint',
  `forward_password` varchar(255) DEFAULT NULL COMMENT 'Senha de acesso ao endpoint',
  PRIMARY KEY (`forward_id`),
  KEY `channel_forward_channel_id` (`channel_id`),
  CONSTRAINT `fk_channel_forward_channel_id` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `channel_forward` WRITE;
/*!40000 ALTER TABLE `channel_forward` DISABLE KEYS */;

INSERT INTO `channel_forward` (`forward_id`, `channel_id`, `environment`, `forward_to`, `forward_url`, `forward_username`, `forward_password`)
VALUES
	(1,1,'development','Blind-Al','blind-al/proccess-message',NULL,NULL),
	(2,1,'staging','Blind-Al','https://blind-al.stg.madeiramadeira.com.br/proccess-message',NULL,NULL),
	(3,1,'production','Blind-Al','https://blind-al.madeiramadeira.com.br/proccess-message',NULL,NULL);

/*!40000 ALTER TABLE `channel_forward` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `channels`;

CREATE TABLE `channels` (
  `channel_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID do canal de entrada da mensagem',
  `channel_name` varchar(100) NOT NULL COMMENT 'Nome do canal de entrada',
  `channel_token` varchar(255) NOT NULL COMMENT 'Hash de identificação do canal de entrada',
  `chatbot_name` varchar(255) NOT NULL COMMENT 'Nome do chatbot que será apresentado para o cliente',
  `channel_status` bit(1) NOT NULL COMMENT 'Status do canal',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data e hora de inserção do canal de entrada',
  PRIMARY KEY (`channel_id`),
  KEY `channels_channel_token` (`channel_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;

INSERT INTO `channels` (`channel_id`, `channel_name`, `channel_token`, `chatbot_name`, `channel_status`, `created_at`)
VALUES
	(1,'Wooddy','b80a2969f63cbde9225b5544c5e201e1cb58611c','Aninha',b'1','2018-10-10 14:05:48'),
	(2,'RH','b95605bf7167367b8a5759789d8e6b9782d72100','MUMU',b'1','2018-10-15 13:00:20'),
	(3,'SmallShops','6d1b24c70f1641fca4aa89af23b62eb82bf1644f','Vitória',b'1','2018-10-15 13:02:00'),
	(4,'MKTPlace','a060a5e96cda70ef60f764bd27dab30c0efbd412','mktplaceBot',b'0','2018-10-15 17:29:00'),
	(5,'Chatter','ff11f0da0a4cd245270f188d8a7299b4084d0328','Atendente',b'1','2018-10-18 16:46:29'),
	(6,'Deadpool','512bc74b7c68b4270ccf7360094b8ff6d8b947b4','Deadpool',b'1','2018-11-07 17:59:48'),
	(7,'BI','d7713aeb5974b7bfed34766c382b48a76d81bdee','',b'1','2019-01-03 11:44:37'),
	(8,'Blind-Al','bba05765aafff50fb75735ae8a520af4ffe380af','',b'1','2019-02-19 00:27:04');

/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table curatorship
# ------------------------------------------------------------

DROP TABLE IF EXISTS `curatorship`;

CREATE TABLE `curatorship` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` varchar(255) NOT NULL COMMENT 'o id da conversa do watson, usado como FK',
  `session_id` varchar(100) NOT NULL COMMENT 'Hash de identificação da conversa para o Wheezy',
  `client_gave_up` varchar(45) DEFAULT NULL,
  `client_was_angry` varchar(45) DEFAULT NULL,
  `error_cod_x` varchar(45) DEFAULT NULL,
  `is_critical_case` varchar(45) DEFAULT NULL,
  `occurred_errors` varchar(45) DEFAULT NULL,
  `should_had_transfer_to_sales` varchar(45) DEFAULT NULL,
  `situation_solved` varchar(45) NOT NULL,
  `was_client_doubt_pos_venda` varchar(45) DEFAULT NULL,
  `was_transfered` varchar(45) DEFAULT NULL,
  `waterfall_appeared` varchar(45) DEFAULT NULL,
  `wrongly_transfered` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comments` text,
  PRIMARY KEY (`id`,`conversation_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `curatorship` WRITE;
/*!40000 ALTER TABLE `curatorship` DISABLE KEYS */;

INSERT INTO `curatorship` (`id`, `conversation_id`, `session_id`, `client_gave_up`, `client_was_angry`, `error_cod_x`, `is_critical_case`, `occurred_errors`, `should_had_transfer_to_sales`, `situation_solved`, `was_client_doubt_pos_venda`, `was_transfered`, `waterfall_appeared`, `wrongly_transfered`, `created_at`, `updated_at`, `comments`)
VALUES
	(11,'','c59996f020206af71a12a81e50cc2226',NULL,NULL,NULL,'Não',NULL,NULL,'Não',NULL,NULL,NULL,NULL,'2018-10-17 18:19:06','2018-10-17 18:19:06','Teste 2');

/*!40000 ALTER TABLE `curatorship` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID da mensagem',
  `channel_id` bigint(20) NOT NULL COMMENT 'ID da origem da mensagem (canal)',
  `session_id` varchar(100) NOT NULL COMMENT 'Hash de identificação da conversa para o Wheezy',
  `session_watson_id` varchar(100) DEFAULT NULL COMMENT 'Hash de identificação da conversa para o Watson',
  `sender` varchar(100) NOT NULL COMMENT 'Remetente da mensagem',
  `recipient` varchar(100) NOT NULL COMMENT 'Destinatário da mensagem',
  `team_id` int(6) DEFAULT NULL COMMENT 'ID de identificação da fila que o usuário irá falar no Chatter',
  `user_id` int(6) DEFAULT NULL COMMENT 'ID de identificação do atendente que está em conversa com o cliente',
  `command` varchar(50) DEFAULT NULL COMMENT 'Comando que será efetuado',
  `context` text COMMENT 'Dados relativos ao comando',
  `sender_info` json DEFAULT NULL COMMENT 'Json de identificação de dados do remetente da mensagem',
  `watson_entities` json DEFAULT NULL COMMENT 'Json de entidades do Watson',
  `watson_intents` json DEFAULT NULL COMMENT 'Json de intenções do Watson',
  `file_url` json DEFAULT NULL COMMENT 'URL do anexo que foi enviado pelo remetente',
  `final_status` varchar(100) DEFAULT NULL COMMENT 'Status final da mensagem',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data e hora de inserção da mensagem na tabela',
  PRIMARY KEY (`message_id`),
  KEY `messages_channel_id` (`channel_id`),
  KEY `messages_session_id` (`session_id`),
  KEY `messages_session_watson_id` (`session_watson_id`),
  KEY `messages_sender` (`sender`),
  KEY `messages_recipient` (`recipient`),
  KEY `messages_team_id` (`team_id`),
  KEY `messages_user_id` (`user_id`),
  KEY `messages_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table messages_client_identification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages_client_identification`;

CREATE TABLE `messages_client_identification` (
  `session_id` varchar(100) NOT NULL COMMENT 'Hash de identificação da conversa para o Wheezy',
  `id_clicli` bigint(20) DEFAULT NULL COMMENT 'ID de identificação do cliente no FC',
  `client_document` varchar(20) DEFAULT NULL COMMENT 'Documento do cliente',
  `client_email` varchar(100) DEFAULT NULL COMMENT 'Email do cliente',
  `client_name` varchar(100) DEFAULT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `cbid` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data e hora de inserção de dados na tabela',
  PRIMARY KEY (`session_id`),
  KEY `messages_client_identify_id_clicli` (`id_clicli`),
  KEY `messages_client_identify_client_document` (`client_document`),
  KEY `messages_client_identify_client_email` (`client_email`),
  KEY `messages_client_identify_created_at` (`created_at`),
  KEY `idx_mci_id_doc_email` (`session_id`,`client_document`,`client_email`),
  KEY `idx_messages_client_identification_uuid` (`uuid`),
  KEY `idx_messages_client_identification_cbid` (`cbid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table messages_context
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages_context`;

CREATE TABLE `messages_context` (
  `context_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID do contexto',
  `session_id` varchar(100) NOT NULL COMMENT 'Hash de identificação das mensagens trocadas',
  `context` json NOT NULL COMMENT 'Identificação do serviço para onde a mensagem será enviada',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data e hora de criação do contexto',
  `updated_at` timestamp NOT NULL COMMENT 'Data e hora de atualização do contexto',
  PRIMARY KEY (`context_id`),
  KEY `message_context_session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table messages_evaluate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages_evaluate`;

CREATE TABLE `messages_evaluate` (
  `evaluate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID da avaliação',
  `message_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID da mensagem avaliada',
  `evaluate` varchar(20) NOT NULL COMMENT 'Avaliação feita para a mensagem',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data e hora de criação do contexto',
  PRIMARY KEY (`evaluate_id`),
  KEY `messages_evaluate_message_id` (`message_id`),
  KEY `messages_evaluate_evaluate` (`evaluate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table messages_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages_history`;

CREATE TABLE `messages_history` (
  `message_id` bigint(20) NOT NULL COMMENT 'ID da mensagem',
  `channel_id` bigint(20) NOT NULL COMMENT 'ID da origem da mensagem (canal)',
  `session_id` varchar(100) NOT NULL COMMENT 'Hash de identificação da conversa para o Wheezy',
  `session_watson_id` varchar(100) DEFAULT NULL COMMENT 'Hash de identificação da conversa para o Watson',
  `sender` varchar(100) NOT NULL COMMENT 'Remetente da mensagem',
  `recipient` varchar(100) NOT NULL COMMENT 'Destinatário da mensagem',
  `team_id` int(6) DEFAULT NULL COMMENT 'ID de identificação da fila que o usuário irá falar no Chatter',
  `user_id` int(6) DEFAULT NULL COMMENT 'ID de identificação do atendente que está em conversa com o cliente',
  `command` varchar(50) DEFAULT NULL COMMENT 'Comando que será efetuado',
  `context` text COMMENT 'Dados relativos ao comando',
  `sender_info` json DEFAULT NULL COMMENT 'Json de identificação de dados do remetente da mensagem',
  `watson_entities` json DEFAULT NULL COMMENT 'Json de entidades do Watson',
  `watson_intents` json DEFAULT NULL COMMENT 'Json de intenções do Watson',
  `file_url` json DEFAULT NULL COMMENT 'URL do anexo que foi enviado pelo remetente',
  `final_status` varchar(100) DEFAULT NULL COMMENT 'Status final da mensagem',
  `created_at` datetime NOT NULL COMMENT 'Data e hora de inserção da mensagem na tabela',
  KEY `messages_history_channel_id` (`channel_id`),
  KEY `messages_history_session_id` (`session_id`),
  KEY `messages_history_session_watson_id` (`session_watson_id`),
  KEY `messages_history_sender` (`sender`),
  KEY `messages_history_recipient` (`recipient`),
  KEY `messages_team_id` (`team_id`),
  KEY `messages_user_id` (`user_id`),
  KEY `messages_history_created_at` (`created_at`),
  KEY `messages_history_message_id_non_unique` (`message_id`),
  KEY `messages_history_command` (`command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table messages_satisfaction_survey
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages_satisfaction_survey`;

CREATE TABLE `messages_satisfaction_survey` (
  `survey_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID da mensagem',
  `session_id` varchar(100) NOT NULL COMMENT 'Hash de identificação da conversa para o Wheezy',
  `agent` varchar(100) NOT NULL COMMENT 'Nome do agente que está sendo avaliado',
  `evaluation` varchar(100) DEFAULT NULL COMMENT 'Avaliação do chat',
  `doubt_solved` varchar(100) DEFAULT NULL COMMENT 'Resolveu a dúvida?',
  `comment` text COMMENT 'Comentário a respeito do chat',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data e hora de inserção da pesquisa na tabela',
  PRIMARY KEY (`survey_id`),
  KEY `messages_satisfaction_survey_session_id` (`session_id`),
  KEY `messages_satisfaction_survey_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table parameters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `parameters`;

CREATE TABLE `parameters` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `value` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `parameters` WRITE;
/*!40000 ALTER TABLE `parameters` DISABLE KEYS */;

INSERT INTO `parameters` (`id`, `name`, `value`, `description`, `created_date`)
VALUES
	(1,'use_chatter','1','Parametro que indica se o wheezy deve ou não utilizar o chatter para transferência para um atendente','2018-05-09 22:15:07'),
	(2,'transferences_count','814','conta o número de transferências realizadas para times onde o chatter poderá atuar','2018-05-09 22:16:56'),
	(3,'chatter_teams','posvendas|vendas','times para os quais o chatter está liberado para ser usado','2018-05-09 22:17:50'),
	(4,'chatter_transference_proportion','1','A cada tantas transferências, uma é feita usando o chatter','2018-05-09 22:42:35'),
	(5,'horario_entrada_vendas','08:00','horario de entrada dos atendentes do setor de vendas','2018-08-24 00:00:00'),
	(6,'horario_saida_vendas','20:00','horario de saida dos atendentes do setor de vendas','2018-08-24 00:00:00'),
	(7,'horario_entrada_pos_vendas','08:00','horario de entrada dos atendentes do setor de pos-vendas','2018-08-24 00:00:00'),
	(8,'horario_saida_pos_vendas','20:00','horario de saida dos atendentes do setor de pos-vendas','2018-08-24 00:00:00'),
	(9,'horario_entrada_retencao','08:00','horario de entrada dos atendentes do setor de retencao','2018-08-24 00:00:00'),
	(10,'horario_saida_retencao','18:00','horario de saida dos atendentes do setor de retencao','2018-08-24 00:00:00');

/*!40000 ALTER TABLE `parameters` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
