-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 15 May 2021, 23:31:59
-- Sunucu sürümü: 10.4.17-MariaDB
-- PHP Sürümü: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `arabakiralama`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `arabalar`
--

CREATE TABLE `arabalar` (
  `id` int(10) UNSIGNED NOT NULL,
  `PLAKA` varchar(20) NOT NULL,
  `MARKA` varchar(50) NOT NULL,
  `MODEL` varchar(50) NOT NULL,
  `DURUMU` varchar(20) NOT NULL,
  `UCRET` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `arabalar`
--

INSERT INTO `arabalar` (`id`, `PLAKA`, `MARKA`, `MODEL`, `DURUMU`, `UCRET`) VALUES
(1, '34ABC678', 'Mercedes', 'M1', 'Mevcut', 100),
(2, '36AB857', 'BMW', 'B1', 'Mevcut', 100);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kiralama`
--

CREATE TABLE `kiralama` (
  `id` int(10) UNSIGNED NOT NULL,
  `ArabaId` int(20) UNSIGNED NOT NULL,
  `PLAKA` varchar(20) NOT NULL,
  `MusteriAdi` varchar(255) NOT NULL,
  `KiralamaTarihi` varchar(20) NOT NULL,
  `TeslimTarihi` varchar(20) NOT NULL,
  `KiralamaUcreti` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `id` int(10) UNSIGNED NOT NULL,
  `isim` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `parola` text NOT NULL,
  `guvenlikSorusu` varchar(100) NOT NULL,
  `cevap` text NOT NULL,
  `adres` text NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `statu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`id`, `isim`, `email`, `parola`, `guvenlikSorusu`, `cevap`, `adres`, `telefon`, `statu`) VALUES
(2, 'ali veli', 'ali@mail.com', '12345', 'İlkokul Öğretmeninin Adı?', 'veli', 'istanbul', '55566644433', 'true');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteriler`
--

CREATE TABLE `musteriler` (
  `MUSTID` int(10) UNSIGNED NOT NULL,
  `MUSTERIADI` varchar(255) NOT NULL,
  `ADRES` varchar(255) NOT NULL,
  `TELEFON` varchar(255) NOT NULL,
  `EPOSTA` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `musteriler`
--

INSERT INTO `musteriler` (`MUSTID`, `MUSTERIADI`, `ADRES`, `TELEFON`, `EPOSTA`) VALUES
(1, 'Veli Deli', 'istanbul/üsküdar', '66666666666', 'veli@mail.com'),
(2, 'mehmet yeni', 'istanbul/kadıköy', '44422211100', 'mehmet@mail.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teslim`
--

CREATE TABLE `teslim` (
  `id` int(10) UNSIGNED NOT NULL,
  `PLAKA` varchar(20) NOT NULL,
  `MusteriAdi` varchar(255) NOT NULL,
  `TeslimTarihi` date NOT NULL,
  `Gecikme` int(10) NOT NULL,
  `ToplamUcret` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `teslim`
--

INSERT INTO `teslim` (`id`, `PLAKA`, `MusteriAdi`, `TeslimTarihi`, `Gecikme`, `ToplamUcret`) VALUES
(1, '34ABC678', 'Veli Deli', '2021-05-17', 0, 300),
(2, '36AB857', 'mehmet yeni', '2021-05-20', 700, 600),
(3, '34ABC678', 'Veli Deli', '2021-05-18', 50, 300);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `arabalar`
--
ALTER TABLE `arabalar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kiralama`
--
ALTER TABLE `kiralama`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `musteriler`
--
ALTER TABLE `musteriler`
  ADD PRIMARY KEY (`MUSTID`);

--
-- Tablo için indeksler `teslim`
--
ALTER TABLE `teslim`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `arabalar`
--
ALTER TABLE `arabalar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `kiralama`
--
ALTER TABLE `kiralama`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `musteriler`
--
ALTER TABLE `musteriler`
  MODIFY `MUSTID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `teslim`
--
ALTER TABLE `teslim`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
