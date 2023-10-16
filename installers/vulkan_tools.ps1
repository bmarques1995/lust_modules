param (
    [string]$buildMode = "",
    [string]$installPrefix = ""
)

if (($buildMode -eq "Debug" -or $buildMode -eq "Release") -and ($installPrefix -ne ""))
{
    cmake -S ./modules/vulkan_tools -G Ninja -DCMAKE_C_COMPILER=cl.exe -DCMAKE_CXX_COMPILER=cl.exe -DUPDATE_DEPS=ON -B ./dependencies/vulkan_tools -DCMAKE_BUILD_TYPE="$buildMode" -DCMAKE_INSTALL_PREFIX="$installPrefix"
    cmake --build ./dependencies/vulkan_tools --config "$buildMode" --target install
} 
else 
{
    Write-Output "Invalid build args"
}