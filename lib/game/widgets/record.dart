class Record {

  static Record? _instance;

  int _record = 0;

  int get getRecord => _record;

  set setRecord(int value) {
    _record = value;
  }

  Record._internal();

  static Record getInstance() {
    if (_instance == null) {
      _instance = Record._internal();
    }
    return _instance!;
  }
}