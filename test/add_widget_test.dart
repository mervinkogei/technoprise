import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:technoprise/screens/home/add.dart';

void main() {
  testWidgets('Add widget test', (WidgetTester tester) async {
    // Build the Add widget
    await tester.pumpWidget(MaterialApp(home: Add()));

    // Verify the title text, description text, and "Add Item" button are present
    expect(find.text('Item Title'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
    expect(find.text('Add Item'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    // Check the form field for entering the title
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Focus and enter text into the title text field
    await tester.enterText(find.byType(TextFormField).first, 'Item Title');
    expect(find.text('Item Title'), findsOneWidget);

    // Focus and enter text into the description text field
    await tester.enterText(find.byType(TextFormField).last, 'Item Description');
    expect(find.text('Item Description'), findsOneWidget);

    // Tap the "Add Item" button with valid inputs
    await tester.tap(find.text('Add Item'));
    await tester.pump();

    // Ensure no error message is displayed for the title field
    expect(find.text('Enter a title for the item'), findsNothing);

    // Tap the "Add Item" button with empty title
    await tester.enterText(find.byType(TextFormField).first, '');
    await tester.tap(find.text('Add Item'));
    await tester.pump(); 

    // The error message should now show for the title
    expect(find.text('Enter a title for the item'), findsOneWidget);

    // Test Cancel button
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle(); 

    // Verify the navigation has popped (meaning the Add widget is closed)
    expect(find.byType(Add), findsNothing);
  });
}
