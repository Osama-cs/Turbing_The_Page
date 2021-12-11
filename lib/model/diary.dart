final String tableDiary = 'diary';

class DiaryFields {
  static final List<String> values = [
    id,
    diaryTime,
    diaryTitle,
    diaryDescription,
  ];

  static final String id = '_id';
  static final String diaryTime = 'diaryTime';
  static final String diaryTitle = 'diaryTitle';
  static final String diaryDescription = 'diaryDescription';
}

class Diary {
  final int? id;
  final DateTime diaryTime;
  final String diaryTitle;
  final String diaryDescription;

  const Diary(
      {this.id,
      required this.diaryTime,
      required this.diaryTitle,
      required this.diaryDescription});

  Diary copy({
    int? id,
    DateTime? diaryTime,
    String? diaryTitle,
    String? diaryDescription,
  }) =>
      Diary(
          id: id ?? this.id,
          diaryTime: diaryTime ?? this.diaryTime,
          diaryTitle: diaryTitle ?? this.diaryTitle,
          diaryDescription: diaryDescription ?? this.diaryDescription);

  static Diary fromJson(Map<String, Object?> json) => Diary(
        id: json[DiaryFields.id] as int?,
        diaryTime: DateTime.parse(json[DiaryFields.diaryTime] as String),
        diaryTitle: json[DiaryFields.diaryTitle] as String,
        diaryDescription: json[DiaryFields.diaryDescription] as String,
      );

  Map<String, Object?> toJson() => {
        DiaryFields.id: id,
        DiaryFields.diaryTime: diaryTime.toIso8601String(),
        DiaryFields.diaryTitle: diaryTitle,
        DiaryFields.diaryDescription: diaryDescription,
      };
}
