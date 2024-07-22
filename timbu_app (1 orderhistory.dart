import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildOrderItem(
              context,
              orderId: 'ORD12345',
              date: '2024-07-21',
              totalAmount: '\$59.00',
              status: 'Shipped',
            ),
            _buildOrderItem(
              context,
              orderId: 'ORD12346',
              date: '2024-07-20',
              totalAmount: '\$34.00',
              status: 'Delivered',
            ),
            _buildOrderItem(
              context,
              orderId: 'ORD12347',
              date: '2024-07-19',
              totalAmount: '\$19.00',
              status: 'Pending',
            ),
            // Add more orders as needed
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(
    BuildContext context, {
    required String orderId,
    required String date,
    required String totalAmount,
    required String status,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order ID: $orderId',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Date: $date',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Total Amount: $totalAmount',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Status: $status',
            style: TextStyle(
              fontSize: 14,
              color: status == 'Delivered'
                  ? Colors.green
                  : (status == 'Shipped' ? Colors.orange : Colors.red),
            ),
          ),
          const SizedBox(height: 12),
          _buildTimeline(),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ), // Text color
              ),
              onPressed: () {
                // Navigate to order details screen or show details
              },
              child: const Text(
                'View Details',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: [
        TimelineTile(
          axis: TimelineAxis.vertical,
          alignment: TimelineAlign.start,
          endChild: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Order Placed',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Colors.green,
            padding: EdgeInsets.all(8),
          ),
        ),
        TimelineTile(
          axis: TimelineAxis.vertical,
          alignment: TimelineAlign.start,
          endChild: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Order Shipped',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Colors.green,
            padding: EdgeInsets.all(8),
          ),
        ),
        TimelineTile(
          axis: TimelineAxis.vertical,
          alignment: TimelineAlign.start,
          endChild: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Order Delivered',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Colors.green,
            padding: EdgeInsets.all(8),
          ),
        ),
      ],
    );
  }
}
