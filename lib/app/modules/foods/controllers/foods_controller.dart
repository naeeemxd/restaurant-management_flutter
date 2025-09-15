import 'package:admin_dashboard/app/modules/foods/views/fooditems.dart';
import 'package:get/get.dart';

class FoodsController extends GetxController {
var selectedItems = <int>[].obs;
  var showChart = true.obs;
  var showValues = true.obs;
  
  final List<FoodItem> foodItems = [
    FoodItem(
      id: 1,
      name: "Spicy Mozzarella with Barbeque",
      category: "Food / Noodle",
      image: "assets/pizza1.jpg",
      actions: ['View', 'Edit', 'Delete', 'Duplicate']
    ),
    FoodItem(
      id: 2,
      name: "Burger Jumbo Special With Spicy",
      category: "Food / Burger",
      image: "assets/burger1.jpg",
      actions: ['View', 'Edit', 'Delete', 'Duplicate']
    ),
    FoodItem(
      id: 3,
      name: "Pizza la Piazza Special Nuggets",
      category: "Food / Pizza",
      image: "assets/pizza2.jpg",
      actions: ['View', 'Edit', 'Delete', 'Duplicate']
    ),
    FoodItem(
      id: 4,
      name: "Spicy Mozzarella with Barbeque",
      category: "Food / Noodle",
      image: "assets/pizza1.jpg",
      actions: ['View', 'Edit', 'Delete', 'Duplicate']
    ),
    FoodItem(
      id: 5,
      name: "Sprite Flavour with Avocado Juice",
      category: "Drink / Sprite",
      image: "assets/drink1.jpg",
      actions: ['View', 'Edit', 'Delete', 'Duplicate']
    ),
  ];

  void toggleItemSelection(int id) {
    if (selectedItems.contains(id)) {
      selectedItems.remove(id);
    } else {
      selectedItems.add(id);
    }
  }

  void toggleChart() {
    showChart.toggle();
  }

  void toggleValues() {
    showValues.toggle();
  }
}
