#pragma once

#include <string>
#include <vector>

class ExoFMSRT {
 public:
  ExoFMSRT();
  virtual ~ExoFMSRT() {}

  void Run() const;

  double* const& GetExtinction() const;

  double* const& GetSingleScatteringAlbedo() const;

  double* const& GetAsymmetryFactor() const;

 protected:
  int nlay, nsp, ng, nb;
  double *temp;
  double *pres;
  double *vmr;
  double *netf;
};
