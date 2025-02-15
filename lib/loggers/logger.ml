(* Ensure the Logs library is set up *)
let () =
  Logs.set_reporter (Logs_fmt.reporter ());
  Logs.set_level (Some Logs.Info)

(* Logging functions *)
let log_info toLog =
  Logs.info (fun m -> m "%s" toLog)

let log_error toLog =
  Logs.err (fun m -> m "%s" toLog)