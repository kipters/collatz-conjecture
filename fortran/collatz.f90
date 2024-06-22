program collatz_program
  implicit none
  integer :: seed, collatz_result
  integer :: collatz

  collatz_result = 0
  do seed = 1, 1000000
    collatz_result = collatz_result + collatz(seed)
  end do
  print *, 'steps', collatz_result
end program collatz_program

integer function collatz(seed)
  implicit none
  integer, intent(in) :: seed
  integer :: steps, temp_seed

  steps = 0
  temp_seed = seed
  do while (temp_seed > 1)
    do while (mod(temp_seed, 2) == 0)
      steps = steps + 1
      temp_seed = temp_seed / 2
    end do
    if (temp_seed > 1) then
      steps = steps + 1
      temp_seed = temp_seed * 3 + 1
    end if
  end do
  collatz = steps
end function collatz
