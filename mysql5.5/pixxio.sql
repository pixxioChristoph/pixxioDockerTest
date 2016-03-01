CREATE USER 'pixxio'@'localhost' IDENTIFIED BY 'mysqlPIXXIO';
GRANT USAGE ON * . * TO  'pixxio'@'localhost' IDENTIFIED BY 'mysqlPIXXIO' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;
CREATE DATABASE IF NOT EXISTS  pixxio ;
GRANT ALL PRIVILEGES ON  pixxio . * TO  'pixxio'@'localhost';
use pixxio;

-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 09. Dez 2015 um 19:35
-- Server Version: 5.5.43
-- PHP-Version: 5.4.39-0+deb7u2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Datenbank: `pixxio`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `alerts`
--

CREATE TABLE IF NOT EXISTS `alerts` (
  `aleID` int(11) NOT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `gelesenStamp` varchar(25) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`aleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `benutzer`
--

CREATE TABLE IF NOT EXISTS `benutzer` (
  `benID` int(11) NOT NULL,
  `recID` varchar(100) DEFAULT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `vname` varchar(80) DEFAULT NULL,
  `nname` varchar(80) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `login` varchar(250) DEFAULT NULL,
  `pass` varchar(250) DEFAULT NULL,
  `home` varchar(250) DEFAULT NULL,
  `aktiv` tinyint(4) DEFAULT NULL,
  `ldap` tinyint(4) DEFAULT NULL,
  `cifsPass` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`benID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `checkInOut`
--

CREATE TABLE IF NOT EXISTS `checkInOut` (
  `chkID` int(11) NOT NULL,
  `benID` int(11) DEFAULT NULL,
  `datID` int(11) DEFAULT NULL,
  `newstamp` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updstamp` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkOutText` text COLLATE utf8_unicode_ci,
  `checkInText` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`chkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comID` int(11) NOT NULL,
  `datID` int(11) DEFAULT NULL,
  `benID` int(11) DEFAULT NULL,
  `kolID` int(11) DEFAULT NULL,
  `newstamp` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updstamp` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`comID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `conversionSettings`
--

CREATE TABLE IF NOT EXISTS `conversionSettings` (
  `conID` int(11) NOT NULL,
  `benID` int(11) DEFAULT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `bezeichnung` text,
  `dpi` varchar(10) DEFAULT NULL,
  `px` varchar(10) DEFAULT NULL,
  `pxUnit` varchar(10) DEFAULT NULL,
  `colorSpace` varchar(20) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `conversions` text,
  PRIMARY KEY (`conID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dateien`
--

CREATE TABLE IF NOT EXISTS `dateien` (
  `datID` int(11) NOT NULL,
  `benID` int(11) NOT NULL,
  `newstamp` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `updstamp` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `neueDatei` tinyint(1) DEFAULT NULL,
  `FileName` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `FileServerName` varchar(90) CHARACTER SET utf8 DEFAULT NULL,
  `Kategorie` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `FileTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `FileType` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `Format` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `ImageHeight` int(11) DEFAULT NULL,
  `ImageWidth` int(11) DEFAULT NULL,
  `ImageSize` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `FileSize` int(11) DEFAULT NULL,
  `CreateDate` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `ModifyDate` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `Orientation` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `ColorMode` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `Rating` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `Subject` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `Creator` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Keywords` text CHARACTER SET utf8,
  `Description` text CHARACTER SET utf8,
  `gpsLat` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `gpsLng` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `gpsAlt` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `gpsInfo` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ExifDaten` longtext CHARACTER SET utf8,
  `downLocked` tinyint(4) DEFAULT NULL,
  `original` tinyint(4) DEFAULT NULL,
  `checkInOut` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main_datID` int(11) DEFAULT NULL,
  `commentState` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`datID`),
  KEY `FileName` (`FileName`),
  KEY `CreateDate` (`CreateDate`),
  KEY `ModifyDate` (`ModifyDate`),
  KEY `FileSize` (`FileSize`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dateienDublette`
--


CREATE TABLE IF NOT EXISTS `dateienDublette` (
  `datID` int(11) NOT NULL,
  `benID` int(11) NOT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `neueDatei` tinyint(1) DEFAULT NULL,
  `FileName` varchar(200) DEFAULT NULL,
  `FileServerName` varchar(90) DEFAULT NULL,
  `Kategorie` varchar(255) DEFAULT NULL,
  `FileTitle` varchar(100) DEFAULT NULL,
  `FileType` varchar(10) DEFAULT NULL,
  `Format` varchar(10) DEFAULT NULL,
  `ImageHeight` int(11) DEFAULT NULL,
  `ImageWidth` int(11) DEFAULT NULL,
  `ImageSize` varchar(15) DEFAULT NULL,
  `FileSize` int(11) DEFAULT NULL,
  `CreateDate` varchar(30) DEFAULT NULL,
  `ModifyDate` varchar(30) DEFAULT NULL,
  `Orientation` varchar(25) DEFAULT NULL,
  `ColorMode` varchar(25) DEFAULT NULL,
  `Rating` varchar(5) DEFAULT NULL,
  `Subject` varchar(200) DEFAULT NULL,
  `Creator` varchar(50) DEFAULT NULL,
  `Keywords` text,
  `Description` text,
  `gpsLat` varchar(10) DEFAULT NULL,
  `gpsLng` varchar(10) DEFAULT NULL,
  `gpsAlt` varchar(10) DEFAULT NULL,
  `gpsInfo` varchar(255) DEFAULT NULL,
  `ExifDaten` text,
  `downLocked` tinyint(4) DEFAULT NULL,
  `original` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`datID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `einstellungen`
--

CREATE TABLE IF NOT EXISTS `einstellungen` (
  `einID` int(11) NOT NULL,
  `benID` int(11) NOT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `smtpserver` varchar(150) DEFAULT NULL,
  `smtpemail` varchar(150) DEFAULT NULL,
  `smtpversendername` varchar(50) DEFAULT NULL,
  `smtpbenutzer` varchar(50) DEFAULT NULL,
  `smtppasswort` varchar(50) DEFAULT NULL,
  `smtpport` varchar(5) DEFAULT NULL,
  `smtpssl` tinyint(4) DEFAULT NULL,
  `ldapserver` varchar(100) DEFAULT NULL,
  `ldapdomain` varchar(100) DEFAULT NULL,
  `ldapgruppe` varchar(250) DEFAULT NULL,
  `ldapbenutzer` varchar(50) DEFAULT NULL,
  `ldapkennwort` varchar(50) DEFAULT NULL,
  `watermarkimage` varchar(100) DEFAULT NULL,
  `wa_transparenz` smallint(6) DEFAULT NULL,
  `wa_breite` smallint(6) DEFAULT NULL,
  `wa_positionierung` varchar(10) DEFAULT NULL,
  `lo` tinyint(4) DEFAULT NULL,
  `mo` tinyint(4) DEFAULT NULL,
  `ro` tinyint(4) DEFAULT NULL,
  `lm` tinyint(4) DEFAULT NULL,
  `mm` tinyint(4) DEFAULT NULL,
  `rm` tinyint(4) DEFAULT NULL,
  `lu` tinyint(4) DEFAULT NULL,
  `mu` tinyint(4) DEFAULT NULL,
  `ru` tinyint(4) DEFAULT NULL,
  `cloudserver` varchar(100) DEFAULT NULL,
  `cloudbenutzer` varchar(50) DEFAULT NULL,
  `cloudkennwort` varchar(50) DEFAULT NULL,
  `fileNameLogo` varchar(150) DEFAULT NULL,
  `fileNameLogoDark` varchar(150) DEFAULT NULL,
  `fileNameStartscreen` varchar(150) DEFAULT NULL,
  `sloganStartscreen` varchar(250) DEFAULT NULL,
  `logoLink` varchar(250) DEFAULT NULL,
  `ldapSyncLogin` tinyint(4) DEFAULT NULL,
  `ldapSyncZeit` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`einID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `exports`
--

CREATE TABLE IF NOT EXISTS `exports` (
  `expID` int(11) NOT NULL,
  `benID` int(11) DEFAULT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `typ` varchar(10) DEFAULT NULL,
  `pfad` text,
  PRIMARY KEY (`expID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `freigabeExtern`
--

CREATE TABLE IF NOT EXISTS `freigabeExtern` (
  `freID` int(11) NOT NULL,
  `kolID` int(11) NOT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `freigabeEmail` text,
  `freigabeBody` text,
  `freigabeAnzahl` varchar(10) DEFAULT NULL,
  `freigabeDimension` varchar(10) DEFAULT NULL,
  `freigabeVon` varchar(25) DEFAULT NULL,
  `freigabeBis` varchar(25) DEFAULT NULL,
  `freigabeWasserzeichen` tinyint(4) DEFAULT NULL,
  `kollektionsession` varchar(150) DEFAULT NULL,
  `fresession` varchar(50) DEFAULT NULL,
  `freigabeMeta` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`freID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `freigabeIntern`
--

CREATE TABLE IF NOT EXISTS `freigabeIntern` (
  `friID` int(11) NOT NULL AUTO_INCREMENT,
  `kolID` int(11) NOT NULL,
  `benID` int(11) NOT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`friID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gastzugriffe`
--

CREATE TABLE IF NOT EXISTS `gastzugriffe` (
  `gasID` int(11) NOT NULL,
  `fresession` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `newstamp` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `updstamp` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `ip` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`gasID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `generalSettings`
--

CREATE TABLE IF NOT EXISTS `generalSettings` (
  `gseID` int(11) NOT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `zeitBilderKonvertieren` int(11) DEFAULT NULL,
  `anzahlBilderLaden` int(11) DEFAULT NULL,
  `stufeBilderAnzeigen` int(11) DEFAULT NULL,
  `breiteBilderKonvertieren` int(11) DEFAULT NULL,
  `byteBilderKonvertieren` int(11) DEFAULT NULL,
  `prozentBilderKomprimieren` int(11) DEFAULT NULL,
  `anzahlDpi` int(11) DEFAULT NULL,
  `tagsFromFilename` int(11) DEFAULT NULL,
  `securePassword` int(11) DEFAULT NULL,
  `tagsByGroup` int(11) DEFAULT NULL,
  `pfadFileArchiv` text,
  `linkFileArchiv` text,
  `pfadFileCollections` text,
  `linkFileCollections` text,
  `pfadFileDownloads` text,
  `linkFileDownloads` text,
  `pfadFileOrigs` text,
  `linkFileOrigs` text,
  `pfadFileDubletten` text,
  `linkFileDubletten` text,
  `pfadFileUpload` text,
  `linkFileUpload` text,
  `detailViewWatermark` int(11) DEFAULT NULL,
  `dataPrivacyText` text,
  `exifDataTop` text,
  `sessionTimeout` int(11) DEFAULT NULL,
  `logAge` int(11) DEFAULT NULL,
  `logUserrelated` int(11) DEFAULT NULL,
  `geoKey` text,
  PRIMARY KEY (`gseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `imports`
--

CREATE TABLE IF NOT EXISTS `imports` (
  `impID` int(11) NOT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `size` text,
  PRIMARY KEY (`impID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `info`
--

CREATE TABLE IF NOT EXISTS `info` (
  `infID` int(11) NOT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `isRegistriert` int(11) DEFAULT NULL,
  `registrierungsDaten` text,
  `hasEmail` int(11) DEFAULT NULL,
  `hasCloud` int(11) DEFAULT NULL,
  `pixxioVersion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`infID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kollektion`
--

CREATE TABLE IF NOT EXISTS `kollektion` (
  `kolID` int(11) NOT NULL,
  `benID` int(11) NOT NULL,
  `newstamp` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `updstamp` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `bezeichnung` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `beschreibung` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `freigabeGlobal` tinyint(4) DEFAULT NULL,
  `freigabeWebdav` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`kolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kollektion_vkn`
--

CREATE TABLE IF NOT EXISTS `kollektion_vkn` (
  `kvkID` int(11) NOT NULL,
  `kolID` int(11) NOT NULL,
  `datID` int(11) NOT NULL,
  `newstamp` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `updstamp` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`kvkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ldapserver`
--

CREATE TABLE IF NOT EXISTS `ldapserver` (
  `lseID` int(11) NOT NULL,
  `benID` int(11) DEFAULT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `server` varchar(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `gruppe` varchar(250) DEFAULT NULL,
  `benutzer` varchar(50) DEFAULT NULL,
  `kennwort` varchar(50) DEFAULT NULL,
  `syncLogin` tinyint(4) DEFAULT NULL,
  `syncZeit` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`lseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lizenzen`
--

CREATE TABLE IF NOT EXISTS `lizenzen` (
  `lizID` int(11) NOT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `offerer` varchar(255) DEFAULT NULL,
  `licensename` varchar(255) DEFAULT NULL,
  `license` longtext,
  PRIMARY KEY (`lizID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lizenzInfo`
--

CREATE TABLE IF NOT EXISTS `lizenzInfo` (
  `linID` int(11) NOT NULL,
  `lizID` int(11) DEFAULT NULL,
  `lteID` int(11) DEFAULT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `infoBeschreibung` text,
  `timeKey` bigint(15) DEFAULT NULL,
  `completeText` text,
  PRIMARY KEY (`linID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lizenzTeile`
--

CREATE TABLE IF NOT EXISTS `lizenzTeile` (
  `lteID` int(11) NOT NULL,
  `lcgID` int(11) NOT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `bezeichnung` varchar(255) DEFAULT NULL,
  `farbe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `logID` int(11) NOT NULL,
  `benID` int(11) DEFAULT NULL,
  `newstamp` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updstamp` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prioritaet` int(11) DEFAULT NULL,
  `kategorie` text COLLATE utf8_unicode_ci,
  `beschreibung` text COLLATE utf8_unicode_ci,
  `statement` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`logID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `netzlaufwerke`
--

CREATE TABLE IF NOT EXISTS `netzlaufwerke` (
  `nfsID` int(11) NOT NULL,
  `benID` int(11) DEFAULT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `server` varchar(100) DEFAULT NULL,
  `directory` varchar(250) DEFAULT NULL,
  `benutzer` varchar(50) DEFAULT NULL,
  `kennwort` varchar(50) DEFAULT NULL,
  `mountDir` text,
  PRIMARY KEY (`nfsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rechteverwaltung`
--

CREATE TABLE IF NOT EXISTS `rechteverwaltung` (
  `recID` int(11) NOT NULL,
  `newstamp` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `updstamp` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `bezeichnung` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `auswahlAnzeige` text CHARACTER SET latin1,
  `auswahlErstellen` text CHARACTER SET latin1,
  `alleRechte` tinyint(4) DEFAULT NULL,
  `katAnzeigen` tinyint(4) DEFAULT NULL,
  `katErstellen` tinyint(4) DEFAULT NULL,
  `katHome` tinyint(4) DEFAULT NULL,
  `ekErstellenBearbeiten` tinyint(4) DEFAULT NULL,
  `ekLoeschen` tinyint(4) DEFAULT NULL,
  `fkBearbeiten` tinyint(4) DEFAULT NULL,
  `fkLoeschen` tinyint(4) DEFAULT NULL,
  `klFreigebenExtern` tinyint(4) DEFAULT NULL,
  `klFreigebenIntern` tinyint(4) DEFAULT NULL,
  `klFreigebenSamba` tinyint(4) DEFAULT NULL,
  `ebHochladenBearbeiten` tinyint(4) DEFAULT NULL,
  `ebLoeschen` tinyint(4) DEFAULT NULL,
  `fbBearbeiten` tinyint(4) DEFAULT NULL,
  `fbLoeschen` tinyint(4) DEFAULT NULL,
  `swErstellenBearbeiten` tinyint(4) DEFAULT NULL,
  `ldap` tinyint(4) DEFAULT NULL,
  `meFreigebenSamba` tinyint(4) DEFAULT NULL,
  `meKommentieren` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`recID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `savedFilters`
--

CREATE TABLE IF NOT EXISTS `savedFilters` (
  `sfiID` int(11) NOT NULL,
  `benID` int(11) DEFAULT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `titel` varchar(100) DEFAULT NULL,
  `filter` text,
  PRIMARY KEY (`sfiID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `savedSettings`
--

CREATE TABLE IF NOT EXISTS `savedSettings` (
  `ligID` int(11) NOT NULL,
  `benID` int(11) DEFAULT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `datids` text,
  `settings` text,
  PRIMARY KEY (`ligID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sessionverwaltung`
--

CREATE TABLE IF NOT EXISTS `sessionverwaltung` (
  `sesID` int(11) NOT NULL,
  `benID` int(11) DEFAULT NULL,
  `newstamp` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `updstamp` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `session` varchar(35) CHARACTER SET latin1 DEFAULT NULL,
  `ip` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `admin` smallint(6) DEFAULT NULL,
  `aktiv` smallint(6) DEFAULT NULL,
  `lang` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `tagID` int(11) NOT NULL AUTO_INCREMENT,
  `recID` varchar(100) DEFAULT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `tag` varchar(70) DEFAULT NULL,
  `firstChar` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`tagID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=617 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `updates`
--

CREATE TABLE IF NOT EXISTS `updates` (
  `updID` int(11) NOT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `version` varchar(10) DEFAULT NULL,
  `text` text,
  `beta` int(11) DEFAULT NULL,
  PRIMARY KEY (`updID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `usbImports`
--

CREATE TABLE IF NOT EXISTS `usbImports` (
  `usbID` int(11) NOT NULL,
  `newstamp` varchar(25) DEFAULT NULL,
  `updstamp` varchar(25) DEFAULT NULL,
  `benID` int(11) DEFAULT NULL,
  `session` varchar(35) DEFAULT NULL,
  `filesToUpload` longtext,
  `tagAry` text,
  `copyTo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`usbID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Default-Werte einpflegen
--


INSERT INTO pixxio.updates (updID, newstamp, version) VALUES ('1', '2015-10-09 09:00:00', '0.772');
INSERT INTO pixxio.benutzer (benID, recID, newstamp, updstamp, vname, nname, email, login, pass, home, aktiv, ldap) VALUES ('1', '1', '1', NULL, 'System', 'Administrator', NULL, 'admin', 'pixxio', 'admin_1', '1', NULL);
INSERT INTO pixxio.info (infID, newstamp,  isRegistriert, registrierungsDaten, hasEmail, hasCloud, pixxioVersion) VALUES (1, '2015-01-01 00:00:00', 0, '', 0, 0, 'box');
INSERT INTO pixxio.einstellungen (einID, benID, newstamp, updstamp, smtpserver, smtpemail, smtpversendername, smtpbenutzer, smtppasswort, smtpport, smtpssl, ldapserver, ldapdomain, ldapgruppe, ldapbenutzer, ldapkennwort, watermarkimage, wa_transparenz, wa_breite, wa_positionierung, lo, mo, ro, lm, mm, rm, lu, mu, ru, cloudserver, cloudbenutzer, cloudkennwort, fileNameLogo, fileNameLogoDark, fileNameStartscreen, sloganStartscreen, logoLink) VALUES ('1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO pixxio.conversionSettings (conID, benID, newstamp, updstamp, bezeichnung, dpi, px, colorSpace, quality, conversions) VALUES (1, 1, '2015-06-15 19:25:59', '2015-06-15 20:02:29', '1. E-Mail ( 350 px )', '72', '350', '', 80, '{\"alle\":\"jpg\"}'),(2, 1, '2015-06-15 19:25:59', '2015-06-15 20:02:29', '3. Präsentation ( 1500 px )', '150', '1500', '', 90, '{\"alle\":\"jpg\"}'),(3, 1, '2015-06-15 19:25:59', '2015-06-15 20:02:29', '2. Webseite ( 800 px )', '72', '800', '', 80, '{\"alle\":\"jpg\"}');
INSERT INTO pixxio.generalSettings (gseID, newstamp, updstamp, zeitBilderKonvertieren, anzahlBilderLaden, stufeBilderAnzeigen, breiteBilderKonvertieren, byteBilderKonvertieren, prozentBilderKomprimieren, anzahlDpi, tagsFromFilename, securePassword, tagsByGroup, pfadFileArchiv, linkFileArchiv, pfadFileCollections, linkFileCollections, pfadFileDownloads, linkFileDownloads, pfadFileOrigs, linkFileOrigs, pfadFileDubletten, linkFileDubletten, pfadFileUpload, linkFileUpload, exifDataTop, sessionTimeout) VALUES ('1', '1', NULL, '1', '25', '1','1920', '1572864', '100', '150', '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,'[\'ImageSize\',\'FileName\',\'Keywords\',\'FileSize\',\'Creator\',\'Model\',\'Owner\',\'GPS\',\'Kategorie\']',-1);
INSERT INTO pixxio.rechteverwaltung (recID ,newstamp ,updstamp ,bezeichnung ,auswahlAnzeige ,auswahlErstellen ,alleRechte ,katAnzeigen ,katErstellen ,katHome ,ekErstellenBearbeiten ,ekLoeschen ,fkBearbeiten ,fkLoeschen ,klFreigebenExtern ,klFreigebenIntern ,klFreigebenSamba ,ebHochladenBearbeiten ,ebLoeschen ,fbBearbeiten ,fbLoeschen ,swErstellenBearbeiten ,ldap)VALUES ('1', '1', NULL , 'Administrator', NULL , NULL , '1', NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL);
