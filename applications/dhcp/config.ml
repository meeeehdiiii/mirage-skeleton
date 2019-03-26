open Mirage

let main = foreign "Unikernel.Main" (console @-> network @-> mclock @-> time @-> job)

let () =
  let packages = [
    package ~min:"0.5" ~ocamlfind:["charrua-core.server"; "charrua-core.wire"] "charrua-core";
    package "arp-mirage";
    package "ethernet"
  ]
  in
  register "dhcp" ~packages [
    main $ default_console $ default_network $ default_monotonic_clock $ default_time
  ]
