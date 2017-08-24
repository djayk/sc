function X=nc_vargetRANGE(NCFILE,VARNAME,START,COUNT);
   % replaces matlabMEXcdf with alt runction that has indexing available
   
   rSTART=flipud(START(:));
   rCOUNT=flipud(COUNT(:));
 %  rSTRIDE=flipud(STRIDE(:));
   X=ncread(NCFILE,VARNAME, rSTART',rCOUNT');%,rSTRIDE);
   X=Rdim(X);  %reverse order of dimensions to TZYX
 end