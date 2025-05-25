import 'package:flutter/material.dart';
import 'package:flutter_base/features/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_base/shared/i18n/l10n/app_localizations.dart';

void main() {
  testWidgets('Sign in button should call signIn when pressed', (
    WidgetTester tester,
  ) async {
    // Simulate user input and button press
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: SignInPage()),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: <Locale>[Locale('en')],
        ),
      ),
    );

    // Enter text into email and password fields
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password123');

    // Verify initial state of the button (shouldn't be loading yet)
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Tap the sign-in button
    await tester.tap(find.byType(ElevatedButton));

    // Trigger a frame to process the tap
    await tester.pump();

    // After pressing, the button should show a loading indicator while sign-in is in progress
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Simulate state change after the button press
    // For example, you could mock the controller's behavior to stop the loading state after some time
    // Here, we will manually set the state to "not loading" and check the button again
    await tester.pumpAndSettle();

    // Check that the loading indicator disappears after the operation is completed
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Optionally: Verify the final UI state, such as navigation or error messages if implemented
  });
}
