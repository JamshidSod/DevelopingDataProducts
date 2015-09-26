

getCharsVector  <- function(str){
  vec = NULL;  
  num = nchar(str);
  for (i in 1:num){
    vec[i] = substr(str, i, i);
  }
  return (vec);
}

#just change space to ' ' for label display
adjustCharsVec <- function(charsVec){
  for (i in 1: length(charsVec)){
    if (charsVec[i] == ' '){
      charsVec[i] = '<space>';
      break;
    }
  }
  return (charsVec);
} 

getCountsAndPropsTable <- function(string){
  charsVec = getCharsVector(string);
  last = 10 + 1;
  
  countsTable = sort(table(charsVec), decreasing=T);
  propTable = countsTable / sum(countsTable);
  charsVec = names(countsTable);
  charsVec = adjustCharsVec(charsVec = charsVec);
  
  if (length(charsVec) >= last){
    charsVec = charsVec[1:last];
    charsVec[last] = "others";
    
    size = length(countsTable);
    
    countsTable[last] = sum(countsTable[last:size])
    countsTable = countsTable[1:last];
    propTable[last] = sum(propTable[last:size]);
    propTable = propTable[1:last];
    
    names(countsTable) = names(propTable) = charsVec;
  }
  
  tables = list();
  tables$countsTable = countsTable;
  tables$propTable = propTable;
  return (tables);
}


