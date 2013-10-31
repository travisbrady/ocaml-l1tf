open Printf
module B = Bigarray.Array1

let get_line fh =
    try
        Some (input_line fh)
    with End_of_file ->
        None

let get_data fn =
    let fh = open_in fn in
    let rec go lst =
        match get_line fh with
        | Some line -> 
                go ((float_of_string line)::lst)
        | None -> List.rev lst
    in
    let float_list = go [] in
    (Array.of_list float_list)

let () =
    let dfn = Sys.argv.(1) in
    let lambda = float_of_string Sys.argv.(2) in
    let data = get_data dfn in
    let res = Ol1tf.l1tf_of_array data lambda in
    for i = 0 to (Array.length res - 1) do
        printf "%7.4f\n" res.(i)
    done;
    ()
