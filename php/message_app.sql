CREATE TABLE `message` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `SenderID` varchar(255) DEFAULT NULL,
  `ReceiverID` varchar(255) DEFAULT NULL,
  `Body` blob DEFAULT NULL,
  `SentAt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci