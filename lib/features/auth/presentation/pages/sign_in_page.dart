import 'package:flutter/material.dart';
import 'package:flutter_base/features/auth/presentation/controllers/sign_in_controller.dart';
import 'package:flutter_base/features/auth/presentation/states/sign_in_state.dart';
import 'package:flutter_base/features/auth/presentation/providers/sign_in_provider.dart';
import 'package:flutter_base/features/auth/presentation/widgets/auth_logo.dart';
import 'package:flutter_base/shared/i18n/l10n/app_localizations.dart';
import 'package:flutter_base/shared/widgets/primary_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../presenters/sign_in_presenter.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignInPresenter presenter = ref.watch(
      signInPresenterProvider.notifier,
    );
    final SignInState state = ref.watch(signInPresenterProvider);
    final SignInController controller = ref.watch(signInControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const AuthLogo(),
        title: Text(AppLocalizations.of(context)!.signIn),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: presenter.setEmail,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.email,
              ),
            ),
            TextField(
              onChanged: presenter.setPassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.password,
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              label: AppLocalizations.of(context)!.signIn,
              onPressed: () => controller.signIn(context),
              isLoading: state.isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
