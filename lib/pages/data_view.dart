import 'package:flutter/material.dart';

class DataView extends StatefulWidget {
  final bool initialIsDataView;
  const DataView({Key? key, required this.initialIsDataView}) : super(key: key);

  @override
  State<DataView> createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  // bool isDataView = true;
  late bool isDataView;
  bool isTodayData = true;
  bool isRevenueExpanded = false;

  @override
  void initState() {
    super.initState();
    isDataView = widget.initialIsDataView;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EAF6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'SCM',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 26,
                ),
                onPressed: () {},
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Top Toggle
            _buildTopToggle(),
            const SizedBox(height: 24),
            // Circular Progress
            _buildCircularProgress(),
            const SizedBox(height: 24),
            // Date Toggle
            if (isDataView) _buildDateToggle(),
            const SizedBox(height: 16),
            // Content based on view
            _buildContent(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTopToggle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isDataView = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isDataView ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 12,
                      color: isDataView ? Colors.white : Colors.blue,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Data View',
                      style: TextStyle(
                        color: isDataView ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isDataView = false;
                  isRevenueExpanded = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !isDataView ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 12,
                      color: !isDataView ? Colors.white : Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Revenue View',
                      style: TextStyle(
                        color: !isDataView ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularProgress() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: SizedBox(
          width: 160,
          height: 160,
          child: Stack(
            children: [
              SizedBox(
                width: 160,
                height: 160,
                child: CircularProgressIndicator(
                  value: isDataView ? 0.55 : 0.75,
                  strokeWidth: 20,
                  backgroundColor: const Color(0xFFE3F2FD),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFF2196F3),
                  ),
                  strokeCap: StrokeCap.round,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isDataView ? '55.00' : '8897455',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      isDataView ? 'kWh/Sqft' : 'tk',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateToggle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: isTodayData ? Colors.blue : Colors.orange,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                isTodayData = true;
              });
            },
            child: Text(
              'Today Data',
              style: TextStyle(
                color: isTodayData ? Colors.black : Colors.grey,
                fontWeight: isTodayData ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: !isTodayData ? Colors.blue : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                isTodayData = false;
              });
            },
            child: Text(
              'Custom Date Data',
              style: TextStyle(
                color: !isTodayData ? Colors.blue : Colors.grey,
                fontWeight: !isTodayData ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (!isDataView) {
      return _buildRevenueView();
    }

    if (isTodayData) {
      return _buildTodayDataView();
    } else {
      return _buildCustomDateView();
    }
  }

  Widget _buildTodayDataView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Energy Chart',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                '5.53 kw',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildDataItem('Data A', '2798.50 (29.53%)', '35689 ৳', Colors.blue),
          const Divider(height: 24),
          _buildDataItem(
            'Data B',
            '72598.50 (35.39%)',
            '525989 ৳',
            Colors.purple,
          ),
          const Divider(height: 24),
          _buildDataItem(
            'Data C',
            '6598.36 (83.90%)',
            '569875৳ ৳',
            Colors.green,
          ),
          const Divider(height: 24),
          _buildDataItem(
            'Data D',
            '6598.26 (36.59%)',
            '356987 ৳',
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomDateView() {
    return Column(
      children: [
        // Date Selectors
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(width: 16, height: 16),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('From Date', style: TextStyle(color: Colors.grey)),
                      Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('To Date', style: TextStyle(color: Colors.grey)),
                      Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.search, color: Colors.white, size: 20),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // First Energy Chart
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Energy Chart',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '20.05 kw',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildDataItem(
                'Data A',
                '2798.50 (29.53%)',
                '35689৳',
                Colors.blue,
              ),
              const Divider(height: 24),
              _buildDataItem(
                'Data B',
                '72598.50 (35.39%)',
                '525989 ৳',
                Colors.purple,
              ),
              const Divider(height: 24),
              _buildDataItem(
                'Data C',
                '6598.36 (83.00%)',
                '569875৳ ৳',
                Colors.green,
              ),
              const Divider(height: 24),
              _buildDataItem(
                'Data D',
                '6598.26 (36.59%)',
                '356987 ৳',
                Colors.orange,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Second Energy Chart
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Energy Chart',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '5.53 kw',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildDataItem(
                'Data A',
                '2798.50 (29.53%)',
                '35689৳',
                Colors.blue,
              ),
              const Divider(height: 24),
              _buildDataItem(
                'Data B',
                '72598.50 (35.39%)',
                '525989 ৳',
                Colors.purple,
              ),
              const Divider(height: 24),
              _buildDataItem(
                'Data C',
                '6598.36 (83.00%)',
                '569875৳ ৳',
                Colors.green,
              ),
              const Divider(height: 24),
              _buildDataItem(
                'Data D',
                '6598.26 (36.59%)',
                '356987 ৳',
                Colors.orange,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRevenueView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        initiallyExpanded: isRevenueExpanded,
        onExpansionChanged: (expanded) {
          setState(() {
            isRevenueExpanded = expanded;
          });
        },
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ).copyWith(bottom: 16),
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Row(
          children: [
            const Icon(Icons.bar_chart, size: 20),
            const SizedBox(width: 8),
            const Text(
              'Data & Cost Info',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 16),
            ),
          ],
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_down,
          size: 24,
          color: Colors.grey,
        ),
        children: [
          Column(
            children: [
              _buildRevenueItem('Data 1', '2798.50 (29.53%)', '35689 ৳'),
              const Divider(height: 24),
              _buildRevenueItem('Data 2', '2798.50 (29.53%)', '35689 ৳'),
              const Divider(height: 24),
              _buildRevenueItem('Data 3', '2798.50 (29.53%)', '35689 ৳'),
              const Divider(height: 24),
              _buildRevenueItem('Data 4', '2798.50 (29.53%)', '35689 ৳'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDataItem(String label, String data, String cost, Color color) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                const Text(
                  'Data',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(width: 8),
                Text(
                  data,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text(
                  'Cost',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(width: 8),
                Text(
                  cost,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRevenueItem(String label, String data, String cost) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              data,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            Text(
              cost,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
