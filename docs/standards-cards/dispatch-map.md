# Карта диспетчеризации: сигнал → карточки правил

> **Индекс-маршрутизатор.** Открывается в начале каждой задачи и при самопроверке.
> Это не контент, а таблица «что я вижу/делаю → какие карточки открыть».

## Как пользоваться

1. **Перед задачей** — **сначала** пройдите гейт-чек-лист ниже, **затем** — таблицу A.
2. **При написании кода** — заметили симптом из таблицы B — откройте указанные карточки.
3. **После написания** — прогоните по [thin-triggers.md](./thin-triggers.md) (компактный чек-лист тонких триггеров).

Карточки лежат в `docs/standards-cards/` (стандарты v8std) и `docs/standards-cards/practice/` (практика кодирования).

---

## 🔴 Гейт-чек-лист (пройти ОБЯЗАТЕЛЬНО перед этапом 2 «Реализация»)

> Этот блок создан после инцидента: при разработке обработки `торо_ЗагрузкаНоменклатурыИзExcel`
> были пропущены `module-templates.md` и `metadata-xml.md` — отсутствующие области в модуле
> формы (№630) и UUID-плейсхолдеры всплыли только при импорте в EDT. Гейт заставляет пройти
> по явному списку, а не «по памяти».

Для **каждого** утверждения, подходящего под задачу, — отметить и открыть карточку.

| Условие задачи | Открыть карточки | Что проверить |
|---|---|---|
| ☐ Создаётся **новый объект** метаданных (справочник, документ, обработка, регистр) | [metadata.md](./metadata.md) №474, №649 · [metadata-xml.md](./practice/metadata-xml.md) · [module-templates.md](./practice/module-templates.md) | Случайные UUID (не плейсхолдеры!), синоним ru/en, структура модуля |
| ☐ Создаётся/правится **форма** | [forms.md](./forms.md) №629, №630 · [module-templates.md](./practice/module-templates.md) · [typical-forms-new.md](./practice/typical-forms-new.md) | 5 обязательных областей, бизнес-логика вне формы |
| ☐ **Правка XML** формы/объекта (`.form`/`.mdo`) вручную | [metadata-xml.md](./practice/metadata-xml.md) | `LineNumber`, `PagesGroupExtInfo`, `<enabled>` у Page, уникальность UUID |
| ☐ Есть **запись/проведение** документа или массовая запись | [events.md](./events.md) №450, №464 · [locks-transactions.md](./practice/locks-transactions.md) · [registers-design.md](./practice/registers-design.md) | Шаблон транзакции, блокировки, `ПроверитьЗаполнение()` |
| ☐ Есть **запросы** | [queries.md](./queries.md) №436, №656 | Нет запроса в цикле, перечислены поля |
| ☐ **Чтение/запись данных** справочников/документов | [language.md](./language.md) №648 · [ЧекЛистКодРевью §5](../code-review/ЧекЛистКодРевью.md) | Точечное чтение, `ЗначенияРеквизитовОбъекта` вместо `.ПолучитьОбъект()` |
| ☐ Работа с **файлами/сетью** | [integration.md](./integration.md) · [language.md](./language.md) №542 | Только спецкаталог, таймауты, вне транзакции |
| ☐ Есть **команды формы**, модифицирующие данные | [typical-forms-new.md](./practice/typical-forms-new.md) | Флаг `modifiesStoredData` (Изменяет сохраняемые данные) |
| ☐ Есть **исключения/перехват** (`Попытка/Исключение`) | [logging.md](./logging.md) №499, №790 | Логирование, не молчаливый перехват |

**Правило:** ни одно подходящее утверждение не должно остаться неотмеченным. Если отмечено — карточка открыта и прочитана, а не просто «посмотрел по названию».

---

## Таблица A. По типу работы (явный выбор)

| Тип работы / объект | Стандарты (v8std) | Практика |
|---|---|---|
| **Запрос, СКД, динамический список** | [queries.md](./queries.md) | — |
| **Отчёт на СКД (создание/ревью)** | [reports.md](./reports.md) | [dcs-design.md](./practice/dcs-design.md) |
| **Динамический список (тормозит)** | [performance.md](./performance.md) №489, №732 · [queries.md](./queries.md) №655, №733 | — |
| **Форма (создание новой)** | [forms.md](./forms.md) №629, №630 | [typical-forms-new.md](./practice/typical-forms-new.md) · [module-templates.md](./practice/module-templates.md) |
| **Форма (доработка типовой БСП)** | [forms.md](./forms.md) | [typical-forms-mod.md](./practice/typical-forms-mod.md) |
| **Форма (правка XML `.form`)** | — | [metadata-xml.md](./practice/metadata-xml.md) |
| **Общий модуль (создание)** | [metadata.md](./metadata.md) №469, №486 · [language.md](./language.md) №455 | [module-templates.md](./practice/module-templates.md) |
| **Модуль объекта/менеджера** | [metadata.md](./metadata.md) №486 · [events.md](./events.md) | [module-templates.md](./practice/module-templates.md) |
| **Документ (проведение, движения)** | [events.md](./events.md) №450, №464, №465 · [language.md](./language.md) №783 | [locks-transactions.md](./practice/locks-transactions.md) · [registers-design.md](./practice/registers-design.md) |
| **Регистр (создание/реструктуризация)** | [metadata.md](./metadata.md) №477, №649, №633 | [registers-design.md](./practice/registers-design.md) |
| **Регистр (RLS, права)** | [security.md](./security.md) №532, №689 | [registers-design.md](./practice/registers-design.md) §10 |
| **Регламентное задание** | [scheduled.md](./scheduled.md) | — |
| **Печатная форма** | [reports.md](./reports.md) №548, №789 | — |
| **Обмен данными / интеграция** | [integration.md](./integration.md) | — |
| **Локализация (многоязычность)** | [localization.md](./localization.md) | — |
| **Права, роли, RLS** | [security.md](./security.md) | — |
| **Расширение (CFE)** | — | [extensions-cfe.md](./practice/extensions-cfe.md) |
| **Асинхронный код (`Асинх`/`Ждать`)** | [forms.md](./forms.md) №703 | [async-await.md](./practice/async-await.md) |
| **Командный интерфейс, кнопки** | [ui.md](./ui.md) | — |
| **Стилистика, цвета, шрифты** | [ux.md](./ux.md) | — |
| **Журналирование, исключения** | [logging.md](./logging.md) | — |
| **Архитектура (где разместить логику)** | [patterns.md](./patterns.md) (SOLID/GRASP) | — |

