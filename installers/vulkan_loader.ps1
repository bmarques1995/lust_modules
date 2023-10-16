param (
    [string]$buildMode = "",
    [string]$installPrefix = ""
)

if (($buildMode -eq "Debug" -or $buildMode -eq "Release") -and ($installPrefix -ne ""))
{
    cmake -S ./modules/vulkan_headers -B ./dependencies/vulkan_headers -DCMAKE_BUILD_TYPE="$buildMode" -DCMAKE_INSTALL_PREFIX="$installPrefix"
    cmake --build ./dependencies/vulkan_headers --config "$buildMode" --target install
    cmake -S ./modules/vulkan_loader -B ./dependencies/vulkan_loader -DCMAKE_BUILD_TYPE="$buildMode" -DCMAKE_INSTALL_PREFIX="$installPrefix"
    cmake --build ./dependencies/vulkan_loader --config "$buildMode" --target install
} 
else 
{
    Write-Output "Invalid build args"
}