# BASIC_APP

La aplicación es una pantalla principal con un listado de tarjetas que muestran información, una pantalla de detalles que muestra más información sobre un elemento seleccionado y una pantalla de formulario para agregar nuevos elementos al listado.

La aplicación incluye:

- Una pantalla principal con un listado de elementos en tarjetas.
- Una pantalla de detalles con información ampliada de un elemento seleccionado.
- Una pantalla de formulario para agregar nuevos elementos al listado.

No requiere conexión a internet, ya que utiliza almacenamiento **local (SQLite/Drift/Hive, según implementación elegida)**.

---

## Arquitectura

Se sigue el patrón **Clean Architecture**, dividiendo el proyecto en tres capas principales:

1. **Domain (Reglas de negocio, casos de uso y entidades)**
2. **Data (Repositorios, modelos, datasources locales)**
3. **Presentation (UI, widgets, manejo de estado)**

Cada *feature* se organiza de forma modular dentro de `lib/features/`.

---

## Estructura de directorios

```bash
.
├── app.dart
├── core
│   ├── di
│   │   └── injector.dart
│   ├── localization
│   │   ├── app_localizations.dart
│   │   └── app_localizations_delegate.dart
│   └── theme
│       └── app_theme.dart
├── features
│   └── items
│       ├── data
│       │   ├── datasources
│       │   │   └── local
│       │   │       ├── app_database.dart
│       │   │       ├── app_database.g.dart
│       │   │       └── item_local_datasource.dart
│       │   ├── models
│       │   │   └── item_model.dart
│       │   └── repositories
│       │       └── item_repository_impl.dart
│       ├── domain
│       │   ├── entities
│       │   │   └── item.dart
│       │   ├── mapper
│       │   │   └── item_mapper.dart
│       │   ├── repositories
│       │   │   └── item_repository.dart
│       │   └── usecases
│       │       ├── add_item.dart
│       │       ├── delete_item.dart
│       │       ├── get_item_by_id.dart
│       │       ├── get_items.dart
│       │       ├── update_item.dart
│       │       └── use_cases.dart
│       └── presentation
│           ├── helper
│           │   └── show_dialog.dart
│           ├── pages
│           │   ├── item_detail_page.dart
│           │   ├── item_form_page.dart
│           │   ├── items_list_page.dart
│           │   └── pages.dart
│           ├── state
│           │   └── items_provider.dart
│           └── widgets
│               ├── confirm_dialog.dart
│               ├── empty_items.dart
│               ├── item_card.dart
│               ├── item_detail_content.dart
│               ├── item_form.dart
│               ├── loader_screen.dart
│               └── widgets.dart
├── main.dart
└── routes
    ├── app_router.dart
    └── routes.dart
```

---

## Dependencias principales

En el archivo `pubspec.yaml` encontrarás dependencias típicas de este tipo de proyecto:

- `flutter_riverpod` → Manejo de estado global.
- `drift` + `sqlite3_flutter_libs` (o `hive`) → Persistencia local.
- `path_provider` → Ubicación de archivos locales.
- `equatable` → Comparación de objetos (entidades y modelos).
- `get_it` → Inyección de dependencias.

---

## Ejecución del proyecto

### 1. Clonar el repositorio

```bash
git clone https://github.com/RutaPragma/basic_app.git
cd basic_app
```

### 2. Instalar dependencias

```bash
flutter pub get
```

### 3. Generar código de Drift (si usas Drift para persistencia)

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Ejecutar la aplicación

```bash
flutter run
```

---

## Flujo de la aplicación

1. **Pantalla Principal**

- Lista todos los elementos guardados en la base de datos local.
- Cada elemento se muestra en una **tarjeta** (`ItemCard`).

2. **Pantalla de Detalle**

- Se accede al pulsar un elemento.
- Muestra información detallada del item seleccionado.

3. **Pantalla de Formulario**

- Permite agregar un nuevo elemento al listado.
- Al guardar, la información se persiste en la base de datos local `sqlite`.
```

---

## Notas

- Este proyecto está diseñado para **escalar fácilmente**: puedes añadir más features siguiendo la misma estructura de carpetas.
- Al no tener conexión a internet, la capa **RemoteDatasource** no existe, pero el diseño permite incluirla en un futuro.

---

## Autor

- Jhony Renteria Rodriguez
- <jhonyrenteria@gmail.com>
