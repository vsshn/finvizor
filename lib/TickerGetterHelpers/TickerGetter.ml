let get_tickers 
(baseUrl : string)
(urlBuilder : string -> int -> string)
(fetcher : string -> string)
(htmlParser : string -> string list) 
(_maxPageIndex : int)
: string list =
  baseUrl |> fun url -> urlBuilder url 2 |> fetcher |> htmlParser