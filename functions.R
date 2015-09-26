
# get a vector individual characters
getCharsVector  <- function(str){
  vec = NULL;  
  num = nchar(str);
  for (i in 1:num){
    vec[i] = substr(str, i, i);
  }
  return (vec);
}

#just change space to <space> for label display on the webpage 
adjustCharsVec <- function(charsVec){
  for (i in 1: length(charsVec)){
    if (charsVec[i] == ' '){
      charsVec[i] = '<space>';
      break;
    }
  }
  return (charsVec);
} 

# the main function used to create the two tables
# one about character frequencies and the other about their proportions 
getCountsAndPropsTable <- function(string){
  charsVec = getCharsVector(string);
 # last = 10 + 1;
  
  countsTable = sort(table(charsVec), decreasing=T);
  propTable = countsTable / sum(countsTable);
  
  charsVec = names(countsTable);
  charsVec = adjustCharsVec(charsVec = charsVec);
  names(countsTable) = names(propTable) = charsVec;
  
  tables = list();
  tables$countsTable = countsTable;
  tables$propTable = propTable;
  return (tables);
}


