IF %~1 EQU Debug ( GOTO:passed )
IF %~1 EQU Release ( GOTO:passed )
goto:eof

:passed
IF STR(%~2) NEQ STR() ( GOTO:passed_install )
goto:eof

:passed_install
cmake -S ./modules/dxc -B ./dependencies/dxc -G Ninja -C ./modules/dxc/cmake/caches/PredefinedParams.cmake -DCMAKE_BUILD_TYPE=%~1 -DENABLE_SPIRV_CODEGEN=ON -DCMAKE_C_COMPILER=cl.exe -DCMAKE_CXX_COMPILER=cl.exe -DCMAKE_INSTALL_PREFIX=%~2
cmake --build ./dependencies/dxc --config %~1 --target install-dxc-headers
cmake --build ./dependencies/dxc --config %~1 --target install-dxc
cmake --build ./dependencies/dxc --config %~1 --target install-dxcompiler
copy %cd%\dependencies\dxc\lib\dxcompiler.lib %~2\lib