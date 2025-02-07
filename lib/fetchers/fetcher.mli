(* fetcher.mli *)

(** Module for fetching financial data from finviz.com *)

val fetch_data : string -> string
(** [fetch_data url] fetches the content from the given [url] as a string. *)