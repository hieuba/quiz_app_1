import 'package:quiz_app/models/question_model.dart';

final deA1 = [
  // ------------ de 1
  //1
  QuestionModel(
    questionText:
        "Phần của đường bộ được sử dụng cho các phương tiện giao thông qua lại là gì?",
    options: [
      "Phần mặt đường và lề đường. ",
      "Phần đường xe chạy.",
      "Phần đường xe cơ giới",
    ],
    correctOptionIndex: 1,
  ),
  //2
  QuestionModel(
    questionText:
        "“Phương tiện tham gia giao thông đường bộ” gồm những loại nào ?",
    options: [
      "Phương tiện giao thông cơ giới đường bộ.",
      "Phương tiện giao thông thô sơ đường bộ và xe máy chuyên dùng.",
      "Cả ý 1 và ý 2.",
    ],
    correctOptionIndex: 2,
  ),
  //3 *
  QuestionModel(
    questionText:
        "* Sử dụng rượu bia khi lái xe, nếu bị phát hiện thì bị xử lý như thế nào ?",
    options: [
      "Chỉ bị nhắc nhở.",
      "Bị xử phạt hành chính hoặc có thể bị xử lý hình sự tùy theo mức độ vi phạm.",
      "Không bị xử lý hình sự.",
    ],
    isSpecial: true,
    correctOptionIndex: 1,
  ),
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
    correctOptionIndex: 0,
  ),
  // 5 *
  QuestionModel(
    questionText:
        "Hành vi sử dụng xe mô tô để kéo, đẩy xe mô tô khác bị hết xăng đến trạm mua xăng có được phép hay không?",
    options: [
      "Chỉ được kéo nếu đã nhìn thấy trạm xăng. ",
      "Chỉ được thực hiện trên đường vắng phương tiện cùng tham gia giao thông.",
      "Không được phép.",
    ],
    isSpecial: true,
    correctOptionIndex: 2,
  ),
  // 6 bien bao
  QuestionModel(
    questionText:
        "Biển báo hiệu hình tròn có nền xanh lam có hình vẽ màu trắng là loại biển gì dưới đây ?",
    options: [
      "Biển báo nguy hiểm.",
      "Biển báo cấm.",
      "Biển báo hiệu lệnh phải thi hành.",
      "Biển báo chỉ dẫn.",
    ],
    imageUrl: 'assets/data/6.jpeg',
    isBienBao: true,
    correctOptionIndex: 2,
  ),
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
    correctOptionIndex: 3,
  ),
  // 8
  QuestionModel(
    questionText:
        "Người điều khiển phương tiện tham gia giao thông trong hầm đường bộ ngoài việc p",
    options: [
      "Xe cơ giới, xe máy chuyên dùng phải bật đèn, xe thô sơ phải bật đèn hoặc có vật phát sáng báo hiệu; chỉ được dừng xe, đỗ xe ở nơi quy định.",
      "Xe cơ giới phải bật đèn ngay cả khi đường hầm sáng; phải cho xe chạy trên một làn đường và chỉ chuyển làn ở nơi được phép; được quay đầu xe, lùi xe khi cần thiết.",
      "Xe máy chuyên dùng phải bật đèn ngay cả khi đường hầm sáng; phải cho xe chạy trên một làn đường và chỉ chuyển làn ở nơi được phép; được quay đầu xe, lùi xe khi cần thiết. ",
    ],
    correctOptionIndex: 0,
  ),
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
    correctOptionIndex: 3,
  ),
  // 10
  QuestionModel(
    questionText:
        "Khi điều khiển xe chạy với tốc độ dưới 60 km/h, để đảm bảo khoảng cách an toàn giữa hai xe, người lái xe phải điều khiển xe như thế nào?",
    options: [
      "Chủ động giữ khoảng cách an toàn phù hợp với xe chạy liền trước xe của mình. ",
      "Đảm bảo khoảng cách an toàn theo mật độ phương tiện, tình hình giao thông thực tế.",
      "Cả ý 1 và ý 2.",
    ],
    correctOptionIndex: 2,
  ),
  //11
  QuestionModel(
    questionText:
        "Để báo hiệu cho xe phía trước biết xe mô tô của bạn muốn vượt, bạn phải có tín hiệu như thế nào dưới đây?",
    options: [
      "Ra tín hiệu bằng tay rồi cho xe vượt qua.",
      "Tăng ga mạnh để gây sự chú ý rồi cho xe vượt qua. ",
      "Bạn phải có tín hiệu bằng đèn hoặc còi.",
    ],
    correctOptionIndex: 2,
  ),
  //12 *
  QuestionModel(
    questionText:
        "*Khi điều khiển xe mô tô tay ga xuống đường dốc dài, độ dốc cao, người lái xe cần thực hiện các thao tác nào dưới đây để đảm bảo an toàn?",
    options: [
      " Giữ tay ga ở mức độ phù hợp, sử dụng phanh trước và phanh sau để giảm tốc độ",
      "Nhả hết tay ga, tắt động cơ, sử dụng phanh trước và phanh sau để giảm tốc độ.",
      "Sử dụng phanh trước để giảm tốc độ kết hợp với tắt chìa khóa điện của xe.",
    ],
    isSpecial: true,
    correctOptionIndex: 0,
  ),
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
    correctOptionIndex: 3,
  ),
  //14 bien bao
  QuestionModel(
    questionText: "Biển nào cấm xe rẽ trái ?",
    options: [
      "Biển 1.",
      "Biển 2.",
      "Cả hai biển.",
    ],
    imageUrl: 'assets/data/14.jpeg',
    isBienBao: true,
    correctOptionIndex: 0,
  ),
  //15 bien bao
  QuestionModel(
    questionText: "Biển nào dưới đây các phương tiện không được phép đi vào ?",
    options: [
      "Biển 1.",
      "Biển 2.",
      "Biển 1 và Biển 2",
    ],
    imageUrl: 'assets/data/15.jpeg',
    isBienBao: true,
    correctOptionIndex: 2,
  ),
  //16 bien bao
  QuestionModel(
    questionText: "Biển nào xe mô tô hai bánh không được đi vào ?",
    options: [
      "Biển 1",
      "Biển 2",
      "Biển 3",
    ],
    imageUrl: 'assets/data/16.jpeg',
    isBienBao: true,
    correctOptionIndex: 1,
  ),
  // 17 bien bao
  QuestionModel(
    questionText: "Biển nào báo hiệu nguy hiểm giao nhau với đường sắt ?",
    options: [
      "Biển 1 và 2.",
      "Biển 1 và 3.",
      "Biển 2 và 3",
      "Cả 3 biển",
    ],
    imageUrl: 'assets/data/17.jpeg',
    isBienBao: true,
    correctOptionIndex: 1,
  ),
  //18 bien bao
  QuestionModel(
    questionText:
        "Biển nào báo hiệu “Đường giao nhau” của các tuyến đường cùng cấp ?",
    options: [
      "Biển 1",
      "Biển 2",
      "Biển 3",
    ],
    imageUrl: 'assets/data/18.jpeg',
    isBienBao: true,
    correctOptionIndex: 0,
  ),
  //19 bien bao
  QuestionModel(
    questionText:
        "Biển nào chỉ dẫn nơi bắt đầu đoạn đường dành cho người đi bộ ?",
    options: [
      "Biển 1",
      "Biển 2",
      "Biển 3",
    ],
    imageUrl: 'assets/data/19.jpeg',
    isBienBao: true,
    correctOptionIndex: 1,
  ),
  //20 bien bao
  QuestionModel(
    questionText: "Biển nào dưới đây báo hiệu hết cấm vượt ?",
    options: [
      "Biển 1",
      "Biển 2",
      "Biển 3",
      "Biển 2 và 3.",
    ],
    imageUrl: 'assets/data/20.jpeg',
    isBienBao: true,
    correctOptionIndex: 3,
  ),
  //21 bien bao
  QuestionModel(
    questionText:
        "Vạch kẻ đường nào dưới đây là vạch phân chia hai chiều xe chạy (vạch tim đường), xe không được lấn làn, không được đè lên vạch ?",
    options: [
      "Vạch 1.",
      "Vạch 2.",
      "Vạch 3.",
      "Cả 3 vạch",
    ],
    imageUrl: 'assets/data/21.jpeg',
    isBienBao: true,
    correctOptionIndex: 1,
  ),
  //22 sa hinh
  QuestionModel(
    questionText: "Xe nào được quyền đi trước trong trường hợp này ?",
    options: [
      "Mô tô.",
      "Xe cứu thương.",
    ],
    imageUrl: 'assets/data/22.jpeg',
    isSaHinh: true,
    correctOptionIndex: 1,
  ),
  // 23 sa hinh
  QuestionModel(
    questionText:
        "Xe tải kéo mô tô ba bánh như hình này có đúng quy tắc giao thông không ?",
    options: [
      "Đúng",
      "Không đúng",
    ],
    imageUrl: 'assets/data/23.jpeg',
    isSaHinh: true,
    correctOptionIndex: 1,
  ),
  //24 sa hinh
  QuestionModel(
    questionText: "Theo hướng mũi tên, những hướng nào xe mô tô được phép đi ?",
    options: [
      "Cả ba hướng.",
      "Hướng 1 và 2.",
      "Hướng 1 và 3.",
      "Hướng 2 và 3.",
    ],
    imageUrl: 'assets/data/24.jpeg',
    isSaHinh: true,
    correctOptionIndex: 2,
  ),
  // 25 sa hinh
  QuestionModel(
    questionText:
        "Các xe đi theo hướng mũi tên, xe nào vi phạm quy tắc giao thông?",
    options: [
      "Xe con, xe tải, xe khách.",
      "Xe tải, xe khách, xe mô tô.",
      "Xe khách, xe mô tô, xe con.",
      "Cả 4 xe",
    ],
    imageUrl: 'assets/data/25.jpeg',
    isSaHinh: true,
    correctOptionIndex: 1,
  ),

  //--------- de 2
