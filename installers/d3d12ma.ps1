param (
    [string]$buildMode = "",
    [string]$installPrefix = ""
)

Write-Output "$installPrefix"

if (($buildMode -eq "Debug" -or $buildMode -eq "Release") -and ($installPrefix -ne ""))
{
    cmake -S ./modules/d3d12ma -B ./dependencies/d3d12ma -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE="$buildMode" -DCMAKE_INSTALL_PREFIX="$installPrefix"
    cmake --build ./dependencies/d3d12ma --config "$buildMode" --target install
} 
else 
{
    Write-Output "Invalid build args"
}