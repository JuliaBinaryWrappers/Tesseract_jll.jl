# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule Tesseract_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("Tesseract")
JLLWrappers.@generate_main_file("Tesseract", UUID("efd95c89-babc-5260-8753-618084eaf9d7"))
end  # module Tesseract_jll
