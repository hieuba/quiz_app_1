Map<int, dynamic> generateMap(int n) {
  Map<int, dynamic> value = {};
  for (int i = 0; i < n; i++) {
    value[i] = null;
  }
  return value;
}

// Hàm chuyển đổi thời gian từ giây sang phút
String convertSecondsToMinutes(String seconds) {
  int secondsValue = int.parse(seconds);
  int minutes = secondsValue ~/ 60; // Lấy phần nguyên

  return '$minutes phút';
}
