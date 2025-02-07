open Cohttp_lwt_unix

(** Module for fetching financial data from finviz.com *)

let fetch_data (url : string) : string =
  let uri = Uri.of_string url in
  let _, body = Client.get uri |> Lwt_main.run in  (* Perform the GET request synchronously *)
  let body_string = Cohttp_lwt.Body.to_string body |> Lwt_main.run in  (* Convert body to string synchronously *)
  body_string