Функция ВыполнитьЗапросAPI(Запрос,Параметры=Неопределено,Подключение=Неопределено) Экспорт
	//Параметры: Структура ИмяПараметра -> Значение
	Ошибка = Ложь;
	ТекстЗапроса = "/" + Запрос;
	МассивПараметров = Новый Массив;                                               
	
	Если Не Параметры = Неопределено Тогда
		Для Каждого КлючИЗначение Из Параметры Цикл
			МассивПараметров.Добавить("" + КлючИЗначение.Ключ + "=" + ?(ТипЗнч(КлючИЗначение.Значение)=Тип("Число"),Формат(КлючИЗначение.Значение,"ЧГ="),КлючИЗначение.Значение));                                      
		КонецЦикла;
	КонецЕсли;
	
	СтрокаПараметров = "";
	Для Каждого СтрокаПараметра Из МассивПараметров Цикл
		Если СтрокаПараметров <> "" Тогда
			СтрокаПараметров = СтрокаПараметров + "&";
		КонецЕсли;
		СтрокаПараметров = СтрокаПараметров + СтрокаПараметра;
	КонецЦикла;
	
	Если СтрокаПараметров <> "" Тогда
		ТекстЗапроса = ТекстЗапроса + "?" + СтрокаПараметров;
	КонецЕсли;
	
	Запрос = Новый HTTPЗапрос(ТекстЗапроса);
	Ответ = Неопределено;
	Если Подключение = Неопределено Тогда
		Подключение = Новый HTTPСоединение(Константы.АдресAPIEthermine.Получить(), 443,,,,, Новый ЗащищенноеСоединениеOpenSSL());
	КонецЕсли;
	Попытка
		Ответ = Подключение.Получить(Запрос);
	Исключение
		Ответ = "Ошибка выполнения";
		Ошибка = Истина;
	КонецПопытки;

	Возврат Новый Структура("Подключение,Ответ,Ошибка",Подключение,Ответ,Ошибка);
КонецФункции

Процедура ЗагрузкаДанныхСEthermine() Экспорт
	ЗагрузитьКурсы();
	ЗагрузитьСтатистикуМайнера();
	ВзаимодействиеСHive.ЗагрузитьДанныеХэшрэйта(Константы.ТокенHiveAPI.Получить());
	ЗагрузитьХешрейтМайнера();
	ВзаимодействиеСPolygon.ЗагрузитьБаланс();
КонецПроцедуры

Процедура ЗагрузитьКурсы() Экспорт 
	//Период = ТекущаяДата();
	//РезультатЗапроса = ВзаимодействиеСEhtermine.ВыполнитьЗапросAPI("poolStats");
	//Если Не РезультатЗапроса.Ошибка Тогда
	//	Ответ = РезультатЗапроса.Ответ;		
	//	
	//	ОтветJSONСтрока = Ответ.ПолучитьТелоКакСтроку();
	//	
	//	ЧтениеJSON = Новый ЧтениеJSON();
	//	ЧтениеJSON.УстановитьСтроку(ОтветJSONСтрока);
	//	Данные = ПрочитатьJSON(ЧтениеJSON,Ложь).data;
	//	ЧтениеJSON.Закрыть();
	//	
	//	Для Каждого КлючИЗначение Из Данные Цикл
	//		Если КлючИЗначение.Ключ = "price" Тогда
	//			КурсUSD = КлючИЗначение.Значение.usd;
	//			КурсBTC = КлючИЗначение.Значение.btc;
	//			НаборЗаписейКурса = РегистрыСведений.КурсыКриптоВалют.СоздатьНаборЗаписей();
	//			
	//			НаборЗаписейКурса.Отбор.Период.Установить(Период);
	//			ЗаписьКурса = НаборЗаписейКурса.Добавить();
	//			ЗаписьКурса.Период = Период;
	//			ЗаписьКурса.ВалютаБазовая = Справочники.Валюты.Ether;
	//			ЗаписьКурса.ВалютаКотировки = Справочники.Валюты.UnitedStatesDollar;
	//			ЗаписьКурса.Курс = КурсUSD;
	//			
	//			ЗаписьКурса = НаборЗаписейКурса.Добавить();
	//			ЗаписьКурса.Период = Период;
	//			ЗаписьКурса.ВалютаБазовая = Справочники.Валюты.Ether;
	//			ЗаписьКурса.ВалютаКотировки = Справочники.Валюты.Bitcoin;
	//			ЗаписьКурса.Курс = КурсBTC;
	//			
	//			НаборЗаписейКурса.Записать();
	//		КонецЕсли;
	//	КонецЦикла;
	//КонецЕсли;
	ВзаимодействиеСBinance.ЗагрузитьКурсы();
