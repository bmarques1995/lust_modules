param (
    [string]$buildMode = "",
    [string]$installPrefix = ""
)

Write-Output "$installPrefix"

if (($buildMode -eq "Debug" -or $buildMode -eq "Release") -and ($installPrefix -ne ""))
{
    cmake -S ./modules/spdlog -B ./dependencies/spdlog -DSPDLOG_BUILD_SHARED=ON -DCMAKE_BUILD_TYPE="$buildMode" -DCMAKE_INSTALL_PREFIX="$installPrefix"
    cmake --build ./dependencies/spdlog --config "$buildMode" --target install
} 
else 
{
    Write-Output "Invalid build args"
}