// 1
  QuestionModel(
    questionText: "“Làn đường” là gì ?",
    options: [
      "Là một phần của phần đường xe chạy được chia theo chiều dọc của đường, sử dụng cho xe chạy.",
      "Là một phần của phần đường xe chạy được chia theo chiều dọc của đường, có bề rộng đủ cho xe chạy an toàn.",
      "Là đường cho xe ô tô chạy, dừng, đỗ an toàn.",
    ],
    correctOptionIndex: 1,
  ),
  //2
  QuestionModel(
    questionText:
        "Người tham gia giao thông đường bộ” gồm những đối tượng nào ?",
    options: [
      "Người điều khiển, người sử dụng phương tiện tham gia giao thông đường bộ.",
      "Người điều khiển, dẫn dắt súc vật; người đi bộ trên đường bộ.",
      "Cả ý 1 và ý 2.",
    ],
    correctOptionIndex: 2,
  ),
  //3 *
  QuestionModel(
    questionText:
        "* Theo Luật phòng chống tác hại của rượu, bia, đối tượng nào dưới đây bị cấm sử dụng rượu bia khi tham gia giao thông ?",
    options: [
      "Người điều khiển: Xe ô tô, xe mô tô, xe đạp, xe gắn máy.",
      "Người ngồi phía sau người điều khiển xe cơ giới.",
      "Người đi bộ.",
      "Cả ý 1 và ý 2.",
    ],
    isSpecial: true,
    correctOptionIndex: 0,
  ),
  // 4 *
  QuestionModel(
    questionText:
        "* Người điều khiển xe mô tô hai bánh, ba bánh, xe gắn máy có được phép sử dụng xe để kéo hoặc đẩy các phương tiện khác khi tham gia giao thông không ?",
    options: [
      "Được phép.",
      "Nếu phương tiện được kéo, đẩy có khối lượng nhỏ hơn phương tiện của mình.",
      "Tuỳ trường hợp.",
      "Không được phép.",
    ],
    isSpecial: true,
    correctOptionIndex: 3,
  ),
  // 5 *
  QuestionModel(
    questionText:
        "* Hành vi vận chuyển đồ vật cồng kềnh bằng xe mô tô, xe gắn máy khi tham gia giao thông có được phép hay không ?",
    options: [
      "Không được vận chuyển.",
      "Chỉ được vận chuyển khi đã chằng buộc cẩn thận.",
      "Chỉ được vận chuyển vật cồng kềnh trên xe máy nếu khoảng cách về nhà ngắn hơn 2 km.",
    ],
    isSpecial: true,
    correctOptionIndex: 0,
  ),
  // 6 bien bao
  QuestionModel(
    questionText:
        "Biển báo hiệu hình chữ nhật hoặc hình vuông hoặc hình mũi tên nền xanh lam là loại biển gì dưới đây ?",
    options: [
      "Biển báo nguy hiểm.",
      "Biển báo cấm.",
      "Biển báo hiệu lệnh phải thi hành.",
      "Biển báo chỉ dẫn.",
    ],
    imageUrl: 'assets/data/2_6.jpeg',
    isBienBao: true,
    correctOptionIndex: 3,
  ),
  //7
  QuestionModel(
    questionText:
        "Khi điều khiển xe chạy trên đường biết có xe sau xin vượt nếu đủ điều kiện an toàn người lái xe phải làm gì ?",
    options: [
      "Tăng tốc độ và ra hiệu cho xe sau vượt, không được gây trở ngại cho xe sau vượt.",
      "Người điều khiển phương tiện phía trước phải giảm tốc độ, đi sát về bên phải của phần đường xe chạy cho đến khi xe sau đã vượt qua, không được gây trở ngại cho xe sau vượt.",
      "Cho xe tránh về bên trái mình và ra hiệu cho xe sau vượt; nếu có chướng ngại vật phía trước hoặc thiếu điều kiện an toàn chưa cho vượt được phải ra hiệu cho xe sau biết; cấm gây trở ngại cho xe xin vượt.",
    ],
    correctOptionIndex: 1,
  ),
  // 8
  QuestionModel(
    questionText:
        "* Người ngồi trên xe mô tô 2 bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào ?",
    options: [
      "Khi tham gia giao thông đường bộ.",
      "Chỉ khi đi trên đường chuyên dùng; đường cao tốc.",
      "Khi tham gia giao thông trên đường tỉnh lộ hoặc quốc lộ.",
    ],
    isSpecial: true,
    correctOptionIndex: 0,
  ),
  // 9
  QuestionModel(
    questionText:
        "Người lái xe mô tô xử lý như thế nào khi cho xe mô tô phía sau vượt ?",
    options: [
      "Nếu đủ điều kiện an toàn, người lái xe phải giảm tốc độ, đi sát về bên phải của phần đường xe chạy cho đến khi xe sau đã vượt qua, không được gây trở ngại đối với xe xin vượt.",
      "Lái xe vào lề đường bên trái và giảm tốc độ để xe phía sau vượt qua, không được gây trở ngại đối với xe xin vượt.",
      "Nếu đủ điều kiện an toàn, người lái xe phải tăng tốc độ, đi sát về bên phải của phần đường xe chạy cho đến khi xe sau đã vượt qua.",
    ],
    correctOptionIndex: 0,
  ),
  // 10
  QuestionModel(
    questionText:
        "Người lái xe phải giảm tốc độ thấp hơn tốc độ tối đa cho phép đến mức cần thiết, chú ý quan sát và chuẩn bị sẵn sàng những tình huống có thế xảy ra để phòng ngừa tai nạn trong các trường hợp nào dưới đây ?",
    options: [
      "Gặp biển báo nguy hiểm trên đường.",
      "Gặp biển chỉ dẫn trên đường.",
      "Gặp biển báo hết mọi lệnh cấm.",
      "Gặp biển báo hết hạn chế tốc độ tối đa cho phép.",
    ],
    correctOptionIndex: 0,
  ),
  //11
  QuestionModel(
    questionText:
        "Người điều khiển xe mô tô phải giảm tốc độ và hết sức thận trọng khi qua những đoạn đường nào dưới đây ?",
    options: [
      "Đường ướt, đường có sỏi cát trên nền đường.",
      "Đường hẹp có nhiều điểm giao cắt từ hai phía.",
      "Đường đèo dốc, vòng liên tục.",
      "Tất cả các ý nêu trên.",
    ],
    correctOptionIndex: 3,
  ),

  //12
  QuestionModel(
    questionText:
        "Khi quay đầu xe, người lái xe cần phải quan sát và thực hiện các thao tác nào để đảm bảo an toàn giao thông ?",
    options: [
      "Quan sát biển báo hiệu để biết nơi được phép quay đầu; quan sát kỹ địa hình nơi chọn để quay đầu; lựa chọn quỹ đạo quay đầu xe cho thích hợp; quay đầu xe với tốc độ thấp; thường xuyên báo tín hiệu để người, các phương tiện xung quanh được biết; nếu quay đầu xe ở nơi nguy hiểm thì đưa đầu xe về phía nguy hiểm đưa đuôi xe về phía an toàn.",
      "Quan sát biển báo hiệu để biết nơi được phép quay đầu; quan sát kỹ địa hình nơi chọn để quay đầu; lựa chọn quỹ đạo quay đầu xe; quay đầu xe với tốc độ tối đa; thường xuyên báo tín hiệu để người, các phương tiện xung quanh được biết; nếu quay đầu xe ở nơi nguy hiểm thì đưa đuôi xe về phía nguy hiểm và đầu xe về phía an toàn.",
    ],
    correctOptionIndex: 0,
  ),
  //13
  QuestionModel(
    questionText:
        "Gương chiếu hậu của xe mô tô hai bánh, có tác dụng gì trong các trường hợp dưới đây ?",
    options: [
      "Để quan sát an toàn phía bên trái khi chuẩn bị rẽ trái.",
      "Để quan sát an toàn phía bên phải khi chuẩn bị rẽ phải.",
      "Để quan sát an toàn phía sau cả bên trái và bên phải trước khi chuyển hướng.",
      "Để quan sát an toàn phía trước cả bên trái và bên phải trước khi chuyển hướng.",
    ],
    correctOptionIndex: 2,
  ),
  //14 bien bao
  QuestionModel(
    questionText: "Khi gặp biển nào xe được rẽ trái ?",
    options: [
      "Biển 1.",
      "Biển 2.",
      "Không biển nào.",
    ],
    imageUrl: 'assets/data/2_14.jpeg',
    isBienBao: true,
    correctOptionIndex: 1,
  ),
  //15 bien bao
  QuestionModel(
    questionText:
        "Khi gặp biển nào xe ưu tiên theo luật định vẫn phải dừng lại ?",
    options: [
      "Biển 1.",
      "Biển 2.",
      "Cả ba biển.",
    ],
    imageUrl: 'assets/data/2_15.jpeg',
    isBienBao: true,
    correctOptionIndex: 1,
  ),
  //16 bien bao
  QuestionModel(
    questionText:
        "Biển báo nào báo hiệu bắt đầu đoạn đường vào phạm vi khu dân cư, các phương tiện tham gia giao thông phải tuân theo các quy định đi đường được áp dụng ở khu đông dân cư ?",
    options: [
      "Biển 1",
      "Biển 2",
    ],
    imageUrl: 'assets/data/2_16.jpeg',
    isBienBao: true,
    correctOptionIndex: 0,
  ),
  // 17 bien bao
  QuestionModel(
    questionText:
        "Biển nào báo hiệu Đường sắt giao nhau với đường bộ không có rào chắn ?",
    options: [
      "Biển 1 và 2.",
      "Biển 1 và 3.",
      "Biển 2 và 3",
      "Cả 3 biển",
    ],
    imageUrl: 'assets/data/2_17.jpeg',
    isBienBao: true,
    correctOptionIndex: 2,
  ),
  //18 bien bao
  QuestionModel(
    questionText: "Biển nào báo hiệu “Đường đôi” ?",
    options: [
      "Biển 1",
      "Biển 2",
      "Biển 3",
    ],
    imageUrl: 'assets/data/2_18.jpeg',
    isBienBao: true,
    correctOptionIndex: 1,
  ),
  //19 bien bao
  QuestionModel(
    questionText: "Biển báo này có ý nghĩa gì ?",
    options: [
      "Báo hiệu đường có ổ gà, lồi lõm.",
      "Báo hiệu đường có gồ giảm tốc phía trước.",
    ],
    imageUrl: 'assets/data/2_19.jpeg',
    isBienBao: true,
    correctOptionIndex: 1,
  ),
  //20 bien bao
  QuestionModel(
    questionText:
        "Trong các biển dưới đây biển nào là biển “Hết mọi lệnh cấm” ?",
    options: [
      "Biển 1",
      "Biển 2",
      "Biển 3",
      "Cả ba biển",
    ],
    imageUrl: 'assets/data/2_20.jpeg',
    isBienBao: true,
    correctOptionIndex: 1,
  ),
  //21 bien bao
  QuestionModel(
    questionText:
        "Vạch kẻ đường nào dưới đây là vạch phân chia hai chiều xe chạy (vạch tim đường) ?",
    options: [
      "Vạch 1.",
      "Vạch 2.",
      "Vạch 3.",
      "Vạch 1 và 3",
    ],
    imageUrl: 'assets/data/2_21.jpeg',
    isBienBao: true,
    correctOptionIndex: 3,
  ),
  //22 sa hinh
  QuestionModel(
    questionText: "Theo tín hiệu đèn, xe nào được phép đi ?",
    options: [
      "Xe con và xe khách.",
      "Mô tô.",
    ],
    imageUrl: 'assets/data/2_22.jpeg',
    isSaHinh: true,
    correctOptionIndex: 0,
  ),
  // 23 sa hinh
  QuestionModel(
    questionText: "Xe nào được quyền đi trước trong trường hợp này ?",
    options: [
      "Xe con.",
      "Xe mô tô.",
    ],
    imageUrl: 'assets/data/2_23.jpeg',
    isSaHinh: true,
    correctOptionIndex: 1,
  ),
  //24 sa hinh
  QuestionModel(
    questionText:
        "Trong trường hợp này, thứ tự xe đi như thế nào là đúng quy tắc giao thông ?",
    options: [
      "Xe công an, xe quân sự, xe con + mô tô.",
      "Xe quân sự, xe công an, xe con + mô tô.",
      "Xe mô tô + xe con, xe quân sự, xe công an."
    ],
    imageUrl: 'assets/data/2_24.jpeg',
    isSaHinh: true,
    correctOptionIndex: 1,
  ),
  // 25 sa hinh
  QuestionModel(
    questionText:
        "Các xe đi theo hướng mũi tên, xe nào chấp hành đúng quy tắc giao thông ?",
    options: [
      "Xe tải, mô tô.",
      "Xe khách, mô tô.",
      "Xe tải, xe con.",
      "Mô tô, xe con."
    ],
    imageUrl: 'assets/data/2_25.jpeg',
    isSaHinh: true,
    correctOptionIndex: 1,
  ),
];


// 8 bien , 4 sa hinh, 2 special