check_date <- function(date) {
	D <- try(as.Date(date), silent = TRUE)
	if(class(D) == "try-error" || is.na(D)) FALSE else TRUE
}

