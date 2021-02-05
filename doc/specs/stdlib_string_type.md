---
title: string type
---

# The `stdlib_string_type` module

[TOC]

## Introduction

The `stdlib_string_type` provides a derived type holding an arbitrary sequence
of characters compatible with most Fortran intrinsic character procedures as
well as operators for working with character variables and constants.


## Derived types provided by `stdlib_string_type`


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### The `string_type` derived type

The `string_type` is defined as a non-extenable derived type representing a
sequence of characters. The internal representation of the character sequence
is implementation dependent and not visible for the user of the module.

#### Status

Experimental


## Procedures and methods provided by `stdlib_string_type`


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Constructor for empty string

The module defines a default constructor to create an empty string type.

#### Description

Creates a string instance representing an empty string.

#### Synax

```fortran
type(string_type) :: string
string = string_type()
! len(string) == 0
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

None.

#### Result value

The result is an instance of `string_type`.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Constructor from character scalar

The module defines a default constructor to create a string type
from a character scalar.

#### Description

Creates a string instance representing the input character scalar value.
The constructor shall create an empty string if an unallocated deferred-length
character variable is passed.

#### Synax

```fortran
type(string_type) :: string
string = string_type("Sequence")
! len(string) == 8
string = string_type(" S p a c e d ")
! len(string) == 9
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

`chars`: shall be a scalar character value. It is an `intent(in)` argument.

#### Result value

The result is an instance of `string_type`.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Constructor from character array

The module defines a default constructor to create a string type
from an array of characters. The character array is flattend.

#### Description

Creates a string instance representing the flattend input array of characters.

#### Synax

```fortran
type(string_type) :: string
string = string_type(["S", "e", "q", "u", "e", "n", "c", "e"])
! len(string) == 8
```

#### Status

Experimental

#### Class

Pure function.

#### Argument

`chars`: shall be an array of characters. It is an `intent(in)` argument.

#### Result value

The result is an instance of `string_type`.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Assignment of character scalar

The module defines an assignment operations, `=`, to create a string type
from a character scalar.

#### Description

Creates a string instance representing the right-hand-side character scalar value.

#### Synax

```fortran
type(string_type) :: string
! len(string) == 0
string = "Sequence"
! len(string) == 8
```

#### Status

Experimental

#### Class

Pure assignment.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Assignment of character array

The module defines an assignment operations, `=`, to create a string type
from an array of characters

#### Description

Creates a string instance representing the flattend right-hand-side array of characters.

#### Synax

```fortran
type(string_type) :: string
! len(string) == 0
string = ["S", "e", "q", "u", "e", "n", "c", "e"]
! len(string) == 8
```

#### Status

Experimental

#### Class

Pure assignment.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Len function

#### Description

Returns the length of the character sequence represented by the string.

#### Synax

```fortran
type(string_type) :: string
integer :: length

string = "Some longer sentence for this example."
length = len(string)
! length == 38

string = "Whitespace                            "
length = len(string)
! length == 38
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

`string`: Instance of a `string_type`. This argument is `intent(in)`.

#### Result value

The result is a default integer scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Len\_trim function

#### Description

Returns the length of the character sequence without trailing spaces
represented by the string.

#### Synax

```fortran
type(string_type) :: string
integer :: length

string = "Some longer sentence for this example."
length = len_trim(string)
! length == 38

string = "Whitespace                            "
length = len_trim(string)
! length == 10
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

`string`: Instance of a `string_type`. This argument is `intent(in)`.

#### Result value

The result is a default integer scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Trim function

#### Description

Returns the character sequence hold by the string without trailing spaces.

#### Synax

```fortran
type(string_type) :: string
character(len=:), allocatable :: dlc

string = "Whitespace                            "
dlc = trim(string)
! len(dlc) == 10
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

- `string`: Instance of a `string_type`. This argument is `intent(in)`.

#### Result value

The result is a scalar character value of the same or less length as the character
sequence represented by the input `string_type` instance.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Adjustl function

#### Description

Left-adjust the character sequence represented by the string.
The length of the character sequence remains unchanged.

#### Synax

```fortran
type(string_type) :: string

string = "                            Whitespace"
string = adjustl(string)
! char(string) == "Whitespace                            "
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

