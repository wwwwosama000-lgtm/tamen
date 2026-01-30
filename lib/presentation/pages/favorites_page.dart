import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/recipe_controller.dart';
import '../../core/theme/app_theme.dart';

class FavoritesPage extends StatelessWidget {
  final RecipeController recipeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('favorites'.tr),
      ),
      body: Obx(() {
        if (recipeController.favoriteRecipes.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_border, size: 80, color: Colors.grey.shade300),
                SizedBox(height: 16),
                Text('no_favorites'.tr, style: TextStyle(color: Colors.grey, fontSize: 18)),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: recipeController.favoriteRecipes.length,
          itemBuilder: (context, index) {
            final recipe = recipeController.favoriteRecipes[index];
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
                          IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () => recipeController.toggleFavorite(recipe),
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
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
