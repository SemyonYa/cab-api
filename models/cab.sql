-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 27 2021 г., 17:50
-- Версия сервера: 5.7.29
-- Версия PHP: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `subtitle` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `author_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `thumb_id` int(11) DEFAULT NULL,
  `tag` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `price` int(11) NOT NULL DEFAULT '0',
  `region` enum('Москва','Норильск') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ctor`
--

INSERT INTO `ctor` (`id`, `title`, `subtitle`, `description`, `created_at`, `author_name`, `author_id`, `thumb_id`, `tag`, `is_active`, `price`, `region`) VALUES
(1, 'Alex Skolnick Trio', 'Материал из Википедии — свободной энциклопедии', NULL, '2020-02-02 12:12:00', 'Игорь Ольденбург', 22, 11, 'article', 1, 0, NULL),
(2, 'Test article', 'Test article subtitle', NULL, '2020-02-02 12:12:00', 'I. Old', 22, 11, 'article', 1, 0, NULL),
(3, 'О клинике', 'About Ortum clinic', NULL, '2021-09-11 22:21:00', 'qweqwe', 22, 11, 'about', 1, 0, NULL),
(10, 'Мануальный терапевт', '', NULL, '2021-09-17 22:42:00', '', 22, NULL, 'position', 1, 0, 'Норильск'),
(11, 'Игорь Ольденбург', 'Главный врач, генеральный директор', NULL, '2021-09-17 22:56:00', '', 22, 26, 'personal', 1, 0, 'Норильск'),
(12, 'Иван Иванов', 'Мануальный терапевт', NULL, '2021-09-17 22:57:00', '', 22, 27, 'personal', 1, 0, 'Норильск'),
(14, 'Массаж ', 'Классический', 'Отличный массаж', '2021-09-19 17:04:00', 'Иванов', 22, 11, 'service', 1, 800, 'Москва'),
(15, 'Массаж по-московски', '', '', '2021-09-19 17:37:00', '', 22, 14, 'service', 1, 10499, 'Москва'),
(16, 'Массаж по-норильски', 'Самый норильский массаж', '', '2021-09-19 17:38:00', '', 22, 13, 'service', 1, 199, 'Норильск');

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

--
-- Дамп данных таблицы `ctor_item`
--

