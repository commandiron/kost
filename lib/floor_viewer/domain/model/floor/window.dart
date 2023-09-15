class Window {
  final double width;
  final double height;
  final bool hasRailing;
  final bool hasWindowsill;

  Window(
    {
      required this.width,
      required this.height,
      this.hasRailing = true,
      this.hasWindowsill = true,
    }
  );
}