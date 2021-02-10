! Low level API for strings. These utilities are used in the high level API
! for the `string_type`.
module stdlib_string_type_low_level
    implicit none

contains

    pure function new_string_from_chars0(chars) result(new)
        character(len=*), intent(in) :: chars(:)
        character(len=:), allocatable :: new
        allocate(character(len=len(chars)*size(chars)) :: new)
        new = transfer(chars, new)
        ! Cannot you just do:
        ! new = chars
        ! ?
    end function

    subroutine read_unformatted0(string, unit, iostat, iomsg)
        character(len=:), allocatable, intent(inout) :: string
        integer, intent(in)    :: unit
        integer, intent(out)   :: iostat
        character(len=*), intent(inout) :: iomsg
        integer, parameter :: long = selected_int_kind(18)
        integer(long) :: chunk
        read(unit, iostat=iostat, iomsg=iomsg) chunk
        if (iostat == 0) then
            string = repeat(' ', chunk)
            read(unit, iostat=iostat, iomsg=iomsg) string
        end if
    end subroutine

    subroutine read_formatted0(string, unit, iotype, v_list, iostat, iomsg)
        character(len=:), allocatable, intent(inout) :: string
        integer, intent(in) :: unit
        character(len=*), intent(in) :: iotype
        integer, intent(in) :: v_list(:)
        integer, intent(out) :: iostat
        character(len=*), intent(inout) :: iomsg
        integer, parameter :: buffer_size = 512
        character(len=buffer_size) :: buffer
        integer :: chunk
        call unused_dummy_argument(iotype)
        call unused_dummy_argument(v_list)
        string = ''
        do
            read(unit, '(a)', iostat=iostat, iomsg=iomsg, size=chunk, advance='no') &
                buffer
            if (iostat > 0) exit
            string = string // buffer(:chunk)
            if (iostat < 0) then
                if (is_iostat_eor(iostat)) then
                    iostat = 0
                end if
                exit
            end if
        end do
    end subroutine

    pure integer function maybe0_len(string) result(n)
       character(len=:), allocatable, intent(in) :: string
       if (allocated(string)) then
           n = len(string)
       else
           n = 0
       end if
    end function

    pure function maybe0(string) result(maybe_string)
       character(len=:), allocatable, intent(in) :: string
       character(len=maybe0_len(string)) :: maybe_string
       if (allocated(string)) then
           maybe_string = string
       end if
    end function

    elemental subroutine unused_dummy_argument(dummy)
        class(*), intent(in) :: dummy
        associate(dummy => dummy); end associate
    end subroutine unused_dummy_argument

end module stdlib_string_type_low_level
