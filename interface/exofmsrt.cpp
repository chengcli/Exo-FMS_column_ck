// exofmsck
#include <exofmsrt.h>
#include "exofmsrt.hpp"

ExoFMSRT::ExoFMSRT()
{
  init_arrays_();
}

void ExoFMSRT::Run() const
{
  call_exo_fms_rt_();
}
