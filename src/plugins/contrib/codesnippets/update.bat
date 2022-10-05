@echo off
set CB_DEVEL_DIR=devel%1
set CB_OUTPUT_DIR=output%1
set CB_DEVEL_RESDIR=%CB_DEVEL_DIR%\share\CodeBlocks
set CB_OUTPUT_RESDIR=%CB_OUTPUT_DIR%\share\CodeBlocks
del ..\..\..\output\share\CodeBlocks\plugins\codesnippets.exe > nul 2>&1
zip -j9 ..\..\..\%CB_DEVEL_DIR%\codesnippets.zip manifest.xml > nul 2>&1
md ..\..\..\%CB_DEVEL_DIR%\images\codesnippets > nul 2>&1
copy .\resources\*.png ..\..\..\%CB_DEVEL_DIR%\images\codesnippets\ > nul 2>&1
md ..\..\..\%CB_OUTPUT_DIR%\images\codesnippets > nul 2>&1
copy .\resources\*.png ..\..\..\%CB_OUTPUT_DIR%\images\codesnippets\ > nul 2>&1
