
Процедура ОбработкаПроведения(Отказ, Режим)
	// регистр ВыплатыКриптовалютПулом 
	Движения.ВыплатыКриптовалютПулом.Записывать = Истина;
	Движение = Движения.ВыплатыКриптовалютПулом.Добавить();
	Движение.Период = Дата;
	Движение.Пул = Пул;
	Движение.Кошелек = Кошелек;
	Движение.Валюта = Валюта;
	Движение.Timestamp = Дата;
	Движение.Сумма = Сумма;
КонецПроцедуры
