Функция ПолучитьМенеджер(метаданныеПолноеИмя) Экспорт
	Возврат Новый(СтрЗаменить(метаданныеПолноеИмя, ".", "Менеджер."), Неопределено);
КонецФункции

Функция ПолучитьМетаданные(метаданныеПолноеИмя) Экспорт
	Возврат Метаданные.НайтиПоПолномуИмени(МетаданныеПолноеИмя);
КонецФункции

Функция ЭтоПеречисление(метаданныеПолноеИмя) Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	Возврат Метаданные.Перечисления.Содержит(текМетаданные) = Истина;
КонецФункции
Функция ЭтоДокумент(метаданныеПолноеИмя) Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	Возврат Метаданные.Документы.Содержит(текМетаданные) = Истина;
КонецФункции
Функция ЭтоСправочник(метаданныеПолноеИмя) Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	Возврат Метаданные.Справочники.Содержит(текМетаданные) = Истина;
КонецФункции
Функция ЭтоПланВидовХарактеристик(метаданныеПолноеИмя) Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	Возврат Метаданные.ПланыВидовХарактеристик.Содержит(текМетаданные) = Истина;
КонецФункции
Функция ЭтоПланСчетов(метаданныеПолноеИмя) Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	Возврат Метаданные.ПланыСчетов.Содержит(текМетаданные) = Истина;
КонецФункции
Функция ЭтоПланВидовРасчета(метаданныеПолноеИмя) Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	Возврат Метаданные.ПланыВидовРасчета.Содержит(текМетаданные) = Истина;
КонецФункции
Функция ЭтоБизнесПроцесс(метаданныеПолноеИмя) Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	Возврат Метаданные.БизнесПроцессы.Содержит(текМетаданные) = Истина;
КонецФункции
Функция ЭтоЗадача(метаданныеПолноеИмя) Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	Возврат Метаданные.Задачи.Содержит(текМетаданные) = Истина;
КонецФункции
Функция ЭтоПланОбмена(метаданныеПолноеИмя) Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	Возврат Метаданные.ПланыОбмена.Содержит(текМетаданные) = Истина;
КонецФункции
Функция ЭтоКонстанта(метаданныеПолноеИмя) Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	Возврат Метаданные.Константы.Содержит(текМетаданные) = Истина;
КонецФункции
Функция ЭтоРегистрСведений(метаданныеПолноеИмя) Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	Возврат Метаданные.РегистрыСведений.Содержит(текМетаданные) = Истина;
КонецФункции
Функция ЭтоРегистрНакопления(метаданныеПолноеИмя) Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	Возврат Метаданные.РегистрыНакопления.Содержит(текМетаданные) = Истина;
КонецФункции
Функция ЭтоРегистрРасчета(метаданныеПолноеИмя) Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	Возврат Метаданные.РегистрыРасчета.Содержит(текМетаданные) = Истина;
КонецФункции
Функция ЭтоРегистрБухгалтерии(метаданныеПолноеИмя) Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	Возврат Метаданные.РегистрыБухгалтерии.Содержит(текМетаданные) = Истина;
КонецФункции

Функция ЭтоСистемноеПеречисление(имяТипаXML) Экспорт
	Если Не ЗначениеЗаполнено(имяТипаXML) Тогда
		Возврат Ложь;
	КонецЕсли;
	
	типы = Новый Массив;
	типы.Добавить(XMLТип(Тип("ВидДвиженияБухгалтерии")).ИмяТипа);
	типы.Добавить(XMLТип(Тип("ВидДвиженияНакопления")).ИмяТипа);
	типы.Добавить(XMLТип(Тип("ВидСчета")).ИмяТипа);
	типы.Добавить(XMLТип(Тип("ИспользованиеРежимаПроведения")).ИмяТипа);
	типы.Добавить(XMLТип(Тип("РежимАвтоВремя")).ИмяТипа);
	типы.Добавить(XMLТип(Тип("РежимЗаписиДокумента")).ИмяТипа);
	типы.Добавить(XMLТип(Тип("РежимПроведенияДокумента")).ИмяТипа);

	Если типы.Найти(имяТипаXML) <> Неопределено Тогда
		Возврат Истина;
	Иначе
		Возврат Ложь;
	КонецЕсли;
КонецФункции

Функция ОбъектИмеетСтандартныеРеквизиты(метаданныеПолноеИмя) Экспорт
	текМетаданные = ПолучитьМетаданные(метаданныеПолноеИмя);
	Если текМетаданные = Неопределено Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Возврат Не ЭтоКонстанта(метаданныеПолноеИмя);
КонецФункции
Функция ОбъектИмеетРеквизиты(метаданныеПолноеИмя) Экспорт
	текМетаданные = ПолучитьМетаданные(метаданныеПолноеИмя);
	Если текМетаданные = Неопределено Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Возврат НЕ ЭтоПеречисление(метаданныеПолноеИмя) И Не ЭтоКонстанта(метаданныеПолноеИмя);
КонецФункции
Функция ОбъектИмеетТабличныеЧасти(метаданныеПолноеИмя) Экспорт
	текМетаданные = ПолучитьМетаданные(метаданныеПолноеИмя);
	Если текМетаданные = Неопределено Тогда
		Возврат Ложь;
	КонецЕсли;                       
	
	Возврат 
		НЕ ЭтоПеречисление(метаданныеПолноеИмя) 
		И Не ЭтоКонстанта(метаданныеПолноеИмя)
		И Не ЭтоРегистрСведений(метаданныеПолноеИмя)
		И Не ЭтоРегистрНакопления(метаданныеПолноеИмя)
		И Не ЭтоРегистрРасчета(метаданныеПолноеИмя)
		И Не ЭтоРегистрБухгалтерии(метаданныеПолноеИмя);
