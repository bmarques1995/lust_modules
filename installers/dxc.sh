#this script is not ready, now lust only works on windows

passed=false

if [[ $1 == "Debug" ]]; then
    passed=true
fi

if [[ $1 == "Release" ]]; then
    passed=true
fi

if [ $passed ]; then
    if [ -n "$2" ]; then
        cmake -S ./modules/dxc -B ./lin_deps/dxc -G Ninja -C ./modules/dxc/cmake/caches/PredefinedParams.cmake -DCMAKE_BUILD_TYPE=$1 -DENABLE_SPIRV_CODEGEN=ON -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_INSTALL_PREFIX=$2
        cmake --build ./lin_deps/dxc --config %~1 --target install-dxc-headers
        cmake --build ./lin_deps/dxc --config %~1 --target install-dxc
        cmake --build ./lin_deps/dxc --config %~1 --target install-dxcompiler
    fi
fi
 