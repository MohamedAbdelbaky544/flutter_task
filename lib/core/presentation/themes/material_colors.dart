import 'package:flutter/material.dart';

///create a [MaterialTextColor] class that has a related colors with enums [TextColor]
class MaterialTextColor extends ColorSwatch<TextColor> {
  const MaterialTextColor(super.primary, super.swatch);
  Color get black => this[TextColor.black]!;
  Color get yellow => this[TextColor.yellow]!;
  Color get white => this[TextColor.white]!;
  Color get lightGrey => this[TextColor.lightGrey]!;
}

enum TextColor {
  black,
  yellow,
  lightGrey,
  white,
}
