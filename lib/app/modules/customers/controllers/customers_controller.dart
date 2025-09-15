import 'package:admin_dashboard/app/modules/customers/views/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomersController extends GetxController {
  var customers = <Customer>[].obs;
  var isLoading = false.obs;
  var searchQuery = ''.obs;
  var sortBy = 'Customer ID'.obs;
  var sortAscending = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadCustomers();
  }

  void loadCustomers() {
    isLoading.value = true;

    // Simulate API call
    Future.delayed(Duration(milliseconds: 500), () {
      customers.value = [
        Customer(
          id: '#C-004560',
          joinDate: DateTime(2020, 3, 27, 12, 42),
          name: 'Veronica',
          location: 'Corner Street 5th, London',
          totalSpent: 78.92,
          lastOrder: 35.36,
        ),
        Customer(
          id: '#C-004561',
          joinDate: DateTime(2020, 3, 28, 12, 42),
          name: 'Rio Da Luca',
          location: 'Emerald Tower 6th, London',
          totalSpent: 58.90,
          lastOrder: 16.76,
        ),
        Customer(
          id: '#C-004562',
          joinDate: DateTime(2020, 3, 29, 12, 42),
          name: 'Fernando',
          location: 'Blessing Hills 1st, London',
          totalSpent: 516.87,
          lastOrder: 75.56,
        ),
        Customer(
          id: '#C-004563',
          joinDate: DateTime(2020, 3, 30, 12, 42),
          name: 'Yenni Tan',
          location: 'Greensand 2nd, London',
          totalSpent: 518.8,
          lastOrder: 57.76,
        ),
        Customer(
          id: '#C-004564',
          joinDate: DateTime(2020, 4, 5, 12, 42),
          name: 'Denny Chang',
          location: 'St. Bakerfield 3rd, London',
          totalSpent: 539.92,
          lastOrder: 21.76,
        ),
        Customer(
          id: '#C-004565',
          joinDate: DateTime(2020, 4, 8, 12, 42),
          name: 'Andrea Liaw',
          location: 'Kingsroad 45th, London',
          totalSpent: 574.92,
          lastOrder: 75.55,
        ),
        Customer(
          id: '#C-004566',
          joinDate: DateTime(2020, 4, 9, 12, 42),
          name: 'Siangny The',
          location: '11 Church Road, London',
          totalSpent: 578.52,
          lastOrder: 21.81,
        ),
        Customer(
          id: '#C-004567',
          joinDate: DateTime(2020, 4, 11, 12, 42),
          name: 'Wenda Maximoff',
          location: '21 Long Beach Tower',
          totalSpent: 586.92,
          lastOrder: 61.56,
        ),
        Customer(
          id: '#C-004568',
          joinDate: DateTime(2020, 4, 15, 12, 42),
          name: 'Natasya Romanoff',
          location: '13 Boulevard Dreams',
          totalSpent: 598.92,
          lastOrder: 55.67,
        ),
        Customer(
          id: '#C-004569',
          joinDate: DateTime(2020, 4, 19, 12, 42),
          name: 'Tony Stark',
          location: 'Sandbay San Tower',
          totalSpent: 528.93,
          lastOrder: 21.88,
        ),
        Customer(
          id: '#C-004570',
          joinDate: DateTime(2020, 5, 10, 12, 42),
          name: 'John Banner',
          location: 'La Plaza de Tower',
          totalSpent: 518.21,
          lastOrder: 21.19,
        ),
        Customer(
          id: '#C-004571',
          joinDate: DateTime(2020, 5, 28, 12, 42),
          name: 'Arthur da Roca',
          location: '19 St. John Road, London',
          totalSpent: 587.98,
          lastOrder: 18.55,
        ),
      ];
      isLoading.value = false;
    });
  }

  List<Customer> get filteredCustomers {
    var filtered = customers.where((customer) {
      return customer.name.toLowerCase().contains(
            searchQuery.value.toLowerCase(),
          ) ||
          customer.id.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          customer.location.toLowerCase().contains(
            searchQuery.value.toLowerCase(),
          );
    }).toList();

    // Sort customers
    filtered.sort((a, b) {
      int comparison = 0;
      switch (sortBy.value) {
        case 'Customer ID':
          comparison = a.id.compareTo(b.id);
          break;
        case 'Join Date':
          comparison = a.joinDate.compareTo(b.joinDate);
          break;
        case 'Customer Name':
          comparison = a.name.compareTo(b.name);
          break;
        case 'Location':
          comparison = a.location.compareTo(b.location);
          break;
        case 'Total Spent':
          comparison = a.totalSpent.compareTo(b.totalSpent);
          break;
        case 'Last Order':
          comparison = a.lastOrder.compareTo(b.lastOrder);
          break;
      }
      return sortAscending.value ? comparison : -comparison;
    });

    return filtered;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void sortCustomers(String column) {
    if (sortBy.value == column) {
      sortAscending.value = !sortAscending.value;
    } else {
      sortBy.value = column;
      sortAscending.value = true;
    }
  }

  void viewCustomerDetails(Customer customer) {
    Get.dialog(
      AlertDialog(
        title: Text('Customer Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${customer.id}'),
            Text('Name: ${customer.name}'),
            Text('Location: ${customer.location}'),
            Text('Total Spent: \$${customer.totalSpent.toStringAsFixed(2)}'),
            Text('Last Order: \$${customer.lastOrder.toStringAsFixed(2)}'),
            Text('Join Date: ${formatDate(customer.joinDate)}'),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Close')),
        ],
      ),
    );
  }

  void editCustomer(Customer customer) {
    Get.snackbar('Edit Customer', 'Opening edit form for ${customer.name}');
  }

  void deleteCustomer(Customer customer) {
    Get.dialog(
      AlertDialog(
        title: Text('Delete Customer'),
        content: Text('Are you sure you want to delete ${customer.name}?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              customers.removeWhere((c) => c.id == customer.id);
              Get.back();
              Get.snackbar(
                'Customer Deleted',
                '${customer.name} has been deleted',
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void showFilterDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Filter Customers'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Filter options will be implemented here'),
            SizedBox(height: 16),
            Text('Current filters: None'),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                'Filter Applied',
                'Customer filters have been applied',
              );
            },
            child: Text('Apply'),
          ),
        ],
      ),
    );
  }

  String formatDate(DateTime date) {
    return '${date.day} ${_getMonthName(date.month)} ${date.year}, ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} AM';
  }

  String _getMonthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month];
  }
}
