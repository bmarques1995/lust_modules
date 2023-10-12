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
        cmake -S ./modules/eigen3 -B ./dependencies/eigen3 -DCMAKE_BUILD_TYPE=$1 -DCMAKE_INSTALL_PREFIX=$2
        cmake --build ./dependencies/eigen3 --target install
    fi
fi