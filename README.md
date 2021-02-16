# String support for the [Fortran standard library](https://github.com/fortran-lang/stdlib)

[![CI](https://github.com/awvwgk/stdlib_string/workflows/CI/badge.svg)](https://github.com/awvwgk/stdlib_string/actions)
[![docs](https://github.com/awvwgk/stdlib_string/workflows/docs/badge.svg)](https://awvwgk.github.io/stdlib_string)

This project contains an exploratory implementation for object-oriented string handling in stdlib.

For the original thread on string support continue the discussion in
[stdlib#69](https://github.com/fortran-lang/stdlib/issues/69).


## Building

This is an [fpm](https://github.com/fortran-lang/fpm) compatible project.
Build this project with

```
fpm build
```

All examples from the tests are included as tests, run them with

```
fpm test
```

This project has been tested with GCC 10.2, GCC 9.3 and Intel 2021.1, other compilers
might work as well, but have not yet been checked.


## Documentation

Preliminary specs are available [here](./doc/specs/stdlib_string_class.md).


## License

This project is available under the [MIT license](./LICENSE).
