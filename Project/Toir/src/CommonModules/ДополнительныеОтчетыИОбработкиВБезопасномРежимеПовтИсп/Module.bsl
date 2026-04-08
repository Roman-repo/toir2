///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2019, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

#Область УстаревшиеПроцедурыИФункции

// Устарела. Будет удалена в следующей редакции библиотеки.
// Возвращает массив методов, которые могут быть выполнены расширением безопасного
// режима.
//
// Возвращаемое значение:
//   Массив - массив строк, в которых хранятся разрешенные методы.
//
Функция ПолучитьРазрешенныеМетоды() Экспорт
	
	Результат = Новый Массив();
	
	Возврат Новый ФиксированныйМассив(Результат);
	
КонецФункции

// Устарела. Будет удалена в следующей редакции библиотеки.
// Возвращает словарь синонимов видов разрешений дополнительных отчетов и обработок
// и их параметров (для отображения в пользовательском интерфейсе).
//
// Возвращаемое значение:
//  ФиксированноеСоответствие - ключи:
//    * Ключ - ТипXDTO - соответствующий виду разрешения,
//    * Значение - Структура - ключи:
//        * Представление - Строка - краткое представление вида разрешения,
//        * Описание - Строка - подробное описание вида разрешения,
//        * Параметры - ТаблицаЗначений - колонки:
//            * Имя - Строка - имя свойства, определенного для ТипаXDTO,
//            * Описание - Строка - описание последствий параметра разрешения для указанного значения параметра,
//        * ОписаниеЛюбогоЗначения - Строка - описание последствий параметра разрешения для неуказанного значения параметра.
//
Функция Словарь() Экспорт
	
	Результат = Новый Соответствие();
	
	// {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}GetFileFromInternet
	
	Представление = НСтр("es='La recepción de los datos de la red el Internet';ru='Получение данных из сети Интернет';en='Receive data from the Internet'");
	Описание = НСтр("es='Al informe adicional o el tratamiento estará permitido recibir los datos de la red el Internet';ru='Дополнительному отчету или обработке будет разрешено получать данные из сети Интернет';en='An additional report or processing will be allowed to receive data from the Internet'");
	
	Параметры = ТаблицаПараметров();
	ДобавитьПараметр(Параметры, "Host", НСтр("es='Del servidor %1';ru='с сервера %1';en='from server %1'"), НСтр("es='De cualquier servidor';ru='с любого сервера';en='from any server'"));
	ДобавитьПараметр(Параметры, "Protocol", НСтр("es='Por la acta %1';ru='по протоколу %1';en='by protocol%1'"), НСтр("es='Por cualquier acta';ru='по любому протоколу';en='by any protocol'"));
	ДобавитьПараметр(Параметры, "Port", НСтр("es='A través del puerto %1';ru='через порт %1';en='through port%1'"), НСтр("es='A través de cualquier puerto';ru='через любой порт';en='through any port'"));
	
	Значение = Новый Структура;
	Значение.Вставить("Представление", Представление);
	Значение.Вставить("Описание", Описание);
	Значение.Вставить("Параметры", Параметры);
	
	Результат.Вставить(
		ДополнительныеОтчетыИОбработкиВБезопасномРежимеИнтерфейс.ТипПолучениеДанныхИзИнтернет(),
		Значение);
	
	// Конец {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}GetFileFromInternet
	
	// {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}SendFileToInternet
	
	Представление = НСтр("es='La transferencia de los datos en la red el Internet';ru='Передача данных в сеть Интернет';en='Data transmission to the Internet'");
	Описание = НСтр("es='Al informe adicional o el tratamiento le estará permitido enviar los datos en la red el Internet';ru='Дополнительному отчету или обработке будет разрешено отправлять данные в сеть Интернет';en='An additional report or processing will be allowed to send data to the Internet'");
	Последствия = НСтр("es='¡La atención! El envío de los datos puede usarse potencialmente "
"por el informe adicional o el tratamiento para la realización de las acciones no supuestas por el administrador "
"de la base informativa. "
""
"Usen el informe dado adicional o el tratamiento solamente en caso de que se confiáis "
"a su elaborador y controlen las restricciones (el servidor, la acta y el puerto), puesto en "
"los permisos dados.';ru='Внимание! Отправка данных потенциально может использоваться дополнительным"
"отчетом или обработкой для совершения действий, не предполагаемых администратором"
"информационной базы."
""
"Используйте данный дополнительный отчет или обработку только в том случае, если доверяете"
"ее разработчику и контролируйте ограничения (сервер, протокол и порт), накладываемые на"
"выданные разрешения.';en='Warning! Sending data may potentially be used by additional"
"report or processing for actions not intended by the administrator"
"information base."
""
"Use this additional report or processing only if you trust"
"its developer and control the restrictions (server, protocol and port) imposed on"
"permissions issued.'");
	
	Параметры = ТаблицаПараметров();
	ДобавитьПараметр(Параметры, "Host", НСтр("es='Al servidor %1';ru='на сервер %1';en='to server %1'"), НСтр("es='En cualquiera del servidor';ru='на любой сервера';en='to any server'"));
	ДобавитьПараметр(Параметры, "Protocol", НСтр("es='Por la acta %1';ru='по протоколу %1';en='by protocol%1'"), НСтр("es='Por cualquier acta';ru='по любому протоколу';en='by any protocol'"));
	ДобавитьПараметр(Параметры, "Port", НСтр("es='A través del puerto %1';ru='через порт %1';en='through port%1'"), НСтр("es='A través de cualquier puerto';ru='через любой порт';en='through any port'"));
	
	Значение = Новый Структура;
	Значение.Вставить("Представление", Представление);
	Значение.Вставить("Описание", Описание);
	Значение.Вставить("Последствия", Последствия);
	Значение.Вставить("Параметры", Параметры);
	
	Результат.Вставить(
		ДополнительныеОтчетыИОбработкиВБезопасномРежимеИнтерфейс.ТипПередачаДанныхВИнтернет(),
		Значение);
	
	// Конец {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}SendFileToInternet
	
	// {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}SoapConnect
	
	Представление = НСтр("es='El recurso a los servicios web en la red el Internet';ru='Обращение к веб-сервисам в сети Интернет';en='Accessing web services on the Internet'");
	Описание = НСтр("es='Al informe adicional o el tratamiento estará permitido dirigirse a los servicios web situados en la red el Internet (es posible además como la recepción por el informe adicional o el tratamiento de la información de la red el Internet, y la transmisión.';ru='Дополнительному отчету или обработке будет разрешено обращаться к веб-сервисам, расположенным в сети Интернет (при этом возможно как получение дополнительным отчетом или обработкой информации из сети Интернет, так и передача.';en='An additional report or processing will be allowed to access web services located on the Internet (in this case, it is possible to receive an additional report or process information from the Internet, as well as transfer.'");
	Последствия = НСтр("es='¡La atención! El recurso a los servicios web puede usarse potencialmente "
"por el informe adicional o el tratamiento para la realización de las acciones no supuestas por el administrador "
"de la base informativa. "
""
"Usen el informe dado adicional o el tratamiento solamente en caso de que se confiáis "
"a su elaborador y controlen las restricciones (la dirección de la conexión), puesto en "
"los permisos dados.';ru='Внимание! Обращение к веб-сервисам потенциально может использоваться дополнительным"
"отчетом или обработкой для совершения действий, не предполагаемых администратором"
"информационной базы."
""
"Используйте данный дополнительный отчет или обработку только в том случае, если доверяете"
"ее разработчику и контролируйте ограничения (адрес подключения), накладываемые на"
"выданные разрешения.';en='Warning! Accessing web services could potentially be used by additional"
"report or processing for actions not intended by the administrator"
"information base."
""
"Use this additional report or processing only if you trust"
"its developer and control the restrictions (connection address) imposed on"
"permissions issued.'");
	
	Параметры = ТаблицаПараметров();
	ДобавитьПараметр(Параметры, "WsdlDestination", НСтр("es='A dirección de %1';ru='по адресу %1';en='at %1'"), НСтр("es='A cualquier dirección';ru='по любому адресу';en='to any address'"));
	
	Значение = Новый Структура;
	Значение.Вставить("Представление", Представление);
	Значение.Вставить("Описание", Описание);
	Значение.Вставить("Последствия", Последствия);
	Значение.Вставить("Параметры", Параметры);
	
	Результат.Вставить(
		ДополнительныеОтчетыИОбработкиВБезопасномРежимеИнтерфейс.ТипWSСоединение(),
		Значение);
	
	// Конец {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}SoapConnect
	
	// {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}CreateComObject
	
	Представление = НСтр("es='La creación del COM-objeto';ru='Создание COM-объекта';en='Creating a COM object'");
	Описание = НСтр("es='Al informe adicional o el tratamiento estará permitido usar los mecanismos del software exterior por medio de la COM-unión';ru='Дополнительному отчету или обработке будет разрешено использовать механизмы внешнего программного обеспечения с помощью COM-соединения';en='Additional report or processing will be allowed to use external software mechanisms using a COM connection'");
	Последствия = НСтр("es='¡La atención! El uso de los medios del software extraño puede usarse "
"por el informe adicional o el tratamiento para la realización de las acciones no supuestas por el administrador "
"de la base informativa, también para la visita no autorizada las restricciones puestas al tratamiento adicional "
"en el régimen seguro. "
""
"Usen el informe dado adicional o el tratamiento solamente en caso de que se confiáis "
"a su elaborador y controlen las restricciones (el identificador de programa), puesto en "
"los permisos dados.';ru='Внимание! Использование средств стороннего программного обеспечения может использоваться"
"дополнительным отчетом или обработкой для совершения действий, не предполагаемых администратором"
"информационной базы, а также для несанкционированного обхода ограничений, накладываемых на дополнительную обработку"
"в безопасном режиме."
""
"Используйте данный дополнительный отчет или обработку только в том случае, если доверяете"
"ее разработчику и контролируйте ограничения (программный идентификатор), накладываемые на"
"выданные разрешения.';en='Warning! Using third-party software tools may be used"
"additional report or processing to perform actions not intended by the administrator"
"information base, as well as for unauthorized circumvention of restrictions imposed on additional processing"
"in safe mode."
""
"Use this additional report or processing only if you trust"
"its developer and control the restrictions (program identifier) imposed on"
"permissions issued.'");
	
	Параметры = ТаблицаПараметров();
	ДобавитьПараметр(Параметры, "ProgId", НСтр("es='Con el identificador de programa %1';ru='с программным идентификатором %1';en='with program identifier %1'"), НСтр("es='Con cualquier identificador de programa';ru='с любым программным идентификатором';en='with any program identifier'"));
	
	Значение = Новый Структура;
	Значение.Вставить("Представление", Представление);
	Значение.Вставить("Описание", Описание);
	Значение.Вставить("Последствия", Последствия);
	Значение.Вставить("Параметры", Параметры);
	
	Результат.Вставить(
		ДополнительныеОтчетыИОбработкиВБезопасномРежимеИнтерфейс.ТипСозданиеCOMОбъекта(),
		Значение);
	
	// Конец {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}CreateComObject
	
	// {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}AttachAddin
	
	Представление = НСтр("es='La creación del objeto exterior al componente';ru='Создание объекта внешней компоненту';en='Creating an object to an external component'");
	Описание = НСтр("es='Al informe adicional o el tratamiento estará permitido usar los mecanismos del software exterior por medio de la creación del objeto de los componente exteriores suministrados en la maqueta la configuración';ru='Дополнительному отчету или обработке будет разрешено использовать механизмы внешнего программного обеспечения с помощью создания объекта внешней компоненты, поставляемой в макете конфигурации';en='Additional report or processing will be allowed to use external software mechanisms by creating an external component object supplied in the configuration layout.'");
	Последствия = НСтр("es='¡La atención! El uso de los medios del software extraño puede usarse "
"por el informe adicional o el tratamiento para la realización de las acciones no supuestas por el administrador "
"de la base informativa, también para la visita no autorizada las restricciones puestas al tratamiento adicional "
"en el régimen seguro. "
""
"Usen el informe dado adicional o el tratamiento solamente en caso de que se confiáis "
"a su elaborador y controlen las restricciones (el nombre de la maqueta, de que se cumple la conexión "
"de los componente exteriores), puesto en los permisos dados.';ru='Внимание! Использование средств стороннего программного обеспечения может использоваться"
"дополнительным отчетом или обработкой для совершения действий, не предполагаемых администратором"
"информационной базы, а также для несанкционированного обхода ограничений, накладываемых на дополнительную обработку"
"в безопасном режиме."
""
"Используйте данный дополнительный отчет или обработку только в том случае, если доверяете"
"ее разработчику и контролируйте ограничения (имя макета, из которого выполняется подключение внешней"
"компоненты), накладываемые на выданные разрешения.';en='Warning! Using third-party software tools may be used"
"additional report or processing to perform actions not intended by the administrator"
"information base, as well as for unauthorized circumvention of restrictions imposed on additional processing"
"in safe mode."
""
"Use this additional report or processing only if you trust"
"its developer and control the restrictions (the name of the layout from which the external connection is"
"components) superimposed on issued permits.'");
	
	Параметры = ТаблицаПараметров();
	ДобавитьПараметр(Параметры, "TemplateName", НСтр("es='De la maqueta %1';ru='из макета %1';en='from layout %1'"), НСтр("es='De cualquier maqueta';ru='из любого макета';en='from any layout'"));
	
	Значение = Новый Структура;
	Значение.Вставить("Представление", Представление);
	Значение.Вставить("Описание", Описание);
	Значение.Вставить("Последствия", Последствия);
	Значение.Вставить("Параметры", Параметры);
	
	Результат.Вставить(
		ДополнительныеОтчетыИОбработкиВБезопасномРежимеИнтерфейс.ТипПодключениеВнешнейКомпоненты(),
		Значение);
	
	// Конец {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}AttachAddin
	
	// {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}GetFileFromExternalSoftware
	
	Представление = НСтр("es='La recepción de los ficheros del objeto exterior';ru='Получение файлов из внешнего объекта';en='Retrieving files from an external object'");
	Описание = НСтр("es='Al informe adicional o el tratamiento estará permitido recibir los ficheros del software exterior (por ejemplo, por medio de la COM-unión o los componente exteriores)';ru='Дополнительному отчету или обработке будет разрешено получать файлы из внешнего программного обеспечения (например, с помощью COM-соединения или внешней компоненты)';en='Additional report or processing will be allowed to receive files from external software (for example, using a COM connection or an external component)'");
	
	Значение = Новый Структура;
	Значение.Вставить("Представление", Представление);
	Значение.Вставить("Описание", Описание);
	
	Результат.Вставить(
		ДополнительныеОтчетыИОбработкиВБезопасномРежимеИнтерфейс.ТипПолучениеФайлаИзВнешнегоОбъекта(),
		Значение);
	
	// Конец {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}GetFileFromExternalSoftware
	
	// {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}SendFileToExternalSoftware
	
	Представление = НСтр("es='La transmisión de los ficheros en el objeto exterior';ru='Передача файлов во внешний объект';en='Transferring files to an external object'");
	Описание = НСтр("es='Al informe adicional o el tratamiento le estará permitido entregar los ficheros al software exterior (por ejemplo, por medio de la COM-unión o los componente exteriores)';ru='Дополнительному отчету или обработке будет разрешено передавать файлы во внешнее программное обеспечение (например, с помощью COM-соединения или внешней компоненты)';en='Additional report or processing will be allowed to transfer files to external software (for example, using a COM connection or an external component)'");
	
	Значение = Новый Структура;
	Значение.Вставить("Представление", Представление);
	Значение.Вставить("Описание", Описание);
	
	Результат.Вставить(
		ДополнительныеОтчетыИОбработкиВБезопасномРежимеИнтерфейс.ТипПередачаФайлаВоВнешнийОбъект(),
		Значение);
	
	// Конец {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}SendFileToExternalSoftware
	
	// {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}SendFileToInternet
	
	Представление = НСтр("es='La realización de los documentos';ru='Проведение документов';en='Document posting'");
	Описание = НСтр("es='Al informe adicional o el tratamiento estará permitido cambiar el estado проведенности de los documentos';ru='Дополнительному отчету или обработке будет разрешено изменять состояние проведенности документов';en='Additional report or processing will be allowed to change the status of documents'");
	
	Параметры = ТаблицаПараметров();
	ДобавитьПараметр(Параметры, "DocumentType", НСтр("es='Los documentos con el tipo %1';ru='документы с типом %1';en='documents with type%1'"), НСтр("es='Cualesquiera documentos';ru='любые документы';en='any documents'"));
	ДобавитьПараметр(Параметры, "Action", НСтр("es='La acción permitida: %1';ru='разрешенное действие: %1';en='permitted action:%1'"), НСтр("es='Cualquier cambio del estado de la realización';ru='любое изменение состояния проведения';en='any change in state of conduct'"));
	
	Значение = Новый Структура;
	Значение.Вставить("Представление", Представление);
	Значение.Вставить("Описание", Описание);
	Значение.Вставить("Параметры", Параметры);
	Значение.Вставить("ОтображатьПользователю", Неопределено);
	
	Результат.Вставить(
		ДополнительныеОтчетыИОбработкиВБезопасномРежимеИнтерфейс.ТипПроведениеДокументов(),
		Значение);
	
	// Конец {http://www.1c.ru/1cFresh/ApplicationExtensions/Permissions/a.b.c.d}SendFileToInternet
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ДобавитьПараметр(Знач ТаблицаПараметров, Знач Имя, Знач Описание, Знач ОписаниеЛюбогоЗначения)
	
	Параметр = ТаблицаПараметров.Добавить();
	Параметр.Имя = Имя;
	Параметр.Описание = Описание;
	Параметр.ОписаниеЛюбогоЗначения = ОписаниеЛюбогоЗначения;
	
КонецПроцедуры

Функция ТаблицаПараметров()
	
	Результат = Новый ТаблицаЗначений();
	Результат.Колонки.Добавить("Имя", Новый ОписаниеТипов("Строка"));
	Результат.Колонки.Добавить("Описание", Новый ОписаниеТипов("Строка"));
	Результат.Колонки.Добавить("ОписаниеЛюбогоЗначения", Новый ОписаниеТипов("Строка"));
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти
