
Процедура ОбработкаПроведения(Отказ, Режим) 
	// регистр ОстаткиНоменклатуры Приход
	Если Товары.Количество() > 0 Тогда 		
		Движения.ОстаткиНоменклатуры.Записывать = Истина;
		Для Каждого ТекСтрокаТовары Из Товары Цикл
			Движение = Движения.ОстаткиНоменклатуры.Добавить();
			Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
			Движение.Период = Дата;
			Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
			Движение.Количество = ТекСтрокаТовары.Количество;
		КонецЦикла;
	Иначе
		Сообщить("Не указаны списываемые товары!");
		Отказ = Истина;
	КонецЕсли;
КонецПроцедуры
