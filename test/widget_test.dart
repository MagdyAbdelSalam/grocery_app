import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_app/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GroceryApp());
    // Just verify it launches without crashing
    expect(find.text('No Route defined'), findsNothing); 
  });
}
