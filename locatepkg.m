function pkgpath = locatepkg(pkgname) 
 pathdirs = strsplit(path, pathsep); 
 for iPath=1:length(pathdirs) 
   pkgpath = [pathdirs{iPath} filesep "+" pkgname]; 
   if exist(pkgpath, "dir") 
     return; 
   endif 
 endfor 
 error("package `%s' cannot be located in the path", pkgname); 
endfunction 