-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2015 at 03:51 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `g-learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

CREATE TABLE IF NOT EXISTS `assessment` (
  `assessment_id` int(255) NOT NULL AUTO_INCREMENT,
  `assessment_name` varchar(100) NOT NULL,
  `total_marks` int(255) NOT NULL,
  `assessment_status` varchar(100) NOT NULL,
  `drill_id` int(255) NOT NULL,
  `teacher_id` int(255) NOT NULL,
  `school_id` int(255) NOT NULL,
  PRIMARY KEY (`assessment_id`,`teacher_id`),
  KEY `FK_assessment_drill` (`drill_id`),
  KEY `FK_assessment_teacher` (`teacher_id`),
  KEY `FK_assessment_school` (`school_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `assessment`
--

INSERT INTO `assessment` (`assessment_id`, `assessment_name`, `total_marks`, `assessment_status`, `drill_id`, `teacher_id`, `school_id`) VALUES
(3, 'Addition', 10, '0', 1, 50, 2);

-- --------------------------------------------------------

--
-- Table structure for table `assessment_log`
--

CREATE TABLE IF NOT EXISTS `assessment_log` (
  `student_id` int(255) NOT NULL,
  `question_id` int(255) NOT NULL,
  `assessment_id` int(255) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `answer_status` varchar(50) NOT NULL,
  PRIMARY KEY (`student_id`,`question_id`,`assessment_id`),
  KEY `FK_assessment_log_question` (`question_id`),
  KEY `FK_assessment_log_assessment` (`assessment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drill`
--

CREATE TABLE IF NOT EXISTS `drill` (
  `drill_id` int(255) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(1000) NOT NULL,
  `drill_name` varchar(150) NOT NULL,
  `drill_description` varchar(1000) DEFAULT NULL,
  `drill_story` varchar(2000) DEFAULT NULL,
  `drill_path` varchar(300) NOT NULL,
  `drill_image` varchar(100) NOT NULL,
  PRIMARY KEY (`drill_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `drill`
--

INSERT INTO `drill` (`drill_id`, `topic_name`, `drill_name`, `drill_description`, `drill_story`, `drill_path`, `drill_image`) VALUES
(1, 'Addition', 'Endless Adder', 'Teaches the concept of Addition', 'Help Mike, the city boy, to master the art of addition by collecting the correct numbers in order to reach the required sum.', 'games/runner', 'assets/images/runner_banner.jpg'),
(2, 'Subtraction', 'Life of a Bee', 'Practice your concepts of Subtraction', 'Dora the honey bee is in danger, there are spiders everywhere. She needs hep finding her correct home.', 'games/LifeofBee', 'assets/images/lifeofbee.png'),
(3, 'Highest/Lowest', 'Balloon Party', 'Teaches the concept of Highest / Lowest numbers', 'This is a simple beach party game, find the required balloon to win as fast as you can.', 'games/balloon_party', 'assets/images/BalloonParty_tile.png'),
(4, 'Even/Odd', 'Catchy', 'Teaches the concept of Even / Odd numbers', 'Hank has been given a task to catch the apples with even numbers on them. Help him master the art of even numbers.', 'games/play_cachy_even_odd', 'assets/images/catchy-tile.png'),
(6, 'Multiples', 'Catchy', 'Teaches the concept of multiples of a number', 'Jack loves this game to find multiples of a number. Help him catch the apple having multiple of given number.', 'games/play_cachy_multiples_of_5', 'assets/images/catchy-tile-2.png'),
(7, 'Ascending', 'Speed Racer', 'Teaches the concept of Ascending Order of Numbers', 'Help Flinstone learn driving by picking up numbers in Ascending order.', 'games/racerAscending', 'assets/images/racergame.png'),
(8, 'Descending', 'Speed Racer', 'Teaches the concept of Descending Order of Numbers', 'Help Flinstone learn driving by picking up numbers in Descending order.', 'games/racerDescending', 'assets/images/racergame.png');

-- --------------------------------------------------------

--
-- Table structure for table `gamelogic`
--

CREATE TABLE IF NOT EXISTS `gamelogic` (
  `log_id` int(255) NOT NULL AUTO_INCREMENT,
  `complexity_level` int(50) NOT NULL,
  `percentage` double NOT NULL,
  `drill_id` int(255) NOT NULL,
  `student_id` int(255) NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `FK_game_student` (`student_id`),
  KEY `FK_game_drill` (`drill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gradesheet`
--

CREATE TABLE IF NOT EXISTS `gradesheet` (
  `student_id` int(255) NOT NULL,
  `assessment_id` int(255) NOT NULL,
  `marks_obtained` int(20) NOT NULL,
  PRIMARY KEY (`student_id`,`assessment_id`),
  KEY `FK_gradesheet_assessment` (`assessment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `person_id` int(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `parent_password` varchar(100) NOT NULL,
  `school_id` int(255) NOT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `username` (`username`),
  KEY `FK_login_school` (`school_id`),
  KEY `username_2` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`person_id`, `username`, `password`, `type`, `parent_password`, `school_id`) VALUES
(32, 'admin', 'dbavOTe8181uxXKLxigyFmZGibTzmLK1k7CTMvBxmDbr8Mf6e1qM2xhZdKvh1D5bhkfLHSsQMSsBLy9FbXc1NQ==', 'admin', '', 1),
(50, 'teacher', 'RBMS+Q1CA3fN8+WcLX9vEFZEDBXqvf3/En0m5Hhn8897YPlQ9hKR6eT+idcRe1cz5vmS1k6MkCma+gU0sUab7Q==', 'teacher', '', 2),
(51, 'student', 'nVYNJ1vJ0kjNf0fSos4lav4Y11SH1ZzgY5laKj1GejrF6ilyRKC7DgaW7rJS6uWioPYRwPCFWniOwKoaqwLPBQ==', 'student', 'VntpNgcwAPou6grnd/48pAfMAXGEzZuiFJXsT2IGYYO8/psTc7RxCJejd+TC7WBhAstKtWS+7PC6XfeBqUumBg==', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_requests`
--

CREATE TABLE IF NOT EXISTS `password_requests` (
  `request_id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `request_date` date NOT NULL,
  PRIMARY KEY (`request_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int(255) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pic_path` varchar(100) NOT NULL,
  `level_in_game` int(11) NOT NULL DEFAULT '0',
  `drill_level` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `first_name`, `last_name`, `address`, `email`, `pic_path`, `level_in_game`, `drill_level`) VALUES
(32, 'zain', 'malak', 'cantt', 'xyz@malik.com', '', 0, 1),
(50, 'Adil ', 'Sarwar', 'Wapda town', 'test@hotmail.com', '', 0, 1),
(51, 'Zain ', 'Malik', 'Cantt', 'xain@gmail.com', 'student_pic.png', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `question_id` int(255) NOT NULL AUTO_INCREMENT,
  `statement` varchar(1000) NOT NULL,
  `option1` varchar(1000) DEFAULT NULL,
  `option2` varchar(1000) DEFAULT NULL,
  `option3` varchar(1000) DEFAULT NULL,
  `answer` varchar(1000) NOT NULL,
  `complexity_level` int(50) NOT NULL,
  `question_status` varchar(50) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `assessment_id` (`assessment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`question_id`, `statement`, `option1`, `option2`, `option3`, `answer`, `complexity_level`, `question_status`, `assessment_id`) VALUES
(5, '2+2', '5', '6', '8', '4', 1, '0', 3);

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE IF NOT EXISTS `school` (
  `school_id` int(255) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(100) NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`school_id`, `school_name`) VALUES
(1, 'Educators'),
(2, 'BeaconHouse'),
(3, 'Fast-Nu');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessment`
--
ALTER TABLE `assessment`
  ADD CONSTRAINT `FK_assessment_drill` FOREIGN KEY (`drill_id`) REFERENCES `drill` (`drill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_assessment_school` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_assessment_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assessment_log`
--
ALTER TABLE `assessment_log`
  ADD CONSTRAINT `FK-assessment_log_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_assessment_log_assessment` FOREIGN KEY (`assessment_id`) REFERENCES `assessment` (`assessment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_assessment_log_student` FOREIGN KEY (`student_id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gamelogic`
--
ALTER TABLE `gamelogic`
  ADD CONSTRAINT `FK_game_drill` FOREIGN KEY (`drill_id`) REFERENCES `drill` (`drill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_game_student` FOREIGN KEY (`student_id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gradesheet`
--
ALTER TABLE `gradesheet`
  ADD CONSTRAINT `FK_gradesheet_assessment` FOREIGN KEY (`assessment_id`) REFERENCES `assessment` (`assessment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_gradesheet_student` FOREIGN KEY (`student_id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `FK_login` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_login_school` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `password_requests`
--
ALTER TABLE `password_requests`
  ADD CONSTRAINT `password_requests_ibfk_1` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `fk_assid_question` FOREIGN KEY (`assessment_id`) REFERENCES `assessment` (`assessment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
