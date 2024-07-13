# compile the exofmsrt module

string(TOLOWER ${CMAKE_BUILD_TYPE} buildl)
string(TOUPPER ${CMAKE_BUILD_TYPE} buildu)

set(namel exofmsrt)
string(TOUPPER ${namel} nameu)

set(_${namel}_src
	  WENO4_mod.f90
    call_twostr.F
	  k_Rosseland_mod.f90
	  IC_mod.f90
    ce_interp_mod.f90
		ce_Burrows_mod.f90
	  ck_opacity_mod.f90
	  dry_conv_adj_mod.f90
		MLT_mod.f90
		sw_direct_mod.f90
		sw_adding_mod.f90
		sw_SDA_mod.f90
		sw_Toon_mod.f90
		sw_SH2_mod.f90
		sw_SH4_mod.f90
		sw_disort_ts_mod.f90
		lw_AA_E_mod.f90
		lw_AA_L_mod.f90
		lw_sc_linear_mod.f90
		lw_VIM_mod.f90
		lw_Toon_mod.f90
		lw_disort_ts_mod.f90
    FMS_RC.f90  
    fms_rc_mod.f90  
    )

add_library(${namel}_${buildl}
    STATIC
    ${_${namel}_src}
    )

set_target_properties(${namel}_${buildl}
    PROPERTIES
    COMPILE_FLAGS ${${PROJECT_NAME}_Fortran_FLAGS}
    )

target_link_libraries(${namel}_${buildl}
    PRIVATE
    lapack
    blas
    )

add_library(exofmsrt::exofmsrtf ALIAS ${namel}_${buildl})
