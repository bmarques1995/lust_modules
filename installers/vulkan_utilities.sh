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
        cmake -S ./modules/vulkan_utilities -B ./lin_deps/vulkan_utilities -DUPDATE_DEPS=ON -DCMAKE_BUILD_TYPE="$1" -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_INSTALL_PREFIX=$2
        cmake --build ./lin_deps/vulkan_utilities --target install
    fi
fi