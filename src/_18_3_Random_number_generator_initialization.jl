#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
###############################################
# 18.3 Random number generator initialization #
###############################################
export rng_alloc, rng_set, rng_free




# This function returns a pointer to a newly-created instance of a random
# number generator of type T.  For example, the following code creates an
# instance of the Tausworthe generator,                 gsl_rng * r =
# gsl_rng_alloc (gsl_rng_taus);  If there is insufficient memory to create the
# generator then the function returns a null pointer and the error handler is
# invoked with an error code of GSL_ENOMEM.          The generator is
# automatically initialized with the default seed, gsl_rng_default_seed.  This
# is zero by default but can be changed either directly or by using the
# environment variable GSL_RNG_SEED (see Random number environment variables).
# The details of the available generator types are described later in this
# chapter.
#
#   Returns: Ptr{gsl_rng}
function rng_alloc(T::Ref{gsl_rng_type})
    output_ptr = ccall( (:gsl_rng_alloc, libgsl), Ptr{gsl_rng},
        (Ref{gsl_rng_type}, ), T )
    output_ptr==C_NULL ? throw(GSL_ERROR(8)) : output_ptr
end


# This function initializes (or `seeds') the random number generator.  If the
# generator is seeded with the same value of s on two different runs, the same
# stream of random numbers will be generated by successive calls to the
# routines below.  If different values of  s >= 1 are supplied, then the
# generated streams of random numbers should be completely different.  If the
# seed s is zero then the standard seed from the original implementation is
# used instead.  For example, the original Fortran source code for the ranlux
# generator used a seed of 314159265, and so choosing s equal to zero
# reproduces this when using gsl_rng_ranlux.          When using multiple seeds
# with the same generator, choose seed values greater than zero to avoid
# collisions with the default setting.          Note that the most generators
# only accept 32-bit seeds, with higher values being reduced modulo  2^32.  For
# generators with smaller ranges the maximum seed value will typically be
# lower.
#
#   Returns: Cvoid
function rng_set(r::Ref{gsl_rng}, s::Integer)
    ccall( (:gsl_rng_set, libgsl), Cvoid, (Ref{gsl_rng}, Culong), r, s )
end


# This function frees all the memory associated with the generator r.
#
#   Returns: Cvoid
function rng_free(r::Ref{gsl_rng})
    ccall( (:gsl_rng_free, libgsl), Cvoid, (Ref{gsl_rng}, ), r )
end
