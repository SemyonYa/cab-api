-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 01 2021 г., 23:35
-- Версия сервера: 5.6.43-log
-- Версия PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cab`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ctor`
--

CREATE TABLE `ctor` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `author_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `thumb_id` int(11) NOT NULL,
  `tag` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `ctor_item`
--

CREATE TABLE `ctor_item` (
  `id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctor_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `id` int(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`id`, `name`) VALUES
(11, '5nSPH2ovl1NoD93l7kmN.jpg'),
(12, 'KE083MHihwe_pARg9oN4.jpg'),
(13, 'JDsL3QV_TKRQCXmOZqGa.jpg'),
(14, '1mrYNaRu4Z57vUeTfmTU.jpg'),
(15, 'XEzB9GHLnpKiAWXOBcHr.jpg'),
(16, 'rYZYXUKpfAUgD9OdNKnm.jpg'),
(17, 'tie9n-BYcIEZMc_FPpiy.jpg'),
(18, 'lhjhjPtujoSEhMR5a65C.jpg'),
(19, 'h1Wp_yIZcMScT1M1jv0l.jpg'),
(20, 'eIe-McxHMb9PJGEt6H_3.jpg'),
(21, '9Vq-OYZIdTnNsA0d-5-B.jpg'),
(22, 'FIrrdD87W1yjsn2WSVmg.jpg'),
(23, '0dQKgC0EJiSEpdg_uO-b.jpg'),
(24, '5HuyC1Mobx5KF-slW9g5.jpg'),
(25, 'Ooq_KMHA7Lw6Q_RA384p.jpg'),
(26, 'mIR2Z8S-VfbbTIG6aWFl.jpg'),
(27, 'nvdPFVvuSmcQv9L_eKBX.jpg'),
(28, 'FjVVEyvv6YO2a2RzQyFK.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `birth` date NOT NULL,
  `password_hash` text COLLATE utf8mb4_unicode_ci,
  `auth_token` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `login`, `role`, `birth`, `password_hash`, `auth_token`, `activated`) VALUES
(1, 'Ivan', 'Ivanov', 'ivan32', 'user', '1998-02-25', NULL, '', 0),
(2, 'Stepan', 'Stepanov', 'step456', 'user', '1986-10-21', NULL, '', 0),
(3, 'Afanas', 'Afanasov', 'af', 'admin', '1990-01-25', NULL, 'qwerty', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ctor`
--
ALTER TABLE `ctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `thumb` (`thumb_id`);

--
-- Индексы таблицы `ctor_item`
--
ALTER TABLE `ctor_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ctor_id` (`ctor_id`);

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_login_unique` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ctor`
--
ALTER TABLE `ctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT для таблицы `ctor_item`
--
ALTER TABLE `ctor_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `image`
--
ALTER TABLE `image`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ctor`
--
ALTER TABLE `ctor`
  ADD CONSTRAINT `ctor_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `ctor_ibfk_2` FOREIGN KEY (`thumb_id`) REFERENCES `image` (`id`);

--
-- Ограничения внешнего ключа таблицы `ctor_item`
--
ALTER TABLE `ctor_item`
  ADD CONSTRAINT `ctor_item_ibfk_1` FOREIGN KEY (`ctor_id`) REFERENCES `ctor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
