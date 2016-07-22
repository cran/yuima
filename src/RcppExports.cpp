// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// detcpp
double detcpp(NumericMatrix A);
RcppExport SEXP yuima_detcpp(SEXP ASEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix >::type A(ASEXP);
    __result = Rcpp::wrap(detcpp(A));
    return __result;
END_RCPP
}
// Smake
NumericMatrix Smake(NumericVector b, int d);
RcppExport SEXP yuima_Smake(SEXP bSEXP, SEXP dSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericVector >::type b(bSEXP);
    Rcpp::traits::input_parameter< int >::type d(dSEXP);
    __result = Rcpp::wrap(Smake(b, d));
    return __result;
END_RCPP
}
// solvecpp
NumericMatrix solvecpp(NumericMatrix A);
RcppExport SEXP yuima_solvecpp(SEXP ASEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix >::type A(ASEXP);
    __result = Rcpp::wrap(solvecpp(A));
    return __result;
END_RCPP
}
// trace
double trace(NumericMatrix S, NumericVector b);
RcppExport SEXP yuima_trace(SEXP SSEXP, SEXP bSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix >::type S(SSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type b(bSEXP);
    __result = Rcpp::wrap(trace(S, b));
    return __result;
END_RCPP
}
// likndim
double likndim(NumericMatrix dx, NumericMatrix b, NumericMatrix A, double h);
RcppExport SEXP yuima_likndim(SEXP dxSEXP, SEXP bSEXP, SEXP ASEXP, SEXP hSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix >::type dx(dxSEXP);
    Rcpp::traits::input_parameter< NumericMatrix >::type b(bSEXP);
    Rcpp::traits::input_parameter< NumericMatrix >::type A(ASEXP);
    Rcpp::traits::input_parameter< double >::type h(hSEXP);
    __result = Rcpp::wrap(likndim(dx, b, A, h));
    return __result;
END_RCPP
}
