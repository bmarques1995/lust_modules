@echo off

call ./installers/spdlog %~1 %~2
call ./installers/eigen %~1 %~2
call ./installers/valijson %~1 %~2
call ./installers/jsoncpp %~1 %~2
call ./installers/vulkan_loader %~1 %~2
call ./installers/spirv_wrapper %~1 %~2
call ./installers/vulkan_tools %~1 %~2
call ./installers/vulkan_utilities %~1 %~2
call ./installers/vulkan_profiles %~1 %~2
call ./installers/vulkan_extension %~1 %~2
call ./installers/vulkan_validation %~1 %~2
call ./installers/dxc %~1 %~2
call ./installers/vma %~1 %~2
call ./installers/d3d12ma %~1 %~2