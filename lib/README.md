# 🧱 Flutter Clean Architecture Boilerplate

**Microservices + Event-driven + Riverpod + Future-driven + i18n**

This project is a scalable boilerplate for large Flutter apps using **Clean Architecture** principles.  
It supports **microservice-style modularization**, **event-driven logic**, **Riverpod for DI and state**, **future-based use cases**, and **built-in internationalization (i18n)**.

---

## 📦 Project Structure

```plaintext
lib
│
├─ app                           ← Application-wide setup
│  ├─ di                         ← Dependency injection setup (e.g., Provider overrides)
│  ├─ lifecycle                  ← App lifecycle management (optional; e.g., state persistence)
│  ├─ router                     ← Routing configuration (GoRouter or similar)
│  └─ app.dart                   ← Root App widget (runApp entry point)
│
├─ config                        ← Environment configurations and global settings
│
├─ core                          ← Pure and abstract foundational layers
│  ├─ base                       ← Base classes, wrappers, and common generics (e.g., Result, BaseUseCase)
│  ├─ exceptions                 ← Application-level exception classes and error definitions
│  ├─ network
│  │  └─ interceptors            ← HTTP interceptors (e.g., Dio interceptors for auth, logging)
│  └─ utils                      ← Generic utility functions (e.g., formatters, validators)
│
├─ features                      ← Domain-driven feature modules
│  ├─ auth
│  │  ├─ application
│  │  │  └─ usecases             ← Application-level business logic (auth workflows, session handling)
│  │  ├─ domain
│  │  │  ├─ entities             ← Domain models (e.g., User, Credentials)
│  │  │  ├─ repositories         ← Abstract repositories (e.g., AuthRepository interface)
│  │  │  └─ services             ← Domain services (e.g., validation logic)
│  │  ├─ infrastructure
│  │  │  └─ repositories         ← Concrete implementations (e.g., APIAuthRepository)
│  │  └─ presentation
│  │      ├─ controllers         ← State logic (e.g., StateNotifiers)
│  │      ├─ pages               ← Screens and pages (e.g., SignInPage)
│  │      ├─ presenters          ← Optional: UI logic managers (for MVVM-like structure)
│  │      ├─ providers           ← Riverpod providers (e.g., controller and use case providers)
│  │      ├─ states              ← UI state classes (e.g., SignInState)
│  │      └─ widgets             ← Feature-specific reusable widgets (e.g., password field)
│  └─ user
│      └─ presentation
│          └─ pages              ← User-related screens (e.g., UserProfilePage)
│
├─ shared                        ← Globally shared resources and utilities
│  ├─ constants                  ← Global constants (e.g., error messages, keys)
│  ├─ extensions                 ← Extension methods for Dart and Flutter types
│  ├─ helpers                    ← Helper functions (e.g., input validation, formatting)
│  ├─ i18n
│  │  └─ l10n                    ← Localization files and generated output
│  ├─ themes                     ← Application theming (colors, typography)
│  └─ widgets                    ← Reusable shared UI components (e.g., buttons, cards)
│
└─ main.dart                     ← Main entry point that runs the app

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

### `app/` (Application Layer)

Contains application-level components such as dependency injection, lifecycle management, and routing.

- **`di/`**: Dependency Injection configuration and management.
- **`lifecycle/`**: Application lifecycle management (e.g., state management, lifecycle events).
- **`router/`**: Router configurations and URL patterns (e.g., GoRouter setup).

---

### `config/` (Configuration Layer)

Contains configuration files related to the environment and app settings.

---

### `core/` (Core Layer)

Contains the core features that are shared across the entire application.

- **`base/`**: Base classes that provide common functionality.
- **`events/`**: Event handling, such as stream management or notifications.
- **`exceptions/`**: Error handling and custom exception classes.
- **`interfaces/`**: Common interfaces used across the app (e.g., repositories).
- **`network/`**: Network-related components, including API clients and services.
- **`utils/`**: Utility functions and helpers.

---

### `features/` (Feature Layer)

Each folder here represents a specific feature of the application. Each feature is organized with its own entities, interfaces, and use cases.

#### Example: `features/auth/`

Contains everything related to authentication.

- **`domain/`**: Domain rules related to authentication.
  - **`entities/`**: Domain models (e.g., `User`, `Credential`).
  - **`services/`**: Domain services (e.g., `PasswordPolicyChecker`).
  - **`value_objects/`**: Immutable, value-based objects (e.g., `EmailAddress`, `Password`).
- **`interfaces/`**: Interfaces used by the authentication feature.
  - **`controllers/`**: Presentation logic (controllers that interact with the UI).
  - **`pages/`**: UI screens related to authentication.
  - **`presenters/`**: UI logic that prepares data for presentation.
  - **`providers/`**: Riverpod provider definitions for injecting dependencies.
  - **`repositories/`**: Handles data persistence, such as interacting with APIs or databases.
  - **`states/`**: State definitions used by presenters to represent UI state.
  - **`widgets/`**: Reusable widgets specific to authentication screens.
- **`usecases/`**: Business logic related to authentication (e.g., user sign-in, password reset).

#### Example: `features/user/`

Contains everything related to the user feature.

- **`interfaces/`**: UI screens for user management.
  - **`pages/`**: User-related pages.

---

### `shared/` (Shared Components)

Contains common resources that are used across multiple features.

- **`constants/`**: Constants such as error messages, configuration values, and app settings.
- **`extensions/`**: Extensions for types and classes to enhance functionality.
- **`helpers/`**: Helper functions for general tasks.
- **`i18n/`**: Internationalization (localization files).
  - **`l10n/`**: Localization resources for different languages.
- **`services/`**: Shared services (e.g., authentication service, storage service).
- **`themes/`**: Application themes (e.g., styling, colors).
- **`widgets/`**: Reusable widgets that can be used across various parts of the app.

---

## Architecture Overview

This project follows the **Clean Architecture** principles, with the following key layers:

- **Entities**: Domain models representing the core business concepts.
- **Use Cases**: Business logic that is responsible for orchestrating workflows and interacting with entities.
- **Interfaces**: Contains adapters that translate data between layers (e.g., repositories, controllers, presenters).
- **Framework & Drivers**: Includes the UI (in this case, Flutter), external systems (e.g., APIs), and persistent data sources.

Each layer has a specific responsibility, and the goal is to ensure that core business logic (the domain layer) remains independent of external frameworks and technologies.

---
