import 'package:get/get.dart';

class UserController extends GetxController {
  final List<String> statuses = ['Active', 'Blocked'];
  var selectedStatuses = <String>{}.obs;
  var selectedStatus = '10'.obs;
  final List<String> options = ['10', '20', '30'];
  var currentPage = 1.obs;
  final int itemsPerPage = 3;
  var users = <Map<String, dynamic>>[].obs;
  var filteredUsers = <Map<String, dynamic>>[].obs;
  var selectedTab = 'General Info'.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    users.addAll([
      {
        'id': '00001',
        'name': 'Christine Brooks',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
        'discounts': '4547',
        'disPer': "10"
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
        'discounts': '4547',
        'disPer': "10"
      },
      {
        'id': '00003',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
        'discounts': '4547',
        'disPer': "10"
      },
      {
        'id': '00004',
        'name': 'Christine Brooks',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
        'discounts': '4547',
        'disPer': "10"
      },
      {
        'id': '00005',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
        'discounts': '4547',
        'disPer': "10"
      },
      {
        'id': '00006',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
        'discounts': '4547',
        'disPer': "10"
      },
      {
        'id': '00007',
        'name': 'Christine Brooks',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
        'discounts': '4547',
        'disPer': "10"
      },
      {
        'id': '00008',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
        'discounts': '4547',
        'disPer': "10"
      },
      {
        'id': '00009',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
        'discounts': '4547',
        'disPer': "10"
      },
      {
        'id': '000010',
        'name': 'Christine Brooks',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
        'discounts': '4547',
        'disPer': "10"
      },
      {
        'id': '000011',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
        'discounts': '4547',
        'disPer': "10"
      },
      {
        'id': '000012',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
        'discounts': '4547',
        'disPer': "10"
      },
      {
        'id': '000013',
        'name': 'Christine Brooks',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
        'discounts': '4547',
        'disPer': "10"
      },
      {
        'id': '000014',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
        'discounts': '4547',
        'disPer': "10"
      },
      {
        'id': '000015',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
        'discounts': '4547',
        'disPer': "10"
      },
    ]);

    filteredUsers.assignAll(users);
  }

  List<Map<String, dynamic>> get paginatedUsers {
    int start = (currentPage.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    var list = filteredUsers;

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
      filteredUsers.assignAll(users);
    } else {
      filteredUsers.assignAll(
        users
            .where((user) => selectedStatuses.contains(user['status']))
            .toList(),
      );
    }

    currentPage.value = 1;

    int totalPages = (filteredUsers.length / itemsPerPage).ceil();
    if (currentPage.value > totalPages) {
      currentPage.value = totalPages > 0 ? totalPages : 1;
    }

    update();
  }

  void deleteUser(String userId) {
    users.removeWhere((user) => user['id'] == userId);
    filteredUsers.removeWhere((user) => user['id'] == userId);

    int totalPages = (filteredUsers.length / itemsPerPage).ceil();
    if (currentPage.value > totalPages) {
      currentPage.value = totalPages > 0 ? totalPages : 1;
    }

    update();
  }

  void updateUserStatus(String userId, String newStatus) {
    int index = users.indexWhere((user) => user['id'] == userId);
    if (index != -1) {
      users[index] = {...users[index], 'status': newStatus};

      int filteredIndex = filteredUsers.indexWhere(
        (user) => user['id'] == userId,
      );
      if (filteredIndex != -1) {
        filteredUsers[filteredIndex] = {
          ...filteredUsers[filteredIndex],
          'status': newStatus,
        };
      }

      users.refresh();
      filteredUsers.refresh();
    }
  }
}
