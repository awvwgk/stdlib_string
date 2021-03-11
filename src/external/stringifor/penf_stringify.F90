!< PENF string-to-number (and viceversa) facility.

module penf_stringify
!< PENF string-to-number (and viceversa) facility.
use, intrinsic :: iso_fortran_env, only : stderr=>error_unit
use penf_global_parameters_variables
use stdlib_kinds, only : I1P => int8, I2P => int16, I4P => int32, I8P => int64, &
                         R4P => sp, R8P => dp, R16P => qp

implicit none
private
save
public :: str

interface str
  !< Convert number (real and integer) to string (number to string type casting).
  module procedure                       &
                   strf_R16P,str_R16P,   &
                   strf_R8P ,str_R8P,    &
                   strf_R4P ,str_R4P,    &
                   strf_I8P ,str_I8P,    &
                   strf_I4P ,str_I4P,    &
                   strf_I2P ,str_I2P,    &
                   strf_I1P ,str_I1P,    &
                             str_bol,    &
                             str_a_R16P, &
                             str_a_R8P,  &
                             str_a_R4P,  &
                             str_a_I8P,  &
                             str_a_I4P,  &
                             str_a_I2P,  &
                             str_a_I1P
endinterface

contains
   elemental function strf_R16P(fm, n) result(str)
   !< Convert real to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(fm=FR16P, n=1._R16P)
   !<```
   !=> 0.100000000000000000000000000000000E+0001 <<<
   character(*), intent(in) :: fm  !< Format different from the standard for the kind.
   real(R16P),   intent(in) :: n   !< Real to be converted.
   character(DR16P)         :: str !< Returned string containing input number.

   write(str, trim(fm)) n
   endfunction strf_R16P

   elemental function strf_R8P(fm, n) result(str)
   !< Convert real to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(fm=FR8P, n=1._R8P)
   !<```
   !=> 0.100000000000000E+001 <<<
   character(*), intent(in) :: fm  !< Format different from the standard for the kind.
   real(R8P),    intent(in) :: n   !< Real to be converted.
   character(DR8P)          :: str !< Returned string containing input number.

   write(str, trim(fm)) n
   endfunction strf_R8P

   elemental function strf_R4P(fm, n) result(str)
   !< Convert real to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(fm=FR4P, n=1._R4P)
   !<```
   !=> 0.100000E+01 <<<
   character(*), intent(in) :: fm  !< Format different from the standard for the kind.
   real(R4P),    intent(in) :: n   !< Real to be converted.
   character(DR4P)          :: str !< Returned string containing input number.

   write(str, trim(fm)) n
   endfunction strf_R4P

   elemental function strf_I8P(fm, n) result(str)
   !< Convert integer to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(fm=FI8P, n=1_I8P)
   !<```
   !=> 1 <<<
   character(*), intent(in) :: fm  !< Format different from the standard for the kind.
   integer(I8P), intent(in) :: n   !< Integer to be converted.
   character(DI8P)          :: str !< Returned string containing input number.

   write(str, trim(fm)) n
   endfunction strf_I8P

   elemental function strf_I4P(fm, n) result(str)
   !< Convert integer to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(fm=FI4P, n=1_I4P)
   !<```
   !=> 1 <<<
   character(*), intent(in) :: fm  !< Format different from the standard for the kind.
   integer(I4P), intent(in) :: n   !< Integer to be converted.
   character(DI4P)          :: str !< Returned string containing input number.

   write(str, trim(fm)) n
   endfunction strf_I4P

   elemental function strf_I2P(fm, n) result(str)
   !< Convert integer to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(fm=FI2P, n=1_I2P)
   !<```
   !=> 1 <<<
   character(*), intent(in) :: fm  !< Format different from the standard for the kind.
   integer(I2P), intent(in) :: n   !< Integer to be converted.
   character(DI2P)          :: str !< Returned string containing input number.

   write(str, trim(fm)) n
   endfunction strf_I2P

   elemental function strf_I1P(fm, n) result(str)
   !< Convert integer to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(fm=FI1P, n=1_I1P)
   !<```
   !=> 1 <<<
   character(*), intent(in) :: fm  !< Format different from the standard for the kind.
   integer(I1P), intent(in) :: n   !< Integer to be converted.
   character(DI1P)          :: str !< Returned string containing input number.

   write(str, trim(fm)) n
   endfunction strf_I1P

   elemental function str_R16P(n, no_sign, compact) result(str)
   !< Convert real to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1._R16P)
   !<```
   !=> -0.100000000000000000000000000000000E+0001 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1._R16P, no_sign=.true.)
   !<```
   !=> 0.100000000000000000000000000000000E+0001 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1._R16P, compact=.true.)
   !<```
   !=> -0.1E+1 <<<
   real(R16P), intent(in)           :: n       !< Real to be converted.
   logical,    intent(in), optional :: no_sign !< Flag for leaving out the sign.
   logical,    intent(in), optional :: compact !< Flag for *compacting* string encoding.
   character(DR16P)                 :: str     !< Returned string containing input number.

   write(str, FR16P) n               ! Casting of n to string.
   if (n>0._R16P) str(1:1)='+'       ! Prefixing plus if n>0.
   if (present(no_sign)) str=str(2:) ! Leaving out the sign.
   if (present(compact)) then
     if (compact) call compact_real_string(string=str)
   endif
   endfunction str_R16P

   elemental function str_R8P(n, no_sign, compact) result(str)
   !< Convert real to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1._R8P)
   !<```
   !=> -0.100000000000000E+001 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1._R8P, no_sign=.true.)
   !<```
   !=> 0.100000000000000E+001 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1._R8P, compact=.true.)
   !<```
   !=> -0.1E+1 <<<
   real(R8P), intent(in)           :: n       !< Real to be converted.
   logical,   intent(in), optional :: no_sign !< Flag for leaving out the sign.
   logical,   intent(in), optional :: compact !< Flag for *compacting* string encoding.
   character(DR8P)                 :: str     !< Returned string containing input number.

   write(str, FR8P) n                ! Casting of n to string.
   if (n>0._R8P) str(1:1)='+'        ! Prefixing plus if n>0.
   if (present(no_sign)) str=str(2:) ! Leaving out the sign.
   if (present(compact)) then
     if (compact) call compact_real_string(string=str)
   endif
   endfunction str_R8P

   elemental function str_R4P(n, no_sign, compact) result(str)
   !< Convert real to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1._R4P)
   !<```
   !=> -0.100000E+01 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1._R4P, no_sign=.true.)
   !<```
   !=> 0.100000E+01 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1._R4P, compact=.true.)
   !<```
   !=> -0.1E+1 <<<
   real(R4P), intent(in)           :: n       !< Real to be converted.
   logical,   intent(in), optional :: no_sign !< Flag for leaving out the sign.
   logical,   intent(in), optional :: compact !< Flag for *compacting* string encoding.
   character(DR4P)                 :: str     !< Returned string containing input number.

   write(str, FR4P) n                ! Casting of n to string.
   if (n>0._R4P) str(1:1)='+'        ! Prefixing plus if n>0.
   if (present(no_sign)) str=str(2:) ! Leaving out the sign.
   if (present(compact)) then
     if (compact) call compact_real_string(string=str)
   endif
   endfunction str_R4P

   elemental function str_I8P(n, no_sign) result(str)
   !< Convert integer to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1_I8P)
   !<```
   !=> -1 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1_I8P, no_sign=.true.)
   !<```
   !=> 1 <<<
   integer(I8P), intent(in)           :: n       !< Integer to be converted.
   logical,      intent(in), optional :: no_sign !< Flag for leaving out the sign.
   character(DI8P)                    :: str     !< Returned string containing input number plus padding zeros.

   write(str, FI8P) n                ! Casting of n to string.
   str = adjustl(trim(str))          ! Removing white spaces.
   if (n>=0_I8P) str='+'//trim(str)  ! Prefixing plus if n>0.
   if (present(no_sign)) str=str(2:) ! Leaving out the sign.
   endfunction str_I8P

   elemental function str_I4P(n, no_sign) result(str)
   !< Converting integer to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1_I4P)
   !<```
   !=> -1 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1_I4P, no_sign=.true.)
   !<```
   !=> 1 <<<
   integer(I4P), intent(in)           :: n       !< Integer to be converted.
   logical,      intent(in), optional :: no_sign !< Flag for leaving out the sign.
   character(DI4P)                    :: str     !< Returned string containing input number plus padding zeros.

   write(str, FI4P) n                ! Casting of n to string.
   str = adjustl(trim(str))          ! Removing white spaces.
   if (n>=0_I4P) str='+'//trim(str)  ! Prefixing plus if n>0.
   if (present(no_sign)) str=str(2:) ! Leaving out the sign.
   endfunction str_I4P

   elemental function str_I2P(n, no_sign) result(str)
   !< Convert integer to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1_I2P)
   !<```
   !=> -1 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1_I2P, no_sign=.true.)
   !<```
   !=> 1 <<<
   integer(I2P), intent(in)           :: n       !< Integer to be converted.
   logical,      intent(in), optional :: no_sign !< Flag for leaving out the sign.
   character(DI2P)                    :: str     !< Returned string containing input number plus padding zeros.

   write(str, FI2P) n                ! Casting of n to string.
   str = adjustl(trim(str))          ! Removing white spaces.
   if (n>=0_I2P) str='+'//trim(str)  ! Prefixing plus if n>0.
   if (present(no_sign)) str=str(2:) ! Leaving out the sign.
   endfunction str_I2P

   elemental function str_I1P(n, no_sign) result(str)
   !< Convert integer to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1_I1P)
   !<```
   !=> -1 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=-1_I1P, no_sign=.true.)
   !<```
   !=> 1 <<<
   integer(I1P), intent(in)           :: n       !< Integer to be converted.
   logical,      intent(in), optional :: no_sign !< Flag for leaving out the sign.
   character(DI1P)                    :: str     !< Returned string containing input number plus padding zeros.

   write(str, FI1P) n                ! Casting of n to string.
   str = adjustl(trim(str))          ! Removing white spaces.
   if (n>=0_I1P) str='+'//trim(str)  ! Prefixing plus if n>0.
   if (present(no_sign)) str=str(2:) ! Leaving out the sign.
   endfunction str_I1P

   elemental function str_bol(n) result(str)
   !< Convert logical to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=.true.)
   !<```
   !=> T <<<
   logical, intent(in):: n   !< Logical to be converted.
   character(1)::        str !< Returned string containing input number plus padding zeros.

   write(str, '(L1)') n
   endfunction str_bol

   pure function str_a_R16P(n, no_sign, separator, delimiters, compact) result(str)
   !< Converting real array to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R16P, -2._R16P])
   !<```
   !=> +0.100000000000000000000000000000000E+0001,-0.200000000000000000000000000000000E+0001 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R16P, 2._R16P], no_sign=.true.)
   !<```
   !=> 0.100000000000000000000000000000000E+0001,0.200000000000000000000000000000000E+0001 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R16P, -2._R16P], separator='|')
   !<```
   !=> +0.100000000000000000000000000000000E+0001|-0.200000000000000000000000000000000E+0001 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R16P, -2._R16P], delimiters=['(', ')'])
   !<```
   !=> (+0.100000000000000000000000000000000E+0001,-0.200000000000000000000000000000000E+0001) <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R16P, -2._R16P], compact=.true.)
   !<```
   !=> +0.1E+1,-0.2E+1 <<<
   real(R16P),   intent(in)           :: n(:)            !< Real array to be converted.
   logical,      intent(in), optional :: no_sign         !< Flag for leaving out the sign.
   character(1), intent(in), optional :: separator       !< Eventual separator of array values.
   character(*), intent(in), optional :: delimiters(1:2) !< Eventual delimiters of array values.
   logical,      intent(in), optional :: compact         !< Flag for *compacting* string encoding.
   character(len=:), allocatable      :: str             !< Returned string containing input number.
   character(DR16P)                   :: strn            !< String containing of element of input array number.
   character(len=1)                   :: sep             !< Array values separator
   integer                            :: i               !< Counter.

   str = ''
   sep = ','
   if(present(separator)) sep = separator
   do i=1,size(n)
     strn = str_R16P(no_sign=no_sign, compact=compact, n=n(i))
     str = str//sep//trim(strn)
   enddo
   str = trim(str(2:))
   if (present(delimiters)) str = delimiters(1)//str//delimiters(2)
   endfunction str_a_R16P

   pure function str_a_R8P(n, no_sign, separator, delimiters, compact) result(str)
   !< Convert real array to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R8P, -2._R8P])
   !<```
   !=> +0.100000000000000E+001,-0.200000000000000E+001 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R8P, 2._R8P], no_sign=.true.)
   !<```
   !=> 0.100000000000000E+001,0.200000000000000E+001 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R8P, -2._R8P], separator='|')
   !<```
   !=> +0.100000000000000E+001|-0.200000000000000E+001 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R8P, -2._R8P], delimiters=['(', ')'])
   !<```
   !=> (+0.100000000000000E+001,-0.200000000000000E+001) <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R8P, -2._R8P], compact=.true.)
   !<```
   !=> +0.1E+1,-0.2E+1 <<<
   real(R8P),    intent(in)           :: n(:)            !< Real array to be converted.
   logical,      intent(in), optional :: no_sign         !< Flag for leaving out the sign.
   character(1), intent(in), optional :: separator       !< Eventual separator of array values.
   character(*), intent(in), optional :: delimiters(1:2) !< Eventual delimiters of array values.
   logical,      intent(in), optional :: compact         !< Flag for *compacting* string encoding.
   character(len=:), allocatable      :: str             !< Returned string containing input number.
   character(DR8P)                    :: strn            !< String containing of element of input array number.
   character(len=1)                   :: sep             !< Array values separator
   integer                            :: i               !< Counter.

   str = ''
   sep = ','
   if(present(separator)) sep = separator
   do i=1,size(n)
     strn = str_R8P(no_sign=no_sign, compact=compact, n=n(i))
     str = str//sep//trim(strn)
   enddo
   str = trim(str(2:))
   if (present(delimiters)) str = delimiters(1)//str//delimiters(2)
   endfunction str_a_R8P

   pure function str_a_R4P(n, no_sign, separator, delimiters, compact) result(str)
   !< Convert real array to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R4P, -2._R4P])
   !<```
   !=> +0.100000E+01,-0.200000E+01 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R4P, 2._R4P], no_sign=.true.)
   !<```
   !=> 0.100000E+01,0.200000E+01 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R4P, -2._R4P], separator='|')
   !<```
   !=> +0.100000E+01|-0.200000E+01 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R4P, -2._R4P], delimiters=['(', ')'])
   !<```
   !=> (+0.100000E+01,-0.200000E+01) <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1._R4P, -2._R4P], compact=.true.)
   !<```
   !=> +0.1E+1,-0.2E+1 <<<
   real(R4P),    intent(in)           :: n(:)            !< Real array to be converted.
   logical,      intent(in), optional :: no_sign         !< Flag for leaving out the sign.
   character(1), intent(in), optional :: separator       !< Eventual separator of array values.
   character(*), intent(in), optional :: delimiters(1:2) !< Eventual delimiters of array values.
   logical,      intent(in), optional :: compact         !< Flag for *compacting* string encoding.
   character(len=:), allocatable      :: str             !< Returned string containing input number.
   character(DR4P)                    :: strn            !< String containing of element of input array number.
   character(len=1)                   :: sep             !< Array values separator
   integer                            :: i               !< Counter.

   str = ''
   sep = ','
   if(present(separator)) sep = separator
   do i=1,size(n)
     strn = str_R4P(no_sign=no_sign, compact=compact, n=n(i))
     str = str//sep//trim(strn)
   enddo
   str = trim(str(2:))
   if (present(delimiters)) str = delimiters(1)//str//delimiters(2)
   endfunction str_a_R4P

   pure function str_a_I8P(n, no_sign, separator, delimiters) result(str)
   !< Convert integer array to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I8P, -2_I8P])
   !<```
   !=> +1,-2 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I8P, 2_I8P], no_sign=.true.)
   !<```
   !=> 1,2 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I8P, -2_I8P], separator='|')
   !<```
   !=> +1|-2 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I8P, -2_I8P], delimiters=['(', ')'])
   !<```
   !=> (+1,-2) <<<
   integer(I8P), intent(in)           :: n(:)            !< Integer array to be converted.
   logical,      intent(in), optional :: no_sign         !< Flag for leaving out the sign.
   character(1), intent(in), optional :: separator       !< Eventual separator of array values.
   character(*), intent(in), optional :: delimiters(1:2) !< Eventual delimiters of array values.
   character(len=:), allocatable      :: str             !< Returned string containing input number.
   character(DI8P)                    :: strn            !< String containing of element of input array number.
   character(len=1)                   :: sep             !< Array values separator
   integer                            :: i               !< Counter.

   str = ''
   sep = ','
   if(present(separator)) sep = separator
   if (present(no_sign)) then
     do i=1,size(n)
       strn = str_I8P(no_sign=no_sign, n=n(i))
       str = str//sep//trim(strn)
     enddo
   else
     do i=1,size(n)
       strn = str_I8P(n=n(i))
       str = str//sep//trim(strn)
     enddo
   endif
   str = trim(str(2:))
   if (present(delimiters)) str = delimiters(1)//str//delimiters(2)
   endfunction str_a_I8P

   pure function str_a_I4P(n, no_sign, separator, delimiters) result(str)
   !< Convert integer array to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I4P, -2_I4P])
   !<```
   !=> +1,-2 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I4P, 2_I4P], no_sign=.true.)
   !<```
   !=> 1,2 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I4P, -2_I4P], separator='|')
   !<```
   !=> +1|-2 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I4P, -2_I4P], delimiters=['(', ')'])
   !<```
   !=> (+1,-2) <<<
   integer(I4P), intent(in)           :: n(:)            !< Integer array to be converted.
   logical,      intent(in), optional :: no_sign         !< Flag for leaving out the sign.
   character(1), intent(in), optional :: separator       !< Eventual separator of array values.
   character(*), intent(in), optional :: delimiters(1:2) !< Eventual delimiters of array values.
   character(len=:), allocatable      :: str             !< Returned string containing input number.
   character(DI4P)                    :: strn            !< String containing of element of input array number.
   character(len=1)                   :: sep             !< Array values separator
   integer                            :: i               !< Counter.

   str = ''
   sep = ','
   if(present(separator)) sep = separator
   if (present(no_sign)) then
     do i=1,size(n)
       strn = str_I4P(no_sign=no_sign, n=n(i))
       str = str//sep//trim(strn)
     enddo
   else
     do i=1,size(n)
       strn = str_I4P(n=n(i))
       str = str//sep//trim(strn)
     enddo
   endif
   str = trim(str(2:))
   if (present(delimiters)) str = delimiters(1)//str//delimiters(2)
   endfunction str_a_I4P

   pure function str_a_I2P(n, no_sign, separator, delimiters) result(str)
   !< Convert integer array to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I2P, -2_I2P])
   !<```
   !=> +1,-2 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I2P, 2_I2P], no_sign=.true.)
   !<```
   !=> 1,2 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I2P, -2_I2P], separator='|')
   !<```
   !=> +1|-2 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I2P, -2_I2P], delimiters=['(', ')'])
   !<```
   !=> (+1,-2) <<<
   integer(I2P), intent(in)           :: n(:)            !< Integer array to be converted.
   logical,      intent(in), optional :: no_sign         !< Flag for leaving out the sign.
   character(1), intent(in), optional :: separator       !< Eventual separator of array values.
   character(*), intent(in), optional :: delimiters(1:2) !< Eventual delimiters of array values.
   character(len=:), allocatable      :: str             !< Returned string containing input number.
   character(DI2P)                    :: strn            !< String containing of element of input array number.
   character(len=1)                   :: sep             !< Array values separator
   integer                            :: i               !< Counter.

   str = ''
   sep = ','
   if(present(separator)) sep = separator
   if (present(no_sign)) then
     do i=1,size(n)
       strn = str_I2P(no_sign=no_sign, n=n(i))
       str = str//sep//trim(strn)
     enddo
   else
     do i=1,size(n)
       strn = str_I2P(n=n(i))
       str = str//sep//trim(strn)
     enddo
   endif
   str = trim(str(2:))
   if (present(delimiters)) str = delimiters(1)//str//delimiters(2)
   endfunction str_a_I2P

   pure function str_a_I1P(n, no_sign, separator, delimiters) result(str)
   !< Convert integer array to string.
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I1P, -2_I1P])
   !<```
   !=> +1,-2 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I1P, 2_I1P], no_sign=.true.)
   !<```
   !=> 1,2 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I1P, -2_I1P], separator='|')
   !<```
   !=> +1|-2 <<<
   !<
   !<```fortran
   !< use penf
   !< print "(A)", str(n=[1_I1P, -2_I1P], delimiters=['(', ')'])
   !<```
   !=> (+1,-2) <<<
   integer(I1P), intent(in)           :: n(:)            !< Integer array to be converted.
   logical,      intent(in), optional :: no_sign         !< Flag for leaving out the sign.
   character(1), intent(in), optional :: separator       !< Eventual separator of array values.
   character(*), intent(in), optional :: delimiters(1:2) !< Eventual delimiters of array values.
   character(len=:), allocatable      :: str             !< Returned string containing input number.
   character(DI1P)                    :: strn            !< String containing of element of input array number.
   character(len=1)                   :: sep             !< Array values separator
   integer                            :: i               !< Counter.

   str = ''
   sep = ','
   if(present(separator)) sep = separator
   if (present(no_sign)) then
     do i=1,size(n)
       strn = str_I1P(no_sign=no_sign, n=n(i))
       str = str//sep//trim(strn)
     enddo
   else
     do i=1,size(n)
       strn = str_I1P(n=n(i))
       str = str//sep//trim(strn)
     enddo
   endif
   str = trim(str(2:))
   if (present(delimiters)) str = delimiters(1)//str//delimiters(2)
   endfunction str_a_I1P

   pure subroutine compact_real_string(string)
   !< author: Izaak Beekman
   !< date: 02/24/2015
   !<
   !< Compact a string representing a real number, so that the same value is displayed with fewer characters.
   !<
   !< @note No need to add doctest: this is tested by a lot of doctests of other TBPs.
   character(len=*),intent(inout) :: string      !< string representation of a real number.
   character(len=len(string))     :: significand !< Significand characters.
   character(len=len(string))     :: expnt       !< Exponent characters.
   character(len=2)               :: separator   !< Separator characters.
   integer(I4P)                   :: exp_start   !< Start position of exponent.
   integer(I4P)                   :: decimal_pos !< Decimal positions.
   integer(I4P)                   :: sig_trim    !< Signature trim.
   integer(I4P)                   :: exp_trim    !< Exponent trim.
   integer(I4P)                   :: i           !< counter

   string = adjustl(string)
   exp_start = scan(string, 'eEdD')
   if (exp_start == 0) exp_start = scan(string, '-+', back=.true.)
   decimal_pos = scan(string, '.')
   if (exp_start /= 0) separator = string(exp_start:exp_start)
   if ( exp_start < decimal_pos ) then ! possibly signed, exponent-less float
     significand = string
     sig_trim = len(trim(significand))
     do i = len(trim(significand)), decimal_pos+2, -1 ! look from right to left at 0s, but save one after the decimal place
       if (significand(i:i) == '0') then
         sig_trim = i-1
       else
         exit
       endif
     enddo
     string = trim(significand(1:sig_trim))
   elseif (exp_start > decimal_pos) then ! float has exponent
     significand = string(1:exp_start-1)
     sig_trim = len(trim(significand))
     do i = len(trim(significand)),decimal_pos+2,-1 ! look from right to left at 0s
       if (significand(i:i) == '0') then
         sig_trim = i-1
       else
         exit
       endif
     enddo
     expnt = adjustl(string(exp_start+1:))
     if (expnt(1:1) == '+' .or. expnt(1:1) == '-') then
       separator = trim(adjustl(separator))//expnt(1:1)
       exp_start = exp_start + 1
       expnt     = adjustl(string(exp_start+1:))
     endif
     exp_trim = 1
     do i = 1,(len(trim(expnt))-1) ! look at exponent leading zeros saving last
       if (expnt(i:i) == '0') then
         exp_trim = i+1
       else
         exit
       endif
     enddo
     string = trim(adjustl(significand(1:sig_trim)))// &
              trim(adjustl(separator))// &
              trim(adjustl(expnt(exp_trim:)))
   !else ! mal-formed real, BUT this code should be unreachable
   endif
   endsubroutine compact_real_string

endmodule penf_stringify
