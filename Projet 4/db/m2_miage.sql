--
-- Table structure for table `my_test_table`
--

DROP TABLE IF EXISTS `my_test_table`;
CREATE TABLE `my_test_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(535) NOT NULL,
  `description` varchar(535) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `my_test_table`
--

INSERT INTO `my_test_table` VALUES (1,'My title','My description');
