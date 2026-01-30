import 'package:get/get.dart';
import '../../data/models/recipe_model.dart';
import '../../data/sources/db_helper.dart';
import 'auth_controller.dart';

class RecipeController extends GetxController {
  var recipes = <RecipeModel>[].obs;
  var favoriteRecipes = <RecipeModel>[].obs;
  final DbHelper _dbHelper = DbHelper();
  final AuthController authController = Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchRecipes();
    fetchFavorites();
  }

  Future<void> fetchRecipes() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('recipes');
    recipes.assignAll(maps.map((e) => RecipeModel.fromMap(e)).toList());
  }

  Future<void> fetchFavorites() async {
    final user = authController.currentUser.value;
    if (user == null) return;

    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT recipes.* FROM recipes
      INNER JOIN favorites ON recipes.id = favorites.recipe_id
      WHERE favorites.user_id = ?
    ''', [user.id]);
    
    favoriteRecipes.assignAll(maps.map((e) => RecipeModel.fromMap(e)).toList());
  }

  Future<void> toggleFavorite(RecipeModel recipe) async {
    final user = authController.currentUser.value;
    if (user == null) return;

    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> existing = await db.query(
      'favorites',
      where: 'user_id = ? AND recipe_id = ?',
      whereArgs: [user.id, recipe.id],
    );

    if (existing.isEmpty) {
      await db.insert('favorites', {
        'user_id': user.id,
        'recipe_id': recipe.id,
      });
      Get.snackbar('success'.tr, 'added_to_favorites'.tr);
    } else {
      await db.delete(
        'favorites',
        where: 'user_id = ? AND recipe_id = ?',
        whereArgs: [user.id, recipe.id],
      );
      Get.snackbar('success'.tr, 'removed_from_favorites'.tr);
    }
    fetchFavorites();
  }

  bool isFavorite(int recipeId) {
    return favoriteRecipes.any((element) => element.id == recipeId);
  }

  Future<void> addRecipe(String title, String ingredients, String instructions) async {
    final db = await _dbHelper.database;
    await db.insert('recipes', {
      'title': title,
      'ingredients': ingredients,
      'instructions': instructions,
      'author_id': authController.currentUser.value!.id,
    });
    fetchRecipes();
  }

  Future<void> updateRecipe(int id, String title, String ingredients, String instructions) async {
    final db = await _dbHelper.database;
    await db.update(
      'recipes',
      {
        'title': title,
        'ingredients': ingredients,
        'instructions': instructions,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
    fetchRecipes();
    fetchFavorites(); // Update favorites if title/content changed
  }

  Future<void> deleteRecipe(int id) async {
    final db = await _dbHelper.database;
    await db.delete('recipes', where: 'id = ?', whereArgs: [id]);
    fetchRecipes();
    fetchFavorites();
  }

  bool canEdit(RecipeModel recipe) {
    final user = authController.currentUser.value;
    if (user == null) return false;
    if (user.role == 'Admin') return true;
    if (user.role == 'Chef' && recipe.authorId == user.id) return true;
    return false;
  }
}
