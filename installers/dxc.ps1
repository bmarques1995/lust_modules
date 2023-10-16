param (
    [string]$buildMode = "",
    [string]$installPrefix = ""
)

if (($buildMode -eq "Debug" -or $buildMode -eq "Release") -and ($installPrefix -ne ""))
{
    cmake -S ./modules/dxc -B ./dependencies/dxc -G Ninja -C ./modules/dxc/cmake/caches/PredefinedParams.cmake -DCMAKE_BUILD_TYPE="$buildMode" -DENABLE_SPIRV_CODEGEN=ON -DCMAKE_C_COMPILER=cl.exe -DCMAKE_CXX_COMPILER=cl.exe -DCMAKE_INSTALL_PREFIX="$installPrefix"
    cmake --build ./dependencies/dxc --config "$buildMode" --target install-dxc-headers
    cmake --build ./dependencies/dxc --config "$buildMode" --target install-dxc
    cmake --build ./dependencies/dxc --config "$buildMode" --target install-dxcompiler
    $libSrc = Join-Path (Get-Location) "dependencies\dxc\lib\dxcompiler.lib"
    $libDst = Join-Path -Path $installPrefix "lib"
    Copy-Item -Path "$libSrc" -Destination "$LibDst"
} 
else 
{
    Write-Output "Invalid build args"
}