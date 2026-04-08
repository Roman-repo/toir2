#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// Пропускаем инициализацию, чтобы гарантировать получение формы при передаче параметра "АвтоТест".
	Если Параметры.Свойство("АвтоТест") Тогда
		Возврат;
	КонецЕсли;
	
	Параметры.Свойство("ВычисляемоеВыражение", ВычисляемоеВыражение);
	Параметры.Свойство("ТипВыражения", ТипВыражения);
	
	Инструкция = "<html>
	|<style type=""text/css"">
	|	body {
	|		overflow:    auto;
	|		margin-top:  12px; 		 
	|		margin-left: 20px; 
	|		font-family: MS Shell Dlg, Microsoft Sans Serif, sans-serif; 
	|		font-size:   8pt;}
	|	table {
	|		width:       270px;  
	|		font-family: MS Shell Dlg, Microsoft Sans Serif, sans-serif; 
	|		font-size:   8pt;}
	|	td {vertical-align: top;}
	|	p {
	|		margin-top: 7px;}
	|</style>
	|<body>";
	
	Если ТипВыражения = "ПравилоВыгрузки"
		Или ТипВыражения = "ПравилоЗагрузки" Тогда
		
		Заголовок = НСтр("es='La expresión en la lengua empotrada';ru='Выражение на встроенном языке';en='Inline language expression'");
		
		Инструкция = Инструкция + "<p>" + 
			НСтр("es='El resultado del cálculo de la expresión en la lengua empotrada 1С:Предприятия "
"debe serse apropiado la propiedad <b> el Resultado </b> por la variable <b> los Parámetros </b>.';ru='Результат вычисления выражения на встроенном языке 1С:Предприятия"
"должен присваиваться свойству <b>Результат</b> переменной <b>Параметры</b>.';en='The result of evaluating the expression in the embedded language 1C: Enterprise"
"must be assigned to the <b> Result </b> property of the <b> Options </b> variable. '");
		
	ИначеЕсли ТипВыражения = "УсловиеПрименимостиПриВыгрузке" Тогда
			
		Заголовок = НСтр("es='La condición de la aplicabilidad de la regla';ru='Условие применимости правила';en='Rule applicability condition'");
		
		Инструкция = Инструкция + "<p>" + 
			НСтр("es='La expresión en la lengua empotrada 1С:Предприятия determina "
"la aplicabilidad gobernaba a la creación del objeto 1С:Документооборота en razon "
"del objeto de esta configuración. El resultado del cálculo debe serse apropiado la propiedad "
"<b> el Resultado </b>. <b> la Verdad </b> significa la aplicabilidad gobernaba, <b> la Mentira </b> – la inaplicabilidad. "
"La expresión es comprobada solamente para las reglas convenientes por los significados de los requisitos claves. "
"</p> <p> el Significado por reticencia: <b> la Verdad </b>.';ru='Выражение на встроенном языке 1С:Предприятия определяет"
"применимость правила при создании объекта 1С:Документооборота на основании "
"объекта этой конфигурации. Результат вычисления должен присваиваться свойству"
"<b>Результат</b>. <b>Истина</b> означает применимость правила, <b>Ложь</b> – неприменимость."
"Выражение проверяется только для правил, подходящих по значениям ключевых реквизитов."
"</p><p>Значение по умолчанию: <b>Истина</b>.';en='The expression in the embedded language 1C: Enterprise defines"
"applicability of the rule when creating the 1C: Document Management object based"
"object of this configuration. The result of the calculation must be assigned to the property."
"<b> Результат </b>. <b> Истина </b> means the applicability of the rule, <b> Ложь </b> - not applicable."
"The expression is checked only for rules matching the values of key details."
"</p> <p> Default: <b> Истина </b>.'") + "<p>";
		
	ИначеЕсли ТипВыражения = "УсловиеПрименимостиПриЗагрузке" Тогда
		
		Заголовок = НСтр("es='La condición de la aplicabilidad de la regla';ru='Условие применимости правила';en='Rule applicability condition'");
		
		Инструкция = Инструкция + "<p>" + 
			НСтр("es='La expresión en la lengua empotrada 1С:Предприятия determina "
"la aplicabilidad gobernaba a la creación del objeto de esta configuración en razon "
"del objeto 1С:Документооборота. El resultado del cálculo debe serse apropiado la propiedad "
"<b> el Resultado </b>. <b> la Verdad </b> significa la aplicabilidad gobernaba, <b> la Mentira </b> – la inaplicabilidad. "
"La expresión es comprobada solamente para las reglas convenientes por los significados de los requisitos claves. "
"</p> <p> el Significado por reticencia: <b> la Verdad </b>.';ru='Выражение на встроенном языке 1С:Предприятия определяет"
"применимость правила при создании объекта этой конфигурации на основании "
"объекта 1С:Документооборота. Результат вычисления должен присваиваться свойству"
"<b>Результат</b>. <b>Истина</b> означает применимость правила, <b>Ложь</b> – неприменимость."
"Выражение проверяется только для правил, подходящих по значениям ключевых реквизитов."
"</p><p>Значение по умолчанию: <b>Истина</b>.';en='The expression in the embedded language 1C: Enterprise defines"
"the applicability of the rule when creating an object of this configuration based on"
"Object 1C: Workflow. The result of the calculation must be assigned to the property."
"<b> Результат</b>. <b> Истина </b> means the applicability of the rule, <b> Ложь </b> - not applicable."
"The expression is checked only for rules matching the values of key details."
"</p> <p> Default: <b> Истина</b>.'") + "<p>";
		
	КонецЕсли;
	
	Инструкция = Инструкция + " " + НСтр("es='A los requisitos del objeto';ru='К реквизитам объекта';en='To the property details'") + " ";
	
	Если ТипВыражения = "ПравилоЗагрузки"
		Или ТипВыражения = "УсловиеПрименимостиПриЗагрузке" Тогда
		
		Инструкция = Инструкция + НСтр("es='1С:Документооборота';ru='1С:Документооборота';en='1C: Workflow'");
		СоставРеквизитов = Справочники.ПравилаИнтеграцииС1СДокументооборотом.
			ПолучитьРеквизитыОбъектаДокументооборота(Параметры.ТипОбъектаДокументооборота);
		
	Иначе // ПравилоВыгрузки, УсловиеПрименимостиПриВыгрузке
		
		Инструкция = Инструкция + НСтр("es='De esta configuración';ru='этой конфигурации';en='this configuration'");
		СоставРеквизитов = Справочники.ПравилаИнтеграцииС1СДокументооборотом.
			ПолучитьРеквизитыОбъектаПотребителя(Параметры.ТипОбъектаПотребителя);
			
	КонецЕсли;
		
	Инструкция = Инструкция + " " + 
		НСтр("es='Se puede dirigirse a través de la propiedad <b> la Fuente </b> por la variable <b> los Parámetros </b>. "
"Los requisitos de la fuente:';ru='можно обращаться через свойство <b>Источник</b> переменной <b>Параметры</b>."
"Реквизиты источника:';en='can be accessed through the <b> Source </b> property of the <b> Options </b> variable."
"Details of the source: '") 
		+ "</p><table>";
		
	Если (ТипВыражения = "ПравилоЗагрузки"
		Или ТипВыражения = "УсловиеПрименимостиПриЗагрузке") Тогда
		СоставРеквизитов.Сортировать("ДопРеквизит, Имя");
	Иначе
		СоставРеквизитов.Сортировать("ДополнительныйРеквизитОбъекта, Имя");
	КонецЕсли;
	
	ВыведенЗаголовокДопРеквизитов = Ложь;
	
	Для Каждого СтруктураРеквизита из СоставРеквизитов Цикл
		
		Если (ТипВыражения = "ПравилоЗагрузки"
			Или ТипВыражения = "УсловиеПрименимостиПриЗагрузке") Тогда
			ЭтоДопРеквизит = СтруктураРеквизита.ДопРеквизит;
		Иначе
			ЭтоДопРеквизит = СтруктураРеквизита.ДополнительныйРеквизитОбъекта;
		КонецЕсли;
		
		Если ЭтоДопРеквизит
			И Не ВыведенЗаголовокДопРеквизитов Тогда
			Инструкция = Инструкция + "<tr><td>";
			Инструкция = Инструкция + "<b>" + НСтр("es='Los requisitos adicionales:';ru='Дополнительные реквизиты:';en='Additional details:'") + "</b>";
			Инструкция = Инструкция + "</tr></td>";
			ВыведенЗаголовокДопРеквизитов = Истина;
		КонецЕсли;
			
		Если ЭтоДопРеквизит Тогда
			Если (ТипВыражения = "ПравилоЗагрузки"
				Или ТипВыражения = "УсловиеПрименимостиПриЗагрузке") Тогда
				ИмяРеквизита = СтрШаблон(НСтр("es='УИД: ""%1""';ru='УИД: ""%1""';en='PID: ""%1""'"), СтруктураРеквизита.ДопРеквизитID);
			Иначе
				ИмяРеквизита = СтрШаблон(НСтр("es='УИД: ""%1""';ru='УИД: ""%1""';en='PID: ""%1""'"), СтруктураРеквизита.Имя);
			КонецЕсли;
		Иначе
			ИмяРеквизита = СтруктураРеквизита.Имя;
		КонецЕсли;
		
		Инструкция = Инструкция + "<tr>";
		Если ТипЗнч(СтруктураРеквизита.Тип) = Тип("СписокЗначений")
			И СтруктураРеквизита.Тип.Количество() > 0
			И Лев(СтруктураРеквизита.Тип[0], 2) = "DM" Тогда
			Инструкция = Инструкция + "<td><a href=""#" + СтруктураРеквизита.Тип[0] + """>" 
				+ ИмяРеквизита + "</a></td>";
		Иначе
			Инструкция = Инструкция + "<td>" + ИмяРеквизита + "</td>";
		КонецЕсли;
		Если СтруктураРеквизита.Представление <> ИмяРеквизита Тогда
			Инструкция = Инструкция + "<td>" + СтруктураРеквизита.Представление + "</td>";
		КонецЕсли;
		Инструкция = Инструкция + "</tr>";
		
	КонецЦикла;
	
	Инструкция = Инструкция + "</table>";
	
	Инструкция = Инструкция + "</body></html>";
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура КомандаОчистить(Команда)
	
	ОписаниеОповещения = Новый ОписаниеОповещения("КомандаОчиститьЗавершение", ЭтаФорма);
	ТекстВопроса = НСтр("es='¿Queréis limpiar realmente la expresión introducida?';ru='Вы действительно хотите очистить введенное выражение?';en='Are you sure you want to clear the entered expression?'");
	ИнтеграцияС1СДокументооборотКлиент.ПоказатьВопросДаНет(ОписаниеОповещения, ТекстВопроса);
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаОК(Команда)
	
	Закрыть(ВычисляемоеВыражение);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РеквизитыПриНажатии(Элемент, ДанныеСобытия, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	Если Не ЗначениеЗаполнено(ДанныеСобытия.HRef) Тогда
		Возврат;
	КонецЕсли;
	
	Позиция = СтрНайти(ДанныеСобытия.HRef, "#", НаправлениеПоиска.СКонца);
	Ссылка = Сред(ДанныеСобытия.HRef, Позиция + 1);
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("Ссылка", Ссылка);
	
	ОткрытьФорму("Справочник.ПравилаИнтеграцииС1СДокументооборотом.Форма.ОписаниеВебСервисов", 
		ПараметрыФормы, ЭтаФорма,,,,, РежимОткрытияОкнаФормы.БлокироватьВесьИнтерфейс);
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаОчиститьЗавершение(Результат, Параметры) Экспорт
	
	Если Результат = КодВозвратаДиалога.Да Тогда
		Закрыть("");
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти