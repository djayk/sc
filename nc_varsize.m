function S = nc_varsize(NCFILE,VARNAME);
      info=ncinfo(NCFILE,VARNAME);
      S=fliplr(info.Size);
end