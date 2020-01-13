# Autogenerated wrapper script for Tesseract_jll for arm-linux-gnueabihf-cxx03
export tesseract, libtesseract

using Giflib_jll
using JpegTurbo_jll
using libpng_jll
using Libtiff_jll
using Zlib_jll
using Leptonica_jll
using CompilerSupportLibraries_jll
using Cairo_jll
using Pango_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `tesseract`
const tesseract_splitpath = ["bin", "tesseract"]

# This will be filled out by __init__() for all products, as it must be done at runtime
tesseract_path = ""

# tesseract-specific global declaration
function tesseract(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(tesseract_path)
    end
end


# Relative path to `libtesseract`
const libtesseract_splitpath = ["lib", "libtesseract.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libtesseract_path = ""

# libtesseract-specific global declaration
# This will be filled out by __init__()
libtesseract_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libtesseract = "libtesseract.so.4"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Tesseract")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Giflib_jll.PATH_list, JpegTurbo_jll.PATH_list, libpng_jll.PATH_list, Libtiff_jll.PATH_list, Zlib_jll.PATH_list, Leptonica_jll.PATH_list, CompilerSupportLibraries_jll.PATH_list, Cairo_jll.PATH_list, Pango_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Giflib_jll.LIBPATH_list, JpegTurbo_jll.LIBPATH_list, libpng_jll.LIBPATH_list, Libtiff_jll.LIBPATH_list, Zlib_jll.LIBPATH_list, Leptonica_jll.LIBPATH_list, CompilerSupportLibraries_jll.LIBPATH_list, Cairo_jll.LIBPATH_list, Pango_jll.LIBPATH_list,))

    global tesseract_path = normpath(joinpath(artifact_dir, tesseract_splitpath...))

    push!(PATH_list, dirname(tesseract_path))
    global libtesseract_path = normpath(joinpath(artifact_dir, libtesseract_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libtesseract_handle = dlopen(libtesseract_path)
    push!(LIBPATH_list, dirname(libtesseract_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

