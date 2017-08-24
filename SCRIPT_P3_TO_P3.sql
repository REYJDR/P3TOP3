-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Aug 24, 2017 at 10:37 AM
-- Server version: 5.6.35-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `p32p3_LOVINGMYMOBILESA`
--

-- --------------------------------------------------------

--
-- Table structure for table `CompanySession`
--

CREATE TABLE IF NOT EXISTS `CompanySession` (
  `ID_compania` bigint(20) NOT NULL,
  `CompanyNameSage50` varchar(50) NOT NULL,
  `isConnected` tinyint(1) NOT NULL,
  `LAST_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_compania`,`CompanyNameSage50`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CompanySession`
--

INSERT INTO `CompanySession` (`ID_compania`, `CompanyNameSage50`, `isConnected`, `LAST_CHANGE`) VALUES
(1, 'Loving My Mobile, S.A.', 1, '2017-08-24 16:33:46');

-- --------------------------------------------------------

--
-- Table structure for table `Customers_Imp`
--

CREATE TABLE IF NOT EXISTS `Customers_Imp` (
  `ID_compania` int(11) NOT NULL DEFAULT '0',
  `ID_companiaOrigen` int(11) DEFAULT NULL,
  `CustomerID` varchar(20) NOT NULL DEFAULT '',
  `Customer_Bill_Name` varchar(39) DEFAULT NULL,
  `AddressLine1` varchar(30) DEFAULT NULL,
  `AddressLine2` varchar(30) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `Zip` varchar(12) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Telephone1` varchar(20) DEFAULT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Created` varchar(10) NOT NULL,
  `Export_date` varchar(10) NOT NULL,
  `Enviado` tinyint(1) DEFAULT '0',
  `Error` tinyint(1) DEFAULT '0',
  `ErrorPT` varchar(20) NOT NULL,
  `Custom_field1` varchar(40) DEFAULT NULL,
  `Custom_field2` varchar(40) DEFAULT NULL,
  `Custom_field3` varchar(40) DEFAULT NULL,
  `Custom_field4` varchar(40) DEFAULT NULL,
  `Custom_field5` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID_compania`,`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customer_Credit_Memo_Detail_Imp`
--

CREATE TABLE IF NOT EXISTS `Customer_Credit_Memo_Detail_Imp` (
  `DetailID` bigint(20) NOT NULL,
  `TransactionID` bigint(20) NOT NULL,
  `ID_compania` int(11) NOT NULL,
  `Item_id` varchar(20) NOT NULL,
  `Description` varchar(160) NOT NULL,
  `GL_Acct` varchar(15) NOT NULL,
  `Quantity` decimal(18,4) NOT NULL,
  `Unit_Price` decimal(18,4) NOT NULL,
  `Net_line` decimal(18,4) NOT NULL,
  `JobID` varchar(20) NOT NULL,
  `JobPhaseID` varchar(20) NOT NULL,
  `JobCostCodeID` varchar(20) NOT NULL,
  `Tax_Type` int(11) NOT NULL,
  PRIMARY KEY (`DetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customer_Credit_Memo_Header_Imp`
--

CREATE TABLE IF NOT EXISTS `Customer_Credit_Memo_Header_Imp` (
  `TransactionID` bigint(20) NOT NULL,
  `ID_compania` int(11) NOT NULL,
  `ID_companiaOrigen` int(11) NOT NULL,
  `CreditNumber` varchar(20) NOT NULL,
  `CustomerID` varchar(20) NOT NULL,
  `CustomerName` varchar(39) NOT NULL,
  `AR_Account` varchar(10) NOT NULL,
  `TaxID` varchar(8) NOT NULL,
  `Subtotal` decimal(18,4) NOT NULL,
  `Net_Credit_due` decimal(18,4) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `Created` varchar(10) NOT NULL,
  `Export_date` varchar(10) NOT NULL,
  `Enviado` tinyint(1) DEFAULT '0',
  `Error` tinyint(1) DEFAULT '0',
  `ErrorPT` varchar(20) NOT NULL,
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customer_Receipt_Detail_Imp`
--

CREATE TABLE IF NOT EXISTS `Customer_Receipt_Detail_Imp` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `ID_compania` int(11) DEFAULT NULL,
  `UniqueReceiptID` bigint(20) DEFAULT NULL,
  `ApplyTo` tinyint(4) DEFAULT NULL,
  `InvoiceNumber` varchar(20) DEFAULT NULL,
  `Description` varchar(160) DEFAULT NULL,
  `Net_line` decimal(18,4) DEFAULT NULL,
  `Quantity` decimal(18,4) DEFAULT NULL,
  `Item_id` varchar(20) DEFAULT NULL,
  `Unit_Price` decimal(18,4) DEFAULT NULL,
  `Taxable` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customer_Receipt_Header_Imp`
--

CREATE TABLE IF NOT EXISTS `Customer_Receipt_Header_Imp` (
  `ID_compania` int(11) NOT NULL DEFAULT '0',
  `ID_companiaOrigen` int(11) DEFAULT NULL,
  `UniqueReceiptID` bigint(20) NOT NULL,
  `CheckNumber` varchar(20) NOT NULL DEFAULT '',
  `ReceiptNumber` varchar(20) NOT NULL DEFAULT '',
  `CustomerID` varchar(20) NOT NULL,
  `CustomerName` varchar(39) NOT NULL,
  `Total` decimal(18,4) NOT NULL,
  `Method_of_Payment` varchar(20) NOT NULL,
  `TaxID` varchar(8) NOT NULL,
  `SalesRepID` varchar(20) NOT NULL DEFAULT '0',
  `CashAccountID` varchar(15) NOT NULL,
  `Prepayment` tinyint(1) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `Created` varchar(10) NOT NULL,
  `Export_date` varchar(10) NOT NULL,
  `Enviado` tinyint(1) DEFAULT '0',
  `Error` tinyint(1) DEFAULT '0',
  `ErrorPT` varchar(20) NOT NULL,
  PRIMARY KEY (`UniqueReceiptID`,`ID_compania`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PurOrdr_Detail_Exp`
--

CREATE TABLE IF NOT EXISTS `PurOrdr_Detail_Exp` (
  `ID_compania` bigint(20) NOT NULL,
  `ID_companiaOrigen` int(11) NOT NULL,
  `TransactionID` bigint(20) NOT NULL,
  `RowIndex` int(11) NOT NULL,
  `Item_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(255) NOT NULL,
  `GL_AccountID` varchar(15) NOT NULL,
  `Quantity` decimal(11,4) NOT NULL,
  `Unit_Price` decimal(16,4) NOT NULL,
  `NetLine` decimal(16,2) NOT NULL,
  `QuantityReceived` decimal(16,4) NOT NULL,
  `JobID` varchar(20) NOT NULL,
  `JobPhaseID` varchar(20) NOT NULL,
  `JobCostCodeID` varchar(20) NOT NULL,
  `LAST_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_compania`,`ID_companiaOrigen`,`TransactionID`,`RowIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PurOrdr_Header_Exp`
--

CREATE TABLE IF NOT EXISTS `PurOrdr_Header_Exp` (
  `ID_compania` bigint(20) NOT NULL,
  `ID_companiaOrigen` int(11) NOT NULL,
  `TransactionID` bigint(20) NOT NULL,
  `PurchaseOrderNumber` varchar(20) NOT NULL,
  `VendorID` varchar(20) NOT NULL,
  `VendorName` varchar(150) NOT NULL,
  `Date` datetime NOT NULL,
  `AccountID` varchar(20) NOT NULL,
  `CustomerSO` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `Total` decimal(18,4) NOT NULL,
  `PO_Closed` tinyint(1) NOT NULL,
  `DropShip` tinyint(1) DEFAULT NULL,
  `DropShipCustomerID` varchar(20) DEFAULT NULL,
  `DropShipCustomerName` varchar(39) DEFAULT NULL,
  `WorkflowAssignee` varchar(39) DEFAULT NULL,
  `WorkflowNote` varchar(2000) DEFAULT NULL,
  `WorkflowStatusName` varchar(32) DEFAULT NULL,
  `LAST_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_compania`,`ID_companiaOrigen`,`TransactionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Sales_Detail_Imp`
--

CREATE TABLE IF NOT EXISTS `Sales_Detail_Imp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_compania` bigint(20) NOT NULL DEFAULT '0',
  `InvoiceNumber` varchar(20) NOT NULL,
  `Item_id` varchar(20) NOT NULL,
  `Description` varchar(160) NOT NULL,
  `GL_Sales_Acct` varchar(15) NOT NULL,
  `Quantity` decimal(18,4) NOT NULL,
  `Unit_Price` decimal(18,4) NOT NULL,
  `Net_line` decimal(18,4) NOT NULL,
  `Taxable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Sales_Header_Imp`
--

CREATE TABLE IF NOT EXISTS `Sales_Header_Imp` (
  `ID_compania` int(11) NOT NULL DEFAULT '0',
  `ID_companiaOrigen` int(11) DEFAULT NULL,
  `InvoiceNumber` varchar(20) NOT NULL DEFAULT '',
  `CustomerID` varchar(50) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `Subtotal` decimal(18,4) NOT NULL,
  `TaxID` varchar(20) NOT NULL,
  `Net_due` decimal(18,4) NOT NULL,
  `SalesRepID` varchar(20) NOT NULL DEFAULT '0',
  `Date` varchar(10) NOT NULL,
  `Created` varchar(10) NOT NULL,
  `Export_date` varchar(10) NOT NULL,
  `Enviado` tinyint(1) DEFAULT '0',
  `Error` tinyint(1) DEFAULT '0',
  `ErrorPT` varchar(20) NOT NULL,
  PRIMARY KEY (`InvoiceNumber`,`ID_compania`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