КонецПроцедуры

Процедура ЗагрузитьСтатистикуМайнера(Кошелек=Неопределено) Экспорт
	Если Кошелек = Неопределено Тогда
		Кошелек = Константы.ОсновнойКошелек.Получить();
	КонецЕсли; 
	
	Запрос = "miner/:" + Кошелек.Наименование + "/currentStats";
	РезультатЗапроса = ВзаимодействиеСEhtermine.ВыполнитьЗапросAPI(Запрос);
	Если Не РезультатЗапроса.Ошибка Тогда
		Ответ = РезультатЗапроса.Ответ;		
		
		ОтветJSONСтрока = Ответ.ПолучитьТелоКакСтроку();
		
		ЧтениеJSON = Новый ЧтениеJSON();
		ЧтениеJSON.УстановитьСтроку(ОтветJSONСтрока);
		Данные = ПрочитатьJSON(ЧтениеJSON,Ложь).data;
		ЧтениеJSON.Закрыть();
		
		Если Данные = "NO DATA" Тогда
			Возврат;
		КонецЕсли;
		
		Период = ОбщегоНазначения.ПолучитьДатуИзTimestamp(Данные.time);
		
		Для Каждого КлючИЗначение Из Данные Цикл
			Если КлючИЗначение.Ключ = "unpaid" Тогда
				НевыплаченныеСредства = КлючИЗначение.Значение * Pow(10,-18); //Перевод Wei в ETH
			КонецЕсли;
		КонецЦикла;
		
		НаборЗаписейНачислений = РегистрыСведений.Начисления.СоздатьНаборЗаписей(); 
		НаборЗаписейНачислений.Отбор.Timestamp.Установить(Период);
		НаборЗаписейНачислений.Отбор.Кошелек.Установить(Кошелек);
		ЗаписьНачисления = НаборЗаписейНачислений.Добавить();
		ЗаписьНачисления.Период = ТекущаяДата();
		ЗаписьНачисления.Timestamp = Период;
		ЗаписьНачисления.Кошелек = Кошелек;
		ЗаписьНачисления.Сумма = НевыплаченныеСредства;
		НаборЗаписейНачислений.Записать();
		
		//ДокументВыплаты = Документы.ВыплатаКриптовалютыПулом.СоздатьДокумент();
		//ДокументВыплаты.Дата = Период;
		//ДокументВыплаты.Валюта = Справочники.Валюты.Ether;
		//ДокументВыплаты.Кошелек = Кошелек;
		//ДокументВыплаты.Сумма = НевыплаченныеСредства * Pow(10,-18); //Перевод Wei в ETH
		//ДокументВыплаты.Записать(РежимЗаписиДокумента.Проведение,РежимПроведенияДокумента.Неоперативный);
	КонецЕсли;
КонецПроцедуры

