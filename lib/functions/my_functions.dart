class MyFunctions {
  static int getTotalItems() => 100;

  static int getItemsInLine(double sliderValue) {
    return (getTotalItems() * sliderValue).round();
  }
}
