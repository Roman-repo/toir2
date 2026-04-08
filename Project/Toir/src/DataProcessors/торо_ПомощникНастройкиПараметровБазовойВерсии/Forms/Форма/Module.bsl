
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если Параметры.Свойство("АвтоТест") Тогда // Возврат при получении формы для анализа.
		Возврат;
	КонецЕсли;

	ТекстСообщения = НСтр("es='El ayudante del ajuste de la versión básica es destinado solamente al relleno inicial de la base informativa durante el primer lanzamiento.';ru='Помощник настройки базовой версии предназначен только для первоначального заполнения информационной базы при первом запуске.';en='The base version configuration assistant is intended only for the initial filling of the infobase at the first start.'");
	ОбщегоНазначения.СообщитьПользователю(ТекстСообщения,,,, Отказ);
	Возврат;
КонецПроцедуры

#КонецОбласти