subroutine get_array_sizes(nlay, nsp, ng, nb)
  use exofms, only: k_l, VMR

  implicit none
  integer, intent(out) :: nlay
  integer, intent(out) :: nsp
  integer, intent(out) :: ng
  integer, intent(out) :: nb

  ng = size(k_l, 1)
  nb = size(k_l, 2)
  nlay = size(k_l, 3)
  nsp = size(VMR, 1)
end subroutine

subroutine get_temp_lyr(ptr_tl)
  use exofms, only: Tl
  use iso_c_binding

  implicit none
  type(c_ptr), intent(out) :: ptr_tl

  ! Use the loc intrinsic to get the memory address of Tl
  ptr_tl = c_loc(Tl)
end subroutine

subroutine get_pres_lvl(ptr_pe)
  use exofms, only: pe
  use iso_c_binding

  implicit none
  type(c_ptr), intent(out) :: ptr_pe

  ! Use the loc intrinsic to get the memory address of pe
  ptr_pe = c_loc(pe)
end subroutine

subroutine get_vmr_lyr(ptr_vmr)
  use exofms, only: VMR
  use iso_c_binding

  implicit none
  type(c_ptr), intent(out) :: ptr_vmr

  ! Use the loc intrinsic to get the memory address of VMR
  ptr_vmr = c_loc(VMR)
end subroutine

subroutine get_netf_lvl(ptr_netf)
  use exofms, only: net_F
  use iso_c_binding

  implicit none
  type(c_ptr), intent(out) :: ptr_netf

  ! Use the loc intrinsic to get the memory address of VMR
  ptr_netf = c_loc(net_F)
end subroutine

subroutine finalize()
  use exofms

  deallocate(Tl)
  deallocate(pe)
  deallocate(dT_rad)
  deallocate(dT_conv)
  deallocate(net_F)
  deallocate(VMR)
  deallocate(mu)
  deallocate(k_l)
  deallocate(tau_e)
  deallocate(ssa)
  deallocate(gg)
  print *, 'Finalized'
end subroutine
