import 'package:admin_dashboard/app/modules/customers/views/customer_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customers_controller.dart';

class CustomersView extends GetView<CustomersController> {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 24),
            _buildSearchAndFilter(),
            SizedBox(height: 24),
            Expanded(child: _buildCustomersTable()),
            SizedBox(height: 16),
            _buildPagination(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Customer',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3748),
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Here is your general customers list data',
              style: TextStyle(fontSize: 14, color: Color(0xFF718096)),
            ),
          ],
        ),
        OutlinedButton.icon(
          onPressed: controller.showFilterDialog,
          icon: Icon(Icons.filter_list, size: 16),
          label: Text('Filter'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Color(0xFF718096),
            side: BorderSide(color: Color(0xFFE2E8F0)),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchAndFilter() {
    return Container(
      height: 40,
      child: TextField(
        onChanged: controller.updateSearchQuery,
        decoration: InputDecoration(
          hintText: 'Search here',
          prefixIcon: Icon(Icons.search, color: Color(0xFF718096)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFE2E8F0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFE2E8F0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFF3182CE)),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
    );
  }

  Widget _buildCustomersTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTableHeader(),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: controller.filteredCustomers.length,
                itemBuilder: (context, index) {
                  return _buildCustomerRow(controller.filteredCustomers[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF3182CE),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: _buildHeaderCell('Customer ID')),
          Expanded(flex: 2, child: _buildHeaderCell('Join Date')),
          Expanded(flex: 2, child: _buildHeaderCell('Customer Name')),
          Expanded(flex: 3, child: _buildHeaderCell('Location')),
          Expanded(flex: 2, child: _buildHeaderCell('Total Spent')),
          Expanded(flex: 2, child: _buildHeaderCell('Last Order')),
          SizedBox(width: 40), // For menu button
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text) {
    return InkWell(
      onTap: () => controller.sortCustomers(text),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          SizedBox(width: 4),
          Obx(() {
            if (controller.sortBy.value == text) {
              return Icon(
                controller.sortAscending.value
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 16,
              );
            }
            return Icon(Icons.unfold_more, color: Colors.white70, size: 16);
          }),
        ],
      ),
    );
  }

  Widget _buildCustomerRow(Customer customer) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF7FAFC), width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              customer.id,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D3748),
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              controller.formatDate(customer.joinDate),
              style: TextStyle(color: Color(0xFF718096), fontSize: 13),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              customer.name,
              style: TextStyle(color: Color(0xFF2D3748), fontSize: 14),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              customer.location,
              style: TextStyle(color: Color(0xFF718096), fontSize: 13),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '\$${customer.totalSpent.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D3748),
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0xFFF7FAFC),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '\$${customer.lastOrder.toStringAsFixed(2)}',
                style: TextStyle(color: Color(0xFF718096), fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: PopupMenuButton<String>(
              icon: Icon(Icons.more_horiz, color: Color(0xFF718096)),
              onSelected: (value) {
                switch (value) {
                  case 'view':
                    controller.viewCustomerDetails(customer);
                    break;
                  case 'edit':
                    controller.editCustomer(customer);
                    break;
                  case 'delete':
                    controller.deleteCustomer(customer);
                    break;
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>(
                  value: 'view',
                  child: Row(
                    children: [
                      Icon(
                        Icons.visibility,
                        size: 16,
                        color: Color(0xFF3182CE),
                      ),
                      SizedBox(width: 8),
                      Text('View Detail'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit, size: 16, color: Color(0xFF38A169)),
                      SizedBox(width: 8),
                      Text('Edit'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, size: 16, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Delete'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Text(
            'Showing ${controller.filteredCustomers.length} from 46 data',
            style: TextStyle(color: Color(0xFF718096)),
          ),
        ),
        Row(
          children: [
            IconButton(icon: Icon(Icons.chevron_left), onPressed: () {}),
            ...List.generate(5, (index) {
              bool isSelected = index == 0;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 2),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: isSelected
                        ? Color(0xFF3182CE)
                        : Colors.transparent,
                    minimumSize: Size(32, 32),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isSelected ? Colors.white : Color(0xFF718096),
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }),
            IconButton(icon: Icon(Icons.chevron_right), onPressed: () {}),
          ],
        ),
      ],
    );
  }
}
