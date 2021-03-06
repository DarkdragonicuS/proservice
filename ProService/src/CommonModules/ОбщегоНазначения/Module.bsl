Процедура УстановитьВозможностьРедактированияФормы(Форма) Экспорт
	Форма.ТолькоПросмотр = Ложь;
КонецПроцедуры

Функция ПолучитьДатуИзTimestamp(Timestamp) Экспорт 
	Возврат МестноеВремя('19700101' + Timestamp); 
КонецФункции 

Функция ПолучитьTimestampИзДаты(Дата) Экспорт 
	Возврат УниверсальноеВремя(Дата) - '19700101'; 
КонецФункции   

Функция ТекущийПользователь() Экспорт
	Возврат ПользователиИнформационнойБазы.ТекущийПользователь();
КонецФункции

Функция НайтиПользователяПоИмени(ИмяПользователя) Экспорт 
	Возврат ПользователиИнформационнойБазы.НайтиПоИмени(ИмяПользователя);
КонецФункции

//Возвращает JSON в строковом виде из структуры
Функция ПолучитьОбъектJSONСтрокой(Структура) Экспорт
	ДанныеКомандыJSON = Новый ЗаписьJSON;
	ДанныеКомандыJSON.УстановитьСтроку(Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Нет,,Истина,ЭкранированиеСимволовJSON.Нет));
	ЗаписатьJSON(ДанныеКомандыJSON,Структура);
	Возврат ДанныеКомандыJSON.Закрыть();	
КонецФункции

//Читает JSON в структуру
Функция ПолучитьСтруктурированныеДанныеJSON(СтрокаJSON) Экспорт
	Попытка
		Чтение = Новый ЧтениеJSON;
		Чтение.УстановитьСтроку(СтрокаJSON);
		Данные = ПрочитатьJSON(Чтение,Ложь);
		Чтение.Закрыть();
	Исключение
		Данные = Неопределено;
	КонецПопытки;
	
	Возврат Данные;
КонецФункции

//Сортирует массив структур
//Контроля НЕТ
Функция СортировкаМассиваСтруктур(Массив,Ключ,Направление = "Возр") Экспорт
	Таблица = Новый ТаблицаЗначений;
	//Таблица.Колонки.Добавить("Дата");
	//Таблица.Колонки.Добавить("Структура");
	Для Каждого КлючИЗначение Из Массив[0] Цикл
		Таблица.Колонки.Добавить(КлючИЗначение.Ключ);
	КонецЦикла;
	
	Для каждого Элемент Из Массив Цикл
		СтрокаТЗ = Таблица.Добавить();
		Для Каждого Колонка Из Таблица.Колонки Цикл
			СтрокаТЗ[Колонка.Имя] = Элемент[Колонка.Имя];
		КонецЦикла;
	КонецЦикла;

	Таблица.Сортировать(Ключ + " " + Направление);
	//Массив = Таблица.ВыгрузитьКолонку("Структура");
	Массив = Новый Массив;
	Для Каждого СтрокаТЗ Из Таблица Цикл
		Структура = Новый Структура;
		Для Каждого Колонка Из Таблица.Колонки Цикл
			Структура.Вставить(Колонка.Имя,СтрокаТЗ[Колонка.Имя]);
		КонецЦикла;
		Массив.Добавить(Структура);
	КонецЦикла;
 
	Возврат Массив;
КонецФункции