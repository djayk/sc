function nc_varput(FILE,VARNAME,DATA)
    % this replaces the mex version, and checks to ssee that written size does not change
    
    FILEINFO=ncinfo(FILE,VARNAME);
    WRSIZE=size(Rdim(DATA));

    if ~isequal(WRSIZE,FILEINFO.Size);   %wrong size
      WRSIZE=size(embed(Rdim(DATA)));    %try embed on tail
    else                                 
      ncwrite(FILE,VARNAME,Rdim(DATA));
      disp('wrote option 3')
      % check if size changed
      FINF=ncinfo(FILE,VARNAME);
      if ~isequal(FINF.Size,FILEINFO.Size);
         error('write file changed varsize 1')
      end
    end
    
     if ~isequal(WRSIZE,FILEINFO.Size);   %wrong size
      WRSIZE=size(Rdim(embed(DATA)));    %try embed on inside
    else                                 
      ncwrite(FILE,VARNAME,embed(Rdim(DATA)));
      disp('wrote option 2')
      % check if size changed
      FINF=ncinfo(FILE,VARNAME);
      if ~isequal(FINF.Size,FILEINFO.Size);
         error('write file changed varsize 2')
      end
    end
     
    if (isequal(WRSIZE,FILEINFO.Size) || isequal(WRSIZE,FILEINFO.Size(1:end-1)) );   %right size
      ncwrite(FILE,VARNAME,Rdim(embed(DATA)));
     % disp('wrote option 1')
      % check if size changed
      FINF=ncinfo(FILE,VARNAME);
      if ~isequal(FINF.Size,FILEINFO.Size);
         error('write file changed varsize 3')
      end
    else
      error('no correct data-var dimension')
    end
    
    

  