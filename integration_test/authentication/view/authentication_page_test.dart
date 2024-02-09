import 'package:design_task/app/authentication/ui/widgets/busha_form_field.dart';
import 'package:design_task/main_production.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('AuthenticationPage Integration Tests', () {
    testWidgets('Ensure widgets are present and can enter text',
        (WidgetTester tester) async {
      app.main(); // Start your app
      await tester
          .pumpAndSettle(); // Wait for all animations and initializations

      // Check if the Text widgets are present
      expect(find.text('Log in to your account'), findsOneWidget);
      expect(
        find.text(
          'Welcome back! Please enter your registered email address to continue',
        ),
        findsOneWidget,
      );

      // Check if BushaFormField for email and password are present
      final emailField = find.byWidgetPredicate(
        (widget) => widget is BushaFormField && widget.title == 'Email Address',
      );
      final passwordField = find.byWidgetPredicate(
        (widget) => widget is BushaFormField && widget.title == 'Password',
      );

      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);

      // Enter text in the email and password fields
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'password123');

      // Optionally, tap the 'Show' button if you want to test visibility toggle
      final showButton = find.text('Show');
      await tester.tap(showButton);
      await tester.pump(); // Rebuild the widget with the new state

      // Tap the 'Continue' button
      final continueButton = find.widgetWithText(ElevatedButton, 'Continue');
      await tester.tap(continueButton);
      await tester
          .pumpAndSettle(); // Wait for any navigation or actions to complete
    });
  });
}
