internet_connection <- function() {
	tryCatch({RCurl::getURL("www.google.com"); TRUE},
					 error = function(err) FALSE)
}
