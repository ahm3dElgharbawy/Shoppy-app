enum ConsoleColor {
  // ANSI color codes
  red(31),
  green(32),
  yellow(33),
  blue(34),
  magenta(35),
  cyan(36),
  white(37);

  final int code;
  const ConsoleColor(this.code);
}