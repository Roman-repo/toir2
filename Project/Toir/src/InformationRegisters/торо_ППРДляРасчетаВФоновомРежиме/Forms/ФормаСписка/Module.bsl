
#Область ОбработчикиСобытийЭлементовТаблицыФормыСписок

&НаКлиенте
Процедура СписокПередНачаломДобавления(Элемент, Отказ, Копирование, Родитель, Группа, Параметр)
	
	ТекстСообщения = НСтр("es='La adición de las anotaciones es imposible. Es necesario usar Para esto la orden ""Contar... (La tarea de fondo)"" el documento ППР';ru='Добавление записей невозможно. Для этого необходимо использовать команду ""Рассчитать ... (фоновое задание)"" документа ППР';en='Adding entries is not possible. To do this, use the ""Calculate ... (background task)"" command of the PPM document'");
	ОбщегоНазначенияКлиент.СообщитьПользователю(ТекстСообщения,,,,Отказ);

КонецПроцедуры

#КонецОбласти