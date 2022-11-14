-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 14, 2022 at 09:04 PM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.24-0ubuntu0.18.04.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `WJZKwDIecA`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_assure`
--

CREATE TABLE `account_assure` (
  `id` int(11) NOT NULL,
  `generatedUsername` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generatedPassword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assID` int(11) NOT NULL,
  `changedPass` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_assure`
--

INSERT INTO `account_assure` (`id`, `generatedUsername`, `generatedPassword`, `assID`, `changedPass`) VALUES
(1, '14450033', 'n^pWrwuaqtks', 1, 0),
(2, '14450038', '#oiErkyfhcqo', 2, 0),
(3, '14450031', 'qtV#idzyauyo', 6, 0),
(4, '14450036', 'dx#fgidSbpwd', 7, 0),
(5, '14450041', 'jkxwz@vmrfpB', 20, 0),
(6, '14450056', 'mzn#Kmgkwtcu', 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `account_entrep`
--

CREATE TABLE `account_entrep` (
  `id` int(11) NOT NULL,
  `generatedUsername` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generatedPassword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_entrep`
--

INSERT INTO `account_entrep` (`id`, `generatedUsername`, `generatedPassword`, `entID`) VALUES
(1, 'entreprise1', '123123Asd.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_sousassure`
--

CREATE TABLE `account_sousassure` (
  `id` int(11) NOT NULL,
  `generatedUsername` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generatedPassword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sousAssID` int(11) NOT NULL,
  `changedPass` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_sousassure`
--

INSERT INTO `account_sousassure` (`id`, `generatedUsername`, `generatedPassword`, `sousAssID`, `changedPass`) VALUES
(1, '14450038', 'hw@gtjKkctdq', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `acte_medical`
--

CREATE TABLE `acte_medical` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `acte_medical`
--

INSERT INTO `acte_medical` (`id`, `code`, `nom`) VALUES
(1, 1, 'Chirurgie'),
(2, 2, 'Appareil Dentaire'),
(3, 3, 'Intervention Urgente'),
(4, 4, 'Implantation');

-- --------------------------------------------------------

--
-- Table structure for table `assure`
--

CREATE TABLE `assure` (
  `id` int(11) NOT NULL,
  `matricule` bigint(20) NOT NULL,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexe` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateNaiss` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cID` int(11) NOT NULL,
  `entID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assure`
--

INSERT INTO `assure` (`id`, `matricule`, `nom`, `prenom`, `sexe`, `dateNaiss`, `cID`, `entID`) VALUES
(1, 14450033, 'Chahin', 'Salah', 'Male', '2000-04-07T12:00:00.000Z', 3, 1),
(2, 14450038, 'Amin', 'Salah', 'Male', '2000-06-18T12:00:00.000Z', 3, 1),
(6, 14450031, 'Aymen', 'Dahmen', 'Male', '2003-04-07T12:00:00.000Z', 5, 1),
(7, 14450036, 'Master', 'Cena', 'Male', '2000-06-18T12:00:00.000Z', 5, 1),
(20, 14450041, 'Aymen', 'Dahmen', 'Male', '2003-04-07T12:00:00.000Z', 10, 1),
(21, 14450056, 'Master', 'Cena', 'Male', '2000-06-18T12:00:00.000Z', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blacklist_token`
--

CREATE TABLE `blacklist_token` (
  `id` int(11) NOT NULL,
  `token` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bulletin`
--

CREATE TABLE `bulletin` (
  `id` int(11) NOT NULL,
  `unique` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idSousAss` int(11) DEFAULT NULL,
  `idAssure` int(11) DEFAULT NULL,
  `cID` int(11) NOT NULL,
  `intervID` int(11) DEFAULT NULL,
  `actID` int(11) DEFAULT NULL,
  `rembID` int(11) DEFAULT NULL,
  `date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `montant` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bulletin`
--

INSERT INTO `bulletin` (`id`, `unique`, `idSousAss`, `idAssure`, `cID`, `intervID`, `actID`, `rembID`, `montant`) VALUES
(1, 'c5f0eaa7-01a2-4260-8bfc-8079b797740f', NULL, 2, 3, 1, 2, NULL, 500);

-- --------------------------------------------------------

--
-- Table structure for table `cheque`
--

CREATE TABLE `cheque` (
  `id` int(11) NOT NULL,
  `numCh` bigint(20) NOT NULL,
  `bank` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idPaim` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_offer`
--

CREATE TABLE `contract_offer` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remboursement` int(11) NOT NULL,
  `plafond` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contract_offer`
--

INSERT INTO `contract_offer` (`id`, `name`, `remboursement`, `plafond`) VALUES
(1, 'advanced', 80, 800),
(2, 'pro', 70, 500),
(3, 'basic', 50, 400);

-- --------------------------------------------------------

--
-- Table structure for table `contrat`
--

CREATE TABLE `contrat` (
  `id` int(11) NOT NULL,
  `unique` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `end` bigint(20) NOT NULL,
  `offerID` int(11) NOT NULL,
  `entID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contrat`
--

INSERT INTO `contrat` (`id`, `unique`, `end`, `offerID`, `entID`) VALUES
(3, '41e5d8d0-dc60-43df-a0c9-c1f21e01a3cc', 1763074800000, 1, 1),
(5, '3ad490ea-4fe6-4d24-9a89-8ef648f40259', 1763074800000, 3, 1),
(10, '855fcfd1-abbc-4d03-8026-7d99d581063d', 1763074800000, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `entreprise`
--

CREATE TABLE `entreprise` (
  `id` int(11) NOT NULL,
  `matFiscal` bigint(20) NOT NULL,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entreprise`
--

INSERT INTO `entreprise` (`id`, `matFiscal`, `nom`, `adresse`, `tel`) VALUES
(1, 14450038, 'LOUHOUM CORP.', 'CITE OLYMPIQUE', 29774720);

-- --------------------------------------------------------

--
-- Table structure for table `intervenant`
--

CREATE TABLE `intervenant` (
  `id` int(11) NOT NULL,
  `CNAM` bigint(20) NOT NULL,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `intervenant`
--

INSERT INTO `intervenant` (`id`, `CNAM`, `nom`, `prenom`) VALUES
(1, 654213, 'Ala', 'Magdouli');

-- --------------------------------------------------------

--
-- Table structure for table `recu`
--

CREATE TABLE `recu` (
  `id` int(11) NOT NULL,
  `idPaim` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reject_cause`
--

CREATE TABLE `reject_cause` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `libelle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `remboursement`
--

CREATE TABLE `remboursement` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sousassure`
--

CREATE TABLE `sousassure` (
  `id` int(11) NOT NULL,
  `matricule` bigint(20) NOT NULL,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexe` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateNaiss` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `insurerID` int(11) NOT NULL,
  `lienParente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sousassure`
--

INSERT INTO `sousassure` (`id`, `matricule`, `nom`, `prenom`, `sexe`, `dateNaiss`, `insurerID`, `lienParente`) VALUES
(1, 14450038, 'Aminos', 'Salahos', 'Homme', '2001-06-18', 2, 99);

-- --------------------------------------------------------

--
-- Table structure for table `statut_bulletin`
--

CREATE TABLE `statut_bulletin` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `bID` int(11) NOT NULL,
  `rejID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statut_bulletin`
--

INSERT INTO `statut_bulletin` (`id`, `status`, `bID`, `rejID`) VALUES
(1, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `virement`
--

CREATE TABLE `virement` (
  `id` int(11) NOT NULL,
  `numVir` bigint(20) NOT NULL,
  `numComp` bigint(20) NOT NULL,
  `idPaim` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_acte_medicalTocontrat`
--

CREATE TABLE `_acte_medicalTocontrat` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_acte_medicalTocontrat`
--

INSERT INTO `_acte_medicalTocontrat` (`A`, `B`) VALUES
(2, 3),
(1, 10),
(3, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_assure`
--
ALTER TABLE `account_assure`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_assure.generatedUsername_unique` (`generatedUsername`),
  ADD UNIQUE KEY `account_assure.assID_unique` (`assID`);

--
-- Indexes for table `account_entrep`
--
ALTER TABLE `account_entrep`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_entrep.generatedUsername_unique` (`generatedUsername`),
  ADD UNIQUE KEY `account_entrep.entID_unique` (`entID`);

--
-- Indexes for table `account_sousassure`
--
ALTER TABLE `account_sousassure`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_sousassure.generatedUsername_unique` (`generatedUsername`),
  ADD UNIQUE KEY `account_sousassure.sousAssID_unique` (`sousAssID`);

--
-- Indexes for table `acte_medical`
--
ALTER TABLE `acte_medical`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `acte_medical.code_unique` (`code`);

--
-- Indexes for table `assure`
--
ALTER TABLE `assure`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assure.matricule_unique` (`matricule`),
  ADD KEY `cID` (`cID`),
  ADD KEY `entID` (`entID`);

--
-- Indexes for table `blacklist_token`
--
ALTER TABLE `blacklist_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blacklist_token.token_unique` (`token`);

--
-- Indexes for table `bulletin`
--
ALTER TABLE `bulletin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bulletin.unique_unique` (`unique`),
  ADD UNIQUE KEY `bulletin_rembID_unique` (`rembID`),
  ADD KEY `cID` (`cID`),
  ADD KEY `intervID` (`intervID`),
  ADD KEY `idSousAss` (`idSousAss`),
  ADD KEY `idAssure` (`idAssure`),
  ADD KEY `actID` (`actID`);

--
-- Indexes for table `cheque`
--
ALTER TABLE `cheque`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cheque.numCh_unique` (`numCh`),
  ADD UNIQUE KEY `cheque_idPaim_unique` (`idPaim`);

--
-- Indexes for table `contract_offer`
--
ALTER TABLE `contract_offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contrat`
--
ALTER TABLE `contrat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contrat.unique_unique` (`unique`),
  ADD KEY `offerID` (`offerID`),
  ADD KEY `entID` (`entID`);

--
-- Indexes for table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entreprise.matFiscal_unique` (`matFiscal`),
  ADD UNIQUE KEY `entreprise.tel_unique` (`tel`);

--
-- Indexes for table `intervenant`
--
ALTER TABLE `intervenant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `intervenant.CNAM_unique` (`CNAM`);

--
-- Indexes for table `recu`
--
ALTER TABLE `recu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `recu_idPaim_unique` (`idPaim`);

--
-- Indexes for table `reject_cause`
--
ALTER TABLE `reject_cause`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reject_cause.code_unique` (`code`);

--
-- Indexes for table `remboursement`
--
ALTER TABLE `remboursement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sousassure`
--
ALTER TABLE `sousassure`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sousassure.matricule_unique` (`matricule`),
  ADD KEY `insurerID` (`insurerID`);

--
-- Indexes for table `statut_bulletin`
--
ALTER TABLE `statut_bulletin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `statut_bulletin.bID_unique` (`bID`),
  ADD KEY `rejID` (`rejID`);

--
-- Indexes for table `virement`
--
ALTER TABLE `virement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `virement.numVir_unique` (`numVir`),
  ADD UNIQUE KEY `virement_idPaim_unique` (`idPaim`);

--
-- Indexes for table `_acte_medicalTocontrat`
--
ALTER TABLE `_acte_medicalTocontrat`
  ADD UNIQUE KEY `_acte_medicalTocontrat_AB_unique` (`A`,`B`),
  ADD KEY `_acte_medicalTocontrat_B_index` (`B`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_assure`
--
ALTER TABLE `account_assure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `account_entrep`
--
ALTER TABLE `account_entrep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_sousassure`
--
ALTER TABLE `account_sousassure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `acte_medical`
--
ALTER TABLE `acte_medical`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `assure`
--
ALTER TABLE `assure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `blacklist_token`
--
ALTER TABLE `blacklist_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulletin`
--
ALTER TABLE `bulletin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cheque`
--
ALTER TABLE `cheque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_offer`
--
ALTER TABLE `contract_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contrat`
--
ALTER TABLE `contrat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `intervenant`
--
ALTER TABLE `intervenant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recu`
--
ALTER TABLE `recu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reject_cause`
--
ALTER TABLE `reject_cause`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `remboursement`
--
ALTER TABLE `remboursement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sousassure`
--
ALTER TABLE `sousassure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `statut_bulletin`
--
ALTER TABLE `statut_bulletin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `virement`
--
ALTER TABLE `virement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_assure`
--
ALTER TABLE `account_assure`
  ADD CONSTRAINT `account_assure_ibfk_1` FOREIGN KEY (`assID`) REFERENCES `assure` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_entrep`
--
ALTER TABLE `account_entrep`
  ADD CONSTRAINT `account_entrep_ibfk_1` FOREIGN KEY (`entID`) REFERENCES `entreprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_sousassure`
--
ALTER TABLE `account_sousassure`
  ADD CONSTRAINT `account_sousassure_ibfk_1` FOREIGN KEY (`sousAssID`) REFERENCES `sousassure` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assure`
--
ALTER TABLE `assure`
  ADD CONSTRAINT `assure_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `contrat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assure_ibfk_2` FOREIGN KEY (`entID`) REFERENCES `entreprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bulletin`
--
ALTER TABLE `bulletin`
  ADD CONSTRAINT `bulletin_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `contrat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bulletin_ibfk_2` FOREIGN KEY (`intervID`) REFERENCES `intervenant` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bulletin_ibfk_3` FOREIGN KEY (`idSousAss`) REFERENCES `sousassure` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bulletin_ibfk_4` FOREIGN KEY (`idAssure`) REFERENCES `assure` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bulletin_ibfk_5` FOREIGN KEY (`actID`) REFERENCES `acte_medical` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bulletin_ibfk_6` FOREIGN KEY (`rembID`) REFERENCES `remboursement` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `cheque`
--
ALTER TABLE `cheque`
  ADD CONSTRAINT `cheque_ibfk_1` FOREIGN KEY (`idPaim`) REFERENCES `remboursement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `contrat_ibfk_1` FOREIGN KEY (`offerID`) REFERENCES `contract_offer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrat_ibfk_2` FOREIGN KEY (`entID`) REFERENCES `entreprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recu`
--
ALTER TABLE `recu`
  ADD CONSTRAINT `recu_ibfk_1` FOREIGN KEY (`idPaim`) REFERENCES `remboursement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sousassure`
--
ALTER TABLE `sousassure`
  ADD CONSTRAINT `sousassure_ibfk_1` FOREIGN KEY (`insurerID`) REFERENCES `assure` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `statut_bulletin`
--
ALTER TABLE `statut_bulletin`
  ADD CONSTRAINT `statut_bulletin_ibfk_1` FOREIGN KEY (`bID`) REFERENCES `bulletin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `statut_bulletin_ibfk_2` FOREIGN KEY (`rejID`) REFERENCES `reject_cause` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `virement`
--
ALTER TABLE `virement`
  ADD CONSTRAINT `virement_ibfk_1` FOREIGN KEY (`idPaim`) REFERENCES `remboursement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `_acte_medicalTocontrat`
--
ALTER TABLE `_acte_medicalTocontrat`
  ADD CONSTRAINT `_acte_medicalTocontrat_ibfk_1` FOREIGN KEY (`A`) REFERENCES `acte_medical` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_acte_medicalTocontrat_ibfk_2` FOREIGN KEY (`B`) REFERENCES `contrat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
