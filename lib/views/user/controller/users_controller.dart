import 'package:get/get.dart';

class UserController extends GetxController {
  final List<String> statuses = ['Active', 'Blocked'];
  var selectedStatuses = <String>{}.obs;
  var currentPage = 1.obs;
  final int itemsPerPage = 8;
  var users = <Map<String, dynamic>>[].obs;
  var filteredUsers = <Map<String, dynamic>>[].obs;

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
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00001',
        'name': 'Christine Brooks',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00001',
        'name': 'Christine Brooks',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00001',
        'name': 'Christine Brooks',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00001',
        'name': 'Christine Brooks',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00001',
        'name': 'Christine Brooks',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00001',
        'name': 'Christine Brooks',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Blocked',
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
      {
        'id': '00002',
        'name': 'Rosie Pearson',
        'orders': 15,
        'date': '2025-01-01',
        'status': 'Active',
      },
    ]);

    filteredUsers.assignAll(users);
  }

  // List<Map<String, dynamic>> get paginatedUsers {
  //   int start = (currentPage.value - 1) * itemsPerPage;
  //   int end = start + itemsPerPage;
  //   var list = filteredUsers;
  //   return list.sublist(start, end > list.length ? list.length : end);
  // }

  // void toggleStatusSelection(String status) {
  //   if (selectedStatuses.contains(status)) {
  //     selectedStatuses.remove(status);
  //   } else {
  //     selectedStatuses.add(status);
  //   }

  //   if (selectedStatuses.isEmpty) {
  //     filteredUsers.assignAll(users);
  //   } else {
  //     filteredUsers.assignAll(
  //       users
  //           .where((user) => selectedStatuses.contains(user['status']))
  //           .toList(),
  //     );
  //   }

  //   currentPage.value = 1;
  //   update();
  // }

  List<Map<String, dynamic>> get paginatedUsers {
    int start = (currentPage.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    var list = filteredUsers; // Apply pagination to filtered users

    if (start >= list.length)
      return []; // Prevents RangeError if page is out of bounds
    return list.sublist(start, end > list.length ? list.length : end);
  }

  // Toggle selection of a status and update filtered users
  void toggleStatusSelection(String status) {
    if (selectedStatuses.contains(status)) {
      selectedStatuses.remove(status);
    } else {
      selectedStatuses.add(status);
    }

    // If no status is selected, show all users
    if (selectedStatuses.isEmpty) {
      filteredUsers.assignAll(users);
    } else {
      filteredUsers.assignAll(
        users
            .where((user) => selectedStatuses.contains(user['status']))
            .toList(),
      );
    }

    // Reset pagination when filtering users
    currentPage.value = 1;
    update();
  }
}
