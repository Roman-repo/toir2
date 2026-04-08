#Область ОбработчикиСобытий

Процедура ОбработкаПолученияФормы(ВидФормы, Параметры, ВыбраннаяФорма, ДополнительнаяИнформация, СтандартнаяОбработка)

	СтандартнаяОбработка = Ложь;
	ВызватьИсключение НСтр("es='Los ajustes de la autorización en 1С:Документообороте no son destinados a la presentación o la redacción.';ru='Настройки авторизации в 1С:Документообороте не предназначены для просмотра или редактирования.';en='Authorization settings in 1C: Document management are not intended for viewing or editing.'");

КонецПроцедуры

#КонецОбласти