Процедура ЗагрузитьВыплаты(Кошелек=Неопределено) Экспорт
	Если Кошелек = Неопределено Тогда
		Кошелек = Константы.ОсновнойКошелек.Получить();
	КонецЕсли; 
	
	Запрос = "miner/:" + Кошелек.Наименование + "/payouts";
	РезультатЗапроса = ВзаимодействиеСEhtermine.ВыполнитьЗапросAPI(Запрос);
	Если Не РезультатЗапроса.Ошибка Тогда
		Ответ = РезультатЗапроса.Ответ;		
		
		ОтветJSONСтрока = Ответ.ПолучитьТелоКакСтроку();
		
		ЧтениеJSON = Новый ЧтениеJSON();
		ЧтениеJSON.УстановитьСтроку(ОтветJSONСтрока);
		Данные = ПрочитатьJSON(ЧтениеJSON,Ложь).data;
		ЧтениеJSON.Закрыть();
		
		Данные = ОбщегоНазначения.СортировкаМассиваСтруктур(Данные,"paidOn");
		
		Для Каждого ЗаписьВыплаты Из Данные Цикл
			Период = ОбщегоНазначения.ПолучитьДатуИзTimestamp(ЗаписьВыплаты.paidOn);
			
			Запрос = Новый Запрос;
			Запрос.Текст = 
				"ВЫБРАТЬ
				|	ВыплатыКриптовалютПулом.Регистратор КАК Регистратор
				|ИЗ
				|	РегистрНакопления.ВыплатыКриптовалютПулом КАК ВыплатыКриптовалютПулом
				|ГДЕ
				|	ВыплатыКриптовалютПулом.Timestamp = &Timestamp";
			
			Запрос.УстановитьПараметр("Timestamp", Период);
			
			РезультатЗапроса = Запрос.Выполнить();
			
			ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
			
			Если ВыборкаДетальныеЗаписи.Следующий() Тогда
				ДокументВыплаты = ВыборкаДетальныеЗаписи.Регистратор.ПолучитьОбъект();
			Иначе
				ДокументВыплаты = Документы.ВыплатаКриптовалютыПулом.СоздатьДокумент();
			КонецЕсли;
			
			Для Каждого КлючИЗначение Из ЗаписьВыплаты Цикл
				Если КлючИЗначение.Ключ = "amount" Тогда
					ВыплаченныеСредства = КлючИЗначение.Значение * Pow(10,-18); //Перевод Wei в ETH
				КонецЕсли;
			КонецЦикла;
			
			ДокументВыплаты.Дата = Период;
			ДокументВыплаты.Пул = Справочники.ПулыМайнинга.EthermineETH;
			ДокументВыплаты.Валюта = ДокументВыплаты.Пул.Валюта;
			ДокументВыплаты.Кошелек = Кошелек;
			ДокументВыплаты.Сумма = ВыплаченныеСредства;
			ДокументВыплаты.Записать(РежимЗаписиДокумента.Проведение,РежимПроведенияДокумента.Неоперативный);
		КонецЦикла; 	
	КонецЕсли;
КонецПроцедуры

