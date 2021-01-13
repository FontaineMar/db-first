-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Creato il: Gen 13, 2021 alle 16:35
-- Versione del server: 5.7.32
-- Versione PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti`
--

CREATE TABLE `clienti` (
  `cl_id` int(11) NOT NULL,
  `cl_nome` varchar(50) NOT NULL,
  `cl_cognome` varchar(50) NOT NULL,
  `cl_tipo-documento` varchar(50) NOT NULL,
  `cl_numero-documento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `clienti`
--

INSERT INTO `clienti` (`cl_id`, `cl_nome`, `cl_cognome`, `cl_tipo-documento`, `cl_numero-documento`) VALUES
(1, 'Donald', 'Trump', 'patente', '3838hfdweh'),
(2, 'Kimbo', 'Slice', 'carta d indetità', 'na348392'),
(3, 'Kim', 'Jong-un', 'carta d indetità', 'na348392'),
(4, 'Rufy', 'Monkey D.', 'carta d indetità', 'na348392'),
(5, 'Marco', 'Rasta', 'carta d indetità', 'na348392'),
(6, 'Homer', 'Simpson', 'carta d indetità', 'na348392'),
(7, 'Jamie', 'Lannister', 'carta d indetità', 'na348392'),
(8, 'Crish', 'Owen', 'carta d indetità', 'na348392'),
(9, 'Diego Armando', 'Maradona', 'carta d indetità', 'na348392'),
(10, 'Stewie', 'Griffin', 'carta d indetità', 'na348392'),
(11, 'Jhon', 'Stark', 'carta d indetità', 'na348392'),
(12, 'Theon', 'Greyjoy', 'carta d indetità', 'na348392'),
(13, 'Alan', 'Grent', 'carta d indetità', 'na348392'),
(14, 'Ian', 'Malcom', 'carta d indetità', 'na348392'),
(15, 'Eric', 'Cartman', 'carta d indetità', 'na348392'),
(16, 'Steve', 'Roger', 'carta d indetità', 'na348392'),
(17, 'Sean', 'Connery', 'carta d indetità', 'na348392'),
(18, 'Fabrizio', 'De andre', 'carta d indetità', 'na348392');

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti-prenotazioni-stanze`
--

CREATE TABLE `clienti-prenotazioni-stanze` (
  `fk_cl_id` int(11) NOT NULL,
  `fk_pr_id` int(11) NOT NULL,
  `fk_st_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `pr_id` int(11) NOT NULL,
  `pr_check-in` date NOT NULL,
  `pr_check-out` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `stanze`
--

CREATE TABLE `stanze` (
  `st_id` int(11) NOT NULL,
  `st_numero` smallint(4) NOT NULL,
  `st_tipologia` varchar(25) NOT NULL,
  `st_prezzo` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `stanze`
--

INSERT INTO `stanze` (`st_id`, `st_numero`, `st_tipologia`, `st_prezzo`) VALUES
(1, 101, 'singola', 60),
(2, 102, 'matrimoniale', 110),
(3, 103, 'matrimoniale', 110),
(4, 104, 'doppia', 110),
(5, 105, 'matrimoniale', 110),
(6, 206, 'singola', 60),
(7, 207, 'matrimoniale', 110),
(8, 208, 'singola', 60),
(9, 209, 'doppia', 110),
(10, 210, 'matrimoniale', 110),
(11, 311, 'tripla', 150),
(12, 312, 'tripla', 150),
(13, 313, 'singola', 60),
(14, 314, 'matrimoniale', 110),
(15, 315, 'matrimoniale', 110),
(16, 416, 'suite', 250),
(17, 417, 'suite', 250);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`cl_id`);

--
-- Indici per le tabelle `clienti-prenotazioni-stanze`
--
ALTER TABLE `clienti-prenotazioni-stanze`
  ADD PRIMARY KEY (`fk_cl_id`,`fk_pr_id`,`fk_st_id`),
  ADD KEY `fk_pr_id` (`fk_pr_id`),
  ADD KEY `fk_st_id` (`fk_st_id`);

--
-- Indici per le tabelle `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`pr_id`);

--
-- Indici per le tabelle `stanze`
--
ALTER TABLE `stanze`
  ADD PRIMARY KEY (`st_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `clienti`
--
ALTER TABLE `clienti`
  MODIFY `cl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `stanze`
--
ALTER TABLE `stanze`
  MODIFY `st_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `clienti-prenotazioni-stanze`
--
ALTER TABLE `clienti-prenotazioni-stanze`
  ADD CONSTRAINT `fk_cl_id` FOREIGN KEY (`fk_cl_id`) REFERENCES `clienti` (`cl_id`),
  ADD CONSTRAINT `fk_pr_id` FOREIGN KEY (`fk_pr_id`) REFERENCES `prenotazioni` (`pr_id`),
  ADD CONSTRAINT `fk_st_id` FOREIGN KEY (`fk_st_id`) REFERENCES `stanze` (`st_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
