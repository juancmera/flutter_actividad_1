# EcoTech – Componentes de PC

Aplicación móvil desarrollada en **Flutter** para la asignatura **Desarrollo de Aplicaciones Móviles** de la Carrera de Ingeniería en Sistemas Inteligentes de la Universidad ECOTEC.

**Actividad Integradora 3:** consumo de una API REST pública y gestión de estados con **Provider**.

## API pública consumida

| Elemento | Detalle |
|---|---|
| **API** | [DummyJSON](https://dummyjson.com) (API REST pública de datos de prueba) |
| **Endpoint** | `GET https://dummyjson.com/products/category/{categoria}` |
| **Categorías** | `laptops`, `tablets`, `mobile-accessories` |
| **Autenticación** | No requiere token, API key ni registro |
| **Formato** | JSON |

Ejemplo de petición:

```
https://dummyjson.com/products/category/laptops
```

Estructura de la respuesta (campos utilizados):

```json
{
  "products": [
    {
      "id": 1,
      "title": "...",
      "description": "...",
      "category": "laptops",
      "price": 0.0,
      "rating": 0.0,
      "stock": 0,
      "brand": "...",
      "thumbnail": "https://..."
    }
  ],
  "total": 0,
  "skip": 0,
  "limit": 0
}
```

Las tres categorías se descargan **en paralelo** (`Future.wait`) y se unen en un solo catálogo.

---

##  Funcionalidades

- **Home:** carrusel con 5 productos mejor valorados (`rating`).
- **Catálogo:** grilla de productos con filtros por categoría (Todos, Laptops, Tablets y Accesorios).
- **Tres estados de la petición:**
  - **Cargando:** indicador de progreso.
  - **Éxito:** muestra los productos.
  - **Error:** mensaje claro y botón **Reintentar** si no hay conexión.
- **Pull-to-Refresh:** desliza hacia abajo para actualizar los datos.
- **Menú lateral (Drawer)** para navegar entre pantallas.
- Límite de espera (*timeout*) de 10 segundos y validación del código HTTP 200.

---

## Arquitectura

La lógica de red está separada de la interfaz en tres capas:

```
DummyJSON ──GET──► Servicio ──► Provider ──► Pantallas
                (http + JSON)  (estados)    (solo muestran)
```

```
lib/
├── models/
│   └── product_model.dart        # Modelo con fromJson / toJson
├── services/
│   └── product_service.dart     # Peticiones HTTP a la API
├── providers/
│   └── product_provider.dart    # Estados: Cargando, Éxito y Error (ChangeNotifier)
├── screens/
│   ├── home_screen.dart           # Carrusel de destacados
│   └── catalogo_screen.dart       # Grilla con filtros
├── widgets/
│   ├── card_swiper.dart
│   ├── producto_widget.dart
│   ├── error_widget.dart
│   └── menu_widget.dart
└── main.dart                      # Registro del Provider y rutas
```

Las pantallas **no importan el paquete `http`**: solo escuchan al Provider con `context.watch` y se redibujan cuando cambia el estado.

---

## Dependencias principales

| Paquete | Uso |
|---|---|
| [`http`](https://pub.dev/packages/http) | Peticiones GET a la API |
| [`provider`](https://pub.dev/packages/provider) | Gestión de estado |
| [`card_swiper`](https://pub.dev/packages/card_swiper) | Carrusel del Home |

---

## Ejecución de la aplicación

### Requisitos

- Flutter SDK instalado (`flutter --version`)
- Un emulador Android/iOS o un dispositivo físico conectado
- Conexión a internet

### Pasos

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/juancmera/flutter_actividad_1.git
   cd flutter_actividad_1
   ```

2. **Cambiar a la rama de esta actividad** (si aún no está fusionada)
   ```bash
   git checkout feature/api-integration
   ```

3. **Instalar las dependencias**
   ```bash
   flutter pub get
   ```

4. **Verificar que hay un dispositivo disponible**
   ```bash
   flutter devices
   ```

5. **Ejecutar la app**
   ```bash
   flutter run
   ```

> **Nota (Android):** el permiso de Internet ya está configurado en `android/app/src/main/AndroidManifest.xml`:
> ```xml
> <uses-permission android:name="android.permission.INTERNET"/>
> ```

---

## Cómo probar los estados

| Estado | Cómo verlo |
|---|---|
| **Cargando** | Al abrir la app, mientras llegan los datos |
| **Éxito** | Con conexión a internet: aparecen el carrusel y el catálogo |
| **Error** | Activa el **modo avión** y desliza hacia abajo para actualizar |
| **Recuperación** | Desactiva el modo avión y pulsa **Reintentar** |

---

## Documentación

El informe técnico de la actividad está en [`docs/Informe_AI3.pdf`](docs/Informe_AI3.pdf).

## Autor
Juan Cristóbal Mera Vásquez – Universidad ECOTEC, 2026
