#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
############################
# 8.4.10 Matrix operations #
############################
export gsl_matrix_add, gsl_matrix_sub, gsl_matrix_mul_elements,
       gsl_matrix_div_elements, gsl_matrix_scale, gsl_matrix_add_constant


# This function adds the elements of matrix b to the elements of matrix a.  The
# result a(i,j) \leftarrow a(i,j) + b(i,j) is stored in a and b remains
# unchanged. The two matrices must have the same dimensions.
# 
#   Returns: Cint
function gsl_matrix_add (a::Ptr{gsl_matrix}, b::Ptr{gsl_matrix})
    ccall( (:gsl_matrix_add, "libgsl"), Cint, (Ptr{gsl_matrix},
        Ptr{gsl_matrix}), a, b )
end


# This function subtracts the elements of matrix b from the elements of matrix
# a.  The result a(i,j) \leftarrow a(i,j) - b(i,j) is stored in a and b remains
# unchanged. The two matrices must have the same dimensions.
# 
#   Returns: Cint
function gsl_matrix_sub (a::Ptr{gsl_matrix}, b::Ptr{gsl_matrix})
    ccall( (:gsl_matrix_sub, "libgsl"), Cint, (Ptr{gsl_matrix},
        Ptr{gsl_matrix}), a, b )
end


# This function multiplies the elements of matrix a by the elements of matrix
# b.  The result a(i,j) \leftarrow a(i,j) * b(i,j) is stored in a and b remains
# unchanged.  The two matrices must have the same dimensions.
# 
#   Returns: Cint
function gsl_matrix_mul_elements (a::Ptr{gsl_matrix}, b::Ptr{gsl_matrix})
    ccall( (:gsl_matrix_mul_elements, "libgsl"), Cint, (Ptr{gsl_matrix},
        Ptr{gsl_matrix}), a, b )
end


# This function divides the elements of matrix a by the elements of matrix b.
# The result a(i,j) \leftarrow a(i,j) / b(i,j) is stored in a and b remains
# unchanged. The two matrices must have the same dimensions.
# 
#   Returns: Cint
function gsl_matrix_div_elements (a::Ptr{gsl_matrix}, b::Ptr{gsl_matrix})
    ccall( (:gsl_matrix_div_elements, "libgsl"), Cint, (Ptr{gsl_matrix},
        Ptr{gsl_matrix}), a, b )
end


# This function multiplies the elements of matrix a by the constant factor x.
# The result a(i,j) \leftarrow x a(i,j) is stored in a.
# 
#   Returns: Cint
function gsl_matrix_scale (a::Ptr{gsl_matrix}, x::Cdouble)
    ccall( (:gsl_matrix_scale, "libgsl"), Cint, (Ptr{gsl_matrix}, Cdouble),
        a, x )
end


# This function adds the constant value x to the elements of the matrix a.  The
# result a(i,j) \leftarrow a(i,j) + x is stored in a.
# 
#   Returns: Cint
function gsl_matrix_add_constant (a::Ptr{gsl_matrix}, x::Cdouble)
    ccall( (:gsl_matrix_add_constant, "libgsl"), Cint, (Ptr{gsl_matrix},
        Cdouble), a, x )
end