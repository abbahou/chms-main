-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2025 at 07:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chms`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
                               `IDAppointment` int(11) NOT NULL,
                               `IDDoctor` int(11) DEFAULT NULL,
                               `IDPatient` int(11) DEFAULT NULL,
                               `AppointmentDate` datetime DEFAULT NULL,
                               `Price` double DEFAULT NULL,
                               `Paye` tinyint(1) DEFAULT NULL,
                               `Status` varchar(50) DEFAULT NULL,
                               `Service` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`IDAppointment`, `IDDoctor`, `IDPatient`, `AppointmentDate`, `Price`, `Paye`, `Status`, `Service`) VALUES
                                                                                                                                  (1, 1, 1, '2024-12-05 10:00:00', 100, 1, 'Completed', 'Consultation'),
                                                                                                                                  (2, 2, 2, '2024-12-06 11:00:00', 150, 0, 'Pending', 'Checkup'),
                                                                                                                                  (1, 1, 1, '2024-12-05 10:00:00', 100, 1, 'Completed', 'Consultation'),
                                                                                                                                  (2, 2, 2, '2024-12-06 11:00:00', 150, 0, 'Pending', 'Checkup');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
                        `IDBill` int(11) NOT NULL,
                        `IDPatient` int(11) DEFAULT NULL,
                        `IDOrdonnanceTest` int(11) DEFAULT NULL,
                        `IDOrdonnance` int(11) DEFAULT NULL,
                        `IDAppointment` int(11) DEFAULT NULL,
                        `Total` double DEFAULT NULL,
                        `DateBill` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`IDBill`, `IDPatient`, `IDOrdonnanceTest`, `IDOrdonnance`, `IDAppointment`, `Total`, `DateBill`) VALUES
                                                                                                                         (1, 1, 1, 1, 1, 230, '2024-12-01 12:00:00'),
                                                                                                                         (2, 2, 2, 2, 2, 350, '2024-12-02 14:00:00'),
                                                                                                                         (1, 1, 1, 1, 1, 230, '2024-12-01 12:00:00'),
                                                                                                                         (2, 2, 2, 2, 2, 350, '2024-12-02 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
                            `IDCommande` int(11) NOT NULL,
                            `DateCommande` date DEFAULT NULL,
                            `IDFournisseur` int(11) DEFAULT NULL,
                            `PrixTotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`IDCommande`, `DateCommande`, `IDFournisseur`, `PrixTotal`) VALUES
                                                                                        (1, '2024-12-01', 1, 500),
                                                                                        (2, '2024-12-02', 2, 1000),
                                                                                        (1, '2024-12-01', 1, 500),
                                                                                        (2, '2024-12-02', 2, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `commande_medicament`
--

CREATE TABLE `commande_medicament` (
                                       `IDCommande` int(11) NOT NULL,
                                       `IDMedicament` int(11) NOT NULL,
                                       `Qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commande_medicament`
--

INSERT INTO `commande_medicament` (`IDCommande`, `IDMedicament`, `Qty`) VALUES
                                                                            (1, 1, 50),
                                                                            (1, 2, 30),
                                                                            (2, 1, 100),
                                                                            (2, 2, 200),
                                                                            (1, 1, 50),
                                                                            (1, 2, 30),
                                                                            (2, 1, 100),
                                                                            (2, 2, 200);

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
                           `IDDisease` int(11) NOT NULL,
                           `DiseaseName` varchar(100) DEFAULT NULL,
                           `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`IDDisease`, `DiseaseName`, `Description`) VALUES
                                                                      (1, 'Diabetes', 'Chronic condition affecting blood sugar levels'),
                                                                      (2, 'Hypertension', 'High blood pressure'),
                                                                      (1, 'Diabetes', 'Chronic condition affecting blood sugar levels'),
                                                                      (2, 'Hypertension', 'High blood pressure');

-- --------------------------------------------------------

--
-- Table structure for table `disease_patient`
--

CREATE TABLE `disease_patient` (
                                   `IDPatient` int(11) NOT NULL,
                                   `IDDisease` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disease_patient`
--

INSERT INTO `disease_patient` (`IDPatient`, `IDDisease`) VALUES
                                                             (1, 1),
                                                             (1, 2),
                                                             (2, 1),
                                                             (2, 2),
                                                             (1, 1),
                                                             (1, 2),
                                                             (2, 1),
                                                             (2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
                          `IDDoctor` int(11) NOT NULL,
                          `IDSpeciality` int(11) DEFAULT NULL,
                          `Nom` varchar(50) DEFAULT NULL,
                          `Prenom` varchar(50) DEFAULT NULL,
                          `Tel` varchar(20) DEFAULT NULL,
                          `Adresse` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`IDDoctor`, `IDSpeciality`, `Nom`, `Prenom`, `Tel`, `Adresse`) VALUES
                                                                                         (1, 1, 'Martin', 'Clara', '1112223334', '50 Doctor Lane'),
                                                                                         (2, 2, 'Anderson', 'David', '5556667778', '75 Specialist Boulevard'),
                                                                                         (1, 1, 'Martin', 'Clara', '1112223334', '50 Doctor Lane'),
                                                                                         (2, 2, 'Anderson', 'David', '5556667778', '75 Specialist Boulevard'),
                                                                                         (1, 1, 'Martin', 'Clara', '1112223334', '50 Doctor Lane'),
                                                                                         (2, 2, 'Anderson', 'David', '5556667778', '75 Specialist Boulevard');

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE `fournisseur` (
                               `IDFournisseur` int(11) NOT NULL,
                               `Nom` varchar(50) DEFAULT NULL,
                               `Prenom` varchar(50) DEFAULT NULL,
                               `Tel` varchar(20) DEFAULT NULL,
                               `Mail` varchar(100) DEFAULT NULL,
                               `Adresse` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`IDFournisseur`, `Nom`, `Prenom`, `Tel`, `Mail`, `Adresse`) VALUES
                                                                                           (1, 'Brown', 'Alice', '1122334455', 'alice.brown@example.com', '789 Pine Road'),
                                                                                           (2, 'Johnson', 'Bob', '6677889900', 'bob.johnson@example.com', '321 Birch Lane'),
                                                                                           (1, 'Brown', 'Alice', '1122334455', 'alice.brown@example.com', '789 Pine Road'),
                                                                                           (2, 'Johnson', 'Bob', '6677889900', 'bob.johnson@example.com', '321 Birch Lane');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
                             `IDInsurance` int(11) NOT NULL,
                             `NameInsurance` varchar(100) DEFAULT NULL,
                             `Pourcentage` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`IDInsurance`, `NameInsurance`, `Pourcentage`) VALUES
                                                                            (1, 'HealthCarePlus', 20.5),
                                                                            (2, 'MedSecure', 15),
                                                                            (1, 'HealthCarePlus', 20.5),
                                                                            (2, 'MedSecure', 15);

-- --------------------------------------------------------

--
-- Table structure for table `labtechnician`
--

CREATE TABLE `labtechnician` (
                                 `IDLabTechnician` int(11) NOT NULL,
                                 `Nom` varchar(50) DEFAULT NULL,
                                 `Prenom` varchar(50) DEFAULT NULL,
                                 `Tel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `labtechnician`
--

INSERT INTO `labtechnician` (`IDLabTechnician`, `Nom`, `Prenom`, `Tel`) VALUES
                                                                            (1, 'Clark', 'James', '5544332211'),
                                                                            (2, 'Adams', 'Emily', '6655443322'),
                                                                            (1, 'Clark', 'James', '5544332211'),
                                                                            (2, 'Adams', 'Emily', '6655443322');

-- --------------------------------------------------------

--
-- Table structure for table `medicament`
--

CREATE TABLE `medicament` (
                              `IDMedicament` int(11) NOT NULL,
                              `NomMed` varchar(50) DEFAULT NULL,
                              `DescMed` varchar(255) DEFAULT NULL,
                              `Prix_Unit` double DEFAULT NULL,
                              `DateExpiration` datetime DEFAULT NULL,
                              `Type` varchar(50) DEFAULT NULL,
                              `Qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicament`
--

INSERT INTO `medicament` (`IDMedicament`, `NomMed`, `DescMed`, `Prix_Unit`, `DateExpiration`, `Type`, `Qty`) VALUES
                                                                                                                 (4, 'Amoxicillin', 'Antibiotic for bacterial infections', 12, '2025-10-15 00:00:00', 'Capsule', 300),
                                                                                                                 (5, 'Cetirizine', 'Allergy relief', 6, '2026-03-31 00:00:00', 'Tablet', 250),
                                                                                                                 (6, 'Metformin', 'Type 2 diabetes treatment', 10.5, '2024-11-20 00:00:00', 'Tablet', 180),
                                                                                                                 (7, 'Omeprazole', 'Acid reflux and heartburn relief', 15, '2025-08-30 00:00:00', 'Capsule', 100);

-- --------------------------------------------------------

--
-- Table structure for table `medicament_fournisseur`
--

CREATE TABLE `medicament_fournisseur` (
                                          `IDMedicament` int(11) NOT NULL,
                                          `IDFournisseur` int(11) NOT NULL,
                                          `Price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicament_fournisseur`
--

INSERT INTO `medicament_fournisseur` (`IDMedicament`, `IDFournisseur`, `Price`) VALUES
                                                                                    (1, 1, 4.5),
                                                                                    (2, 2, 7.5),
                                                                                    (1, 1, 4.5),
                                                                                    (2, 2, 7.5);

-- --------------------------------------------------------

--
-- Table structure for table `ordonnance`
--

CREATE TABLE `ordonnance` (
                              `IDOrdonnance` int(11) NOT NULL,
                              `IDDoctor` int(11) DEFAULT NULL,
                              `DateCreation` datetime DEFAULT NULL,
                              `IDPharmacien` int(11) DEFAULT NULL,
                              `IDPatient` int(11) DEFAULT NULL,
                              `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordonnance`
--

INSERT INTO `ordonnance` (`IDOrdonnance`, `IDDoctor`, `DateCreation`, `IDPharmacien`, `IDPatient`, `Status`) VALUES
                                                                                                                 (1, 1, '2024-12-01 09:00:00', 1, 1, 'Completed'),
                                                                                                                 (2, 2, '2024-12-02 10:30:00', 2, 2, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `ordonnancedetails`
--

CREATE TABLE `ordonnancedetails` (
                                     `IDOrdonnance` int(11) NOT NULL,
                                     `IDTest` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordonnancedetails`
--

INSERT INTO `ordonnancedetails` (`IDOrdonnance`, `IDTest`) VALUES
                                                               (1, 1),
                                                               (2, 2),
                                                               (1, 1),
                                                               (2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ordonnancetest`
--

CREATE TABLE `ordonnancetest` (
                                  `IDOrdonnanceTest` int(11) NOT NULL,
                                  `IDDoctor` int(11) DEFAULT NULL,
                                  `DateOrdonnanceTest` datetime DEFAULT NULL,
                                  `IDPatient` int(11) DEFAULT NULL,
                                  `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordonnancetest`
--

INSERT INTO `ordonnancetest` (`IDOrdonnanceTest`, `IDDoctor`, `DateOrdonnanceTest`, `IDPatient`, `Status`) VALUES
                                                                                                               (1, 1, '2024-12-01 09:30:00', 1, 'Pending'),
                                                                                                               (2, 2, '2024-12-02 11:00:00', 2, 'Completed'),
                                                                                                               (1, 1, '2024-12-01 09:30:00', 1, 'Pending'),
                                                                                                               (2, 2, '2024-12-02 11:00:00', 2, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `ordonnancetest_testresult`
--

CREATE TABLE `ordonnancetest_testresult` (
                                             `IDOrdonnanceTest` int(11) NOT NULL,
                                             `IDTestResult` int(11) DEFAULT NULL,
                                             `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordonnancetest_testresult`
--

INSERT INTO `ordonnancetest_testresult` (`IDOrdonnanceTest`, `IDTestResult`, `Status`) VALUES
                                                                                           (1, 1, 'Pending'),
                                                                                           (2, 2, 'Completed'),
                                                                                           (1, 1, 'Pending'),
                                                                                           (2, 2, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `ordonnance_medicament`
--

CREATE TABLE `ordonnance_medicament` (
                                         `IDMedicament` int(11) NOT NULL,
                                         `IDOrdonnance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordonnance_medicament`
--

INSERT INTO `ordonnance_medicament` (`IDMedicament`, `IDOrdonnance`) VALUES
                                                                         (1, 1),
                                                                         (2, 2),
                                                                         (1, 1),
                                                                         (2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
                           `IDPatient` int(11) NOT NULL,
                           `Nom` varchar(50) DEFAULT NULL,
                           `Prenom` varchar(50) DEFAULT NULL,
                           `Sexe` varchar(10) DEFAULT NULL,
                           `BirthDate` datetime DEFAULT NULL,
                           `Adresse` varchar(255) DEFAULT NULL,
                           `Tel` varchar(20) DEFAULT NULL,
                           `IDInsurance` int(11) DEFAULT NULL,
                           `CIN` varchar(20) DEFAULT NULL,
                           `Ville` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`IDPatient`, `Nom`, `Prenom`, `Sexe`, `BirthDate`, `Adresse`, `Tel`, `IDInsurance`, `CIN`, `Ville`) VALUES
                                                                                                                               (1, 'Taylor', 'Laura', 'Female', '1985-04-15 00:00:00', '901 Maple Street', '1234567890', 1, 'A123456', 'Springfield'),
                                                                                                                               (2, 'Wilson', 'George', 'Male', '1990-09-22 00:00:00', '305 Cedar Avenue', '0987654321', 2, 'B987654', 'Riverside'),
                                                                                                                               (1, 'Taylor', 'Laura', 'Female', '1985-04-15 00:00:00', '901 Maple Street', '1234567890', 1, 'A123456', 'Springfield'),
                                                                                                                               (2, 'Wilson', 'George', 'Male', '1990-09-22 00:00:00', '305 Cedar Avenue', '0987654321', 2, 'B987654', 'Riverside'),
                                                                                                                               (1, 'Taylor', 'Laura', 'Female', '1985-04-15 00:00:00', '901 Maple Street', '1234567890', 1, 'A123456', 'Springfield'),
                                                                                                                               (2, 'Wilson', 'George', 'Male', '1990-09-22 00:00:00', '305 Cedar Avenue', '0987654321', 2, 'B987654', 'Riverside'),
                                                                                                                               (3, 'Taylor', 'Laura', 'Female', '1985-04-15 00:00:00', '901 Maple Street', '1234567890', 1, 'A123456', 'Springfield');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacien`
--

CREATE TABLE `pharmacien` (
                              `IDPharmacien` int(11) NOT NULL,
                              `Nom` varchar(50) DEFAULT NULL,
                              `Prenom` varchar(50) DEFAULT NULL,
                              `Tel` varchar(20) DEFAULT NULL,
                              `Adresse` varchar(255) DEFAULT NULL,
                              `email` varchar(255) NOT NULL,
                              `password` varchar(255) NOT NULL,
                              `hospital` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmacien`
--

INSERT INTO `pharmacien` (`IDPharmacien`, `Nom`, `Prenom`, `Tel`, `Adresse`, `email`, `password`, `hospital`) VALUES
                                                                                                                  (1, 'imane', 'chaoui', '755463214', '123 Elm Street', 'imane@gmail.com', '1234', 'CarePoint'),
                                                                                                                  (2, 'Doe', 'Jane', '9876543210', '456 Oak Avenue', 'Doe@gmail.com', '1234', 'Carepoint');

-- --------------------------------------------------------

--
-- Table structure for table `planning`
--

CREATE TABLE `planning` (
                            `IDPlanning` int(11) NOT NULL,
                            `Date` date DEFAULT NULL,
                            `Date_Start` time DEFAULT NULL,
                            `Date_Fin` time DEFAULT NULL,
                            `Availability` tinyint(1) DEFAULT NULL,
                            `IDDoctor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `planning`
--

INSERT INTO `planning` (`IDPlanning`, `Date`, `Date_Start`, `Date_Fin`, `Availability`, `IDDoctor`) VALUES
                                                                                                        (1, '2024-12-01', '08:00:00', '12:00:00', 1, 1),
                                                                                                        (2, '2024-12-01', '14:00:00', '18:00:00', 0, 1),
                                                                                                        (3, '2024-12-02', '08:00:00', '12:00:00', 1, 2),
                                                                                                        (4, '2024-12-02', '14:00:00', '18:00:00', 0, 2),
                                                                                                        (1, '2024-12-01', '08:00:00', '12:00:00', 1, 1),
                                                                                                        (2, '2024-12-01', '14:00:00', '18:00:00', 0, 1),
                                                                                                        (3, '2024-12-02', '08:00:00', '12:00:00', 1, 2),
                                                                                                        (4, '2024-12-02', '14:00:00', '18:00:00', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reclamationassurance`
--

CREATE TABLE `reclamationassurance` (
                                        `IDReclamationAssurance` int(11) NOT NULL,
                                        `IDPatient` int(11) DEFAULT NULL,
                                        `IDAssurance` int(11) DEFAULT NULL,
                                        `DateReclamation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reclamationassurance`
--

INSERT INTO `reclamationassurance` (`IDReclamationAssurance`, `IDPatient`, `IDAssurance`, `DateReclamation`) VALUES
                                                                                                                 (1, 1, 1, '2024-12-01'),
                                                                                                                 (2, 2, 2, '2024-12-02'),
                                                                                                                 (1, 1, 1, '2024-12-01'),
                                                                                                                 (2, 2, 2, '2024-12-02');

-- --------------------------------------------------------

--
-- Table structure for table `speciality`
--

CREATE TABLE `speciality` (
                              `IDSpeciality` int(11) NOT NULL,
                              `NomSpeciality` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `speciality`
--

INSERT INTO `speciality` (`IDSpeciality`, `NomSpeciality`) VALUES
                                                               (1, 'Cardiology'),
                                                               (2, 'Dermatology'),
                                                               (1, 'Cardiology'),
                                                               (2, 'Dermatology');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
                        `IDTest` int(11) NOT NULL,
                        `Name` varchar(100) DEFAULT NULL,
                        `MaxVal` double DEFAULT NULL,
                        `MinVal` double DEFAULT NULL,
                        `Price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`IDTest`, `Name`, `MaxVal`, `MinVal`, `Price`) VALUES
                                                                       (1, 'Blood Sugar', 140, 70, 30),
                                                                       (2, 'Cholesterol', 200, 100, 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `medicament`
--
ALTER TABLE `medicament`
    ADD PRIMARY KEY (`IDMedicament`);

--
-- Indexes for table `pharmacien`
--
ALTER TABLE `pharmacien`
    ADD PRIMARY KEY (`IDPharmacien`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `medicament`
--
ALTER TABLE `medicament`
    MODIFY `IDMedicament` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
