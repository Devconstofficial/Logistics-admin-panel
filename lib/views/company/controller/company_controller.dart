import 'package:get/get.dart';

class CompanyController extends GetxController {
  final List<String> statuses = ['Active', 'Blocked'];
  var selectedStatuses = <String>{}.obs;
  var selectedStatus = "".obs;
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
        'id': 'LogiXpress',
        'type': 'Logistics',
        'name': "Ahsan Khan",
        'number': '+92 3011122334',
        'status': 'Active',
        'discounts': '2000',
        'disPer': "5"
      },
      {
        'id': 'SpeedCargo',
        'type': 'Logistics',
        'name': "Sara Malik",
        'number': '+92 3029988776',
        'status': 'Blocked',
        'discounts': '3000',
        'disPer': "7"
      },
      {
        'id': 'GoMove',
        'type': 'Transport',
        'name': "Imran Ali",
        'number': '+92 3035566778',
        'status': 'Active',
        'discounts': '4500',
        'disPer': "10"
      },
      {
        'id': 'PakLoaders',
        'type': 'Freight',
        'name': "Rabia Sheikh",
        'number': '+92 3046655443',
        'status': 'Blocked',
        'discounts': '1200',
        'disPer': "3"
      },
      {
        'id': 'FreightPro',
        'type': 'Logistics',
        'name': "Zain Raza",
        'number': '+92 3054433221',
        'status': 'Active',
        'discounts': '3400',
        'disPer': "6"
      },
      {
        'id': 'MoveFast',
        'type': 'Transport',
        'name': "Fariha Tanveer",
        'number': '+92 3061122334',
        'status': 'Blocked',
        'discounts': '5000',
        'disPer': "12"
      },
      {
        'id': 'QuickShift',
        'type': 'Logistics',
        'name': "Hamza Yousuf",
        'number': '+92 3072233445',
        'status': 'Active',
        'discounts': '2750',
        'disPer': "8"
      },
      {
        'id': 'TrackRoute',
        'type': 'Freight',
        'name': "Mehwish Qadir",
        'number': '+92 3083344556',
        'status': 'Blocked',
        'discounts': '3900',
        'disPer': "9"
      },
      {
        'id': 'TransPak',
        'type': 'Transport',
        'name': "Bilal Shah",
        'number': '+92 3094455667',
        'status': 'Active',
        'discounts': '3100',
        'disPer': "4"
      },
      {
        'id': 'LogiQuick',
        'type': 'Logistics',
        'name': "Tania Ahmad",
        'number': '+92 3005566778',
        'status': 'Blocked',
        'discounts': '2800',
        'disPer': "5"
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