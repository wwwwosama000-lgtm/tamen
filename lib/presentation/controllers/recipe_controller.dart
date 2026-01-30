import 'package:get/get.dart';
import '../../data/models/recipe_model.dart';
import '../../data/sources/db_helper.dart';
import 'auth_controller.dart';

class RecipeController extends GetxController {
  var recipes = <RecipeModel>[].obs;
  final DbHelper _dbHelper = DbHelper();
  final AuthController authController = Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('recipes');
    recipes.assignAll(maps.map((e) => RecipeModel.fromMap(e)).toList());
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
  }

  Future<void> deleteRecipe(int id) async {
    final db = await _dbHelper.database;
    await db.delete('recipes', where: 'id = ?', whereArgs: [id]);
    fetchRecipes();
  }

  bool canEdit(RecipeModel recipe) {
    final user = authController.currentUser.value;
    if (user == null) return false;
    if (user.role == 'Admin') return true;
    if (user.role == 'Chef' && recipe.authorId == user.id) return true;
    return false;
  }
}
