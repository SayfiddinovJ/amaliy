class ChatModel {
  final String userName;
  final String massage;
  final String createdAt;

  ChatModel({
    required this.userName,
    required this.massage,
    required this.createdAt,
  });

  ChatModel copyWith({
    String? userName,
    String? massage,
    String? createdAt,
  }) {
    return ChatModel(
      userName: userName ?? this.userName,
      massage: massage ?? this.massage,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory ChatModel.fromJson(Map<String, dynamic> jsonData) {
    return ChatModel(
      userName: jsonData['username'] as String? ?? "",
      massage: jsonData['massage'] as String? ?? '',
      createdAt: jsonData['createdAt'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'massage': massage,
      'createdAt': createdAt,
    };
  }

  @override
  String toString() {
    return ''''
       username : $userName,
       massage : $massage,
       createdAt : $createdAt, 
      ''';
  }
}
