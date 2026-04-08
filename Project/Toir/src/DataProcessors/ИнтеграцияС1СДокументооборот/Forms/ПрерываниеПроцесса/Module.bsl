#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ТекстСообщения = НСтр("es='Será cumplida la interrupción del proceso y sus tareas no cumplidas. "
"Los estados de los documentos establecidos por este proceso, serán limpiados. "
""
"¡La atención! Todos los cambios hechos serán irreversibles.';ru='Будет выполнено прерывание процесса и его невыполненных задач."
"Состояния документов, установленные этим процессом, будут очищены."
""
"Внимание! Все внесенные изменения будут необратимыми.';en='The process and its outstanding tasks will be interrupted."
"Document states established by this process will be cleared."
""
"Attention! All changes will be irreversible.'");
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ПрерватьПроцесс(Команда)
	
	Закрыть(Истина);
	
КонецПроцедуры

&НаКлиенте
Процедура Отмена(Команда)
	
	Закрыть(Ложь);
	
КонецПроцедуры

#КонецОбласти

