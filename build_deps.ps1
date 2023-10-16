param (
    [string]$buildMode,
    [string]$installPath
)

./installers/spdlog $buildMode $installPath
./installers/eigen $buildMode $installPath
./installers/valijson $buildMode $installPath
./installers/jsoncpp $buildMode $installPath
./installers/vulkan_loader $buildMode $installPath
./installers/spirv_wrapper $buildMode $installPath
./installers/vulkan_tools $buildMode $installPath
./installers/vulkan_utilities $buildMode $installPath
./installers/vulkan_profiles $buildMode $installPath
./installers/vulkan_extension $buildMode $installPath
./installers/vulkan_validation $buildMode $installPath
./installers/dxc $buildMode $installPath
./installers/vma $buildMode $installPath
./installers/d3d12ma $buildMode $installPath