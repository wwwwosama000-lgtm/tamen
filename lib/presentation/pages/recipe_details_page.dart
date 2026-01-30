import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/recipe_model.dart';
import '../../core/theme/app_theme.dart';
import '../controllers/recipe_controller.dart';

class RecipeDetailsPage extends StatelessWidget {
  final RecipeController recipeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final RecipeModel recipe = Get.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            actions: [
              Obx(() => IconButton(
                icon: Icon(
                  recipeController.isFavorite(recipe.id!) 
                    ? Icons.favorite 
                    : Icons.favorite_border,
                  color: Colors.white,
                ),
                onPressed: () => recipeController.toggleFavorite(recipe),
              )),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(recipe.title),
              background: Container(
                color: AppTheme.primaryColor,
                child: Icon(Icons.restaurant, size: 100, color: Colors.white24),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(Icons.list_alt, 'ingredients'.tr),
                  SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(recipe.ingredients, style: TextStyle(fontSize: 16, height: 1.5)),
                    ),
                  ),
                  SizedBox(height: 24),
                  _buildSectionTitle(Icons.menu_book, 'instructions'.tr),
                  SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(recipe.instructions, style: TextStyle(fontSize: 16, height: 1.5)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.primaryColor),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.secondaryColor),
        ),
      ],
    );
  }
}
