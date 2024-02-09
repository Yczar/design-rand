import 'package:design_task/app/authentication/data/models/user.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  // Public factory
  factory HiveService() {
    return _instance;
  }

  // Private constructor
  HiveService._internal();
  Box<dynamic>? _box;
  static final HiveService _instance = HiveService._internal();

  // Initialize Hive and open a box
  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    _box = await Hive.openBox('userBox');
  }

  Future<void> signInUser(User user) async {
    print('Email: ${user.email}');
    try {
      await _box?.put(user.email, user.toMap());
    } catch (error) {
      print(error);
    }
  }

  User? getUser(String email) {
    final userMap = _box?.get(email) as Map?;

    if (userMap != null) {
      return User.fromMap(Map<String, dynamic>.from(userMap));
    }
    return null;
  }

  Future<bool> authenticateUser(String email, String password) async {
    var user = getUser(email);
    print('Fetched User ${user?.email}');
    if (user == null) {
      await signInUser(
        User(
          email: email,
          password: password,
        ),
      );
    }
    user = getUser(email);
    print(user?.password);
    if (user != null && user.password == password) {
      return true;
    }
    return false;
  }
}
