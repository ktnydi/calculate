import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseProvider = Provider(
  (_) => Supabase.instance.client,
);

final authenticatorProvider =
    StateNotifierProvider.autoDispose<AuthenticatorNotifier, User?>(
      (ref) {
        final supabase = ref.watch(supabaseProvider);
        return AuthenticatorNotifier(supabase.auth);
      },
    );

class AuthenticatorNotifier extends StateNotifier<User?> {
  AuthenticatorNotifier(this.auth) : super(null) {
    final user = auth.currentUser;
    state = user;
  }

  final GoTrueClient auth;

  Future<void> signInAnonymously() async {
    if (state != null) return;

    final response = await auth.signInAnonymously();
    final user = response.user;

    if (user != null) {
      state = user;
    }
  }
}
