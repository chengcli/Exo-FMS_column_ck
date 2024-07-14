message(STATUS "Compile the exofmsrt test code")

enable_testing()
create_data_link(FMS_RC.nml)
create_data_link(CE_tables)
create_data_link(hybrid_sigma)
create_data_link(opac_data)
create_data_link(sw_flux)

setup_test(test_exofms)
