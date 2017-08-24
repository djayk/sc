function X=nc_varget(NCFILE,VARNAME);
   % replaces matlabMEXcdf with
   X=ncread(NCFILE,VARNAME);
   X=Rdim(X);  %reverse order of dimensions to TZYX
 end