- `string`: Instance of a `string_type`. This argument is `intent(in)`.

#### Result value

The result is a scalar character value of the same length as the character sequence
represented by the input `string_type` instance.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Adjustr function

#### Description

Right-adjust the character sequence represented by the string.
The length of the character sequence remains unchanged.

#### Synax

```fortran
type(string_type) :: string

string = "Whitespace                            "
string = adjustr(string)
! char(string) == "                            Whitespace"
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

- `string`: Instance of a `string_type`. This argument is `intent(in)`.

#### Result value

The result is a scalar character value of the same length as the character sequence
represented by the input `string_type` instance.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Repeat function

#### Description

Repeats the character sequence hold by the string by the number of
specified copies.

#### Synax

```fortran
type(string_type) :: string
character(len=:), allocatable :: dlc

string = "What? "
dlc = repeat(string, 3)
! dlc == "What? What? What? "
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

- `string`: Instance of a `string_type`. This argument is `intent(in)`.
- `ncopies`: Integer of default type. This argument is `intent(in)`.

#### Result value

The result is a scalar character value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Char function

Return the character sequence represented by the string.

#### Description

#### Synax

```fortran
type(string_type) :: string
character(len=:), allocatable :: dlc

string = "Character sequence"
dlc = char(string)
! dlc == "Character sequence"
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

- `string`: Instance of a `string_type`. This argument is `intent(in)`.

#### Result value

The result is a scalar character value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Char function (position variant)

Return the character sequence represented by the string.

#### Description

#### Synax

```fortran
type(string_type) :: string
character(len=:), allocatable :: dlc
character(len=1), allocatable :: chars(:)

string = "Character sequence"
dlc = char(string, 3)
! dlc == "a"
chars = char(string, [3, 5, 8, 12, 14, 15, 18])
! chars == ["a", "a", "e", "e", "u", "e", "e"]
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

- `string`: Instance of a `string_type`. This argument is `intent(in)`.
- `pos`: Integer of default type. This argument is `intent(in)`.

#### Result value

The result is a scalar character value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Char function (range variant)

Return the character sequence represented by the string.

#### Description

#### Synax

```fortran
type(string_type) :: string
character(len=:), allocatable :: dlc

string = "Fortran"
dlc = char(string, 1, 4)
! dlc == "Fort"
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

- `string`: Instance of a `string_type`. This argument is `intent(in)`.
- `start`: Integer of default type. This argument is `intent(in)`.
- `last`: Integer of default type. This argument is `intent(in)`.

#### Result value

The result is a scalar character value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Ichar function

Character-to-integer conversion function.

#### Description

Returns the code for the character in the first character position of the
character sequence in the system's native character set.

#### Synax

```fortran
type(string_type) :: string
integer :: code

string = "Fortran"
code = ichar(string)
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

- `string`: Instance of a `string_type`. This argument is `intent(in)`.

#### Result value

The result is a default integer scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Iachar function

Code in ASCII collating sequence.

#### Description

Returns the code for the ASCII character in the first character position of
the character sequences represent by the string.

#### Synax

```fortran
type(string_type) :: string
integer :: code

string = "Fortran"
code = iachar(string)
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

- `string`: Instance of a `string_type`. This argument is `intent(in)`.

#### Result value

The result is a default integer scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Index function

Position of a *substring* within a *string*.

#### Description

Returns the position of the start of the leftmost or rightmost occurrence
of string *substring* in *string*, counting from one. If *substring* is not
present in *string*, zero is returned.

#### Synax

```fortran
type(string_type) :: string
integer :: pos

string = "Search this string for this expression"
pos = index(string, "this")
! pos == 8

pos = index(string, "this", back=.true.)
! pos == 24

pos = index(string, "This")
! pos == 0
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

#### Result value

The result is a default integer scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Scan function

Scan a *string* for the presence of a *set* of characters. Scans a *string* for
any of the characters in a *set* of characters.

#### Description

If *back* is either absent or *false*, this function returns the position
of the leftmost character of *string* that is in *set*. If *back* is *true*,
the rightmost position is returned. If no character of *set* is found in
*string*, the result is zero.

#### Synax

