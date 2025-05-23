import 'package:get/get.dart';

class BookingController extends GetxController {
  final List<String> statuses = ['Pending', 'Completed', 'In Transit'];
  var selectedStatuses = <String>{}.obs;
  var currentPage = 1.obs;
  final int itemsPerPage = 8;
  var bookings = <Map<String, dynamic>>[].obs;
  var filteredBookings = <Map<String, dynamic>>[].obs;
  var selectedTab = 'User'.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    bookings.addAll([
      {
        "id": '00001',
        "driverId": "D001",
        "driverName": "Michael Johnson",
        "userName": "John Doe",
        "vehicleType": "Sedan",
        "price": 25.0,
        "pickupLocation": "123 Main St, New York, NY",
        "pickupLat": 40.712776,
        "pickupLng": -74.005974,
        "dropoffLocation": "456 Elm St, Brooklyn, NY",
        "dropoffLat": 40.678178,
        "dropoffLng": -73.944158,
        "status": "Completed",
      },
      {
        "id": '00002',
        "driverId": "D002",
        "driverName": "Emily Davis",
        "userName": "Jane Smith",
        "vehicleType": "SUV",
        "price": 50.0,
        "pickupLocation": "789 Oak St, Los Angeles, CA",
        "pickupLat": 34.052235,
        "pickupLng": -118.243683,
        "dropoffLocation": "321 Pine St, Beverly Hills, CA",
        "dropoffLat": 34.073620,
        "dropoffLng": -118.400356,
        "status": "Pending",
      },
      {
        "id": '00003',
        "driverId": "D003",
        "driverName": "Robert Wilson",
        "userName": "Alice Brown",
        "vehicleType": "Luxury",
        "price": 75.0,
        "pickupLocation": "567 Maple Ave, Chicago, IL",
        "pickupLat": 41.878113,
        "pickupLng": -87.629799,
        "dropoffLocation": "890 Birch Rd, Evanston, IL",
        "dropoffLat": 42.045074,
        "dropoffLng": -87.687696,
        "status": "In Transit",
      },
    ]);

    filteredBookings.assignAll(bookings);
  }

  List<Map<String, dynamic>> get paginatedUsers {
    int start = (currentPage.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    var list = filteredBookings;

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
      filteredBookings.assignAll(bookings);
    } else {
      filteredBookings.assignAll(
        bookings
            .where((user) => selectedStatuses.contains(user['status']))
            .toList(),
      );
    }

    currentPage.value = 1;

    int totalPages = (filteredBookings.length / itemsPerPage).ceil();
    if (currentPage.value > totalPages) {
      currentPage.value = totalPages > 0 ? totalPages : 1;
    }

    update();
  }

  void deleteBooking(String userId) {
    bookings.removeWhere((user) => user['id'] == userId);
    filteredBookings.removeWhere((user) => user['id'] == userId);

    int totalPages = (filteredBookings.length / itemsPerPage).ceil();
    if (currentPage.value > totalPages) {
      currentPage.value = totalPages > 0 ? totalPages : 1;
    }

    update();
  }

  void updateBookingStatus(String userId, String newStatus) {
    int index = bookings.indexWhere((user) => user['id'] == userId);
    if (index != -1) {
      bookings[index] = {...bookings[index], 'status': newStatus};

      int filteredIndex = filteredBookings.indexWhere(
        (user) => user['id'] == userId,
      );
      if (filteredIndex != -1) {
        filteredBookings[filteredIndex] = {
          ...filteredBookings[filteredIndex],
          'status': newStatus,
        };
      }

      bookings.refresh();
      filteredBookings.refresh();
    }
  }
}
