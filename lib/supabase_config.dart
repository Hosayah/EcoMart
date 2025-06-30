import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> initSupabase() async {
  await dotenv.load(fileName: ".env");
  final supabaseKey = dotenv.env['SUPABASE_KEY'];
  await Supabase.initialize(
    url: 'https://fksevuabbmxmwfziycdh.supabase.co',
    anonKey: '$supabaseKey',
  );
}