open TickerGetterHelpers
open Fetchers
open Loggers
open Constants

let baseUrl = Consts.baseUrl ^ "?v=111"

let () =
  Logger.log_info(baseUrl);
  let result =
    TickerGetter.get_tickers baseUrl UrlGenerator.generateUrl Fetcher.fetch_data
      HtmlParser.extractTickersFromHtml Consts.maxPageIndex
  in
  List.iter print_endline result
