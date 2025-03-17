-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 17 2025 г., 17:08
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pharmacy_warehouse`
--

-- --------------------------------------------------------

--
-- Структура таблицы `distribution`
--

CREATE TABLE `distribution` (
  `distribution_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `distribution_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `distribution`
--

INSERT INTO `distribution` (`distribution_id`, `branch_id`, `drug_id`, `employee_id`, `quantity`, `distribution_date`) VALUES
(1, 1, 1, 1, 50, '2024-03-01'),
(2, 2, 2, 2, 100, '2024-03-15'),
(3, 3, 3, 3, 75, '2024-05-01'),
(4, 1, 1, 3, 100, '2024-06-20'),
(5, 2, 2, 2, 200, '2024-06-16'),
(6, 1, 2, 2, 200, '2024-03-10'),
(7, 1, 2, 1, 500, '2024-06-15'),
(8, 1, 3, 2, 300, '2024-06-21');

-- --------------------------------------------------------

--
-- Структура таблицы `drugs`
--

CREATE TABLE `drugs` (
  `drug_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `unit_of_measurement` varchar(50) NOT NULL DEFAULT 'шт',
  `purchase_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `selling_price` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `drugs`
--

INSERT INTO `drugs` (`drug_id`, `name`, `manufacturer_id`, `purpose`, `category`, `unit_of_measurement`, `purchase_price`, `selling_price`) VALUES
(1, 'Амоксициллин', 4, 'Антибактериальный', 'Антибиотики', 'таблетки', 100.00, 150.00),
(2, 'Парацетамол', 1, 'Жаропонижающее', 'Обезболивающие', 'таблетки', 20.00, 35.00),
(3, 'Ибупрофен', 3, 'Противовоспалительное', 'Обезболивающие', 'капсулы', 30.00, 50.00),
(4, 'Цефтриаксон', 2, 'Антибактериальный', 'Антибиотики', 'шт', 150.00, 200.00),
(5, 'Аспирин', 1, 'Жаропонижающее', 'Обезболивающие', 'таблетки', 10.00, 22.00);

-- --------------------------------------------------------

--
-- Структура таблицы `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `name`) VALUES
(1, 'Здоровье'),
(2, 'МедФарм'),
(3, 'ФармаКорп'),
(4, 'ФармаИнтер');

-- --------------------------------------------------------

--
-- Структура таблицы `pharmacy_branches`
--

CREATE TABLE `pharmacy_branches` (
  `branch_id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `pharmacy_branches`
--

INSERT INTO `pharmacy_branches` (`branch_id`, `city`, `address`) VALUES
(1, 'Москва', 'ул. Тверская, 15'),
(2, 'Санкт-Петербург', 'Невский проспект, 22'),
(3, 'Казань', 'ул. Баумана, 45'),
(4, 'Новосибирск', 'ул. Советская, 18'),
(5, 'Владивосток', 'ул. Океанская, 10');

-- --------------------------------------------------------

--
-- Структура таблицы `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `tax_id` varchar(20) NOT NULL,
  `license_number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `name`, `address`, `contact_person`, `phone_number`, `tax_id`, `license_number`) VALUES
(1, 'ООО \"ФармПоставка\"', 'г. Москва, ул. Ленина, 10', 'Кузнецов А.А.', '+7 (903) 456-78-90', '7712345678', 'ЛЦ-12345'),
(2, 'АО \"МедСнаб\"', 'г. Санкт-Петербург, ул. Кирова, 5', 'Петрова Е.В.', '+7 (904) 567-89-01', '7812345679', 'ЛЦ-67890'),
(3, 'ООО \"ФармаТрейд\"', 'г. Екатеринбург, ул. Победы, 12', 'Смирнов И.И.', '+7 (905) 123-45-67', '6612345678', 'ЛЦ-98765');

-- --------------------------------------------------------

--
-- Структура таблицы `supplies`
--

CREATE TABLE `supplies` (
  `supply_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `supply_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `supplies`
--

INSERT INTO `supplies` (`supply_id`, `supplier_id`, `drug_id`, `employee_id`, `quantity`, `supply_date`) VALUES
(1, 1, 1, 1, 100, '2024-02-15'),
(2, 2, 2, 2, 200, '2024-03-10'),
(3, 1, 3, 3, 150, '2024-04-20'),
(4, 1, 2, 1, 500, '2024-06-15'),
(5, 2, 3, 2, 300, '2024-06-21');

-- --------------------------------------------------------

--
-- Структура таблицы `warehouse_employees`
--

CREATE TABLE `warehouse_employees` (
  `employee_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `passport_data` varchar(50) NOT NULL,
  `position` varchar(100) NOT NULL DEFAULT 'Работник',
  `phone_number` varchar(20) NOT NULL,
  `salary` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `warehouse_employees`
--

INSERT INTO `warehouse_employees` (`employee_id`, `full_name`, `passport_data`, `position`, `phone_number`, `salary`) VALUES
(1, 'Иванов Иван Иванович', '1234 567890', 'Менеджер', '+7 (900) 123-45-67', 50000.00),
(2, 'Петров Петр Петрович', '2345 678901', 'Кладовщик', '+7 (901) 234-56-78', 38500.00),
(3, 'Сидорова Анна Сергеевна', '3456 789012', 'Бухгалтер', '+7 (902) 345-67-89', 45000.00),
(4, 'Козлов Михаил Сергеевич', '4567 123456', 'Работник', '+7 (906) 765-43-21', 32000.00);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `distribution`
--
ALTER TABLE `distribution`
  ADD PRIMARY KEY (`distribution_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Индексы таблицы `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`drug_id`),
  ADD KEY `FK1` (`manufacturer_id`);

--
-- Индексы таблицы `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pharmacy_branches`
--
ALTER TABLE `pharmacy_branches`
  ADD PRIMARY KEY (`branch_id`);

--
-- Индексы таблицы `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Индексы таблицы `supplies`
--
ALTER TABLE `supplies`
  ADD PRIMARY KEY (`supply_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Индексы таблицы `warehouse_employees`
--
ALTER TABLE `warehouse_employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `distribution`
--
ALTER TABLE `distribution`
  MODIFY `distribution_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `drugs`
--
ALTER TABLE `drugs`
  MODIFY `drug_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `pharmacy_branches`
--
ALTER TABLE `pharmacy_branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `supplies`
--
ALTER TABLE `supplies`
  MODIFY `supply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `warehouse_employees`
--
ALTER TABLE `warehouse_employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `distribution`
--
ALTER TABLE `distribution`
  ADD CONSTRAINT `distribution_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `pharmacy_branches` (`branch_id`),
  ADD CONSTRAINT `distribution_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`drug_id`),
  ADD CONSTRAINT `distribution_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `warehouse_employees` (`employee_id`);

--
-- Ограничения внешнего ключа таблицы `drugs`
--
ALTER TABLE `drugs`
  ADD CONSTRAINT `FK1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `supplies`
--
ALTER TABLE `supplies`
  ADD CONSTRAINT `supplies_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`),
  ADD CONSTRAINT `supplies_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`drug_id`),
  ADD CONSTRAINT `supplies_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `warehouse_employees` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
