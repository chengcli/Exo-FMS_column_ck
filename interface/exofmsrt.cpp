// C/C++
#include <iostream>

// exofmsck
#include <exofmsrt.h>
#include "exofmsrt.hpp"

ExoFMSRT::ExoFMSRT()
{
  int nstep = 0;
  int iIC = 4;
  call_exo_fms_rt_(&nstep, &iIC);

  get_array_sizes_(&nlay_, &nsp_, &ng_, &nb_);

  std::cout << "======== Dimensions of the problem =========" << std::endl;
  std::cout << "nlayer = " << nlay_ << std::endl;
  std::cout << "nspecies = " << nsp_ << std::endl;
  std::cout << "ng = " << ng_ << std::endl;
  std::cout << "nb = " << nb_ << std::endl;
  std::cout << "===========" << std::endl;

  get_temp_lyr_(temp_);
  get_pres_lvl_(pres_);
  get_vmr_lyr_(vmr_);
  get_netf_lvl_(netf_);
}

ExoFMSRT::~ExoFMSRT() {
  finalize_();
}

void ExoFMSRT::Run(int iIC) const
{
  int nsteps = 1;
  call_exo_fms_rt_(&nsteps, &iIC);
}
