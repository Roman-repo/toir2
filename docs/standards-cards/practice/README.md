# Практика кодирования 1С

> Практические правила кодирования и работы с метаданными — то, чего **нет в стандартах v8std**, но что критично для выживания в коде.
> Адаптировано из репозитория [`comol/ai_rules_1c`](https://github.com/comol/ai_rules_1c).

## Отличие от карточек стандартов

| Карточки стандартов (`../`) | Карточки практики (`./`) |
|---|---|
| «Что требует стандарт v8std» | «Как писать, чтобы не сломать» |
| Фокус на комплаенс (317 стандартов) | Фокус на практические грабли и паттерны |
| Покрытие: всё, что есть в стандартах | Покрытие: то, чего нет в стандартах |

Это **комплементарные** слои. Стандарты говорят «что правильно», практика — «как именно и где споткнётесь».

## Карточки практики

| Карточка | Назначение | Когда использовать |
|---|---|---|
| [metadata-xml.md](./metadata-xml.md) | Грабли ручной правки XML/MDO и форм | Правите `.form`/`.mdo` вручную — `LineNumber`, `PagesGroupExtInfo`, UUID |
| [extensions-cfe.md](./extensions-cfe.md) | Паттерны расширений 1С (CFE) | Пишете/ревьюите код в расширении — перехватчики, `ПродолжитьВызов`, маркеры |
| [async-await.md](./async-await.md) | Асинхронные методы `Асинх`/`Ждать`/`Обещание` (8.3.18+) | Переходите со старых `Показать*` на новый синтаксис, ловушки потери исключений |
| [dcs-design.md](./dcs-design.md) | Проектирование отчётов СКД | Создаёте/ревьюите отчёт СКД — наборы, поля/ресурсы, программный override |
| [registers-design.md](./registers-design.md) | Проектирование регистров | Создаёте/реструктурируете регистр — тип, измерения, периодичность, индексы |
| [locks-transactions.md](./locks-transactions.md) | Блокировки и транзакции | Проектируете проведение, отлаживаете конфликты блокировок |
| [module-templates.md](./module-templates.md) | Канонические скелеты модулей | Создаёте новый модуль — готовые шаблоны областей по типам модулей |
| [typical-forms-mod.md](./typical-forms-mod.md) | Программная доработка типовых форм | Дорабатываете типовую форму — добавляете элементы кодом, не визуально |
| [typical-forms-new.md](./typical-forms-new.md) | Создание новых форм | Создаёте новую форму своего объекта — 5 областей, проверка заполнения, modifiesStoredData |

## Как пользоваться

### При разработке
1. Определите тип работы (правка XML, расширение, асинхронный код, СКД, проведение...).
2. Откройте релевантную карточку практики.
3. Дополнительно откройте карточку стандарта (ссылки в каждой практической карточке) — для комплаенса.

### При код-ревью
1. По типу изменённого объекта откройте карточку практики.
2. Пройдитесь по чек-листу в конце каждой карточки.
3. Сверьте с чек-листом код-ревью в [`docs/code-review/`](../../code-review/ЧекЛистКодРевью.md).

## Источники

Адаптировано из репозитория [comol/ai_rules_1c](https://github.com/comol/ai_rules_1c) (`content/rules/`):
- [`metadata-xml-workarounds.md`](https://github.com/comol/ai_rules_1c/blob/main/content/rules/metadata-xml-workarounds.md)
- [`extension-patterns.md`](https://github.com/comol/ai_rules_1c/blob/main/content/rules/extension-patterns.md)
- [`async-methods.md`](https://github.com/comol/ai_rules_1c/blob/main/content/rules/async-methods.md)
- [`dcs-design.md`](https://github.com/comol/ai_rules_1c/blob/main/content/rules/dcs-design.md)
- [`registers-design.md`](https://github.com/comol/ai_rules_1c/blob/main/content/rules/registers-design.md)
- [`locks-and-transactions.md`](https://github.com/comol/ai_rules_1c/blob/main/content/rules/locks-and-transactions.md)
- [`module-structure.md`](https://github.com/comol/ai_rules_1c/blob/main/content/rules/module-structure.md)
- [`dev-standards-forms.md`](https://github.com/comol/ai_rules_1c/blob/main/content/rules/dev-standards-forms.md)

Лицензия исходного репозитория — public domain (никаких ограничений).
