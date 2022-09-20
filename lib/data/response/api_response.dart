import 'package:mvvmstructre/data/response/status.dart';
//uses how to handle api responses
class Apiresponse<T> {
  Status? status;
  T? data;
  String? message;

  Apiresponse(this.status, this.data, this.message);
  Apiresponse.loading() : status = Status.LOADING;
  Apiresponse.completed(this.data) : status = Status.COMPLETED;
  Apiresponse.error(this.message) : status = Status.ERROR;//if response brcome an error, whilw handle the exception

  @override
  String toString() {
    return '$status $data $message';
  }
}
