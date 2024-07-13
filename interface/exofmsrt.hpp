#pragma once

#include <string>
#include <vector>

class ExoFMSRT {
 public:
  ExoFMSRT();
  virtual ~ExoFMSRT();

  void Run(int iIC = -1) const;

  int nlay() { return nlay_; }
  int nsp() { return nsp_; }
  int ng() { return ng_; }
  int nb() { return nb_; }

  double& temp(int i) { return temp_[i]; }
  double& pres(int i) { return pres_[i]; }
  double& vmr(int n, int i) { return vmr_[n + i * nsp_]; }
  double const& netf(int i) const { return netf_[i]; }

  double* const& GetExtinction() const;
  double* const& GetSingleScatteringAlbedo() const;
  double* const& GetAsymmetryFactor() const;

 protected:
  int nlay_, nsp_, ng_, nb_;
  double *temp_ = nullptr;
  double *pres_ = nullptr;
  double *vmr_ = nullptr;
  double *netf_ = nullptr;
};
