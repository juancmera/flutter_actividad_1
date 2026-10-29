# EcoTech – Registro de componentes de PC

Prototipo interactivo (MVP) de una aplicación de catálogo de productos desarrollado en Flutter para la **Actividad Integradora 1** de la asignatura **Desarrollo de Aplicaciones Móviles**, Carrera de Ingeniería en Sistemas Inteligentes, Universidad ECOTEC.

La aplicación permite registrar un componente de PC en un formulario y enviar sus datos a una segunda pantalla, donde se muestran en detalle.

## Funcionalidades

- **Pantalla 1 – `FormScreen`**: formulario para ingresar código, nombre, cantidad, precio y descripción del componente.
  - Validación al presionar **Guardar**: si algún campo está vacío, se muestra el mensaje "Completa todos los campos".
  - Teclado numérico para cantidad y teclado decimal para precio.
  - Descripción multilínea con límite de 150 caracteres.
- **Pantalla 2 – `DetailScreen`**: muestra los datos recibidos dentro de un `Card`.
  - Botón **Registrar otro componente** para regresar al formulario.
- **Navegación multipantalla** con `Navigator.push` y `Navigator.pop`.
- **Paso de parámetros** mediante el constructor de `DetailScreen`, usando un objeto del modelo `Componentes`.

## Estructura principal

| Archivo / clase | Descripción |
|---|---|
| `product_model.dart` | Clase modelo `Componentes` que agrupa los datos del producto. |
| `campo_widgets.dart` | Widget reutilizable `CampoTexto` (etiqueta, texto de ayuda, controlador, ícono y tipo de teclado). |
| `FormScreen` | `StatefulWidget` con el formulario, los controladores y el botón Guardar. |
| `DetailScreen` | `StatelessWidget` que recibe el parámetro `componenteRecibido`. |
| `assets/img/` | Imágenes de la aplicación. |

## Paso de parámetros

```dart
// Pantalla 1: se crea el objeto y se envía
Componentes nuevoComponente = Componentes(
  codigo: _codController.text,
  nombre: _nomController.text,
  cantidad: _canController.text,
  precio: _preController.text,
  descripcion: _desController.text,
);

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailScreen(componenteRecibido: nuevoComponente),
  ),
);

// Pantalla 2: se recibe por constructor
final Componentes componenteRecibido;
const DetailScreen({super.key, required this.componenteRecibido});
```

## Requisitos

- Flutter 3.47.5 (canal stable)
- Dart 3.13.4
- Entorno verificado con `flutter doctor -v` (sin problemas)

## Ejecución

```bash
git clone https://github.com/juancmera/flutter_actividad_1.git
cd flutter_actividad_1
flutter pub get
flutter run
```

## Declaración de uso de IA

Se utilizó el asistente de IA Claude (Anthropic) como guía sobre el envío de parámetros entre pantallas: el cambio de `FormScreen` a `StatefulWidget`, la creación del objeto `nuevoComponente`, su envío en el `builder` de `MaterialPageRoute` y la recepción en el constructor de `DetailScreen`. El resto del código fue desarrollado en base a las clases de la asignatura.

## Autor

Juan Cristóbal Mera Vásquez – Universidad ECOTEC, 2026
