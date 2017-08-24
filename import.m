function import(varargin) 
 error(nargchk(1, inf, nargin, "struct")); 
 for i=1:nargin 
   [names, funcs] = import1(varargin{i}); 
   for j=1:length(names) 
     assignin("caller", names{j}, funcs{j}); 
   endfor 
 endfor 
endfunction 