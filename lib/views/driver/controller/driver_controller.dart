import 'package:get/get.dart';

class DriverController extends GetxController {
  final List<String> statuses = ['Active', 'Blocked'];
  var selectedStatuses = <String>{}.obs;
  var currentPage = 1.obs;
  final int itemsPerPage = 3;
  var drivers = <Map<String, dynamic>>[].obs;
  var filteredDrivers = <Map<String, dynamic>>[].obs;
  var selectedTab = 'General Info'.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    drivers.addAll([
      {
        'id': '00001',
        'name': 'Christine Brooks',
        'jobs': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'jobs': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00003',
        'name': 'Rosie Pearson',
        'jobs': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00004',
        'name': 'Christine Brooks',
        'jobs': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
      },
      {
        'id': '00005',
        'name': 'Rosie Pearson',
        'jobs': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00006',
        'name': 'Rosie Pearson',
        'jobs': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00007',
        'name': 'Christine Brooks',
        'jobs': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
      },
      {
        'id': '00008',
        'name': 'Rosie Pearson',
        'jobs': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00009',
        'name': 'Rosie Pearson',
        'jobs': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '000010',
        'name': 'Christine Brooks',
        'jobs': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
      },
      {
        'id': '000011',
        'name': 'Rosie Pearson',
        'jobs': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '000012',
        'name': 'Rosie Pearson',
        'jobs': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '000013',
        'name': 'Christine Brooks',
        'jobs': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
      },
      {
        'id': '000014',
        'name': 'Rosie Pearson',
        'jobs': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
    ]);

    filteredDrivers.assignAll(drivers);
  }

  List<Map<String, dynamic>> get paginatedUsers {
    int start = (currentPage.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    var list = filteredDrivers;

    if (start >= list.length) return [];
    return list.sublist(start, end > list.length ? list.length : end);
  }

  void toggleStatusSelection(String status) {
    if (selectedStatuses.contains(status)) {
      selectedStatuses.remove(status);
    } else {
      selectedStatuses.add(status);
    }

    if (selectedStatuses.isEmpty) {
      filteredDrivers.assignAll(drivers);
    } else {
      filteredDrivers.assignAll(
        drivers
            .where((user) => selectedStatuses.contains(user['status']))
            .toList(),
      );
    }

    currentPage.value = 1;

    int totalPages = (filteredDrivers.length / itemsPerPage).ceil();
    if (currentPage.value > totalPages) {
      currentPage.value = totalPages > 0 ? totalPages : 1;
    }

    update();
  }

  void deleteDriver(String userId) {
    drivers.removeWhere((user) => user['id'] == userId);
    filteredDrivers.removeWhere((user) => user['id'] == userId);

    int totalPages = (filteredDrivers.length / itemsPerPage).ceil();
    if (currentPage.value > totalPages) {
      currentPage.value = totalPages > 0 ? totalPages : 1;
    }

    update();
  }

  void updateDriverStatus(String userId, String newStatus) {
    int index = drivers.indexWhere((user) => user['id'] == userId);
    if (index != -1) {
      drivers[index] = {...drivers[index], 'status': newStatus};

      int filteredIndex = filteredDrivers.indexWhere(
        (user) => user['id'] == userId,
      );
      if (filteredIndex != -1) {
        filteredDrivers[filteredIndex] = {
          ...filteredDrivers[filteredIndex],
          'status': newStatus,
        };
      }

      drivers.refresh();
      filteredDrivers.refresh();
    }
  }
}
