library(getPass)

# Define RODBC connection to ORACLE
get.connected <- function(schema = "AFSCP1", username, password) { #BF changed from AFSC to AFSCP1 - that's how it's set up on my computer
  (echo <- FALSE)
  if (!hasArg(username)) {
    username <- getPass(msg = "Enter your ORACLE Username: ")
  }
  if (!hasArg(password)) {
    password <- getPass(msg = "Enter your ORACLE Password: ")
  }
  channel <- RODBC::odbcConnect(paste(schema), paste(username), paste(password), believeNRows = FALSE)
}

# Execute the connection
suppressWarnings(channel <- get.connected())


while (channel == -1) {
  cat("Unable to connect. Username or password may be incorrect. Please re-enter.\n\n")
  suppressWarnings(channel <- get.connected())
}

if (class(channel) == "RODBC") {
  cat("Successfully connected to Oracle!\n\n")
}
