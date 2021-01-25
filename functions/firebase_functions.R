
# Download data from firebase location
firebase_download <- function(projectURL, path = NULL){
  data <- suppressWarnings(download(projectURL, paste0('Pong-Stars/',path)))
  return(data)
} 

# Save data to firebase location
firebase_save <- function(projectURL, path = NULL, data){
  if(is.null(path)) return(NULL)
  put(data, projectURL, paste0('Pong-Stars/', path))
} 
