class RecipeDbEntity {
  static const fieldId = 'id';
  static const fieldName = 'name';
  static const fieldThumbnailUrl = 'thumbnail_url';
  static const fieldDescription = 'description';

  final int id;
  final String name;
  final String thumbnailUrl;
  final String description;

  const RecipeDbEntity({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.description,
  });

  RecipeDbEntity.fromMap(Map<String, dynamic> map)
      : id = map[fieldId] as int,
        name = map[fieldName] as String,
        thumbnailUrl = map[fieldThumbnailUrl] as String,
        description = map[fieldDescription] as String;

  Map<String, dynamic> toMap() => {
        fieldId: id,
        fieldName: name,
        fieldThumbnailUrl: thumbnailUrl,
        fieldDescription: description,
      };
}
