import 'package:flutter/material.dart';
import 'package:flutter_base/features/auth/interfaces/states/sign_in_state.dart';
import 'package:flutter_base/features/auth/interfaces/providers/sign_in_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/domain/entities/user.dart';
import 'package:flutter_base/shared/i18n/l10n/app_localizations.dart';

class UserProfilePage extends ConsumerWidget {
  final User user;

  const UserProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignInState state = ref.watch(signInPresenterProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.profile)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.userInfo,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('${AppLocalizations.of(context)!.id}: ${user.id}'),
            Text('${AppLocalizations.of(context)!.email}: ${state.email}'),
          ],
        ),
      ),
    );
  }
}
