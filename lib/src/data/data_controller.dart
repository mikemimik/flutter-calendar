import 'package:flutter/foundation.dart';
import 'package:calendar/src/types.dart';

class BaseDataController {
  BaseDataController({
    @required this.fetchData,
    @required this.parseData,
    @required this.getUri,
  });

  final FetchDataCallback fetchData;
  final ParseDataCallback parseData;
  final GetDataUriCallback getUri;
}

class DataController extends BaseDataController {
  DataController({
    @required fetchData,
    @required parseData,
    @required getUri,
  })
      : super(
          fetchData: fetchData,
          parseData: parseData,
          getUri: getUri,
        );
}
