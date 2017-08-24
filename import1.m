function [names, funcs] = import1(pkgname) 
 pkgname_parts = strsplit(pkgname, "."); 
 if length(pkgname_parts) > 2 
   error("invalid package name: %s", pkgname); 
 endif 
 pkgpath = locatepkg(pkgname_parts{1}); 
 unwind_protect 
   cwd = pwd; 
   cd(pkgpath); 
   names = what(pwd); 
   names = {names.m{:}, names.mex{:}, names.oct{:}}; 
   names = cellfun(@stripExtension, names, "UniformOutput", false); 
   if length(pkgname_parts) == 2 
     if any(strcmp(pkgname_parts{2}, names)) 
       names = {pkgname_parts{2}}; 
     else 
       error("function `%s' not found in package `%s'", ... 
         pkgname_parts{2}, pkgname_parts{1}); 
     endif 
   endif 
   funcs = cellfun(@str2func, names, "UniformOutput", false); 
 unwind_protect_cleanup 
   cd(cwd); 
 end_unwind_protect 
endfunction 