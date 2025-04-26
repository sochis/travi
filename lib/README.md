# 🧱 Flutter Clean Architecture Boilerplate  
**Microservices + Event-driven + Riverpod + Future-driven + i18n**

This project is a scalable boilerplate for large Flutter apps using **Clean Architecture** principles.  
It supports **microservice-style modularization**, **event-driven logic**, **Riverpod for DI and state**, **future-based use cases**, and **built-in internationalization (i18n)**.

---

## 📦 Project Structure

```plaintext
lib/
├── app/                          # App-level setup (routing, DI, lifecycle)
│   ├── di/                       # Global providers and dependency injection
│   ├── routes/                   # Routing config (GoRouter, etc.)
│   ├── lifecycle/                # App lifecycle events and handlers
│   └── app.dart                  # Root App widget

├── core/                         # Core architecture foundation (pure & abstract)
│   ├── base/                     # Base classes (UseCase, Entity, etc.)
│   ├── events/                   # EventBus & event definitions
│   ├── exceptions/               # Common exception classes
│   ├── interfaces/               # Abstract repositories and data sources
│   ├── network/                  # Network clients (e.g., Dio setup)
│   └── utils/                    # Pure, stateless utility functions

├── shared/                       # Reusable UI and helpers across features
│   ├── widgets/                  # Common UI components (buttons, modals, etc.)
│   ├── extensions/               # Dart extensions (String, DateTime, etc.)
│   ├── themes/                   # App-wide themes and color schemes
│   ├── constants/                # Static constants (texts, keys, routes)
│   ├── helpers/                  # Convenience helpers (context utils, etc.)
│   └── i18n/                     # Internationalization (arb files + i18n logic)
│       ├── l10n/                 # Localization files (app_en.arb, etc.)
│       ├── localization.dart     # Custom localization helpers
│       └── localization_provider.dart # Locale switching with Riverpod

├── features/                     # Each business domain (microservice-like modules)
│   ├── auth/                     # Authentication domain
│   │   ├── domain/               # Entities, repository interfaces
│   │   ├── application/          # UseCases (future-driven logic)
│   │   │   └── event_handlers/   # Event subscribers (optional)
│   │   ├── infrastructure/       # Repository implementations, APIs
│   │   └── presentation/         # UI (widgets, view models)
│   ├── user/                     # User profile domain
│   ├── chat/                     # Chat/messaging domain
│   ├── notification/             # Notification domain
│   └── ...

├── main.dart                     # App entry point
```

---

## 🧠 Key Concepts

- 🧱 **Clean Architecture**: Clear separation of concerns (domain, application, infrastructure, presentation).
- 🧩 **Microservice-style Features**: Each domain is modular and self-contained.
- ⚡ **Event-driven Logic**: Features communicate via decoupled events.
- 🧪 **Future-driven UseCases**: Async-first, testable business logic.
- 🌍 **Built-in i18n Support**: ARB-based localization via Flutter’s `intl` & `gen-l10n`.
- 💉 **Riverpod DI**: Simple, reactive dependency injection and state management.

---

## 🚀 Tech Stack

- [Flutter](https://flutter.dev/)
- [Riverpod](https://riverpod.dev/)
- [GoRouter](https://pub.dev/packages/go_router)
- [Dio](https://pub.dev/packages/dio)
- [Freezed](https://pub.dev/packages/freezed)
- [intl](https://pub.dev/packages/intl)

---

## 🛠 Setup

### 1. Install dependencies

```bash
flutter pub get
```

### 2. Generate localization files

```bash
flutter gen-l10n
```

### 3. Run code generation (Freezed, JsonSerializable)

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 🔁 Event-driven Architecture

Define and emit events via `EventBus` in `core/events/`.

```dart
// Event definition
class UserLoggedInEvent extends BaseEvent {
  final String userId;
}

// Emitting an event
ref.read(eventBusProvider).emit(UserLoggedInEvent(userId));

// Listening to an event
ref.read(eventBusProvider).on<UserLoggedInEvent>().listen((event) {
  // React to event
});
```

You can place event handlers inside `features/<name>/application/event_handlers/`  
to organize listeners and keep logic modular.

---

## 🌐 Internationalization (i18n)

Localization files live under:

```plaintext
lib/shared/i18n/l10n/
  ├── app_en.arb
  ├── app_ja.arb
  └── ...
```

Add this to `pubspec.yaml`:

```yaml
flutter:
  generate: true
  localization:
    arb-dir: lib/shared/i18n/l10n
    template-arb-file: app_en.arb
    output-localization-file: app_localizations.dart
```

Use `Locale` with Riverpod:

```dart
final localeProvider = StateProvider<Locale?>((ref) => null);
```

---

## 📂 Directory Roles

| Directory   | Purpose |
|-------------|---------|
| `core/`     | App-agnostic logic and architecture |
| `shared/`   | UI utilities and helper modules |
| `features/` | Self-contained business logic per domain |
| `app/`      | App setup, DI, navigation, and lifecycle management |

---

## 🧪 TODO (Extensible Features)

- [ ] Add test coverage (unit, integration)
- [ ] Firebase integration (auth, messaging)
- [ ] CI/CD setup (GitHub Actions, etc.)
- [ ] Feature modularization into Dart packages
- [ ] Persistent storage (shared_preferences, secure storage)

---

## 🤝 Contribution

Fork freely and customize for your use case.
This project is designed to scale with teams and complex apps.

---

## 📃 License

MIT