INSERT INTO `ctor_item` (`id`, `type`, `value`, `ctor_id`, `ordering`) VALUES
(1, 'H1', 'First article block H1', 2, 0),
(2, 'H2', 'First article block H2', 2, 1),
(3, 'Text', 'Александр (А́лекс) Натан Ско́лник (англ. Alexander Nathan Skolnick; 29 сентября 1968, Беркли, Калифорния) — американский гитарист, играющий в разных стилях (трэш-метал и джаз).', 2, 2),
(15, 'Text', 'Александр (Алекс) Натан Сколник (англ. Alexander Nathan Skolnick; 29 сентября 1968, Беркли, Калифорния) — американский гитарист, играющий в разных стилях (трэш-метал и джаз). Наиболее известен как лид-гитарист американской трэш-метал-группы Testament. Согласно голосованиям журнала Guitar World, входит в список 100 лучших гитаристов мира[1] и в список 50 самых быстрых гитаристов мира[2]. Также Loudwire поместил его на 24 место в своем списке «Топ-66 лучших хард-рок/метал-гитаристов всех времён».', 1, 0),
(16, 'H1', 'Состав группы', 1, 1),
(17, 'H2', 'Нынешний состав', 1, 2),
(18, 'List', 'Алекс Сколник — гитара (с 2001);\nНатан Пэк — контрабас (с 2003);\nМэт Зебровски — барабаны/перкуссия (с 2001).', 1, 3),
(19, 'H2', 'Бывшие участники', 1, 4),
(20, 'List', 'Джон Дэвис — контрабас (2001—2003).', 1, 5),
(21, 'H1', 'Репертуар', 1, 6),
(22, 'Text', 'Трио известно тем, что исполняет каверы на песни различных групп классического рока и хеви-метала — они называют это «современными стандартами». Они переигрывали следующие произведения (на студийных записях, либо на концертах): Tom Sawyer, The Trooper, Highway Star, Practica lo que predicas (испаноязычная версия песни Testament Practice What You Preach), Goodbye to Romance, Detroit Rock City, Still Loving You, Don’t Talk to Strangers, Dream On, No One Like You (присутствует на дебютном студийном альбоме в виде оригинала и в виде бонус-трека — концертной записи), War Pigs, Electric Eye, Money, Blackout, Fade to Black и Pinball Wizard.\nСо времени выпуска своего первого альбома трио всё больше двигается в сторону исполнения собственного материала, на втором альбоме половина песен являются их собственными, а на третьем уже всего три кавера. Их четвёртый альбом, Veritas, содержит всего один кавер.', 1, 7),
(28, 'Text', 'Клиника «Ортум» – это узкоспециализированная клиника, направленная на лечение опорно-двигательного аппарата – важнейшей системы в организме. И сейчас мы это вам докажем:', 3, 0),
(29, 'List', 'Осознание своего «я» происходит за счёт работы головного мозга, а вот его реализация – идёт через опорно-двигательный аппарат. Если говорить проще – голова придумывает что делать, а тело, повинуясь команде, встает и делает. Таким образом, этот аппарат позволяет человеку двигаться, то есть жить.\nВ широком понимании, он состоит не только из костей и мышц, но и сухожилий, связок и капсул суставов, связок и капсул внутренних органов, периферических сосудов и нервов. На кости приходится до 40 процентов от всей массы тела, то есть это самая тяжёлая и массивная часть, а скелетная мускулатура – самая энергопотребляющая ткань организма. Во время нагрузки она потребляет очень много кислорода, энергии и пластических веществ. Другими словами, лёгкие и кишечник снабжают эту систему всем необходимым, а почки отфильтровывают всё ненужное – все внутренние органы и системы работают на опорно-двигательный аппарат. \nДанный аппарат является опорой для всех внутренних органов – они крепятся своими связками к костям. В качестве примера представьте книжный шкаф. Шкаф – это вместилище книг. Книги будут стоять на полке ровно, только если сама полка ровная. Если она покосится, то книги попадают. То же самое происходит и с внутренними органами – если есть проблемы с опорно-двигательным аппаратом, то это неизбежно скажется на их функционировании. И они начнут болеть.', 3, 1),
(30, 'Text', 'Поэтому начинать любую терапию по любым причинам необходимо с исследования и коррекции именно опорно-двигательного аппарата. ', 3, 2),
(31, 'H2', 'Обязанности:', 10, 0),
(32, 'List', 'Приём и лечение пациентов с заболеваниями опорно-двигательного аппарата и периферической нервной системы.\nВедение первичной документации и амбулаторной карты. Заполнение листа УКЛ.\nКонтроль работы массажистов и медсестёр ФТЛ.\nПостоянно обучаться и обучать новым навыкам коллег.', 10, 1),
(33, 'H2', 'Требования:', 10, 2),
(34, 'List', 'Готовность к переезду.\nПол: мужской.\nВозраст: до 40 лет.\nОбразование: Высшее профессиональное образование по специальности: \"Лечебное дело\". Ординатура по специальности \"Мануальная терапия\" или профессиональная переподготовка по специальности \"Мануальная терапия\" при наличии послевузовского профессионального образования по одной из специальностей: \"Неврология\", \"Травматология и ортопедия\". Действующий Сертификат специалиста по специальности «Мануальная терапии».\nОпыт работы: от одного года. Применение на практике рефлексотерапии, прикладной кинезиологии, кинезиологического тейпирования, фармакопунктуры, ортезирования стоп, лечебного массажа приветствуются.\nЗнания: качественные знания анатомии, физиологии и своей специальности (мануальная терапия).\nНавыки: мягкотканые техники (ПИРМ, МЭТ, МФР, стрейн-контрстрейн), ударные техники (устранение блоков ПДС всех видов).\nПриветствуются наличие знаний и навыков кинезиологии, кинезиологического тейпирования, подиатрии, клинической гомеопатии, ударно-волновой терапии.', 10, 3),
(35, 'H2', 'Идеология: ', 10, 4),
(36, 'List', 'Мир стоит на добре, любви и квантовой физике. Если ты заботлив и добр, то и мир будет добр и заботлив к тебе.\nЗарплату платит не работодатель, а пациент. Именно он делает заказ для удовлетворения своей потребности. Пациент является заказчиком, а медперсонал – подрядчиком.\nЗалогом успеха в правильном диагнозе является тщательный сбор анамнеза и осмотр, но никак не различные анализы.\nХирургия должна быть только ургентной. Всё остальное можно и должно вылечивать консервативно.', 10, 5),
(37, 'H2', 'Условия:', 10, 6),
(38, 'List', 'Работодатель гарантирует полное соблюдение ТК: официальное трудоустройство, соцпакет, медицинский стаж, график работы 5\\2, нормированный рабочий день.\nНовый филиал: свежий качественный светлый ремонт, 2 душевых, раздевалка с индивидуальными шкафчиками, кухня, новая мебель и оборудование, новая команда.\nОбучение: на месте, участие в очных и онлайн-семинарах.', 10, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `filial`
--

CREATE TABLE `filial` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` enum('Москва','Норильск') COLLATE utf8mb4_unicode_ci NOT NULL,
  `emails` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phones` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `addresses` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `filial`
--

INSERT INTO `filial` (`id`, `name`, `description`, `code`, `emails`, `phones`, `addresses`) VALUES
(1, 'Клиника \"ОРТУМ\"', 'Клиника реабилитации опорно-двигательного  аппарата', 'Москва', 'moscow@ortum.ru\r\nmoscow2@ortum.ru', '+7 (000) 789-79-79\r\n+7 (000) 789-69-79\r\n+7 (000) 989-79-79', 'Москва, переулок Гранитный, 4/1'),
(2, 'Клиника \"ОРТУМ\"', 'Клиника реабилитации опорно-двигательного  аппарата', 'Норильск', 'moscow@ortum.ru\r\nmoscow2@ortum.ru', '+7 (000) 789-79-79\r\n+7 (000) 789-69-79\r\n+7 (000) 989-79-79', 'Норильск, пр-д Моторостроителей, 64');

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
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
(22, 'admin', 'adm', 'admin', 'admin', '1968-10-21', '$2y$13$Ed66Z3OmuiZUcPq6P5qhW.FRuHeVbXhORcGXP1u9uC/eh2z30I9Fy', '6OOL5Mo8pBFt8FESdc-T85bkNs8vgylfRFwtqfpu6jBgbYc526z6W8UXwKf9eIHuXBvGg8KbZZfV8u1EBmA4D7YPHZLKMshB38qd8P6IKtofpGAqiU-cYfZCeVPbTGqQ', 1),
(23, 'qwe', 'qwe', 'qwe', 'user', '2020-12-01', '$2y$13$AiSKqqZeO47XZAaKXQw3P.E60.zndwohEqKow.RNSHa8xunB6YIza', NULL, 1),
(24, 'qwe', 'qwe', 'qwe1', 'user', '2020-12-01', '$2y$13$UbJ.4pi.M.Pm5iRSZtcM1uPWm3wM3NqLpwzd/tPGRB58c7ByMtEpW', NULL, 1);

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
-- Индексы таблицы `filial`
--
ALTER TABLE `filial`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `ctor_item`
--
ALTER TABLE `ctor_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ctor`
--
ALTER TABLE `ctor`
  ADD CONSTRAINT `ctor_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `ctor_item`
--
ALTER TABLE `ctor_item`
  ADD CONSTRAINT `ctor_item_ibfk_1` FOREIGN KEY (`ctor_id`) REFERENCES `ctor` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
