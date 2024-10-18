import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:technoprise/screens/home/add.dart';
import 'package:technoprise/screens/home/data.dart' as d_datum;

void main() {
  testWidgets('Deleting an existing item ', (WidgetTester tester) async {
    // Initialize a list of items (assuming this widget interacts with a list in the parent widget)
    List<d_datum.Datum> items = [
      d_datum.Datum(title: 'Test Item 1', description: 'This is a test item.'),
      d_datum.Datum(title: 'Test Item 2', description: 'This is another test item.'),
    ];

    // Build the widget to be tested (pass the list of items)
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Add(), 
        ),
      ),
    );

    // Ensure that the list has the item to be deleted
    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Test Item 2'), findsOneWidget);

    // Simulate tapping the delete button for 'Test Item 1'
    await tester.tap(find.byKey( Key(items[0].title) ));
    await tester.pump(); 

    // Verify that 'Item 1' is removed from the list
    expect(find.text('Test Item 1'), findsNothing);
    expect(find.text('Test Item 2'), findsOneWidget);
  });

 
}
