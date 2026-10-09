import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1_juberta_kalvarisman_waruwu/main.dart';

void main() {
  testWidgets('Course Explorer App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CourseExplorerApp());
    expect(find.text('Course Explorer v2'), findsOneWidget);
  });
}