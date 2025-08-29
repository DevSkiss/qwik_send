import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  SupabaseClient get supabase => Supabase.instance.client;
}
