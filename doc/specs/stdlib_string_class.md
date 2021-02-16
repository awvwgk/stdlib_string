---
title: string class
---

# The `stdlib_string_class` module

[TOC]

## Introduction

The `stdlib_string_class` provides an abstract base class (ABC) specification of
an extendible string type to hold an arbitrary character sequence.

The ABC provides compatibility with all intrinsic character procedures as well as
operators for working with character variables and constants.
A minimal implementation of the string class has to provide only a setter function
in form of an assignment from a fixed length character variable and getter functions
for returning the whole string, a character at a certain index and a range of
characters within the bounds of the character sequence.
To use the provided generic interfaces for compatibility with intrinsic character
variables and the non-extendible [[string_type]] implementation of the [[string_class]]
should reexport all overloaded generic interfaces from the ABC.

Implementations of the string class that are encouraged to overwrite the type
bound procedures providing those functionality in the ABC with optimized
algorithms suitable for their respective representation of the character sequence.
