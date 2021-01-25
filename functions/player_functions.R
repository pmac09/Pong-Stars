# Get Player list
get_playerList <- function(projectURL){
  playerList <- firebase_download(projectURL, path='players')
  return(playerList)
}

# Function to add player to the playerList
add_player <- function(playerList, firstName, lastName, nickname){
  
  # Count existing players
  n <- length(playerList) + 1
  
  # Create player ID
  playerID <- paste0('P', sprintf("%03d", n))
  
  
  # Add player to player List
  playerList[[playerID]] <- list(
    playerID = playerID,
    firstName = firstName,
    lastName = lastName,
    nickname = nickname
  )
  
  # Return player list
  return(playerList)
} 

# Save player list
update_playerList <- function(projectURL, playerList){
  firebase_save(projectURL, path="players", playerList)
}


