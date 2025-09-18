abstract class Drink {
  String get name;
  int get price;
  void showInfo(int index); 
}

class Shai implements Drink {
  @override
  String get name => 'Shai';
  @override
  int get price => 10;
  @override
  void showInfo(int index) {
    print('$index. $name - $price');
  }
}

class TurkishCoffee implements Drink {
  @override
  String get name => 'TurkishCoffee';
  @override
  int get price => 25;
  @override
  void showInfo(int index) {
    print('$index. $name - $price');
  }
}

class HibiscusTea implements Drink {
  @override
  String get name => 'HibiscusTea';
  @override
  int get price => 15;
  @override
  void showInfo(int index) {
    print('$index. $name - $price');
  }
}

List<Drink> allDrinks = [Shai(), TurkishCoffee(), HibiscusTea()];
