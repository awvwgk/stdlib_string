# String support for the [Fortran standard library](https://github.com/fortran-lang/stdlib)

This project contains an exploratory implementation for functional string handling.


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

Preliminary specs are available [here](./doc/specs/stdlib_string_type.md).


## License

This project is available under the [MIT license](./LICENSE).
