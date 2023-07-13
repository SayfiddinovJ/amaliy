class TimesModel{
  final String tongSaharlik;
  final String quyosh;
  final String peshin;
  final String asr;
  final String shomIftor;
  final String hufton;
  TimesModel({
    required this.tongSaharlik,
    required this.quyosh,
    required this.peshin,
    required this.asr,
    required this.shomIftor,
    required this.hufton,
  });
  factory TimesModel.fromJson(Map<String,dynamic> json){
    return TimesModel(
        tongSaharlik: json['tong_saharlik'] as String? ?? '',
        quyosh: json['quyosh'] as String? ?? '',
        peshin: json['peshin'] as String? ?? '',
        asr: json['asr'] as String? ?? '',
        shomIftor: json['shom_iftor'] as String? ?? '',
        hufton: json['hufton'] as String? ?? '',
    );
  }
}