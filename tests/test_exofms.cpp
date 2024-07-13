#include <iostream>

#include <exofmsrt/exofmsrt.hpp>

int main() {
  ExoFMSRT rt;
  rt.Run(4);

  std::cout << "temp = " << rt.temp(0) << std::endl;
  std::cout << "temp = " << rt.temp(1) << std::endl;
  std::cout << "temp = " << rt.temp(2) << std::endl;

  std::cout << "pres = " << rt.pres(0) << std::endl;
  std::cout << "pres = " << rt.pres(1) << std::endl;
  std::cout << "pres = " << rt.pres(2) << std::endl;

  std::cout << "vmr = " << rt.vmr(0, 0) << std::endl;
  std::cout << "vmr = " << rt.vmr(1, 0) << std::endl;
  std::cout << "vmr = " << rt.vmr(2, 0) << std::endl;
  std::cout << "vmr = " << rt.vmr(0, 1) << std::endl;
  std::cout << "vmr = " << rt.vmr(0, 2) << std::endl;
  std::cout << "vmr = " << rt.vmr(0, 3) << std::endl;

  std::cout << "netf = " << rt.netf(0) << std::endl;
  std::cout << "netf = " << rt.netf(1) << std::endl;
  std::cout << "netf = " << rt.netf(2) << std::endl;

  for (int i = 0; i < rt.nlay(); ++i) {
    rt.temp(i) *= 2.;
  }

  rt.Run();

  std::cout << "temp = " << rt.temp(0) << std::endl;
  std::cout << "temp = " << rt.temp(1) << std::endl;
  std::cout << "temp = " << rt.temp(2) << std::endl;
  std::cout << "netf = " << rt.netf(0) << std::endl;
  std::cout << "netf = " << rt.netf(1) << std::endl;
  std::cout << "netf = " << rt.netf(2) << std::endl;
}
