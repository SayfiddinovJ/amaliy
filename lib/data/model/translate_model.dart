class ResponseData{
  final TranslateModel responseData;
  ResponseData({required this.responseData});
  factory ResponseData.fromJson(Map<String, dynamic> json){
    print('Response');
    return ResponseData(responseData: TranslateModel.fromJson(json['responseData']));
  }
}


class TranslateModel{
  final String translatedText;
  TranslateModel({required this.translatedText});
  factory TranslateModel.fromJson(Map<String,dynamic> json){
    print('Translate');
    return TranslateModel(translatedText: json['translatedText'] ?? '');
  }
}