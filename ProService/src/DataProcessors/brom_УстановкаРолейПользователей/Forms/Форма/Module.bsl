&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ЗагрузитьПользователей();
	ИнициализироватьСписокРолей();
КонецПроцедуры

Процедура ИнициализироватьСписокРолей()
	списокРолей = Новый Массив();
	расширениеБром = Метаданные.WebСервисы.brom_api.РасширениеКонфигурации(); 
	Для Каждого метаРоль Из Метаданные.Роли Цикл
		расширение = метаРоль.РасширениеКонфигурации();
		Если расширение <> Неопределено И расширение.УникальныйИдентификатор = расширениеБром.УникальныйИдентификатор Тогда
			списокРолей.Добавить(метаРоль);
		КонецЕсли;
	КонецЦикла;
	
	Для Каждого метаРоль Из списокРолей Цикл
		ЭтаФорма.Роли.Добавить(метаРоль.Имя, метаРоль.Синоним);
	КонецЦикла;
КонецПроцедуры

Процедура ЗагрузитьПользователей()
	списокПользователей = ПользователиИнформационнойБазы.ПолучитьПользователей();
	Для Каждого пользователь Из списокПользователей Цикл
		стр = ЭтаФорма.Пользователи.Добавить();
		стр.Наименование = пользователь.ПолноеИмя;
		стр.УникальныйИдентификатор = пользователь.УникальныйИдентификатор;
	КонецЦикла;
КонецПроцедуры

Процедура ЗагрузитьРолиПользователя()
	текДанные = ЭтаФорма.Пользователи.НайтиПоИдентификатору(Элементы.Пользователи.ТекущаяСтрока);
	Если текДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	текПользователь = ПользователиИнформационнойБазы.НайтиПоУникальномуИдентификатору(текДанные.УникальныйИдентификатор);
	Для Каждого текСтр Из ЭтаФорма.Роли Цикл
		роль = Метаданные.Роли.Найти(текСтр.Значение);
		текСтр.Пометка = текПользователь.Роли.Содержит(роль);
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ПользователиПриАктивизацииСтроки(Элемент)
	ЗагрузитьРолиПользователя();
КонецПроцедуры

&НаКлиенте
Процедура РолиПометкаПриИзменении(Элемент)
	РолиПометкаПриИзмененииНаСервере();
КонецПроцедуры
Процедура РолиПометкаПриИзмененииНаСервере()
	текДанныеПользователя = ЭтаФорма.Пользователи.НайтиПоИдентификатору(Элементы.Пользователи.ТекущаяСтрока);
	Если текДанныеПользователя = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	текДанныеРоль = ЭтаФорма.Роли.НайтиПоИдентификатору(Элементы.Роли.ТекущаяСтрока);
	Если текДанныеРоль = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	текПользователь = ПользователиИнформационнойБазы.НайтиПоУникальномуИдентификатору(текДанныеПользователя.УникальныйИдентификатор);
	роль = Метаданные.Роли.Найти(текДанныеРоль.Значение);
	
	Если текПользователь = Неопределено Или роль = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Если текДанныеРоль.Пометка Тогда
		Если Не текПользователь.Роли.Содержит(роль) Тогда
			текПользователь.Роли.Добавить(роль);
			текПользователь.Записать();
		КонецЕсли;
	Иначе
		Если текПользователь.Роли.Содержит(роль) Тогда
			текПользователь.Роли.Удалить(роль);
			текПользователь.Записать();
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры

