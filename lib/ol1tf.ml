module B=Bigarray.Array1

type vector = (float, Bigarray.float64_elt, Bigarray.c_layout) B.t 

external l1tf_lambdamax : int -> vector -> float = "caml_l1tf_lambdamax"

external l1tf : int -> vector -> float -> vector -> int = "caml_l1tf"


let lambdamax_of_array arr =
    let ba = B.of_array Bigarray.float64 Bigarray.c_layout arr in
    l1tf_lambdamax (Array.length arr) ba

let l1tf_of_array arr lambda =
    let ba = B.of_array Bigarray.float64 Bigarray.c_layout arr in
    let n = Array.length arr in
    let out = B.of_array Bigarray.float64 Bigarray.c_layout arr in
    let res = l1tf n ba lambda out in
    let ret = Array.create n 0.0 in
    for i = 0 to (n - 1) do
        ret.(i) <- out.{i}
    done;
    ret
