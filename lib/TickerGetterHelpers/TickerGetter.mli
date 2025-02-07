(* TickerGetter.mli *)

(** Module for parsing out tickers from an html body*)

val get_tickers : 
string -> 
(string -> int -> string) -> 
(string -> string) -> 
(string -> string list) -> 
int -> 
string list
(** [get_tickers url] fetches the content from the given [url] as a string. *)