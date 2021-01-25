
get_playerList <- function(){
  playerList <- firebase_download(path='players')
  return(playerList)
} # Get Player list

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
} # Function to add player to the playerList

update_playerList <- function(playerList){
  firebase_save(path="players", playerList)
} # Save player list


