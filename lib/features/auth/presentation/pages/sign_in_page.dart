import 'package:flutter/material.dart';
import 'package:flutter_base/features/auth/presentation/providers/sign_in_state.dart';
import 'package:flutter_base/shared/i18n/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/sign_in_provider.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignInController controller = ref.watch(signInProvider.notifier);
    final SignInState state = ref.watch(signInProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.signIn)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: controller.setEmail,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.email,
              ),
            ),
            TextField(
              onChanged: controller.setPassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.password,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  state.isLoading ? null : () => controller.signIn(context),
              child:
                  state.isLoading
                      ? const CircularProgressIndicator()
                      : Text(AppLocalizations.of(context)!.signIn),
            ),
          ],
        ),
      ),
    );
  }
}