---

## Таблица B. По сигналу в коде (симптом → карточки)

| Симптом / паттерн в коде | Открыть |
|---|---|
| `Движения.X` / `ОбработкаПроведения` | [locks-transactions.md](./practice/locks-transactions.md) · [registers-design.md](./practice/registers-design.md) · [events.md](./events.md) №450 |
| `СрезПоследних` / `Остатки` в запросе | [queries.md](./queries.md) №733, №657 · [registers-design.md](./practice/registers-design.md) §7 |
| `.Ссылка.` / `.Регистратор.` в запросе | [queries.md](./queries.md) №732 |
| `НЕ ... В (ВЫБРАТЬ...)` (анти-соединение) | [queries.md](./queries.md) №655 |
| `Сообщить(...)` | [ux.md](./ux.md) №418 · [forms.md](./forms.md) №400 |
| `ОткрытьФормуМодально` / `Предупреждение` | [async-await.md](./practice/async-await.md) · [forms.md](./forms.md) №703 |
| `Асинх Процедура ПриОткрытии` / `ПередЗакрытием` | [async-await.md](./practice/async-await.md) §правило 2 |
| `&НаСервере` (контекстный вызов) | [performance.md](./performance.md) №636 |
| `.ПолучитьОбъект()` для чтения | [language.md](./language.md) №648 |
| `Текст = Текст + ...` в цикле | [language.md](./language.md) №782 |
| `Попытка...Исключение` без лога | [logging.md](./logging.md) №499 |
| `Выполнить(...)` / `Вычислить(...)` | [security.md](./security.md) №770 |
| `УстановитьПривилегированныйРежим(Истина)` | [security.md](./security.md) №485 |
| `НСтр(...)` / пользовательские тексты | [localization.md](./localization.md) №761, №764 |
| Правка `.form` / `.mdo` вручную | [metadata-xml.md](./practice/metadata-xml.md) |
| `&Перед` / `&После` / `&ИзменениеИКонтроль` | [extensions-cfe.md](./practice/extensions-cfe.md) |
| `ПриКомпоновкеРезультата` | [dcs-design.md](./practice/dcs-design.md) §5 |
| `НаборЗаписей.Записать()` в цикле | [performance.md](./performance.md) №792 |
| Запрос в цикле (`Запрос.Выполнить()` в `Для`) | [queries.md](./queries.md) №436 |
| `АвтоОбновление = Истина` у списка | [performance.md](./performance.md) №489 |

---

## Таблица C. По симптому проблемы

| Симптом | Открыть |
|---|---|
| «Тормозит», «зависает», «долго открывается» | [performance.md](./performance.md) · [queries.md](./queries.md) №655, №732 · [perf-reports/](../perf-reports/) (пример разбора) |
| «Конфликт блокировок», «deadlock» | [practice/locks-transactions.md](./practice/locks-transactions.md) §4, §6 · [language.md](./language.md) №783 |
| «Данные рассинхронизированы» | [practice/registers-design.md](./practice/registers-design.md) §8 · [events.md](./events.md) №450 |
| «Форма не открывается после правки» | [practice/metadata-xml.md](./practice/metadata-xml.md) |
| «Оригинальный метод не выполняется в расширении» | [practice/extensions-cfe.md](./practice/extensions-cfe.md) — `ПродолжитьВызов` |
| «Не обновляется список» | [forms.md](./forms.md) №558 · [performance.md](./performance.md) №489 |
| «Права не работают» | [security.md](./security.md) №737, №689 |

---

## Связанные артефакты

- [thin-triggers.md](./thin-triggers.md) — компактный чек-лист для самопроверки после написания кода
- [code-review/ЧекЛистКодРевью.md](../code-review/ЧекЛистКодРевью.md) — чек-лист ревью по типам объектов
- [AGENTS.md → Порядок работы](../../AGENTS.md) — процедура, в которую встроен этот dispatch-map
