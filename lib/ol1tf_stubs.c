
#include <stdio.h>
#include <sys/types.h>

#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/mlvalues.h>
#include <caml/bigarray.h>

#include "l1tf.h"

CAMLprim value
caml_l1tf_lambdamax(value n, value y) {
    double *_y = Data_bigarray_val(y);
    double maxval  = l1tf_lambdamax(Int_val(n), _y);
    printf("maxval: %f\n", maxval);
    return caml_copy_double(maxval);
}

CAMLprim value
caml_l1tf(value n, value y, value lambda, value x) {
    CAMLparam4(n, y, lambda, x);
    double *_y = Data_bigarray_val(y);
    int res = l1tf(Int_val(n), _y, Double_val(lambda), Data_bigarray_val(x));
    CAMLreturn(res);
}

