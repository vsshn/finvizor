(* HtmlParser.mli *)

(** Module for parsing out tickers from an html body*)

val extractTickersFromHtml : 
string -> string list
(** [extractTickersFromHtml html] extracts tickers from [html] as a string list. *)