class RecipeModel {
  final int? id;
  final String title;
  final String ingredients;
  final String instructions;
  final int authorId;

  RecipeModel({
    this.id,
    required this.title,
    required this.ingredients,
    required this.instructions,
    required this.authorId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'ingredients': ingredients,
      'instructions': instructions,
      'author_id': authorId,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      id: map['id'],
      title: map['title'],
      ingredients: map['ingredients'],
      instructions: map['instructions'],
      authorId: map['author_id'],
    );
  }
}
