## SmartUI

Lightweight и гибкая UI-библиотека для SwiftUI  

Набор переиспользуемых компонентов с упором на кастомизацию и чистую архитектуру

**SmartUI** - это набор UI-компонентов, построенных вокруг идеи:

- максимум гибкости  
- минимум бойлерплейта  
- единый стиль и поведение  

Без обёрток на UIKit - только нативный SwiftUI.

---

###

📦 Установка (SPM)

`.package(url: "https://github.com/yourname/SmartUI.git", from: "1.0.0")`

---

### 🧩 Input компоненты
- SmartTextField
- SmartTextEditor (multiline)

### 🎛 Controls
- SmartToggle
- SmartSlider
- SmartButton

И множество часто использумых наборов модификаций обычных view одним вызовом

---

Все компоненты используют одинаковую архитектуру:
- Config-driven API
- State-based UI
- Минимум логики в месте использования

Можно настроить:
- цвета
- отступы
- скругления
- поведение
- валидацию

Каждый компонент управляется через `Config`, в котором прописаны значения по умолчанию с возможностью изменить конкретные параметры по необходимости:

```swift
SmartTextField(
    text: $text,
    config: .init(
        placeholder: "Email",
        maxLength: 50,
        rules: [EmailRule()],
        colors: .init(
            background: .gray.opacity(0.1),
            focused: .blue
        )
    )
)
```
---

### Встроенная логика

Из коробки:
- валидация
- ограничения ввода
- error state
- динамический UI

 Пример состояний
- normal
- focused
- error
- disabled
- loading (для кнопки)

Все состояния обрабатываются внутри компонента
