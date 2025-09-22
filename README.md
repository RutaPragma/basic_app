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
lib/
├─ routes/
│   ├─ app_router.dart          # Aquí configuras GoRouter
│   
├─ core/                        # Recursos compartidos entre features
│  ├─ error/                    # Manejo de errores y excepciones
│  ├─ usecases/                 # Base abstracta para casos de uso
│  ├─ utils/                    # Utilidades generales
│  └─ database/                 # Configuración de la BD local
│
├─ features/
│  └─ items/                    # Feature principal: Items
│     ├─ data/
│     │  ├─ datasources/
│     │  │  └─ local/
│     │  │     └─ item_local_datasource.dart   # Fuente de datos local
│     │  ├─ models/
│     │  │  └─ item_model.dart
│     │  ├─ mapper/
│     │  │  └─ item_model_mapper.dart 
│     │  └─ repositories/
│     │     └─ item_repository_impl.dart
│     │
│     ├─ domain/
│     │  ├─ entities/
│     │  │  └─ item.dart
│     │  ├─ repositories/
│     │  │  └─ item_repository.dart
│     │  └─ usecases/
│     │     ├─ get_items.dart
│     │     ├─ add_item.dart
│     │     └─ get_item_detail.dart
│     │
│     ├─ presentation/
│     │  ├─ state/
│     │  │  └─ items_provider.dart
│     │  ├─ pages/
│     │  │  ├─ items_page.dart
│     │  │  ├─ item_detail_page.dart
│     │  │  └─ item_form_page.dart
│     │  └─ widgets/
│     │     └─ item_card.dart
│     │
│     └─ items_injection.dart   # Inyección de dependencias del feature
│
├─ app.dart                     # Configuración de MaterialApp y rutas
└─ main.dart                    # Punto de entrada principal
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

---

## Pruebas

Para correr las pruebas unitarias:

```bash
flutter test
```

---

## Notas

- Este proyecto está diseñado para **escalar fácilmente**: puedes añadir más features siguiendo la misma estructura de carpetas.
- Al no tener conexión a internet, la capa **RemoteDatasource** no existe, pero el diseño permite incluirla en un futuro.

---

## Autor

- Jhony Renteria Rodriguez
- <jhonyrenteria@gmail.com>
