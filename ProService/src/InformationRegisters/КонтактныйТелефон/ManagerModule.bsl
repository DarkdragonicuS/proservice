Функция ПолучитьТелефонПоКонтрагенту(Контрагент) Экспорт 	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
|	КонтактныйТелефон.НомерТелефона КАК НомерТелефона
|ИЗ
|	РегистрСведений.КонтактныйТелефон КАК КонтактныйТелефон
|ГДЕ
|	КонтактныйТелефон.Контрагент = &Контрагент";

Запрос.УстановитьПараметр("Контрагент", 				Контрагент);
Выборка = Запрос.Выполнить().Выбрать();
СписокТелефонов = Новый СписокЗначений;
Пока Выборка.Следующий() Цикл
		СписокТелефонов.Добавить(Выборка.НомерТелефона); 
	КонецЦикла;	
	Возврат СписокТелефонов;
	//Запрос = Новый Запрос;
	//Запрос.Текст = "ВЫБРАТЬ 
	//			   |	ШтрихкодыНоменклатуры.Штрихкод КАК ШтрихКод
	//			   |ИЗ
	//			   |	РегистрСведений.ШтрихкодыНоменклатуры КАК ШтрихкодыНоменклатуры
	//			   |ГДЕ
	//			   |	ШтрихкодыНоменклатуры.Номенклатура = &Номенклатура
	//			   |	И ШтрихкодыНоменклатуры.ХарактеристикаНоменклатуры = &ХарактеристикаНоменклатуры 	               
	//			   |	И (НЕ ШтрихкодыНоменклатуры.НеИспользуется)
	//			   |	И (ШтрихкодыНоменклатуры.ТипШтрихкода = &ТипШтрихКода ИЛИ &ТипШКНеЗадан) 
	//			   |	И ШтрихкодыНоменклатуры.ЕдиницаИзмерения = &ЕдиницаИзмерения";
	//
	
	//Запрос.УстановитьПараметр("Номенклатура", 				Номенклатура);
	//Запрос.УстановитьПараметр("ХарактеристикаНоменклатуры", ХарактеристикаНоменклатуры);
	//Запрос.УстановитьПараметр("ЕдиницаИзмерения", 			ЕдиницаИзмерения);
	//Запрос.УстановитьПараметр("ТипШтрихКода", 				ТипШтрихКода);
	//Запрос.УстановитьПараметр("ТипШКНеЗадан", 		   		НЕ ЗначениеЗаполнено(ТипШтрихКода));
	//
	//Выборка = Запрос.Выполнить().Выбрать();
	//СписокШтрихКодов = Новый СписокЗначений;
	//Пока Выборка.Следующий() Цикл
	//	СписокШтрихКодов.Добавить(Выборка.ШтрихКод); 
	//КонецЦикла;	
	//Возврат СписокШтрихКодов;
КонецФункции	
