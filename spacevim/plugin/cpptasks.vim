"=======================================================================================================================
" Spiros kabasakalis
" CMake Tasks and Key bindings for Windows Mingw C++ project using Spacevim Job API and custom cpprunner plugin
" Author: Spiros kabasakalis < kabasakalis at gmail.com >
" URL: https://github.com/kabasakalis 
" Copyright (c) 2018- 2019  Spiros Kabasakalis
" License: MI
" 
" These are cmake commands registered as cpprunner jobs and run asynchronously
" with the help of Spacevim cpp language specified key bindings.
" It is  assumed that a build and release folder exist at the root of
" the project and commands are ran from these folders - this is taken care by the commands themselves.
" Note that we are running cmake inside the Mingw environment of MSYS so these are actually linux shell 
" commands invoked by the sh wrapper of the MSYS installation. It is assumed that 
" [MSYS installation folder]\usr\bin and  [MSYS installation folder]\\mingw64\bin are 
" included in Windows PATH. You can also execute these commands directly from the Mingw environment. 
"=======================================================================================================================

" Adjust these according to your project configuration 
let g:build_debug_folder = "build"
let g:build_release_folder = "build_release"
let g:executable_name_debug = "sfml_project" "see CMakeLists.txt
let g:executable_name_release = "sfml_project" "see CMakeLists.txt

let g:cmd = "cmd /c " "windows command

" CMake configure commands
let g:configure_debug_command = "cd ". g:build_debug_folder . " && sh ../tasks/cmake_config_debug.sh "
let g:configure_release_command = "cd " . g:build_release_folder . " && sh ../tasks/cmake_config_release.sh "

" CMake build build commands
let g:build_debug_command = "cd " . g:build_debug_folder . " && sh ../tasks/cmake_build.sh "
let g:build_release_command = "cd " . g:build_release_folder . " && sh ../tasks/cmake_build.sh "

" Run executable commands
let g:run_release_command = "cd " . g:build_release_folder . " && ". g:executable_name_release
let g:run_debug_command = "cd " . g:build_debug_folder . " && ". g:executable_name_debug

" CMake Build and run commands (debug and release)
let g:build_run_debug_command =  g:build_debug_command . "&&" . g:executable_name_debug
let g:build_run_release_command =  g:build_release_command . "&&" . g:executable_name_release



function! s:language_specified_mappings() abort

  " CMake Configure Spacevim C++ language specific mappings
  let g:_spacevim_mappings_space.l.c = {'name' : '+Configure'}
  call SpaceVim#mapping#space#langSPC('nmap', ['l','c', 'd'], 
       \ 'call plugin#cpprunner#open("configure_debug_command")', 'Configure debug', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['l','c', 'r'], 
       \ 'call plugin#cpprunner#open("configure_release_command")', 'Configure release', 1)


  " CMake Build Spacevim C++ language specific mappings
  let g:_spacevim_mappings_space.l.b = {'name' : '+Build'}
  call SpaceVim#mapping#space#langSPC('nmap', ['l','b', 'd'], 
       \ 'call plugin#cpprunner#open("build_debug_command")', 'Build debug', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['l','b', 'r'], 
       \ 'call plugin#cpprunner#open("build_release_command")', 'Build release', 1)


  " Execute Spacevim C++ language specific mappings
  let g:_spacevim_mappings_space.l.e = {'name' : '+Execute'}
  call SpaceVim#mapping#space#langSPC('nmap', ['l','e', 'd'], 
       \ 'call plugin#cpprunner#open("run_debug_command")', 'Execute debug', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['l','e', 'r'], 
       \ 'call plugin#cpprunner#open("run_release_command")', 'Execute release', 1)

  " Build And Run Spacevim C++ language specific mappings
  let g:_spacevim_mappings_space.l.l = {'name' : '+Launch(Build & Run)'}
  call SpaceVim#mapping#space#langSPC('nmap', ['l','l', 'd'], 
       \ 'call plugin#cpprunner#open("build_run_debug_command")', 'Build and Run debug', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['l','l', 'r'], 
       \ 'call plugin#cpprunner#open("build_run_release_command")', 'Build and Run release', 1)

endfunction

" Register cmake configure jobs
call plugin#cpprunner#reg_runner('configure_debug_command',g:cmd . g:configure_debug_command )
call plugin#cpprunner#reg_runner('configure_release_command',g:cmd . g:configure_release_command )

" Register cmake build jobs
call plugin#cpprunner#reg_runner('build_debug_command',g:cmd . g:build_debug_command )
call plugin#cpprunner#reg_runner('build_release_command',g:cmd . g:build_release_command )

" Register run jobs (debug, release)
call plugin#cpprunner#reg_runner('run_debug_command',g:cmd . g:run_debug_command )
call plugin#cpprunner#reg_runner('run_release_command',g:cmd . g:run_release_command )

" Register cmake build and run jobs (debug, release)
call plugin#cpprunner#reg_runner('build_run_debug_command',g:cmd . g:build_run_debug_command )
call plugin#cpprunner#reg_runner('build_run_release_command',g:cmd . g:build_run_release_command )

" Apply mappings
call SpaceVim#mapping#space#regesit_lang_mappings('cpp', function('s:language_specified_mappings'))
