
get_tournamentList <- function(){
  tournamentList <- firebase_download(path='tournaments')
  return(tournamentList)
}# Get tournaments list
add_tournament <- function(tournamentList, tName){
  
  # Count existing tournaments
  n <- length(tournamentList) + 1
  
  # Create tournament ID
  tournamentID <- paste0('T', sprintf("%03d", n))
  
  # Add tournament to tournaments List
  tournamentList[[tournamentID]] <- list(
    tournamentID = tournamentID,
    tournamentName = tName
  )
  
  # Save tournament list
  firebase_save(path='tournaments', tournamentList)
  
  # Return tournament list
  return(tournamentList)
} # Function to add tournament to the tournament List 
get_tournament <- function(tournamentID){
  fbPath <- paste0('tournaments/',tournamentID)
  tournament <- firebase_download(path=fbPath)
  return(tournament)
} # Get a tournament

get_tournament_player_list <- function(tournamentID){
  # Download tournament players list
  fbPath <- paste0('tournaments/',tournamentID, '/players')
  tPlayerList <- firebase_download(path=fbPath) 
  return(tPlayerList)
} # Get all players in a tournament
add_tournament_player <- function(tournamentID, playerID){
  
  # Get tournament players list
  tPlayerList <- get_tournament_player_list(tournamentID)
  
  # Add player
  tPlayerList <- unique(c(tPlayerList, playerID))
  
  # Save player list
  fbPath <- paste0('tournaments/',tournamentID, '/players')
  firebase_save(path=fbPath, tPlayerList)
  
  # Return new tournament player list
  return(tPlayerList)
} # Add new player to a tournament

get_tournament_team_list <- function(tournamentID){
  # Download tournament teams list
  fbPath <- paste0('tournaments/',tournamentID, '/teams')
  tTeamList <- firebase_download(path=fbPath) 
  return(tTeamList)
} # Get all teams in a tournament

add_tournament_team <- function(tournamentID, teamName, players){
  
  # Get tournament teams list
  tTeamList <- get_tournament_team_list(tournamentID)
  
  # Count existing players
  n <- length(tTeamList) + 1
  
  # Create player ID
  teamID <- paste0('C', sprintf("%03d", n))
  
  # Add player to player List
  tTeamList[[teamID]] <- list(
    teamID = teamID,
    teamName = teamName,
    players = players
  )
  
  # Save team list
  fbPath <- paste0('tournaments/',tournamentID, '/teams')
  firebase_save(path=fbPath, tTeamList)
  
  # Return new tournament team list
  return(tTeamList)
} # Add new team to a tournament
