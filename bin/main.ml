open Fetchers

let () =
  let url = "https://finviz.com/screener.ashx?v=111" in
  let data = Fetcher.fetch_data url in
  Printf.printf "Fetched data: %s\n" data