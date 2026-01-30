import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/recipe_controller.dart';
import '../../core/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  final RecipeController recipeController = Get.put(RecipeController());
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_title'.tr),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Get.toNamed('/settings'),
          ),
        ],
      ),
      body: Obx(() {
        if (recipeController.recipes.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.receipt_long, size: 80, color: Colors.grey.shade300),
                SizedBox(height: 16),
                Text('no_recipes'.tr, style: TextStyle(color: Colors.grey, fontSize: 18)),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: recipeController.recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipeController.recipes[index];
            return Card(
              margin: EdgeInsets.only(bottom: 16),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => Get.toNamed('/recipe-details', arguments: recipe),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              recipe.title,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.secondaryColor),
                            ),
                          ),
                          if (recipeController.canEdit(recipe))
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit_outlined, color: Colors.blue),
                                  onPressed: () => Get.toNamed('/add-edit-recipe', arguments: recipe),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete_outline, color: Colors.red),
                                  onPressed: () => _showDeleteDialog(context, recipe.id!),
                                ),
                              ],
                            ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        recipe.ingredients,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.person, size: 16, color: AppTheme.primaryColor),
                          SizedBox(width: 4),
                          Text('Chef ID: ${recipe.authorId}', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: Obx(() {
        final role = authController.currentUser.value?.role;
        if (role == 'Admin' || role == 'Chef') {
          return FloatingActionButton.extended(
            onPressed: () => Get.toNamed('/add-edit-recipe'),
            label: Text('add_recipe'.tr),
            icon: Icon(Icons.add),
            backgroundColor: AppTheme.primaryColor,
          );
        }
        return SizedBox.shrink();
      }),
    );
  }

  void _showDeleteDialog(BuildContext context, int id) {
    Get.dialog(
      AlertDialog(
        title: Text('delete'.tr),
        content: Text('Are you sure?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
          TextButton(
            onPressed: () {
              recipeController.deleteRecipe(id);
              Get.back();
            },
            child: Text('delete'.tr, style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
