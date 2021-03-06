
Процедура ОбработкаПроведения(Отказ, Режим)
	Если Товары.Количество() > 0 Тогда
		
			//Движения.ДвиженияДенежныхСредств.Записывать = Истина;
			Движения.ОстаткиНоменклатуры.Записывать = Истина;
			Движения.Закупки.Записывать = Истина;
			//Движение = Движения.ДвиженияДенежныхСредств.Добавить();
			//Движение.Период = Дата;
			//Движение.Сумма = -СуммаДокумента; //Расход
			//Движение.СтатьяДвиженияДенежныхСредств = ПредопределенноеЗначение("Справочник.СтатьиДвиженияДенежныхСредств.ОплатаПоставщику");
			
		
			Для Каждого Товар Из Товары Цикл
				// регистр ОстаткиНоменклатуры
				Движение = Движения.ОстаткиНоменклатуры.Добавить();
				Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
				Движение.Период = Дата;
				Движение.Номенклатура = Товар.Номенклатура;
				Движение.Количество = Товар.Количество;
				
				// регистр Закупки
				Движение = Движения.Закупки.Добавить();
				Движение.Период = Дата;
				Движение.Контрагент = Контрагент;
				Движение.Номенклатура = Товар.Номенклатура;
				Движение.Количество = Товар.Количество;
				Движение.Сумма = Товар.Сумма;
			КонецЦикла;
		
	Иначе
		Сообщить("Не указаны поступившие товары!");
		Отказ = Истина;
	КонецЕсли;
КонецПроцедуры

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ЗаказТоваров") Тогда
		// Заполнение шапки
		ДокументОснование = ДанныеЗаполнения.Ссылка;
		ЗаказТоваров = ДанныеЗаполнения.Ссылка;
		Комментарий = ДанныеЗаполнения.Комментарий;
		Контрагент = ДанныеЗаполнения.Контрагент;
		СуммаДокумента = 0;
		Для Каждого ТекСтрокаТовары Из ДанныеЗаполнения.Товары Цикл
			НоваяСтрока = Товары.Добавить();
			НоваяСтрока.Количество = ТекСтрокаТовары.Количество;
			НоваяСтрока.Номенклатура = ТекСтрокаТовары.Номенклатура;
			НоваяСтрока.Сумма = ТекСтрокаТовары.Сумма;
			НоваяСтрока.Цена = ТекСтрокаТовары.Цена;
			СуммаДокумента = СуммаДокумента + НоваяСтрока.Сумма;
		КонецЦикла;
	КонецЕсли;
КонецПроцедуры
