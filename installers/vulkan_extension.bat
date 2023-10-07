IF %~1 EQU Debug ( GOTO:passed )
IF %~1 EQU Release ( GOTO:passed )
goto:eof

:passed
IF STR(%~2) NEQ STR() ( GOTO:passed_install )
goto:eof

:passed_install
cmake -S ./modules/vulkan_extension -B ./dependencies/vulkan_extension -DCMAKE_BUILD_TYPE="%~1" -DCMAKE_INSTALL_PREFIX=%~2
cmake --build ./dependencies/vulkan_extension --config %~1 --target install