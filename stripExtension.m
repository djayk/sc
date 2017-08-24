function fileName = stripExtension(fileName) 
 dotIndices = strfind(fileName, "."); 
 fileName = fileName(1:(dotIndices(end)-1)); 
endfunction 