import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/user_model.dart';
import '../../data/sources/db_helper.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var currentUser = Rxn<UserModel>();
  final DbHelper _dbHelper = DbHelper();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('user_id');
    if (userId != null) {
      final db = await _dbHelper.database;
      List<Map<String, dynamic>> maps = await db.query('users', where: 'id = ?', whereArgs: [userId]);
      if (maps.isNotEmpty) {
        currentUser.value = UserModel.fromMap(maps.first);
        isLoggedIn.value = true;
      }
    }
  }

  Future<bool> login(String username, String password) async {
    final db = await _dbHelper.database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (maps.isNotEmpty) {
      currentUser.value = UserModel.fromMap(maps.first);
      isLoggedIn.value = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('user_id', currentUser.value!.id!);
      return true;
    }
    return false;
  }

  Future<bool> register(String username, String password, String role) async {
    final db = await _dbHelper.database;
    try {
      await db.insert('users', {
        'username': username,
        'password': password,
        'role': role,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
    isLoggedIn.value = false;
    currentUser.value = null;
    Get.offAllNamed('/login');
  }
}
