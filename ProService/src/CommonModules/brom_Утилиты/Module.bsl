Функция СвйоствоОбъектаXDTO(объектXDTO, имяСвойства, значениеПоУмолчанию = Неопределено) Экспорт
	Если объектXDTO = Неопределено Тогда
		Возврат значениеПоУмолчанию;
	КонецЕсли;
	
	Если объектXDTO.Свойства().Получить(имяСвойства) = Неопределено Тогда
		Возврат значениеПоУмолчанию;
	КонецЕсли;
	
	Если объектXDTO[имяСвойства] = Неопределено Тогда
		Возврат значениеПоУмолчанию;
	КонецЕсли;
	
	Возврат объектXDTO[имяСвойства];
КонецФункции

Функция СравнитьТипыXDTO(тип1, тип2) Экспорт
	Возврат тип1.URIПространстваИмен = тип2.URIПространстваИмен
	И тип1.Имя = тип2.Имя; 
КонецФункции

Функция ПолучитьИмяПоляЗапроса(ключПоля, имяПоля = "") Экспорт
	Если ЗначениеЗаполнено(имяПоля) Тогда
		Возврат имяПоля;
	КонецЕсли;
	
	Возврат СтрЗаменить(ключПоля, ".", "");
КонецФункции

Функция СвойствоОбъекта(объект, имяСвойства) Экспорт
	проверка = Новый Структура(имяСвойства, Неопределено);
	
	ЗаполнитьЗначенияСвойств(проверка, объект);
	Возврат проверка[имяСвойства];
КонецФункции
Функция СвойствоУстановлено(объект, имяСвойства) Экспорт
	проверка = Новый Структура(имяСвойства, Неопределено);
	
	ЗаполнитьЗначенияСвойств(проверка, объект);
	Возврат проверка[имяСвойства] <> Неопределено;
КонецФункции