```fortran
type(string_type) :: string
integer :: pos

string = "fortran"
pos = scan(string, "ao")
! pos == 2

pos = scan(string, "ao", .true.)
! pos == 6

pos = scan(string, "c++")
! pos == 0
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

#### Result value

The result is a default integer scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Verify function

Scan a string for the absence of a set of characters. Verifies that all
the characters in string belong to the set of characters in set.

#### Description

If *back* is either absent or *false*, this function returns the position
of the leftmost character of *string* that is not in *set*. If *back* is *true*,
the rightmost position is returned. If all characters of *string* are found
in *set*, the result is zero.

#### Synax

```fortran
type(string_type) :: string
integer :: pos

string = "fortran"
pos = verify(string, "ao")
! pos == 1

pos = verify(string, "fo")
! pos == 3

pos = verify(string, "c++")
! pos == 1

pos = verify(string, "c++", back=.true.)
! pos == 7

pos = verify(string, string)
! pos == 0
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

#### Result value

The result is a default integer scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Lgt function (lexical greater)

Lexically compare the order of two character sequences being greater.

#### Description

The left-hand side, the right-hand side or both character sequences can
be represented by a string type.
This defines three procedures overloading the intrinsic `lgt` procedure.

#### Synax

```fortran
type(string_type) :: string
logical :: res

string = "bcd"
res = lgt(string, "abc")
! res .eqv. .true.

res = lgt(string, "bcd")
! res .eqv. .false.

res = lgt(string, "cde")
! res .eqv. .false.
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

- `lhs`: Either scalar character value or string type. This argument is `intent(in)`.
- `rhs`: Either scalar character value or string type. This argument is `intent(in)`.

#### Result value

The result is a default logical scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Llt function (lexical less)

Lexically compare the order of two character sequences being less.

#### Description

The left-hand side, the right-hand side or both character sequences can
be represented by a string type.
This defines three procedures overloading the intrinsic `llt` procedure.

#### Synax

```fortran
type(string_type) :: string
logical :: res

string = "bcd"
res = llt(string, "abc")
! res .eqv. .false.

res = llt(string, "bcd")
! res .eqv. .false.

res = llt(string, "cde")
! res .eqv. .true.
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

- `lhs`: Either scalar character value or string type. This argument is `intent(in)`.
- `rhs`: Either scalar character value or string type. This argument is `intent(in)`.

#### Result value

The result is a default logical scalar value.

<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Lge function (lexical greater or equal)

Lexically compare the order of two character sequences being greater or equal.

#### Description

The left-hand side, the right-hand side or both character sequences can
be represented by a string type.
This defines three procedures overloading the intrinsic `lge` procedure.

#### Synax

```fortran
type(string_type) :: string
logical :: res

string = "bcd"
res = lge(string, "abc")
! res .eqv. .true.

res = lge(string, "bcd")
! res .eqv. .true.

res = lge(string, "cde")
! res .eqv. .false.
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

- `lhs`: Either scalar character value or string type. This argument is `intent(in)`.
- `rhs`: Either scalar character value or string type. This argument is `intent(in)`.

#### Result value

The result is a default logical scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Lle function (lexical less or equal)

Lexically compare the order of two character sequences being less or equal.

#### Description

The left-hand side, the right-hand side or both character sequences can
be represented by a string type.
This defines three procedures overloading the intrinsic `lle` procedure.

#### Synax

```fortran
type(string_type) :: string
logical :: res

string = "bcd"
res = lle(string, "abc")
! res .eqv. .false.

res = lle(string, "bcd")
! res .eqv. .true.

res = lle(string, "cde")
! res .eqv. .true.
```

#### Status

Experimental

#### Class

Elemental function.

#### Argument

- `lhs`: Either scalar character value or string type. This argument is `intent(in)`.
- `rhs`: Either scalar character value or string type. This argument is `intent(in)`.

#### Result value

The result is a default logical scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Comparison operator greater

Compare the order of two character sequences being greater.

#### Description

The left-hand side, the right-hand side or both character sequences can
be represented by a string type.
This defines three procedures overloading the intrinsic `operator(.gt.)`.

#### Synax

```fortran
type(string_type) :: string
logical :: res

string = "bcd"
res = string > "abc"
! res .eqv. .true.

res = string > "bcd"
! res .eqv. .false.

