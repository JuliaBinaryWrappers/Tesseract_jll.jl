# Autogenerated wrapper script for Tesseract_jll for x86_64-w64-mingw32-cxx03
export libtesseract, tesseract

using Giflib_jll
using JpegTurbo_jll
using libpng_jll
using Libtiff_jll
using Zlib_jll
using Leptonica_jll
using CompilerSupportLibraries_jll
using Cairo_jll
using Pango_jll
JLLWrappers.@generate_wrapper_header("Tesseract")
JLLWrappers.@declare_library_product(libtesseract, "libtesseract-5.dll")
JLLWrappers.@declare_executable_product(tesseract)
function __init__()
    JLLWrappers.@generate_init_header(Giflib_jll, JpegTurbo_jll, libpng_jll, Libtiff_jll, Zlib_jll, Leptonica_jll, CompilerSupportLibraries_jll, Cairo_jll, Pango_jll)
    JLLWrappers.@init_library_product(
        libtesseract,
        "bin\\libtesseract-5.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        tesseract,
        "bin\\tesseract.exe",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
