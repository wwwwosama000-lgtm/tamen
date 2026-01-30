import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/recipe_model.dart';
import '../controllers/recipe_controller.dart';

class AddEditRecipePage extends StatelessWidget {
  final RecipeController recipeController = Get.find();
  final RecipeModel? recipe = Get.arguments;
  
  final TextEditingController titleController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final TextEditingController instructionsController = TextEditingController();

  AddEditRecipePage() {
    if (recipe != null) {
      titleController.text = recipe!.title;
      ingredientsController.text = recipe!.ingredients;
      instructionsController.text = recipe!.instructions;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe == null ? 'add_recipe'.tr : 'edit_recipe'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: titleController, decoration: InputDecoration(labelText: 'recipe_name'.tr)),
              TextField(controller: ingredientsController, decoration: InputDecoration(labelText: 'ingredients'.tr), maxLines: 3),
              TextField(controller: instructionsController, decoration: InputDecoration(labelText: 'instructions'.tr), maxLines: 5),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (recipe == null) {
                    recipeController.addRecipe(titleController.text, ingredientsController.text, instructionsController.text);
                  } else {
                    recipeController.updateRecipe(recipe!.id!, titleController.text, ingredientsController.text, instructionsController.text);
                  }
                  Get.back();
                },
                child: Text('save'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
