Функция ПространствоИменБром() Экспорт
	Возврат Метаданные.ПакетыXDTO.brom_API.ПространствоИмен;
КонецФункции

Функция ТипДанныхXDTO(имяТипа) Экспорт
	Возврат ФабрикаXDTO.Тип(ПространствоИменБром(), имяТипа);
КонецФункции

Функция СформироватьДеревоЗагружаемыхУзлов(стрУзлы) Экспорт
	Возврат brom_API.СформироватьДеревоЗагружаемыхУзлов(стрУзлы);
КонецФункции

Функция УдаленныйВызовМетодаРазрешен(полноеИмяМетода) Экспорт
	области = brom_Настройки.ОбластьДотупаУдаленныхВызовов();
	
	текИмя = НРег(СокрЛП(полноеИмяМетода));
	фИмена = СтрРазделить(текИмя, ".");
	
	Для Каждого область Из области Цикл
		область = НРег(СокрЛП(область));
		фОбласти = СтрРазделить(область, ".");
		Если фИмена.Количество() <> фОбласти.Количество() Тогда
			Продолжить;
		КонецЕсли;
		
		доступен = Истина;
		Для к = 0 По фИмена.ВГраница() Цикл
			фОбласть = фОбласти[к];
			фИмя = фИмена[к];
			Если фОбласть <> "*" И фОбласть <> фИмя Тогда
				доступен = Ложь;
				Прервать;
			КонецЕсли;        
		КонецЦикла;
		
		Если доступен Тогда
			Возврат Истина;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Ложь;
КонецФункции

