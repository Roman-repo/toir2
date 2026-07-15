# Практика: Грабли ручной правки XML метаданных и форм

> Практические ловушки при ручном редактировании `*.mdo` (EDT) и `*.form` / `*.xml` форм.
> Адаптировано из [`metadata-xml-workarounds.md`](https://github.com/comol/ai_rules_1c/blob/main/content/rules/metadata-xml-workarounds.md) репозитория `ai_rules_1c`.

## Когда применять

При ручной правке метаданных XML/MDO и форм — когда нужно добавить реквизит, элемент формы, табличную часть **без визального редактора**. Это самые частые причины, по которым форма/объект перестаёт открываться.

---

## 🔴 1. `LineNumber` в табличных частях — НЕ добавлять

Табличные части **не должны** содержать `<standardAttributes>` с `LineNumber`. Платформа добавляет его автоматически; явная копия вызывает ошибку загрузки или дублирование.

```xml
<!-- НЕПРАВИЛЬНО — удалить этот блок из <tabularSections> -->
<standardAttributes>
  <dataHistory>Use</dataHistory>
  <name>LineNumber</name>
  <fillValue xsi:type="core:UndefinedValue"/>
  <fullTextSearch>Use</fullTextSearch>
</standardAttributes>
```

То же для `.mdo` (EDT) — не добавляйте `LineNumber` как `standardAttribute` к табличным частям.

📖 Стандарт: [№649](https://github.com/zeegin/v8std/blob/main/docs/std/649.md) Реквизиты

---

## 🔴 2. `PagesGroupExtInfo` — правильное имя типа (с буквой «s»)

Имя типа extInfo для группы страниц — `PagesGroupExtInfo` (с буквой **«s»**), не `PageGroupExtInfo`:

```xml
<!-- ПРАВИЛЬНО -->
<type>Pages</type>
<extInfo xsi:type="form:PagesGroupExtInfo">
  <pagesRepresentation>Auto</pagesRepresentation>
  <currentRowUse>Auto</currentRowUse>
</extInfo>
```

Опечатка `PageGroupExtInfo` **молча ломает форму** — группа страниц не загружается в Конфигураторе/EDT.

---

## 🔴 3. Элемент `Page` — обязательно `<enabled>true</enabled>`

Для каждого элемента `Page` внутри группы `Pages` флаг `<enabled>` **обязателен**. Без него Конфигуратор считает страницу отключённой (или форма не проходит валидацию):

```xml
<type>Page</type>
<enabled>true</enabled>
```

---

## 🔴 4. UID/UUID — глобально уникальные

Все UID/UUID новых объектов метаданных, реквизитов, табличных частей должны быть **глобально уникальны** в рамках конфигурации.

- Генерируйте каждый UUID отдельно: `[guid]::NewGuid()` (PowerShell), `uuid.uuid4()` (Python), `NewUUID` в EDT.
- **Никогда** не копируйте-вставляйте существующий UUID.
- **Никогда** не используйте плейсхолдеры/последовательности (`a1b2c3d4…`, `b2c3d4e5…`).
- После массовой генерации метаданных — запускайте проверку на дубликаты UUID по дереву исходников.

При добавлении объектов метаданных — также обновляйте `Configuration.xml` (порядок `<childObjects>` имеет значение).

---

## 🟡 5. Хук валидации после правки

После любой ручной правки XML метаданных — проверяйте:

- `verify_xml` из `1c-code-metadata-mcp` против соответствующей XSD (`get_xsd_schema` если не уверены в типе) — когда поднимем MCP.
- Sanity-загрузку через `1c-metadata-manage/tools/1c-meta-validate/scripts/meta-validate.ps1`.
- Вручную — импорт в EDT и проверка, что объект открывается.

Это ловит структурные проблемы (отсутствующие обязательные элементы, неверные имена типов, битые ссылки) до того, как они дойдут до платформы.

---

## Чек-лист перед коммитом правок XML

- [ ] В табличных частях нет `LineNumber` в `standardAttributes`
- [ ] Группы страниц используют `PagesGroupExtInfo` (с «s»)
- [ ] Каждый `Page` содержит `<enabled>true</enabled>`
- [ ] Все новые UUID сгенерированы, не скопированы
- [ ] `Configuration.xml` / `Configuration.mdo` обновлён (`childObjects`)
- [ ] Форма/объект открывается в EDT после правки

## Связанные карточки

- [Стандарты метаданных](../metadata.md) — правила метаданных уровня стандарта
- [Скелеты модулей](./module-templates.md) — шаблоны модулей
- [Типовые формы: доработка](./typical-forms-mod.md) — программная модификация форм
