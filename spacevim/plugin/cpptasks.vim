let g:build_debug_folder = "build"
let g:build_release_folder = "build_release"
let g:executable_name_debug = "sfml_project"
let g:executable_name_release = "sfml_project"


let g:run_release_command = "cmd /c cd " . g:build_release_folder . " && ". g:executable_name_release
let g:run_debug_command = "cmd /c cd " . g:build_debug_folder . " && ". g:executable_name_debug

let g:configure_debug_command = "cmd /c cd ". g:build_debug_folder . " && sh ../tasks/cmake_config_debug.sh"
let g:configure_release_command = "cmd /c cd " . g:build_release_folder . " && sh ../tasks/cmake_config_release.sh"

let g:build_debug_command = "cmd c/ cd " . g:build_debug_folder . " && sh ../tasks/cmake_build.sh"
let g:build_release_command = "cmd c/ cd " . g:build_release_folder . " && sh ../tasks/cmake_build.sh"


let g:build_debug_command = "cmd c/ cd " . g:build_debug_folder . " && sh ../tasks/cmake_build.sh"




function! s:language_specified_mappings() abort
  
  call SpaceVim#mapping#space#langSPC('nmap', ['l', 'o'], 'call plugin#cpprunner#open("build1")', 'execute build', 1)
 call SpaceVim#mapping#space#langSPC('nmap', ['l', 'w'], 'call plugin#cpprunner#open("build1")', 'executeWEOO', 1)

  let g:_spacevim_mappings_space.l.b = {'name' : '+Build'}

  call SpaceVim#mapping#space#langSPC('nmap', ['l','b', 'd'], 
       \ 'call plugin#cpprunner#open("build_debug_command")', 'Build debug', 1)

  call SpaceVim#mapping#space#langSPC('nmap', ['l','b', 'r'], 
       \ 'call plugin#cpprunner#open("build_release_command")', 'Build release', 1)




  let g:_spacevim_mappings_space.l.c = {'name' : '+Configure'}

  call SpaceVim#mapping#space#langSPC('nmap', ['l','c', 'd'], 
       \ 'call plugin#cpprunner#open("configure_debug_command")', 'Configure debug', 1)

  call SpaceVim#mapping#space#langSPC('nmap', ['l','c', 'r'], 
       \ 'call plugin#cpprunner#open("configure_release_command")', 'Configure release', 1)




let g:_spacevim_mappings_space.l.r = {'name' : '+Run'}

call SpaceVim#mapping#space#langSPC('nmap', ['l','r', 'd'], 
       \ 'call plugin#cpprunner#open("run_debug_command")', 'Run debug', 1)

  call SpaceVim#mapping#space#langSPC('nmap', ['l','r', 'r'], 
       \ 'call plugin#cpprunner#open("run_release_command")', 'Run release', 1)



endfunction



call plugin#cpprunner#reg_runner('build_debug_command',g:build_debug_command )
call plugin#cpprunner#reg_runner('build_release_command',g:build_release_command )


call plugin#cpprunner#reg_runner('configure_debug_command',g:configure_debug_command )
" call plugin#cpprunner#reg_runner('configure_debug_command', 'cmd /c  echo foo & echo bar' )
call plugin#cpprunner#reg_runner('configure_release_command',g:configure_release_command )

call plugin#cpprunner#reg_runner('run_debug_command',g:run_debug_command )
call plugin#cpprunner#reg_runner('run_release_command',g:run_release_command )



call plugin#cpprunner#reg_runner('build1', 'cmake --build .')

call SpaceVim#mapping#space#regesit_lang_mappings('cpp', function('s:language_specified_mappings'))



