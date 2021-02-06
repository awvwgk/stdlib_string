---
project: stdlib_string
summary: String support for the Fortran standard library
src_dir: src
exclude_dir: tests
output_dir: API-doc
page_dir: doc
media_dir: doc/media
fpp_extensions: fypp
preprocess: true
macro: MAXRANK=3
preprocessor: fypp
display: public
         protected
source: true
proc_internals: true
md_extensions: markdown.extensions.toc
graph: true
graph_maxnodes: 250
graph_maxdepth: 5
coloured_edges: true
sort: permission-alpha
extra_mods: iso_fortran_env:https://gcc.gnu.org/onlinedocs/gfortran/ISO_005fFORTRAN_005fENV.html
            iso_c_binding:https://gcc.gnu.org/onlinedocs/gfortran/ISO_005fC_005fBINDING.html#ISO_005fC_005fBINDING
print_creation_date: true
creation_date: %Y-%m-%d %H:%M %z
project_github: https://github.com/awvwgk/stdlib_string
project_website: https://awvwgk.github.io/stdlib_string
license: by-sa
author: fortran-lang/stdlib contributors
author_pic: https://fortran-lang.org/assets/img/fortran_logo_512x512.png
author_email: fortran-lang@groups.io
github: https://github.com/fortran-lang
twitter: https://twitter.com/fortranlang
website: https://fortran-lang.org
dbg: true
---
