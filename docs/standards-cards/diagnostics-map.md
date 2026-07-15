# Индекс: стандарт ↔ диагностика

> Построено из [`docs/diagnostics/index.md`](https://github.com/zeegin/v8std/blob/main/docs/diagnostics/index.md) репозитория v8std.
> Показаны **только стандарты, имеющие автоматические диагностики** (120 из 317).
> Остальные 197 стандартов проверяются только ревью/вручную.

## Источники диагностик

| Инструмент | Кол-во диагностик | Назначение |
|---|---|---|
| **BSL Language Server** (`bslls:`) | 81 | Линтер для EDT/VSCode, realtime проверка |
| **SonarQube АПК/ACC** (`acc:`) | 445 | Качество кода на CI, накопительные метрики |
| **v8-code-style** (`v8cs:`) | 91 | Плагин EDT, проверка стиля |

## Карта «стандарт → диагностики»

| № | Стандарт | BSL LS | АПК/ACC | v8-code-style |
|---|---|---|---|---|
| [№400](https://github.com/zeegin/v8std/blob/main/docs/std/400.md) | Информирование пользователя | — | — | `v8cs:event-heandler-boolean-param` |
| [№402](https://github.com/zeegin/v8std/blob/main/docs/std/402.md) | Настройка расписания регламентных заданий | — | `acc:319` | `v8cs:scheduled-job-periodicity-too-short` |
| [№404](https://github.com/zeegin/v8std/blob/main/docs/std/404.md) | Открытие форм | — | `acc:346`, `acc:65` | `v8cs:export-method-in-command-form-module`, `v8cs:use-non-recommended-method` |
| [№409](https://github.com/zeegin/v8std/blob/main/docs/std/409.md) | Использование РеквизитФормыВЗначение и ДанныеФо... | `bslls:FormDataToValue` | `acc:68` | `v8cs:using-form-data-to-value` |
| [№412](https://github.com/zeegin/v8std/blob/main/docs/std/412.md) | Упорядочивание результатов запроса | `bslls:SelectTopWithoutOrderBy` | `acc:540` | — |
| [№418](https://github.com/zeegin/v8std/blob/main/docs/std/418.md) | Ограничение на использование метода Сообщить | `bslls:DeprecatedMessage` | `acc:69` | `v8cs:use-non-recommended-method` |
| [№432](https://github.com/zeegin/v8std/blob/main/docs/std/432.md) | Использование реквизитов строкового типа | — | `acc:1205` | — |
| [№434](https://github.com/zeegin/v8std/blob/main/docs/std/434.md) | Использование ключевых слов "ОБЪЕДИНИТЬ" и "ОБЪ... | `bslls:UnionAll` | `acc:96` | — |
| [№435](https://github.com/zeegin/v8std/blob/main/docs/std/435.md) | Ограничение на использование конструкции "ПОЛНО... | `bslls:FullOuterJoinQuery` | `acc:70` | — |
| [№437](https://github.com/zeegin/v8std/blob/main/docs/std/437.md) | Оформление текстов запросов | `bslls:AssignAliasFieldsInQuery`, `bslls:QueryParseError` | `acc:254` | — |
| [№439](https://github.com/zeegin/v8std/blob/main/docs/std/439.md) | Использование директив компиляции и инструкций ... | `bslls:CompilationDirectiveNeedLess`, `bslls:ParseError` | `acc:104`, `acc:547` | `v8cs:form-module-pragma` |
| [№440](https://github.com/zeegin/v8std/blob/main/docs/std/440.md) | Использование дублирующего кода | — | `acc:1343`, `acc:1344` | — |
| [№441](https://github.com/zeegin/v8std/blob/main/docs/std/441.md) | Общие требования к построению конструкций встро... | `bslls:CanonicalSpellingKeywords`, `bslls:CompareWithBoolean` | `acc:1248` | `v8cs:bsl-canonical-pragma` |
| [№444](https://github.com/zeegin/v8std/blob/main/docs/std/444.md) | Перенос выражений | `bslls:IncorrectLineBreak` | `acc:101`, `acc:102`, `acc:103` | — |
| [№450](https://github.com/zeegin/v8std/blob/main/docs/std/450.md) | Порядок записи движений документов | — | `acc:105` | — |
| [№451](https://github.com/zeegin/v8std/blob/main/docs/std/451.md) | Программное создание прикладных объектов | — | `acc:99` | — |
| [№453](https://github.com/zeegin/v8std/blob/main/docs/std/453.md) | Описание процедур и функций | `bslls:MissingParameterDescription`, `bslls:MissingReturnedValueDescription`, `bslls:PublicMethodsDescription` | `acc:1242`, `acc:1243`, `acc:1334`, `acc:1335`, `acc:1336`, `acc:1360`, `acc:1381`, `acc:1382`, `acc:222`, `acc:223`, `acc:288`, `acc:289`, `acc:388`, `acc:389`, `acc:399`, `acc:400`, `acc:401`, `acc:402`, `acc:403`, `acc:404`, `acc:405`, `acc:406`, `acc:407`, `acc:408`, `acc:409`, `acc:410`, `acc:416`, `acc:417`, `acc:459`, `acc:466` | `v8cs:doc-comment-export-procedure-description-section`, `v8cs:export-procedure-missing-comment` |
| [№454](https://github.com/zeegin/v8std/blob/main/docs/std/454.md) | Правила образования имен переменных | `bslls:ReservedParameterNames` | `acc:247`, `acc:248` | `v8cs:bsl-variable-name-invalid` |
| [№455](https://github.com/zeegin/v8std/blob/main/docs/std/455.md) | Структура модуля | `bslls:CodeOutOfRegion`, `bslls:CommonModuleMissingAPI`, `bslls:DuplicateRegion`, `bslls:EmptyRegion`, `bslls:EventHandlerInvalidSignature`, `bslls:EventHandlerOutsideEventRegion`, `bslls:MissingVariablesDescription`, `bslls:NonExportMethodsInApiRegion`, `bslls:NonStandardRegion` | `acc:1340`, `acc:1341`, `acc:1387`, `acc:239`, `acc:240`, `acc:241`, `acc:273`, `acc:274`, `acc:286`, `acc:425`, `acc:426`, `acc:427`, `acc:428`, `acc:429`, `acc:430` | `v8cs:invocation-form-event-handler`, `v8cs:module-region-empty`, `v8cs:module-structure-event-regions`, `v8cs:module-structure-form-event-regions`, `v8cs:module-structure-init-code-in-region`, `v8cs:module-structure-method-in-regions`, `v8cs:module-structure-top-region`, `v8cs:module-structure-var-in-region` |
| [№456](https://github.com/zeegin/v8std/blob/main/docs/std/456.md) | Тексты модулей | `bslls:ExcessiveAutoTestCheck`, `bslls:InvalidCharacterInFile`, `bslls:LineLength`, `bslls:OneStatementPerLine`, `bslls:SpaceAtStartComment`, `bslls:UnsafeFindByCode`, `bslls:UnusedLocalMethod`, `bslls:YoLetterUsage` | `acc:1244`, `acc:1339`, `acc:1353`, `acc:163`, `acc:217`, `acc:244`, `acc:246`, `acc:282`, `acc:284`, `acc:285`, `acc:433` | — |
| [№460](https://github.com/zeegin/v8std/blob/main/docs/std/460.md) | Использование управляемого режима блокировки | — | `acc:66`, `acc:67` | `v8cs:ql-using-for-update` |
| [№464](https://github.com/zeegin/v8std/blob/main/docs/std/464.md) | Обработчик события ПередЗаписью | `bslls:DataExchangeLoading` | `acc:75` | `v8cs:data-exchange-load` |
| [№465](https://github.com/zeegin/v8std/blob/main/docs/std/465.md) | Обработчик события ПриЗаписи | `bslls:DataExchangeLoading` | `acc:75` | `v8cs:data-exchange-load` |
| [№467](https://github.com/zeegin/v8std/blob/main/docs/std/467.md) | Общие требования к конфигурации | `bslls:OrdinaryAppSupport`, `bslls:WrongDataPathForFormElements` | `acc:1026`, `acc:1027`, `acc:1028`, `acc:1030`, `acc:1032`, `acc:1033`, `acc:1034`, `acc:1035`, `acc:1036`, `acc:1037`, `acc:1038`, `acc:1108`, `acc:1349`, `acc:1350`, `acc:1351`, `acc:1352`, `acc:1374`, `acc:216`, `acc:235`, `acc:265`, `acc:277`, `acc:278`, `acc:299`, `acc:321`, `acc:323`, `acc:324`, `acc:355`, `acc:376`, `acc:377`, `acc:379`, `acc:380`, `acc:470`, `acc:524`, `acc:525`, `acc:526`, `acc:527`, `acc:531`, `acc:557`, `acc:558`, `acc:559`, `acc:561`, `acc:562`, `acc:563`, `acc:564`, `acc:565`, `acc:566`, `acc:567`, `acc:568`, `acc:569`, `acc:570`, `acc:571`, `acc:572`, `acc:573`, `acc:574`, `acc:580`, `acc:581`, `acc:8`, `acc:82`, `acc:87` | `v8cs:db-object-max-number-length`, `v8cs:form-module-missing-pragma`, `v8cs:ql-like-expression-with-field`, `v8cs:redundant-export-method` |
| [№468](https://github.com/zeegin/v8std/blob/main/docs/std/468.md) | Пользовательские представления объектов | — | `acc:1210`, `acc:1211`, `acc:1213`, `acc:1214`, `acc:1215`, `acc:1216`, `acc:1217`, `acc:93` | `v8cs:md-list-object-presentation` |
| [№469](https://github.com/zeegin/v8std/blob/main/docs/std/469.md) | Правила создания общих модулей | `bslls:CommonModuleInvalidType`, `bslls:CommonModuleNameCached`, `bslls:CommonModuleNameClient`, `bslls:CommonModuleNameClientServer`, `bslls:CommonModuleNameFullAccess`, `bslls:CommonModuleNameGlobal`, `bslls:CommonModuleNameGlobalClient`, `bslls:CommonModuleNameServerCall`, `bslls:CommonModuleNameWords` | `acc:1245`, `acc:125`, `acc:363`, `acc:547`, `acc:73`, `acc:80`, `acc:83`, `acc:84`, `acc:85`, `acc:90` | `v8cs:common-module-name-cached`, `v8cs:common-module-name-client-cached`, `v8cs:common-module-name-full-access`, `v8cs:common-module-name-global-client`, `v8cs:common-module-name-server-call`, `v8cs:common-module-name-server-call-cached`, `v8cs:extension-md-object-prefix` |
| [№473](https://github.com/zeegin/v8std/blob/main/docs/std/473.md) | Использование кодов (номеров) объектов конфигур... | — | `acc:1206`, `acc:1209` | — |
| [№474](https://github.com/zeegin/v8std/blob/main/docs/std/474.md) | Имя, синоним, комментарий | `bslls:ForbiddenMetadataName`, `bslls:MetadataObjectNameLength`, `bslls:SameMetadataObjectAndChildNames` | `acc:1151`, `acc:1207`, `acc:1208`, `acc:1218`, `acc:347`, `acc:349`, `acc:350`, `acc:351`, `acc:352`, `acc:353`, `acc:354`, `acc:381`, `acc:5`, `acc:58`, `acc:6`, `acc:7`, `acc:8`, `acc:86` | `v8cs:md-standard-attribute-synonym-empty`, `v8cs:mdo-ru-name-unallowed-letter` |
| [№477](https://github.com/zeegin/v8std/blob/main/docs/std/477.md) | Самодостаточность регистров | — | `acc:123` | — |
| [№478](https://github.com/zeegin/v8std/blob/main/docs/std/478.md) | Подсказка и проверка заполнения | — | `acc:447`, `acc:59` | — |
| [№482](https://github.com/zeegin/v8std/blob/main/docs/std/482.md) | Заполнение свойств конфигурации информацией о в... | — | `acc:1201`, `acc:1202`, `acc:1203`, `acc:60`, `acc:61`, `acc:62`, `acc:63`, `acc:64`, `acc:72`, `acc:76` | — |
| [№483](https://github.com/zeegin/v8std/blob/main/docs/std/483.md) | Нумерация редакций и версий | — | `acc:1200`, `acc:71` | — |
| [№487](https://github.com/zeegin/v8std/blob/main/docs/std/487.md) | Минимизация количества серверных вызовов и трафика | `bslls:MissingTempStorageDeletion` | — | — |
| [№488](https://github.com/zeegin/v8std/blob/main/docs/std/488.md) | Стандартные роли | — | `acc:1046`, `acc:1149`, `acc:1150`, `acc:162`, `acc:164`, `acc:165`, `acc:192`, `acc:193`, `acc:194`, `acc:195`, `acc:218`, `acc:219`, `acc:220`, `acc:224`, `acc:251`, `acc:419`, `acc:420` | `v8cs:right-active-users`, `v8cs:right-administration`, `v8cs:right-all-functions-mode`, `v8cs:right-configuration-extensions-administration`, `v8cs:right-data-administration`, `v8cs:right-delete`, `v8cs:right-exclusive-mode`, `v8cs:right-interactive-open-external-data-processors`, `v8cs:right-interactive-open-external-reports`, `v8cs:right-output-to-printer-file-clipboard`, `v8cs:right-save-user-data`, `v8cs:right-start-automation`, `v8cs:right-start-external-connection`, `v8cs:right-start-thick-client`, `v8cs:right-start-thin-client`, `v8cs:right-start-web-client`, `v8cs:right-update-database-configuration`, `v8cs:right-view-event-log` |
| [№490](https://github.com/zeegin/v8std/blob/main/docs/std/490.md) | Блокировка данных объекта для редактирования из... | — | `acc:1327`, `acc:1328` | — |
| [№492](https://github.com/zeegin/v8std/blob/main/docs/std/492.md) | Обработчики событий модуля формы, подключаемые ... | — | `acc:100` | `v8cs:module-attachable-event-handler-name` |
| [№498](https://github.com/zeegin/v8std/blob/main/docs/std/498.md) | Использование Журнала регистрации | `bslls:UsageWriteLogEvent` | `acc:152`, `acc:153`, `acc:154`, `acc:156`, `acc:157`, `acc:161`, `acc:370`, `acc:371` | — |
| [№499](https://github.com/zeegin/v8std/blob/main/docs/std/499.md) | Перехват исключений в коде | `bslls:MissingCodeTryCatchEx`, `bslls:TryNumber`, `bslls:UsageWriteLogEvent` | `acc:1319`, `acc:1320`, `acc:280` | `v8cs:begin-transaction`, `v8cs:commit-transaction`, `v8cs:empty-except-statement`, `v8cs:lock-out-of-try`, `v8cs:rollback-transaction` |
| [№500](https://github.com/zeegin/v8std/blob/main/docs/std/500.md) | Общие правила построения интерфейсов | — | `acc:1134`, `acc:1135` | — |
| [№501](https://github.com/zeegin/v8std/blob/main/docs/std/501.md) | Общие интерфейсы | — | `acc:1133`, `acc:242` | — |
| [№503](https://github.com/zeegin/v8std/blob/main/docs/std/503.md) | Имя элемента управления | — | `acc:1241` | — |
| [№504](https://github.com/zeegin/v8std/blob/main/docs/std/504.md) | Изменения размера колонки табличного поля | — | `acc:1240` | — |
| [№505](https://github.com/zeegin/v8std/blob/main/docs/std/505.md) | Размеры формы | — | `acc:1224`, `acc:1225` | — |
| [№506](https://github.com/zeegin/v8std/blob/main/docs/std/506.md) | Подсказки | — | `acc:1136`, `acc:1238` | — |
| [№507](https://github.com/zeegin/v8std/blob/main/docs/std/507.md) | Использование флагов "Автовыбор незаполненного"... | — | `acc:1239` | — |
| [№511](https://github.com/zeegin/v8std/blob/main/docs/std/511.md) | Использование закладок | — | `acc:120` | — |
| [№515](https://github.com/zeegin/v8std/blob/main/docs/std/515.md) | Разделители | — | `acc:117`, `acc:118` | — |
| [№516](https://github.com/zeegin/v8std/blob/main/docs/std/516.md) | Кнопки | — | `acc:113`, `acc:114`, `acc:115` | — |
| [№524](https://github.com/zeegin/v8std/blob/main/docs/std/524.md) | Стили | — | `acc:1125`, `acc:1126`, `acc:1127`, `acc:1128`, `acc:1129`, `acc:1130`, `acc:1131`, `acc:1132`, `acc:1221`, `acc:1222` | — |
| [№531](https://github.com/zeegin/v8std/blob/main/docs/std/531.md) | Реквизит «Комментарий» у документов | — | `acc:108`, `acc:109` | `v8cs:md-object-attribute-comment-incorrect-type`, `v8cs:md-object-attribute-comment-not-exist` |
| [№532](https://github.com/zeegin/v8std/blob/main/docs/std/532.md) | Установка прав для новых объектов и полей объектов | — | `acc:145`, `acc:146` | — |
| [№534](https://github.com/zeegin/v8std/blob/main/docs/std/534.md) | Удаление устаревших объектов метаданных из конф... | — | `acc:1338`, `acc:1370`, `acc:1371`, `acc:236`, `acc:259`, `acc:375` | — |
| [№540](https://github.com/zeegin/v8std/blob/main/docs/std/540.md) | Общие требования к регламентным заданиям | — | `acc:302`, `acc:496` | — |
| [№542](https://github.com/zeegin/v8std/blob/main/docs/std/542.md) | Доступ к файловой системе из кода конфигурации | `bslls:FileSystemAccess`, `bslls:MissingTemporaryFileDeletion`, `bslls:TempFilesDir` | `acc:441`, `acc:495` | `v8cs:missing-temporary-file-deletion` |
| [№543](https://github.com/zeegin/v8std/blob/main/docs/std/543.md) | Использование подсистем | — | `acc:263`, `acc:264`, `acc:538` | — |
| [№544](https://github.com/zeegin/v8std/blob/main/docs/std/544.md) | Ограничения на использование экспортных процеду... | — | `acc:250` | `v8cs:export-method-in-command-form-module` |
| [№547](https://github.com/zeegin/v8std/blob/main/docs/std/547.md) | Ограничение на использование оператора Перейти | — | `acc:249`, `acc:89` | `v8cs:not-support-goto-operator-webclient`, `v8cs:use-goto-operator` |
| [№548](https://github.com/zeegin/v8std/blob/main/docs/std/548.md) | Формирование печатных форм | — | `acc:384` | — |
| [№551](https://github.com/zeegin/v8std/blob/main/docs/std/551.md) | Разработка конфигураций с повторным использован... | — | `acc:277`, `acc:278` | — |
| [№554](https://github.com/zeegin/v8std/blob/main/docs/std/554.md) | Переопределение общих модулей в условиях иерарх... | — | `acc:499`, `acc:500`, `acc:501`, `acc:502`, `acc:503`, `acc:505`, `acc:506` | — |
| [№585](https://github.com/zeegin/v8std/blob/main/docs/std/585.md) | Сообщения пользователю | — | `acc:1223`, `acc:374` | — |
| [№598](https://github.com/zeegin/v8std/blob/main/docs/std/598.md) | Тексты | — | `acc:163`, `acc:6`, `acc:7`, `acc:8` | — |
| [№630](https://github.com/zeegin/v8std/blob/main/docs/std/630.md) | Правила создания модулей форм | — | `acc:78` | `v8cs:export-method-in-command-form-module` |
| [№639](https://github.com/zeegin/v8std/blob/main/docs/std/639.md) | Использование переменных в программных модулях | `bslls:ExportVariables` | — | — |
| [№640](https://github.com/zeegin/v8std/blob/main/docs/std/640.md) | Параметры процедур и функций | `bslls:ExtraCommas`, `bslls:MissedRequiredParameter`, `bslls:NestedFunctionInParameters`, `bslls:NumberOfOptionalParams`, `bslls:NumberOfParams`, `bslls:OrderOfParams` | `acc:134`, `acc:1383`, `acc:1386`, `acc:141`, `acc:142`, `acc:267`, `acc:269`, `acc:271`, `acc:287`, `acc:293`, `acc:294`, `acc:295`, `acc:548`, `acc:549` | `v8cs:method-optional-parameter-before-required`, `v8cs:method-too-many-params` |
| [№642](https://github.com/zeegin/v8std/blob/main/docs/std/642.md) | Длительные операции на сервере | `bslls:MissingTempStorageDeletion` | — | — |
| [№643](https://github.com/zeegin/v8std/blob/main/docs/std/643.md) | Работа в разных часовых поясах | — | `acc:143` | `v8cs:use-non-recommended-method` |
| [№644](https://github.com/zeegin/v8std/blob/main/docs/std/644.md) | Обеспечение совместимости библиотек | `bslls:CachedPublic` | `acc:277`, `acc:278`, `acc:458`, `acc:468`, `acc:469`, `acc:473`, `acc:474`, `acc:475`, `acc:476` | `v8cs:deprecated-procedure-outside-deprecated-region` |
| [№647](https://github.com/zeegin/v8std/blob/main/docs/std/647.md) | Имена процедур и функций | `bslls:FunctionNameStartsWithGet` | `acc:307` | — |
| [№648](https://github.com/zeegin/v8std/blob/main/docs/std/648.md) | Ответственное чтение данных | — | `acc:1327`, `acc:1328` | — |
| [№654](https://github.com/zeegin/v8std/blob/main/docs/std/654.md) | Разыменование ссылочных полей составного типа в... | — | `acc:1377` | — |
| [№655](https://github.com/zeegin/v8std/blob/main/docs/std/655.md) | Ограничения на соединения с вложенными запросам... | `bslls:JoinWithSubQuery`, `bslls:JoinWithVirtualTable` | `acc:494` | — |
| [№657](https://github.com/zeegin/v8std/blob/main/docs/std/657.md) | Обращения к виртуальным таблицам | `bslls:VirtualTableCallWithoutParameters` | — | `v8cs:ql-virtual-table-filters` |
| [№658](https://github.com/zeegin/v8std/blob/main/docs/std/658.md) | Эффективные условия запросов | — | — | `v8cs:ql-constants-in-binary-operation` |
| [№667](https://github.com/zeegin/v8std/blob/main/docs/std/667.md) | Элементы стиля | `bslls:StyleElementConstructors` | `acc:1326`, `acc:1331`, `acc:1332`, `acc:1333`, `acc:1345`, `acc:1346`, `acc:1347` | `v8cs:new-color`, `v8cs:new-font` |
| [№669](https://github.com/zeegin/v8std/blob/main/docs/std/669.md) | Ограничение на выполнение внешнего кода | `bslls:UsingExternalCodeTools` | `acc:1324`, `acc:472`, `acc:552`, `acc:553`, `acc:554`, `acc:555`, `acc:556` | — |
| [№674](https://github.com/zeegin/v8std/blob/main/docs/std/674.md) | Заголовок отчета | — | — | `v8cs:data-composition-variant-name-default` |
| [№678](https://github.com/zeegin/v8std/blob/main/docs/std/678.md) | Безопасность прикладного программного интерфейс... | `bslls:SetPrivilegedMode` | — | — |
| [№680](https://github.com/zeegin/v8std/blob/main/docs/std/680.md) | Поддержка толстого клиента, управляемое приложе... | — | `acc:256`, `acc:361`, `acc:362` | `v8cs:module-accessibility-at-client` |
| [№686](https://github.com/zeegin/v8std/blob/main/docs/std/686.md) | Работа с параметром "Отказ" в обработчиках событий | `bslls:UsingCancelParameter` | `acc:144` | `v8cs:event-heandler-boolean-param` |
| [№689](https://github.com/zeegin/v8std/blob/main/docs/std/689.md) | Настройка ролей и прав доступа | — | `acc:1375`, `acc:226`, `acc:227`, `acc:228`, `acc:229`, `acc:232`, `acc:233`, `acc:234`, `acc:290`, `acc:291`, `acc:336`, `acc:359`, `acc:360`, `acc:375`, `acc:419`, `acc:420`, `acc:421`, `acc:422`, `acc:423`, `acc:424`, `acc:442`, `acc:443`, `acc:507`, `acc:508`, `acc:510`, `acc:511`, `acc:512`, `acc:513`, `acc:541` | `v8cs:document-post-in-privileged-mode`, `v8cs:functional-option-privileged-get-mode`, `v8cs:using-isinrole` |
| [№690](https://github.com/zeegin/v8std/blob/main/docs/std/690.md) | Обработчики обновления информационной базы | — | `acc:1363` | — |
| [№693](https://github.com/zeegin/v8std/blob/main/docs/std/693.md) | Использование объектов типа Структура | `bslls:NumberOfValuesInStructureConstructor` | `acc:293`, `acc:294`, `acc:295` | — |
| [№697](https://github.com/zeegin/v8std/blob/main/docs/std/697.md) | Использование предопределенных элементов | — | `acc:1149`, `acc:192`, `acc:193`, `acc:194`, `acc:195`, `acc:304`, `acc:305` | — |
| [№700](https://github.com/zeegin/v8std/blob/main/docs/std/700.md) | Установка внешних компонент и расширений платформы | — | `acc:1348`, `acc:150` | — |
| [№702](https://github.com/zeegin/v8std/blob/main/docs/std/702.md) | Реквизит Ссылка и признак "Использовать всегда"... | — | `acc:148`, `acc:149`, `acc:160` | `v8cs:form-list-field-ref-not-added`, `v8cs:form-list-ref-use-always-flag-disabled`, `v8cs:form-list-ref-user-visibility-enabled` |
| [№703](https://github.com/zeegin/v8std/blob/main/docs/std/703.md) | Ограничение на использование модальных окон и с... | — | — | `v8cs:dont-use-modality-mode` |
| [№705](https://github.com/zeegin/v8std/blob/main/docs/std/705.md) | Отнесение объектов библиотек к подсистемам | — | `acc:1147` | — |
| [№710](https://github.com/zeegin/v8std/blob/main/docs/std/710.md) | Условное оформление в формах | — | `acc:386`, `acc:387` | `v8cs:data-composition-conditional-appearance-use` |
| [№712](https://github.com/zeegin/v8std/blob/main/docs/std/712.md) | Панель разделов | — | `acc:311` | `v8cs:subsystem-synonym-too-long` |
| [№714](https://github.com/zeegin/v8std/blob/main/docs/std/714.md) | Навигация внутри раздела | — | `acc:313` | — |
| [№723](https://github.com/zeegin/v8std/blob/main/docs/std/723.md) | Особенности разработки конфигураций для ОС Linu... | — | `acc:1365`, `acc:1366` | — |
| [№724](https://github.com/zeegin/v8std/blob/main/docs/std/724.md) | Использование модулей с повторным использование... | — | `acc:435`, `acc:436`, `acc:437`, `acc:438`, `acc:439`, `acc:444` | — |
| [№726](https://github.com/zeegin/v8std/blob/main/docs/std/726.md) | Особенности использования в запросах оператора ... | `bslls:UsingLikeInQuery` | — | `v8cs:ql-constants-in-binary-operation` |
| [№728](https://github.com/zeegin/v8std/blob/main/docs/std/728.md) | Ограничения на использование реквизитов составн... | — | `acc:1329`, `acc:1330` | `v8cs:db-object-anyref-type`, `v8cs:db-object-ref-non-ref-type` |
| [№733](https://github.com/zeegin/v8std/blob/main/docs/std/733.md) | Эффективное обращение к виртуальной таблице «Ос... | `bslls:VirtualTableCallWithoutParameters` | — | — |
| [№737](https://github.com/zeegin/v8std/blob/main/docs/std/737.md) | Проверка прав доступа | `bslls:IsInRoleMethod` | `acc:336`, `acc:341`, `acc:393`, `acc:394`, `acc:395`, `acc:457`, `acc:460`, `acc:461`, `acc:514`, `acc:515` | `v8cs:form-item-visible-settings-by-roles`, `v8cs:using-isinrole` |
| [№740](https://github.com/zeegin/v8std/blob/main/docs/std/740.md) | Безопасное хранение паролей | `bslls:UsingHardcodeSecretInformation` | `acc:345` | `v8cs:unsafe-password-ib-storage` |
| [№741](https://github.com/zeegin/v8std/blob/main/docs/std/741.md) | Открытие параметризированных форм | — | — | `v8cs:optional-form-parameter-access`, `v8cs:unknown-form-parameter-access` |
| [№744](https://github.com/zeegin/v8std/blob/main/docs/std/744.md) | История выбора при вводе | — | `acc:412`, `acc:413`, `acc:414` | — |
| [№746](https://github.com/zeegin/v8std/blob/main/docs/std/746.md) | Обработчики событий ОбработкаПолученияПредставл... | — | — | `v8cs:module-accessibility-at-client` |
| [№748](https://github.com/zeegin/v8std/blob/main/docs/std/748.md) | Таймауты при работе с внешними ресурсами | `bslls:TimeoutsInExternalResources` | `acc:397`, `acc:398` | — |
| [№752](https://github.com/zeegin/v8std/blob/main/docs/std/752.md) | Обработчик события ПередУдалением | `bslls:DataExchangeLoading` | `acc:75` | `v8cs:data-exchange-load` |
| [№759](https://github.com/zeegin/v8std/blob/main/docs/std/759.md) | Несущественные предупреждения проверки конфигур... | — | `acc:561`, `acc:562`, `acc:563`, `acc:564`, `acc:565`, `acc:566`, `acc:567`, `acc:568`, `acc:569`, `acc:570`, `acc:571`, `acc:572`, `acc:573`, `acc:574` | — |
| [№760](https://github.com/zeegin/v8std/blob/main/docs/std/760.md) | Ограничения на регламентные задания при работе ... | — | `acc:453`, `acc:454`, `acc:455` | — |
| [№761](https://github.com/zeegin/v8std/blob/main/docs/std/761.md) | Интерфейсные тексты в коде: требования по локал... | — | `acc:1297`, `acc:1298`, `acc:1299`, `acc:1354`, `acc:1355`, `acc:1356`, `acc:1357`, `acc:1358`, `acc:1359`, `acc:492` | — |
| [№762](https://github.com/zeegin/v8std/blob/main/docs/std/762.md) | Запросы, динамические списки и отчеты на СКД: т... | — | `acc:1297`, `acc:1298`, `acc:1299`, `acc:1300`, `acc:1354`, `acc:320`, `acc:462`, `acc:463`, `acc:465`, `acc:491` | — |
| [№763](https://github.com/zeegin/v8std/blob/main/docs/std/763.md) | Форматирование даты, числа, Булево: требования ... | — | `acc:1367`, `acc:1368`, `acc:1369`, `acc:335` | — |
| [№764](https://github.com/zeegin/v8std/blob/main/docs/std/764.md) | Строковые константные выражения в коде: требова... | — | `acc:1297`, `acc:1298`, `acc:1299`, `acc:1354`, `acc:334` | — |
| [№765](https://github.com/zeegin/v8std/blob/main/docs/std/765.md) | Элементы форм: требования по локализации | — | `acc:445`, `acc:446`, `acc:447`, `acc:448`, `acc:464` | `v8cs:form-dynamic-list-item-title`, `v8cs:input-field-list-choice-mode` |
| [№766](https://github.com/zeegin/v8std/blob/main/docs/std/766.md) | Макеты: требования по локализации и поддержке р... | — | `acc:1361`, `acc:450`, `acc:497` | — |
| [№767](https://github.com/zeegin/v8std/blob/main/docs/std/767.md) | Регламентные задания: требования по локализации | — | `acc:449` | `v8cs:mdo-scheduled-job-description` |
| [№768](https://github.com/zeegin/v8std/blob/main/docs/std/768.md) | Программное переопределение текстов запросов ди... | — | `acc:482`, `acc:483`, `acc:484` | — |
| [№770](https://github.com/zeegin/v8std/blob/main/docs/std/770.md) | Ограничения на использование Выполнить и Вычисл... | `bslls:DisableSafeMode`, `bslls:ExecuteExternalCode`, `bslls:ExecuteExternalCodeInCommonModule` | `acc:486`, `acc:487`, `acc:488`, `acc:489`, `acc:490` | `v8cs:server-execution-safe-mode` |
| [№771](https://github.com/zeegin/v8std/blob/main/docs/std/771.md) | Интеграция прикладных решений через формат Ente... | — | `acc:518`, `acc:519`, `acc:520` | — |
| [№773](https://github.com/zeegin/v8std/blob/main/docs/std/773.md) | Использование признака ОбменДанными.Загрузка в ... | `bslls:DataExchangeLoading` | `acc:75` | `v8cs:data-exchange-load` |
| [№774](https://github.com/zeegin/v8std/blob/main/docs/std/774.md) | Безопасность запуска приложений | `bslls:FileSystemAccess` | `acc:534` | — |
| [№775](https://github.com/zeegin/v8std/blob/main/docs/std/775.md) | Безопасность программного обеспечения, вызываем... | — | `acc:536`, `acc:537` | — |
| [№783](https://github.com/zeegin/v8std/blob/main/docs/std/783.md) | Транзакции: правила использования | `bslls:PairingBrokenTransaction`, `bslls:WrongUseOfRollbackTransactionMethod` | `acc:1319`, `acc:1320`, `acc:325`, `acc:326`, `acc:327`, `acc:328`, `acc:329`, `acc:330`, `acc:331`, `acc:332`, `acc:415`, `acc:478`, `acc:521` | `v8cs:begin-transaction`, `v8cs:commit-transaction`, `v8cs:lock-out-of-try`, `v8cs:rollback-transaction` |
| [№784](https://github.com/zeegin/v8std/blob/main/docs/std/784.md) | Автогенерированные данные в информационной базе... | — | `acc:1385`, `acc:152`, `acc:153`, `acc:154`, `acc:156`, `acc:157`, `acc:161`, `acc:370`, `acc:371` | — |

## Как пользоваться

- **При ревью кода**: увидев нарушение стандарта, проверьте, есть ли у него диагностика. Если есть — нарушение должно ловиться автоматикой, а не глазами.
- **При настройке CI**: включите диагностики из нужных стандартов в профиль SonarQube/BSL LS. Нарушения блокирующих стандартов → `Critical`/`Blocker`.
- **При выборе стандарта для применения**: стандарты с `bslls:`-диагностикой предпочтительнее — их нарушение видно прямо в редакторе.
