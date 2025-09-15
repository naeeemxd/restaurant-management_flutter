import 'package:admin_dashboard/app/modules/foods/views/fooditems.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/foods_controller.dart';

class FoodsView extends GetView<FoodsController> {
  const FoodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildFoodGrid(),
              const SizedBox(height: 32),
              _buildPagination(),
              const SizedBox(height: 40),
              _buildMenuComparison(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Foods',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3748),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Here is your menus summary with graph view',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: 300,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search here',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.view_list),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(12),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.grid_view),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(12),
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text('New Menu', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF10B981),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFoodGrid() {
    return Column(
      children: [
        // First row
        Row(
          children: controller.foodItems
              .take(5)
              .map((item) => Expanded(child: buildFoodCard(item)))
              .toList(),
        ),
        const SizedBox(height: 24),
        // Second row (duplicate items for demo)
        Row(
          children: controller.foodItems
              .take(5)
              .map((item) => Expanded(child: buildFoodCard(item)))
              .toList(),
        ),
      ],
    );
  }

  Widget buildFoodCard(FoodItem item) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Colors.grey[200],
              ),
              child: Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _getItemColor(item.category),
                  ),
                  child: Icon(
                    _getItemIcon(item.category),
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D3748),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.category,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildActionButton(Icons.visibility, Colors.green),
                      _buildActionButton(Icons.edit, Colors.orange),
                      _buildActionButton(Icons.delete, Colors.red),
                      _buildActionButton(Icons.copy, Colors.blue),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color color) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, color: color, size: 16),
    );
  }

  Color _getItemColor(String category) {
    if (category.contains('Burger')) return Colors.orange;
    if (category.contains('Pizza')) return Colors.red;
    if (category.contains('Noodle')) return Colors.green;
    if (category.contains('Sprite')) return Colors.yellow[700]!;
    return Colors.blue;
  }

  IconData _getItemIcon(String category) {
    if (category.contains('Burger')) return Icons.lunch_dining;
    if (category.contains('Pizza')) return Icons.local_pizza;
    if (category.contains('Noodle')) return Icons.ramen_dining;
    if (category.contains('Sprite')) return Icons.local_drink;
    return Icons.fastfood;
  }

  Widget _buildPagination() {
    return Row(
      children: [
        Text(
          'Showing 15 from 100 Menu',
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_left),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(8),
              ),
            ),
            const SizedBox(width: 8),
            _buildPageButton('1', true),
            _buildPageButton('2', false),
            _buildPageButton('3', false),
            _buildPageButton('4', false),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_right),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(8),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPageButton(String text, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: isActive ? const Color(0xFF10B981) : Colors.white,
          foregroundColor: isActive ? Colors.white : Colors.grey[600],
          minimumSize: const Size(40, 40),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildMenuComparison() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Menu Comparison',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D3748),
                ),
              ),
              const Spacer(),
              Obx(
                () => Row(
                  children: [
                    Checkbox(
                      value: controller.showChart.value,
                      onChanged: (value) => controller.toggleChart(),
                      activeColor: const Color(0xFF10B981),
                    ),
                    const Text('Chart'),
                    const SizedBox(width: 16),
                    Checkbox(
                      value: controller.showValues.value,
                      onChanged: (value) => controller.toggleValues(),
                      activeColor: const Color(0xFF10B981),
                    ),
                    const Text('Show Value'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildChartWidget('75%', 'Burger', Colors.blue, 0.75),
              _buildChartWidget('32%', 'Pizza', Colors.red, 0.32),
              _buildChartWidget('67%', 'Soft Drink', Colors.yellow[700]!, 0.67),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartWidget(
    String percentage,
    String label,
    Color color,
    double progress,
  ) {
    return Obx(
      () => Column(
        children: [
          if (controller.showChart.value)
            Container(
              width: 120,
              height: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 12,
                      backgroundColor: color.withOpacity(0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    ),
                  ),
                  if (controller.showValues.value)
                    Text(
                      percentage,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                ],
              ),
            )
          else
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  percentage,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 16),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2D3748),
            ),
          ),
        ],
      ),
    );
  }
}