Процедура ЗагрузитьХешрейтМайнера(Кошелек=Неопределено) Экспорт
	Если Кошелек = Неопределено Тогда
		Кошелек = Константы.ОсновнойКошелек.Получить();
	КонецЕсли; 
	
	Запрос = "miner/:" + Кошелек.Наименование + "/workers";
	РезультатЗапроса = ВзаимодействиеСEhtermine.ВыполнитьЗапросAPI(Запрос);
	Если Не РезультатЗапроса.Ошибка Тогда
		Ответ = РезультатЗапроса.Ответ;		
		
		ОтветJSONСтрока = Ответ.ПолучитьТелоКакСтроку();
		
		ЧтениеJSON = Новый ЧтениеJSON();
		ЧтениеJSON.УстановитьСтроку(ОтветJSONСтрока);
		Данные = ПрочитатьJSON(ЧтениеJSON,Ложь).data;
		ЧтениеJSON.Закрыть();
			
        Если Данные.Количество() = 0 Тогда
        	Возврат;
        КонецЕсли;		
				
		//СуммарныйХэшрейт = Новый ОписаниеТипов("Число",,,Новый КвалификаторыЧисла(15,8));		
		//СуммарныйПериод = "";
		НаборЗаписейХэшрейтаМайнера = РегистрыСведений.ХэшрейтОборудования.СоздатьНаборЗаписей();
		//НаборЗаписейХэшрейта.Отбор.Период.Установить(Период);
		//НаборЗаписейХэшрейта.Отбор.ВоркерID.Установить(Воркер);
		НаборЗаписейХэшрейтаМайнера.Отбор.ФермаID.Установить(Кошелек.Наименование);
		НаборЗаписейХэшрейтаМайнера.Отбор.ВоркерID.Установить("");
		ЗаписьХэшрейтаМайнера = НаборЗаписейХэшрейтаМайнера.Добавить();
		
		Для Каждого СтатистикаВоркера Из Данные Цикл
			
			Воркер = СтатистикаВоркера.worker;
			Период = ОбщегоНазначения.ПолучитьДатуИзTimestamp(СтатистикаВоркера.time);
			Хэшрейт = СтатистикаВоркера.currentHashrate;
			//СуммарныйХэшрейт = СуммарныйХэшрейт + Хэшрейт;
			//СуммарныйПериод = СуммарныйПериод + СтатистикаВоркера.time;
			
			НаборЗаписейХэшрейта = РегистрыСведений.ХэшрейтОборудования.СоздатьНаборЗаписей();
			НаборЗаписейХэшрейта.Отбор.Период.Установить(Период);
			НаборЗаписейХэшрейта.Отбор.ВоркерID.Установить(Воркер);
			НаборЗаписейХэшрейта.Отбор.ФермаID.Установить(Кошелек.Наименование);
			
			ЗаписьХэшрейта = НаборЗаписейХэшрейта.Добавить();
			ЗаписьХэшрейта.Валюта = Справочники.Валюты.Ether;
			ЗаписьХэшрейта.ИмяФермы = Кошелек.Наименование;
			ЗаписьХэшрейта.ВоркерID = Воркер;
			ЗаписьХэшрейта.ФермаID = Кошелек.Наименование;
			ЗаписьХэшрейта.Период = Период;
			ЗаписьХэшрейта.Хэшрэйт = Хэшрейт;
		    ЗаписьХэшрейта.ЭффективныйХэшрейт = Истина;
			
			НаборЗаписейХэшрейта.Записать();
			
			Если Не ЗначениеЗаполнено(ЗаписьХэшрейтаМайнера.Период) Тогда
				НаборЗаписейХэшрейтаМайнера.Отбор.Период.Установить(Период);
				ЗаписьХэшрейтаМайнера.Период = Период;
				ЗаписьХэшрейтаМайнера.Валюта = Справочники.Валюты.Ether;
				ЗаписьХэшрейтаМайнера.ИмяФермы = Кошелек.Наименование;
				ЗаписьХэшрейтаМайнера.ФермаID = Кошелек.Наименование;
				ЗаписьХэшрейтаМайнера.ЭффективныйХэшрейт = Истина;
			КонецЕсли;
			ЗаписьХэшрейтаМайнера.Хэшрэйт = ЗаписьХэшрейтаМайнера.Хэшрэйт + Хэшрейт;
		КонецЦикла;
		                   
		//Период = ОбщегоНазначения.ПолучитьДатуИзTimestamp(Цел(СуммарныйПериод / 3));
		//
		//НаборЗаписейХэшрейта = РегистрыСведений.ХэшрейтОборудования.СоздатьНаборЗаписей();
		//НаборЗаписейХэшрейта.Отбор.Период.Установить(Период);
		//НаборЗаписейХэшрейта.Отбор.ВоркерID.Установить(0);
		//НаборЗаписейХэшрейта.Отбор.ФермаID.Установить(Кошелек.Наименование);
		//
		//ЗаписьХэшрейта = НаборЗаписейХэшрейта.Добавить();
		//ЗаписьХэшрейта.Валюта = Справочники.Валюты.Ether;
		//ЗаписьХэшрейта.ИмяФермы = Кошелек.Наименование;
		////ЗаписьХэшрейта.ВоркерID = Воркер;
		//ЗаписьХэшрейта.ФермаID = Кошелек.Наименование;
		//ЗаписьХэшрейта.Период = Период;
		//ЗаписьХэшрейта.Хэшрэйт = СуммарныйХэшрейт;
		//ЗаписьХэшрейта.ЭффективныйХэшрейт = Истина;
		
		НаборЗаписейХэшрейта.Записать();
		НаборЗаписейХэшрейтаМайнера.Записать();
	КонецЕсли;
КонецПроцедуры
