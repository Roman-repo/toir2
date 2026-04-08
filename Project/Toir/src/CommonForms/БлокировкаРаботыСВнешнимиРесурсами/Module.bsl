///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2019, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ИмяСобытияЖурналаРегистрации = БлокировкаРаботыСВнешнимиРесурсами.ИмяСобытияЖурналаРегистрации();
	
	ПараметрыБлокировки = БлокировкаРаботыСВнешнимиРесурсами.СохраненныеПараметрыБлокировки();
	ПроверятьИмяСервера = ПараметрыБлокировки.ПроверятьИмяСервера;
	
	Если Параметры.ПринятиеРешенияОБлокировке Тогда
		
		ТекстСнятияБлокировки = РегламентныеЗаданияСлужебный.ЗначениеНастройки("РасположениеКомандыСнятияБлокировки");
		РазделениеВключено = ОбщегоНазначения.РазделениеВключено();
		ИзменилосьРазделение = ПараметрыБлокировки.РазделениеВключено <> РазделениеВключено;
		
		Если РазделениеВключено Тогда
			Элементы.ИнформационнаяБазаПеремещена.Заголовок = НСтр("es='La aplicación es trasladada';ru='Приложение перемещено';en='Application moved'");
			Элементы.ЭтоКопияИнформационнойБазы.Заголовок = НСтр("es='Es la copia de la aplicación';ru='Это копия приложения';en='This is a copy of the application.'");
			Заголовок = НСтр("es='La aplicación era trasladada o restablecida de la copia de reserva';ru='Приложение было перемещено или восстановлено из резервной копии';en='The application has been moved or restored from backup'");
		КонецЕсли;
		
		Если Не РазделениеВключено И Не ИзменилосьРазделение Тогда
			
			УточнениеМасштабируемыйКластер = ?(ОбщегоНазначения.ИнформационнаяБазаФайловая(), "",
				НСтр("es='• En el trabajo en масштабируемом el clúster para la prevención de los funcionamientos falsos por el cambio de los ordenadores"
" que hacen el papel de los servidores de trabajo, desconecten la comprobación del nombre del ordenador, presionen <b> Todavía - Comprobar el nombre del servidor. </b>';ru='• При работе в масштабируемом кластере для предотвращения ложных срабатываний из-за смены компьютеров, выступающих"
"  в роли рабочих серверов, отключите проверку имени компьютера, нажмите <b>Еще - Проверять имя сервера.</b>';en='• While working in a scalable cluster to prevent false positives due to the change of computers acting"
"click on the link <b> More - Check server name. </ b>'"));
			
			НадписьПредупреждение = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
				НСтр("es='El trabajo con todos los recursos exteriores (la sincronización de los datos, el envío de los correos y así sucesivamente), cumplido por el horario, "
"es bloqueado para la prevención de los conflictos con la base por la base informativa. "
""
"%1 "
""
"<a href = ""ZhurnalRegistratsii""> la información técnica sobre la causa del bloqueo </a> "
""
"• Si la base informativa se usará para la gestión del recuento, presionen <b> la base Informativa es trasladada </b>. "
"• Si es la copia de la base informativa, presionen <b> Es la copia de la base informativa </b>. "
""
""
"%2 %3';ru='Работа со всеми внешними ресурсами (синхронизация данных, отправка почты и т.п.), выполняемая по расписанию,"
"заблокирована для предотвращения конфликтов с основой информационной базой."
""
"%1"
""
"<a href = ""ЖурналРегистрации"">Техническая информация о причине блокировки</a>"
""
"• Если информационная база будет использоваться для ведения учета, нажмите <b>Информационная база перемещена</b>."
"• Если это копия информационной базы, нажмите <b>Это копия информационной базы</b>."
"%2"
""
"%3';en='Work with all external resources (data synchronization, sending mail, etc.), performed on schedule,"
"blocked to prevent conflicts with the basis of the information base."
""
"%1"
""
"<a href = ""ЖурналРегистрации""> Technical information about the reason for the block </a>"
""
"• If the infobase will be used for accounting, click <b> Infobase moved </b>."
"• If this is a copy of the infobase, click <b> This is a copy of the infobase </b>."
"%2"
""
"%3 '"),
				ПараметрыБлокировки.ПричинаБлокировки,
				УточнениеМасштабируемыйКластер,
				ТекстСнятияБлокировки);
		ИначеЕсли Не РазделениеВключено И ИзменилосьРазделение Тогда
			НадписьПредупреждение = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
				НСтр("es='El trabajo con todos los recursos exteriores (la sincronización de los datos, el envío de los correos y así sucesivamente), cumplido por el horario, "
"es bloqueado para la prevención de los conflictos con la aplicación en el Internet. "
""
"<b> la base informativa era cargada de la aplicación en el Internet </b> "
""
"• Si la base informativa se usará para la gestión del recuento, presionen <b> la base Informativa es trasladada </b>. "
"• Si es la copia de la base informativa, presionen <b> Es la copia de la base informativa </b>. "
""
"%1';ru='Работа со всеми внешними ресурсами (синхронизация данных, отправка почты и т.п.), выполняемая по расписанию,"
"заблокирована для предотвращения конфликтов с приложением в Интернете."
""
"<b>Информационная база была загружена из приложения в Интернете</b>"
""
"• Если информационная база будет использоваться для ведения учета, нажмите <b>Информационная база перемещена</b>."
"• Если это копия информационной базы, нажмите <b>Это копия информационной базы</b>."
""
"%1';en='Work with all external resources (data synchronization, sending mail, etc.), performed on schedule,"
"blocked to prevent conflicts with the application on the Internet."
""
"<b> The infobase was downloaded from an application on the Internet </b>"
""
"• If the infobase will be used for accounting, click <b> Infobase moved </b>."
"• If this is a copy of the infobase, click <b> This is a copy of the infobase </b>."
""
"%1'"),
				ТекстСнятияБлокировки);
		ИначеЕсли РазделениеВключено И Не ИзменилосьРазделение Тогда
			НадписьПредупреждение = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
				НСтр("es='El trabajo con todos los recursos exteriores (la sincronización de los datos, el envío de los correos y así sucesivamente), cumplido por el horario, "
"es bloqueado para la prevención de los conflictos con la aplicación en el Internet. "
""
"<b> la aplicación era trasladada </b> "
""
"• Si la aplicación se usará para la gestión del recuento, presionen <b> la Aplicación es trasladado </b>. "
"• Si es la copia de la aplicación, presionen <b> Es la copia de la aplicación </b>. "
""
"%1';ru='Работа со всеми внешними ресурсами (синхронизация данных, отправка почты и т.п.), выполняемая по расписанию,"
"заблокирована для предотвращения конфликтов с приложением в Интернете."
""
"<b>Приложение было перемещено</b>"
""
"• Если приложение будет использоваться для ведения учета, нажмите <b>Приложение перемещено</b>."
"• Если это копия приложения, нажмите <b>Это копия приложения</b>."
""
"%1';en='Work with all external resources (data synchronization, sending mail, etc.), performed on schedule,"
"blocked to prevent conflicts with the application on the Internet."
""
"<b> The application has been moved </b>"
""
"• If the application will be used for accounting, click <b> Application Moved </b>."
"• If this is a copy of the application, click <b> This is a copy of the application </b>."
""
"%1'"),
				ТекстСнятияБлокировки);
		Иначе // Если РазделениеВключено И ИзменилосьРазделение
			НадписьПредупреждение = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
				НСтр("es='El trabajo con todos los recursos exteriores (la sincronización de los datos, el envío de los correos y así sucesivamente), cumplido por el horario, "
"es bloqueado para la prevención de los conflictos con la aplicación en el Internet. "
""
"<b> la aplicación era trasladada </b> "
""
"• Si la aplicación se usará para la gestión del recuento, presionen <b> la Aplicación es trasladado </b>. "
"• Si es la copia de la aplicación, presionen <b> Es la copia de la aplicación </b>. "
""
"%1';ru='Работа со всеми внешними ресурсами (синхронизация данных, отправка почты и т.п.), выполняемая по расписанию,"
"заблокирована для предотвращения конфликтов с приложением в Интернете."
""
"<b>Приложение было перемещено</b>"
""
"• Если приложение будет использоваться для ведения учета, нажмите <b>Приложение перемещено</b>."
"• Если это копия приложения, нажмите <b>Это копия приложения</b>."
""
"%1';en='Work with all external resources (data synchronization, sending mail, etc.), performed on schedule,"
"blocked to prevent conflicts with the application on the Internet."
""
"<b> The application has been moved </b>"
""
"• If the application will be used for accounting, click <b> Application Moved </b>."
"• If this is a copy of the application, click <b> This is a copy of the application </b>."
""
"%1'"),
				ТекстСнятияБлокировки);
		КонецЕсли;
		
		Элементы.НадписьПредупреждение.Заголовок = СтроковыеФункцииКлиентСервер.ФорматированнаяСтрока(НадписьПредупреждение);
		
		Если ОбщегоНазначения.ИнформационнаяБазаФайловая() Тогда
			Элементы.ФормаГруппаЕще.Видимость = Ложь;
		Иначе
			Элементы.ФормаПроверятьИмяСервера.Пометка = ПроверятьИмяСервера;
			Элементы.ФормаСправка.Видимость = Ложь;
		КонецЕсли;
		
	Иначе
		Элементы.ГруппаПараметрыФормы.ТекущаяСтраница = Элементы.ГруппаПараметрыБлокировки;
		Элементы.НадписьПредупреждение.Видимость = Ложь;
		Элементы.ЗаписатьИЗакрыть.КнопкаПоУмолчанию = Истина;
		Заголовок = НСтр("es='Los parámetros del bloqueo del trabajo con los recursos exteriores';ru='Параметры блокировки работы с внешними ресурсами';en='External resource blocking options'");
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура НадписьПредупреждениеОбработкаНавигационнойСсылки(Элемент, НавигационнаяСсылкаФорматированнойСтроки, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("СобытиеЖурналаРегистрации", ИмяСобытияЖурналаРегистрации);
	ОткрытьФорму("Обработка.ЖурналРегистрации.Форма.ЖурналРегистрации", ПараметрыФормы);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ИнформационнаяБазаПеремещена(Команда)
	
	РазрешитьРаботуСВнешнимиРесурсами();
	СтандартныеПодсистемыКлиент.УстановитьРасширенныйЗаголовокПриложения();
	ОбновитьИнтерфейс();
	Закрыть();
	
КонецПроцедуры

&НаКлиенте
Процедура ЭтоКопияИнформационнойБазы(Команда)
	
	ЗапретитьРаботуСВнешнимиРесурсами();
	СтандартныеПодсистемыКлиент.УстановитьРасширенныйЗаголовокПриложения();
	ОбновитьИнтерфейс();
	Закрыть();
	
КонецПроцедуры

&НаКлиенте
Процедура ПроверятьИмяСервера(Команда)
	
	ПроверятьИмяСервера = Не ПроверятьИмяСервера;
	Элементы.ФормаПроверятьИмяСервера.Пометка = ПроверятьИмяСервера;
	УстановитьПроверкуИмениСервераВПараметрыБлокировки(ПроверятьИмяСервера);
	
КонецПроцедуры

&НаКлиенте
Процедура ЗаписатьИЗакрыть(Команда)
	
	УстановитьПроверкуИмениСервераВПараметрыБлокировки(ПроверятьИмяСервера);
	Закрыть();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервереБезКонтекста
Процедура РазрешитьРаботуСВнешнимиРесурсами()
	
	БлокировкаРаботыСВнешнимиРесурсами.РазрешитьРаботуСВнешнимиРесурсами();
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ЗапретитьРаботуСВнешнимиРесурсами()
	
	БлокировкаРаботыСВнешнимиРесурсами.ЗапретитьРаботуСВнешнимиРесурсами();
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура УстановитьПроверкуИмениСервераВПараметрыБлокировки(ПроверятьИмяСервера)
	
	БлокировкаРаботыСВнешнимиРесурсами.УстановитьПроверкуИмениСервераВПараметрыБлокировки(ПроверятьИмяСервера);
	
КонецПроцедуры

#КонецОбласти