res = string > "cde"
! res .eqv. .false.
```

#### Status

Experimental

#### Class

Elemental function, `operator(.gt.)`.

#### Argument

- `lhs`: Either scalar character value or string type. This argument is `intent(in)`.
- `rhs`: Either scalar character value or string type. This argument is `intent(in)`.

#### Result value

The result is a default logical scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Comparison operator less

Compare the order of two character sequences being less.

#### Description

The left-hand side, the right-hand side or both character sequences can
be represented by a string type.
This defines three procedures overloading the intrinsic `operator(.lt.)`.

#### Synax

```fortran
type(string_type) :: string
logical :: res

string = "bcd"
res = string < "abc"
! res .eqv. .false.

res = string < "bcd"
! res .eqv. .false.

res = string < "cde"
! res .eqv. .true.
```

#### Status

Experimental

#### Class

Elemental function, `operator(.lt.)`.

#### Argument

- `lhs`: Either scalar character value or string type. This argument is `intent(in)`.
- `rhs`: Either scalar character value or string type. This argument is `intent(in)`.

#### Result value

The result is a default logical scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Comparison operator greater or equal

Compare the order of two character sequences being greater or equal.

#### Description

The left-hand side, the right-hand side or both character sequences can
be represented by a string type.
This defines three procedures overloading the intrinsic `operator(.ge.)`.

#### Synax

```fortran
type(string_type) :: string
logical :: res

string = "bcd"
res = string >= "abc"
! res .eqv. .true.

res = string >= "bcd"
! res .eqv. .true.

res = string >= "cde"
! res .eqv. .false.
```

#### Status

Experimental

#### Class

Elemental function, `operator(.ge.)`.

#### Argument

- `lhs`: Either scalar character value or string type. This argument is `intent(in)`.
- `rhs`: Either scalar character value or string type. This argument is `intent(in)`.

#### Result value

The result is a default logical scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Comparison operator less or equal

Compare the order of two character sequences being less or equal.

#### Description

The left-hand side, the right-hand side or both character sequences can
be represented by a string type.
This defines three procedures overloading the intrinsic `operator(.le.)`.

#### Synax

```fortran
type(string_type) :: string
logical :: res

string = "bcd"
res = string <= "abc"
! res .eqv. .false.

res = string <= "bcd"
! res .eqv. .true.

res = string <= "cde"
! res .eqv. .true.
```

#### Status

Experimental

#### Class

Elemental function, `operator(.le.)`.

#### Argument

- `lhs`: Either scalar character value or string type. This argument is `intent(in)`.
- `rhs`: Either scalar character value or string type. This argument is `intent(in)`.

#### Result value

The result is a default logical scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Comparison operator equal

Compare two character sequences for equality.

#### Description

The left-hand side, the right-hand side or both character sequences can
be represented by a string type.
This defines three procedures overloading the intrinsic `operator(.eq.)`.

#### Synax

```fortran
type(string_type) :: string
logical :: res

string = "bcd"
res = string == "abc"
! res .eqv. .false.

res = string == "bcd"
! res .eqv. .true.

res = string == "cde"
! res .eqv. .false.
```

#### Status

Experimental

#### Class

Elemental function, `operator(.eq.)`.

#### Argument

- `lhs`: Either scalar character value or string type. This argument is `intent(in)`.
- `rhs`: Either scalar character value or string type. This argument is `intent(in)`.

#### Result value

The result is a default logical scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Comparison operator not equal

Compare two character sequences for inequality.

#### Description

The left-hand side, the right-hand side or both character sequences can
be represented by a string type.
This defines three procedures overloading the intrinsic `operator(.ne.)`.

#### Synax

```fortran
type(string_type) :: string
logical :: res

string = "bcd"
res = string /= "abc"
! res .eqv. .true.

res = string /= "bcd"
! res .eqv. .false.

