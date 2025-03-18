class Note {
  final String title;
  final String content;

  const Note({required this.title, required this.content});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Note && runtimeType == other.runtimeType && title == other.title;

  @override
  int get hashCode => title.hashCode;
}
