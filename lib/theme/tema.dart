import 'package:flutter/material.dart';

/// Paleta TechStoreColors (navy / dorado) usada en el rebranding de TechStock.
class TechStoreColors  {

  //barra superior
  static const Color navy900 = Color(0xFF16233F);
  static const Color navy800 = Color(0xFF1C2C4D);
  static const Color navy700 = Color(0xFF233761);

  // Dorado (acento / logo / botón principal)
  static const Color gold = Color(0xFFE8B34A);
  static const Color goldDark = Color(0xFFC9971C);

  // Superficies
  static const Color background = Color(0xFFEEF1F7);
  static const Color card = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE6EAF1);
  static const Color borderStrong = Color(0xFFDDE2EC);

  // Texto
  static const Color text = Color(0xFF16233F);
  static const Color text2 = Color(0xFF3A4258);
  static const Color muted = Color(0xFF8792A6);
  static const Color muted2 = Color(0xFFA3ADC2);

  // Estados
  static const Color green = Color(0xFF16A34A);
  static const Color greenBg = Color(0xFFE7F4EC);
  static const Color amber = Color(0xFFA9720F);
  static const Color amberBg = Color(0xFFFDF1DE);
  static const Color red = Color(0xFFE11D48);
  static const Color redBg = Color(0xFFFBE2E6);

  // LinearGradient define un degradado entre dos o más colores.
  // begin y end indican la dirección: de arriba-izquierda a abajo-derecha.
  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gold, goldDark],
  );

}

/// Radios de las esquinas, para usar siempre los mismos.
class TechStoreRadius {
  TechStoreRadius._();
  static const double sm = 7;
  static const double md = 10;
  static const double full = 999;
}

/// Tema global de la app. Se aplica una sola vez en MaterialApp.
ThemeData techStoreTheme() {
  //ColorScheme colores de Material 3. los widgets (botones, campos, AppBar) toman de aquí su color si no se les indica otro.
  const scheme = ColorScheme(
    brightness: Brightness.light,
    primary: TechStoreColors.navy900,
    onPrimary: Colors.white,
    primaryContainer: TechStoreColors.navy700,
    onPrimaryContainer: Colors.white,
    secondary: TechStoreColors.gold,
    onSecondary: TechStoreColors.navy900,
    secondaryContainer: TechStoreColors.amberBg,
    onSecondaryContainer: TechStoreColors.amber,
    tertiary: TechStoreColors.green,
    onTertiary: Colors.white,
    error: TechStoreColors.red,
    onError: Colors.white,
    errorContainer: TechStoreColors.redBg,
    onErrorContainer: TechStoreColors.red,
    surface: TechStoreColors.card,
    onSurface: TechStoreColors.text,
    onSurfaceVariant: TechStoreColors.text2,
    outline: TechStoreColors.borderStrong,
    outlineVariant: TechStoreColors.border,
  );
 
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    //color de fondo de todos los Scaffold de la app.
    scaffoldBackgroundColor: TechStoreColors.background,
 
    // NUEVO: appBarTheme da el mismo estilo a todas las AppBar,
    // así ya no se escribe backgroundColor en cada pantalla.
    appBarTheme: const AppBarTheme(
      backgroundColor: TechStoreColors.navy900,
      foregroundColor: Colors.white,
      elevation: 0, //elevation 0 quita la sombra debajo de la barra.
    ),
 
    //inputDecorationTheme da el mismo estilo a todos los campos
    // (TextField / TextFormField), incluido tu CampoTexto.
    inputDecorationTheme: InputDecorationTheme(
      filled: true, //filled + fillColor pintan el interior del campo.
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: TechStoreColors.muted2),
      prefixIconColor: TechStoreColors.muted, //color del ícono izquierdo.
      //contentPadding es el espacio interno entre el borde y el texto.
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TechStoreRadius.sm),
        //BorderSide define color y grosor de la línea del borde.
        borderSide: const BorderSide(color: TechStoreColors.borderStrong),
      ),
      //enabledBorder es el borde cuando el campo no está seleccionado.
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TechStoreRadius.sm),
        borderSide: const BorderSide(color: TechStoreColors.borderStrong),
      ),
      //focusedBorder es el borde mientras el usuario escribe en él.
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TechStoreRadius.sm),
        borderSide: const BorderSide(color: TechStoreColors.navy700, width: 1.5),
      ),
      //errorBorder se usa cuando un validator devuelve un mensaje.
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TechStoreRadius.sm),
        borderSide: const BorderSide(color: TechStoreColors.red),
      ),
    ),
 
    //snackBarTheme da estilo a todos los SnackBar de la app.
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: TechStoreColors.navy900,
      //floating hace que el SnackBar flote separado del borde inferior.
      behavior: SnackBarBehavior.floating,
    ),
 
    dividerColor: TechStoreColors.border,
  );
}
 