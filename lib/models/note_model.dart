class NoteModel {
  final int? id;
  final String title;
  final String date;
  final String items;

  NoteModel({
    this.id,
    required this.title,
    required this.date,
    required this.items,
  });

  NoteModel copy({int? id, String? title, String? date, String? items}) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'items': items,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      date: map['date'],
      items: map['items'],
    );
  }
}