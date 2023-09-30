cmake -S ./modules/spdlog -B ./dependencies/spdlog -DSPDLOG_BUILD_SHARED=ON -DCMAKE_INSTALL_PREFIX=%~1
cmake --build ./dependencies/spdlog --config %~1 --target install