res = string /= "cde"
! res .eqv. .true.
```

#### Status

Experimental

#### Class

Elemental function, `operator(.ne.)`.

#### Argument

- `lhs`: Either scalar character value or string type. This argument is `intent(in)`.
- `rhs`: Either scalar character value or string type. This argument is `intent(in)`.

#### Result value

The result is a default logical scalar value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Concatenation operator

Concatenate two character sequences.

#### Description

The left-hand side, the right-hand side or both character sequences can
be represented by a string type.
This defines three procedures overloading the intrinsic `operator(//)`.

#### Synax

```fortran
type(string_type) :: string

string = "Hello, "
string = string // "World!"
! dlc(string) == 13
```

#### Status

Experimental

#### Class

Elemental function, `operator(//)`.

#### Argument

- `lhs`: Either scalar character value or string type. This argument is `intent(in)`.
- `rhs`: Either scalar character value or string type. This argument is `intent(in)`.

#### Result value

The result is a scalar character value.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Unformatted write

#### Description

Write the character sequence hold by the string to a connected unformatted unit.

#### Synax

```fortran
type(string_type) :: string
integer :: io
string = "Important saved value"

open(newunit=io, form="unformatted", status="scratch")
write(io) string

rewind(io)

read(io) string
close(io)
```

#### Status

Experimental

#### Class

Unformatted derived type IO.

#### Argument

- `string`: Instance of the string type to read. This argument is `intent(inout)`.
- `unit`: Formatted unit for output. This argument is `intent(in)`.
- `iostat`: Status identifier to indicate success of output operation.
  This argument is `intent(out)`.
- `iomsg`: Buffer to return error message in case of failing output operation.
  This argument is `intent(inout)`.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Formatted write

#### Description

Write the character sequence hold by the string to a connected formatted unit.

#### Synax

```fortran
type(string_type) :: string
integer :: io
string = "Important saved value"

open(newunit=io, form="formatted", status="scratch")
write(io, *) string

rewind(io)

read(io, *) string
close(io)
```

#### Status

Experimental

#### Class

Formatted derived type IO.

#### Argument

- `string`: Instance of the string type to read. This argument is `intent(inout)`.
- `unit`: Formatted unit for output. This argument is `intent(in)`.
- `iotype`: Type of formatted data transfer, has the value `"LISTDIRECTED"` for `fmt=*`,
  `"NAMELIST"` for namelist output or starts with `"DT"` for derived type output.
  This argument is `intent(in)`.
- `v_list`: Rank one array of default integer type containing the edit descriptors for
  derived type output.
  This argument is `intent(in)`.
- `iostat`: Status identifier to indicate success of output operation.
  This argument is `intent(out)`.
- `iomsg`: Buffer to return error message in case of failing output operation.
  This argument is `intent(inout)`.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Unformatted read

#### Description

Read a character sequence from a connected unformatted unit into the string.

#### Synax

```fortran
type(string_type) :: string
integer :: io
string = "Important saved value"

open(newunit=io, form="unformatted", status="scratch")
write(io) string

rewind(io)

read(io) string
close(io)
```

#### Status

Experimental

#### Class

Unformatted derived type IO.

#### Argument

- `string`: Instance of the string type to read. This argument is `intent(inout)`.
- `unit`: Formatted unit for input. This argument is `intent(in)`.
- `iostat`: Status identifier to indicate success of input operation.
  This argument is `intent(out)`.
- `iomsg`: Buffer to return error message in case of failing input operation.
  This argument is `intent(inout)`.


<!-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -->
### Formatted read

#### Description

Read a character sequence from a connected formatted unit into the string.

#### Synax

```fortran
type(string_type) :: string
integer :: io
string = "Important saved value"

open(newunit=io, form="formatted", status="scratch")
write(io, *) string

rewind(io)

read(io, *) string
close(io)
```

#### Status

Experimental

#### Class

Formatted derived type IO.

#### Argument

- `string`: Instance of the string type to read. This argument is `intent(inout)`.
- `unit`: Formatted unit for input. This argument is `intent(in)`.
- `iotype`: Type of formatted data transfer, has the value `"LISTDIRECTED"` for `fmt=*`,
  `"NAMELIST"` for namelist input or starts with `"DT"` for derived type input.
  This argument is `intent(in)`.
- `v_list`: Rank one array of default integer type containing the edit descriptors for
  derived type input.
  This argument is `intent(in)`.
- `iostat`: Status identifier to indicate success of input operation.
  This argument is `intent(out)`.
- `iomsg`: Buffer to return error message in case of failing input operation.
  This argument is `intent(inout)`.