КонецФункции

Функция ПредставлениеТипаВИмяТипа(представление) Экспорт
	фрагменты = СтрРазделить(представление, " ", Ложь);
	Для к = 0 По фрагменты.ВГраница() Цикл
		фрагмент = фрагменты[к];
		фрагменты[к] = ВРег(Лев(фрагмент, 1)) + Прав(фрагмент, СтрДлина(фрагмент) - 1);
	КонецЦикла;
	
	Возврат СтрСоединить(фрагменты);	
КонецФункции

Функция ПолучитьПредопределенныеЗначения(метаданныеПолноеИмя) Экспорт
	Если ЭтоПеречисление(метаданныеПолноеИмя) Тогда
		результат = Новый Структура();
		
		запрос = Новый Запрос;
		запрос.Текст = 
			"ВЫБРАТЬ
			|	Табл.Ссылка КАК Ссылка,
			|	Табл.Порядок КАК Порядок
			|ИЗ
			|	Перечисление.ИмяПеречисления КАК Табл";
		
		запрос.Текст = СтрЗаменить(запрос.Текст, "Перечисление.ИмяПеречисления", метаданныеПолноеИмя);
		
		данные = запрос.Выполнить().Выбрать();		
		Пока данные.Следующий() Цикл
			ссылка = данные.Ссылка;
			индекс = данные.Порядок;
			результат.Вставить(ссылка.Метаданные().ЗначенияПеречисления[индекс].Имя, данные.Ссылка);
		КонецЦикла;
		
		Возврат результат;
	КонецЕсли;
	
	Если ЭтоСправочник(метаданныеПолноеИмя)
		Или ЭтоПланВидовХарактеристик(метаданныеПолноеИмя)
		Или ЭтоПланСчетов(метаданныеПолноеИмя) 
		Или ЭтоПланВидовРасчета(метаданныеПолноеИмя) Тогда
		
		результат = Новый Структура();		
		запрос = Новый Запрос;
		запрос.Текст = 
			"ВЫБРАТЬ
			|	Табл.Ссылка КАК Ссылка,
			|	Табл.ИмяПредопределенныхДанных КАК ИмяПредопределенныхДанных
			|ИЗ
			|	Таблица.ИмяОбъекта КАК Табл
			|ГДЕ
			|	Табл.Предопределенный = ИСТИНА";
		запрос.Текст = СтрЗаменить(запрос.Текст, "Таблица.ИмяОбъекта", метаданныеПолноеИмя);
		
		данные = запрос.Выполнить().Выбрать();
		
		Пока данные.Следующий() Цикл
			Попытка
				результат.Вставить(данные.ИмяПредопределенныхДанных, данные.Ссылка);
			Исключение
				// TODO
			КонецПопытки;
		КонецЦикла;
		
		Возврат результат;
	КонецЕсли;
	
	Возврат Неопределено;
КонецФункции

Функция ПолучитьТипКоллекцииИзПолногоИмени(метаданныеПолноеИмя) Экспорт
	Возврат СтрРазделить(метаданныеПолноеИмя, ".")[0];
КонецФункции

Функция ПолучитьОбщиеРеквизитыОбъекта(метаданныеПолноеИмя)Экспорт
	текМетаданные = Метаданные.НайтиПоПолномуИмени(метаданныеПолноеИмя);
	
	реквизиты = Новый Массив();
	использовать 		= Метаданные.СвойстваОбъектов.ИспользованиеОбщегоРеквизита.Использовать;
	авто				= Метаданные.СвойстваОбъектов.ИспользованиеОбщегоРеквизита.Авто;
	разделять 			= Метаданные.СвойстваОбъектов.РазделениеДанныхОбщегоРеквизита.Разделять;
	разделятьНезависимо	= Метаданные.СвойстваОбъектов.ИспользованиеРазделяемыхДанныхОбщегоРеквизита.Независимо;
	
	автоИспользовать 	= Метаданные.СвойстваОбъектов.АвтоИспользованиеОбщегоРеквизита.Использовать;
	Для Каждого реквизит Из Метаданные.ОбщиеРеквизиты Цикл
		Если реквизит.РазделениеДанных = разделять И реквизит.ИспользованиеРазделяемыхДанных = разделятьНезависимо Тогда
			Продолжить;	
		КонецЕсли;
		
		автоиспользование = реквизит.АвтоИспользование; 
		
		элементСостава = реквизит.Состав.Найти(текМетаданные);
		Если элементСостава <> Неопределено Тогда
			Если элементСостава.Использование = использовать Или элементСостава.Использование = авто И автоиспользование = автоИспользовать Тогда
				реквизиты.Добавить(реквизит);	
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;
	
	Возврат реквизиты;
КонецФункции

Функция ЭтоСсылочныйТип(имяТипаXML) Экспорт
	фрагменты = СтрРазделить(имяТипаXML, ".", Ложь);
	Возврат Прав(фрагменты[0], 3) = "Ref";
КонецФункции



