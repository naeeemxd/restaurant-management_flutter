import 'package:get/get.dart';

class AnalyticsController extends GetxController {
  var selectedChartPeriod = 'Monthly'.obs;
  var selectedSellingPeriod = 'Monthly'.obs;
  var selectedTrendingPeriod = 'Weekly'.obs;
  var selectedRevenuePeriod = 'Monthly'.obs;
  var selectedFavoritePeriod = 'Monthly'.obs;
  
  final chartPeriods = ['Monthly', 'Weekly', 'Daily'];
  
  // Sample data
  final chartOrders = 257000.obs;
  final avgOrderValue = 1245.obs;
  final currentValue = 512.obs;
  
  final trendingItems = [
    {'name': 'Tuna soup spinach with himalayan salt', 'orders': 524, 'trend': 'up', 'category': 'MAIN COURSE'},
    {'name': 'Chicken curry special with cucumber', 'orders': 215, 'trend': 'down', 'category': 'MAIN COURSE'},
    {'name': 'Italiano pizza mozzarella with basil', 'orders': 120, 'trend': 'up', 'category': 'PIZZA'},
    {'name': 'Watermelon mix chocolate juice with ice', 'orders': 76, 'trend': 'up', 'category': 'DRINK'},
    {'name': 'Chicken curry special with cucumber', 'orders': 215, 'trend': 'down', 'category': 'MAIN COURSE'},
  ].obs;
  
  final mostSellingItems = [
    {'name': 'Medium Spicy Spaghetti Italiano', 'price': 12.56, 'category': 'PASTA'},
    {'name': 'Pizza Meal for Kids (Small size)', 'price': 5.67, 'category': 'PIZZA'},
    {'name': 'Supreme Pizza with Beef Topping', 'price': 11.21, 'category': 'PIZZA'},
    {'name': 'Mozzarella Pizza with Random Topping', 'price': 8.15, 'category': 'PIZZA'},
    {'name': 'Pizza Meal for Kids (Small size)', 'price': 5.67, 'category': 'PIZZA'},
  ].obs;
  
  final favoriteItems = [
    {'name': 'Medium Spicy Pizza with Kamungg Leaf', 'rating': 4.5, 'orders': '506 orders'},
    {'name': 'Chicken Curry Specials With Cucumbers', 'rating': 4.8, 'orders': '398 orders'},
    {'name': 'Watermelon Mix Chocolate Juice with Ice', 'rating': 4.2, 'orders': '296 orders'},
    {'name': 'Italiano Pizza with mozzarella Spicy', 'rating': 4.6, 'orders': '398 orders'},
    {'name': 'Burger Jumbo la Plazza with Barbeque', 'rating': 4.7, 'orders': '398 orders'},
    {'name': 'Bread Fried with Nuggets Specials', 'rating': 4.4, 'orders': '398 orders'},
  ].obs;
}
