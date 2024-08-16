import 'dart:io';

class QuoteException extends HttpException {
  int? statusCode;
  String? statusMessage;

  QuoteException(this.statusCode, String statusMessage) : super(statusMessage);
}
