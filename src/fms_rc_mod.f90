subroutine get_array_size(nlay_, nsp_, ng_, nb_)
  integer, intent(out) :: nlay_
  integer, intent(out) :: nsp_
  integer, intent(out) :: ng_
  integer, intent(out) :: nb_

  namelist /FMS_RC_nml/ nlay, nsp, ng, nb

  nlayr_ = nlay
  nsp_ = nsp
  ng_ = ng
  nb_ = nb
end subroutine

subroutine init_arrays()
  use exofms

  namelist /FMS_RC_nml/ nlay, nsp, ng, nb

  integer :: nlev

  nlev = nlay + 1
  allocate(Tl(nlay), pe(nlev))
  allocate(dT_rad(nlay), dT_conv(nlay), net_F(nlev))
  allocate(tau_e(ng,nb,nlev), k_l(ng,nb,nlay))
  allocate(ssa(ng,nb,nlay), gg(ng,nb,nlay))
  allocate(VMR(nsp,nlay), mu(nlay))

end subroutine

subroutine get_temp_lyr(ptr_tl)
  use exofms, only: Tl

  integer, intent(out) :: ptr_tl

  ! Use the loc intrinsic to get the memory address of Tl
  ptr_tl = loc(Tl)
end subroutine

subroutine get_pres_lvl(ptr_pe)
  use exofms, only: pe

  integer, intent(out) :: ptr_pe

  ! Use the loc intrinsic to get the memory address of pe
  ptr_pe = loc(pe)
end subroutine

subroutine get_vmr_lyr(ptr_vmr)
  use exofms, only: VMR

  integer, intent(out) :: ptr_vmr

  ! Use the loc intrinsic to get the memory address of VMR
  ptr_vmr = loc(VMR)
end subroutine
