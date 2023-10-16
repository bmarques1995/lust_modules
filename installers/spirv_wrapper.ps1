param (
    [string]$buildMode = "",
    [string]$installPrefix = ""
)

if (($buildMode -eq "Debug" -or $buildMode -eq "Release") -and ($installPrefix -ne ""))
{
    cmake -S ./modules/spirv_wrapper -B ./dependencies/spirv_wrapper -DCMAKE_BUILD_TYPE="$buildMode" -DCMAKE_INSTALL_PREFIX="$installPrefix"
    cmake --build ./dependencies/spirv_wrapper --config $buildMode --target install
} 
else 
{
    Write-Output "Invalid build args"
}