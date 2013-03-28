part of youtubeanalytics_v1_api_client;

class ReportsResource extends Resource {

  ReportsResource(Client client) : super(client) {
  }

  /**
   * Retrieve your YouTube Analytics reports.
   *
   * [ids] - Identifies the YouTube channel or content owner for which you are retrieving YouTube Analytics data.
- To request data for a YouTube user, set the ids parameter value to channel==CHANNEL_ID, where CHANNEL_ID specifies the unique YouTube channel ID.
- To request data for a YouTube CMS content owner, set the ids parameter value to contentOwner==OWNER_NAME, where OWNER_NAME is the CMS name of the content owner.
   *
   * [start_date] - The start date for fetching YouTube Analytics data. The value should be in YYYY-MM-DD format.
   *
   * [end_date] - The end date for fetching YouTube Analytics data. The value should be in YYYY-MM-DD format.
   *
   * [metrics] - A comma-separated list of YouTube Analytics metrics, such as views or likes,dislikes. See the Available Reports document for a list of the reports that you can retrieve and the metrics available in each report, and see the Metrics document for definitions of those metrics.
   *
   * [dimensions] - A comma-separated list of YouTube Analytics dimensions, such as views or ageGroup,gender. See the Available Reports document for a list of the reports that you can retrieve and the dimensions used for those reports. Also see the Dimensions document for definitions of those dimensions.
   *
   * [filters] - A list of filters that should be applied when retrieving YouTube Analytics data. The Available Reports document identifies the dimensions that can be used to filter each report, and the Dimensions document defines those dimensions. If a request uses multiple filters, join them together with a semicolon (;), and the returned result table will satisfy both filters. For example, a filters parameter value of video==dMH0bHeiRNg;country==IT restricts the result set to include data for the given video in Italy.
   *
   * [max_results] - The maximum number of rows to include in the response.
   *   Minimum: 1
   *
   * [sort] - A comma-separated list of dimensions or metrics that determine the sort order for YouTube Analytics data. By default the sort order is ascending. The '-' prefix causes descending sort order.
   *
   * [start_index] - An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter (one-based, inclusive).
   *   Minimum: 1
   *
   * [optParams] - Additional query parameters
   */
  Future<ResultTable> query(String ids, String start_date, String end_date, String metrics, {String dimensions, String filters, int max_results, String sort, int start_index, Map optParams}) {
    var completer = new Completer();
    var url = "reports";
    var urlParams = new Map();
    var queryParams = new Map();

    var paramErrors = new List();
    if (dimensions != null) queryParams["dimensions"] = dimensions;
    if (end_date == null) paramErrors.add("end_date is required");
    if (end_date != null) queryParams["end-date"] = end_date;
    if (filters != null) queryParams["filters"] = filters;
    if (ids == null) paramErrors.add("ids is required");
    if (ids != null) queryParams["ids"] = ids;
    if (max_results != null) queryParams["max-results"] = max_results;
    if (metrics == null) paramErrors.add("metrics is required");
    if (metrics != null) queryParams["metrics"] = metrics;
    if (sort != null) queryParams["sort"] = sort;
    if (start_date == null) paramErrors.add("start_date is required");
    if (start_date != null) queryParams["start-date"] = start_date;
    if (start_index != null) queryParams["start-index"] = start_index;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      completer.completeError(new ArgumentError(paramErrors.join(" / ")));
      return completer.future;
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    response
      .then((data) => completer.complete(new ResultTable.fromJson(data)))
      .catchError((e) { completer.completeError(e); return true; });
    return completer.future;
  }
}
