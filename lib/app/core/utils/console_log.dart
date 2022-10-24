import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

void main() {
  print(
      'Run with either `dart example/main.dart` or `dart --enable-asserts example/main.dart`.');
  demo();
}

void demo() {
  // logger.d('Log message with 2 methods');

  loggerNoStack.i('Info message');

  loggerNoStack.w('Just a warning!');

  // logger.e('Error! Something bad happened', 'Test Error');

  loggerNoStack.v({'key': 5, 'value': 'something'});

  logger.v("Verbose log");

  logger.d("Debug log");

  logger.i("Info log");

  logger.w("Warning log");

  logger.e("Error log");

  logger.wtf("What a terrible failure log");

  Logger(printer: SimplePrinter(colors: true)).v('boom');
}
