import 'package:quiz_app/models/question_model.dart';

final questionsA1 = [
  //1
  QuestionModel(
      questionText:
          "Phần của đường bộ được sử dụng cho các phương tiện giao thông qua lại là gì?",
      options: [
        "Phần mặt đường và lề đường. ",
        "Phần đường xe chạy.",
        "Phần đường xe cơ giới",
      ],
      correctOptionIndex: 1),
  //2
  QuestionModel(
      questionText:
          "“Phương tiện tham gia giao thông đường bộ” gồm những loại nào ?",
      options: [
        "Phương tiện giao thông cơ giới đường bộ.",
        "Phương tiện giao thông thô sơ đường bộ và xe máy chuyên dùng.",
        "Cả ý 1 và ý 2.",
      ],
      correctOptionIndex: 2),
  //3 *
  QuestionModel(
      questionText:
          "* Sử dụng rượu bia khi lái xe, nếu bị phát hiện thì bị xử lý như thế nào ?",
      options: [
        "Chỉ bị nhắc nhở.",
        "Bị xử phạt hành chính hoặc có thể bị xử lý hình sự tùy theo mức độ vi phạm.",
        "Không bị xử lý hình sự.",
      ],
      correctOptionIndex: 2),
  // 4
  QuestionModel(
      questionText:
          "Bạn đang lái xe phía trước có một xe cứu thương đang phát tín hiệu ưu tiên bạn có được phép vượt hay không ?",
      options: [
        "Không được vượt.",
        "Được vượt khi đang đi trên cầu.",
        "Được phép vượt khi đi qua nơi giao nhau có ít phương tiện cùng tham gia giao thông.",
        "Được vượt khi đảm bảo an toàn.",
      ],
      correctOptionIndex: 0),
  // 5 *
  QuestionModel(
      questionText:
          "Hành vi sử dụng xe mô tô để kéo, đẩy xe mô tô khác bị hết xăng đến trạm mua xăng có được phép hay không?",
      options: [
        "Chỉ được kéo nếu đã nhìn thấy trạm xăng. ",
        "Chỉ được thực hiện trên đường vắng phương tiện cùng tham gia giao thông.",
        "Không được phép.",
      ],
      correctOptionIndex: 2),
  // 6 hinh
  QuestionModel(
      questionText:
          "Biển báo hiệu hình tròn có nền xanh lam có hình vẽ màu trắng là loại biển gì dưới đây ?",
      options: [
        "Biển báo nguy hiểm.",
        "Biển báo cấm.",
        "Biển báo hiệu lệnh phải thi hành.",
        "Biển báo chỉ dẫn.",
      ],
      imageUrl: 'https://hoclaixehcm.vn/image200/41.jpg',
      correctOptionIndex: 2),
  //7
  QuestionModel(
      questionText:
          "Bạn đang lái xe trong khu vực đô thị từ 22 giờ đến 5 giờ sáng hôm sau và cần vượt một xe khác, bạn cần báo hiệu như thế nào để đảm bảo an toàn giao thông? ",
      options: [
        "Phải báo hiệu bằng đèn hoặc còi",
        "Chỉ được báo hiệu bằng còi.",
        "Phải báo hiệu bằng cả còi và đèn.",
        "Chỉ được báo hiệu bằng đèn."
      ],
      correctOptionIndex: 3),
  // 8
  QuestionModel(
      questionText:
          "Người điều khiển phương tiện tham gia giao thông trong hầm đường bộ ngoài việc p",
      options: [
        "Xe cơ giới, xe máy chuyên dùng phải bật đèn, xe thô sơ phải bật đèn hoặc có vật phát sáng báo hiệu; chỉ được dừng xe, đỗ xe ở nơi quy định.",
        "Xe cơ giới phải bật đèn ngay cả khi đường hầm sáng; phải cho xe chạy trên một làn đường và chỉ chuyển làn ở nơi được phép; được quay đầu xe, lùi xe khi cần thiết.",
        "Xe máy chuyên dùng phải bật đèn ngay cả khi đường hầm sáng; phải cho xe chạy trên một làn đường và chỉ chuyển làn ở nơi được phép; được quay đầu xe, lùi xe khi cần thiết. ",
      ],
      correctOptionIndex: 0),
  // 9
  QuestionModel(
      questionText:
          "Trên đoạn đường hai chiều không có giải phân cách giữa, người lái xe không được vượt xe khác trong các trường hợp nào dưới đây?",
      options: [
        "Xe bị vượt bất ngờ tăng tốc độ và cố tình không nhường đường.",
        "Xe bị vượt giảm tốc độ và nhường đường",
        "Phát hiện có xe đi ngược chiều.",
        "Cả ý 1 và ý 3."
      ],
      correctOptionIndex: 3),
  // 10
  QuestionModel(
      questionText:
          "Khi điều khiển xe chạy với tốc độ dưới 60 km/h, để đảm bảo khoảng cách an toàn giữa hai xe, người lái xe phải điều khiển xe như thế nào?",
      options: [
        "Chủ động giữ khoảng cách an toàn phù hợp với xe chạy liền trước xe của mình. ",
        "Đảm bảo khoảng cách an toàn theo mật độ phương tiện, tình hình giao thông thực tế.",
        "Cả ý 1 và ý 2.",
      ],
      correctOptionIndex: 2),
  //11
  QuestionModel(
      questionText:
          "Để báo hiệu cho xe phía trước biết xe mô tô của bạn muốn vượt, bạn phải có tín hiệu như thế nào dưới đây?",
      options: [
        "Ra tín hiệu bằng tay rồi cho xe vượt qua.",
        "Tăng ga mạnh để gây sự chú ý rồi cho xe vượt qua. ",
        "Bạn phải có tín hiệu bằng đèn hoặc còi.",
      ],
      correctOptionIndex: 2),
  //12 *
  QuestionModel(
      questionText:
          "*Khi điều khiển xe mô tô tay ga xuống đường dốc dài, độ dốc cao, người lái xe cần thực hiện các thao tác nào dưới đây để đảm bảo an toàn?",
      options: [
        " Giữ tay ga ở mức độ phù hợp, sử dụng phanh trước và phanh sau để giảm tốc độ",
        "Nhả hết tay ga, tắt động cơ, sử dụng phanh trước và phanh sau để giảm tốc độ.",
        "Sử dụng phanh trước để giảm tốc độ kết hợp với tắt chìa khóa điện của xe.",
      ],
      correctOptionIndex: 0),
  //13
  QuestionModel(
      questionText:
          "Tay ga trên xe mô tô hai bánh có tác dụng gì trong các trường hợp dưới đây ?",
      options: [
        "Để điều khiển xe chạy về phía trước.",
        "Để điều tiết công suất động cơ qua đó điều khiển tốc độ của xe.",
        "Để điều khiển xe chạy lùi.",
        "Cả ý 1 và ý 2.",
      ],
      correctOptionIndex: 3),
  //14 hinh
  QuestionModel(
      questionText: "Biển nào cấm xe rẽ trái ?",
      options: [
        "Biển 1.",
        "Biển 2.",
        "Cả hai biển.",
      ],
      imageUrl: 'https://hoclaixehcm.vn/image200/105.jpg',
      correctOptionIndex: 0),
  //15 hịnh
  QuestionModel(
      questionText:
          "Biển nào dưới đây các phương tiện không được phép đi vào ?",
      options: [
        "Biển 1.",
        "Biển 2.",
        "Biển 1 và Biển 2",
      ],
      imageUrl: 'https://hoclaixehcm.vn/image200/113.jpg',
      correctOptionIndex: 2),
  //16 hinh
  QuestionModel(
      questionText: "Biển nào xe mô tô hai bánh không được đi vào ?",
      options: [
        "Biển 1",
        "Biển 2",
        "Biển 3",
      ],
      imageUrl: 'https://hoclaixehcm.vn/image200/121.jpg',
      correctOptionIndex: 1),
  // 17 hinh
  QuestionModel(
      questionText: "Biển nào báo hiệu nguy hiểm giao nhau với đường sắt ?",
      options: [
        "Biển 1 và 2.",
        "Biển 1 và 3.",
        "Biển 2 và 3",
        "Cả 3 biển",
      ],
      imageUrl: 'https://hoclaixehcm.vn/image200/129.jpg',
      correctOptionIndex: 1),
  //18 hinh
  QuestionModel(
      questionText:
          "Biển nào báo hiệu “Đường giao nhau” của các tuyến đường cùng cấp ?",
      options: [
        "Biển 1",
        "Biển 2",
        "Biển 3",
      ],
      imageUrl: 'https://hoclaixehcm.vn/image200/137.jpg',
      correctOptionIndex: 0),
  //19 hinh
  QuestionModel(
      questionText:
          "Biển nào chỉ dẫn nơi bắt đầu đoạn đường dành cho người đi bộ ?",
      options: [
        "Biển 1",
        "Biển 2",
        "Biển 3",
      ],
      imageUrl: 'https://hoclaixehcm.vn/image200/145.jpg',
      correctOptionIndex: 1),
  //20 hinh
  QuestionModel(
      questionText: "Biển nào dưới đây báo hiệu hết cấm vượt ?",
      options: [
        "Biển 1",
        "Biển 2",
        "Biển 3",
        "Biển 2 và 3.",
      ],
      imageUrl: 'https://hoclaixehcm.vn/image200/153.jpg',
      correctOptionIndex: 3),
  //21 hinh
  QuestionModel(
      questionText:
          "Vạch kẻ đường nào dưới đây là vạch phân chia hai chiều xe chạy (vạch tim đường), xe không được lấn làn, không được đè lên vạch ?",
      options: [
        "Vạch 1.",
        "Vạch 2.",
        "Vạch 3.",
        "Cả 3 vạch",
      ],
      imageUrl: 'https://hoclaixehcm.vn/image200/161.jpg',
      correctOptionIndex: 1),
  //22 hịnh
  QuestionModel(
      questionText: "Xe nào được quyền đi trước trong trường hợp này ?",
      options: [
        "Mô tô.",
        "Xe cứu thương.",
      ],
      imageUrl: 'https://hoclaixehcm.vn/image200/169.jpg',
      correctOptionIndex: 1),
  // 23
  QuestionModel(
      questionText:
          "Xe tải kéo mô tô ba bánh như hình này có đúng quy tắc giao thông không ?",
      options: [
        "Đúng",
        "Không đúng",
      ],
      imageUrl: 'https://hoclaixehcm.vn/image200/177.jpg',
      correctOptionIndex: 1),
  //24 hinh
  QuestionModel(
      questionText:
          "Theo hướng mũi tên, những hướng nào xe mô tô được phép đi ?",
      options: [
        "Cả ba hướng.",
        "Hướng 1 và 2.",
        "Hướng 1 và 3."
            "Hướng 2 và 3.",
      ],
      imageUrl: 'https://hoclaixehcm.vn/image200/185.jpg',
      correctOptionIndex: 2),
  // 25 hinh
  QuestionModel(
      questionText:
          "Các xe đi theo hướng mũi tên, xe nào vi phạm quy tắc giao thông?",
      options: [
        "Xe con, xe tải, xe khách.",
        "Xe tải, xe khách, xe mô tô.",
        "Xe khách, xe mô tô, xe con.",
      ],
      imageUrl: 'https://hoclaixehcm.vn/image200/193.jpg',
      correctOptionIndex: 1),
];
