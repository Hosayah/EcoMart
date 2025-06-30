
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final SupabaseClient _client = Supabase.instance.client;

  /// insert user to supabase user table
  Future<void> insertUser(Map<String, dynamic> user) async {
    try {
      // ✅ Navigate to Verify Email screen
      await _client.from('users').insert(user); // no execute() needed
    } on PostgrestException catch (e) {
      print('Supabase DB Error: ${e.message}');
      rethrow;
    } catch (e) {
      print('Unknown Error: $e');
      rethrow;
    }
  }
}