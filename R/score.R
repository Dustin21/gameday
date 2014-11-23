#' View the NHL scores for a specific day.
#'
#' This function returns the NHL scores for a particular day in a convenient data.frame.
#'
#' Your friend is certain that the Chicago Blackhawks lost the game on November 22, 2014, but you
#' are quite sure that they won considerably. Because you are working diligently on an R
#' assignment, you now can check with ease!
#'
#' @param date Specified date to check scores. Defaults to today's date
#' @return a data.frame that shows the home and away scores for all teams playing on the date specified.
#' @keywords misc
#' @note \code{date} format is \code{\%Y-\%m-\%d}, but flexible with format \code{\%Y/\%m/\%d}.
#' @export
#' @examples
#' score(Sys.Date())
#' gday("2014-11-22")
#' gday("2014/11/22")


score <- function(date = Sys.Date()) {

	assert_that(check_date(date))

	if(internet_connection()) {

		url  <- paste0('http://live.nhle.com/GameData/GCScoreboard/',
									 date, '.jsonp')
		raw <- RCurl::getURL(url)
		json <- gsub('([a-zA-Z_0-9\\.]*\\()|(\\);?$)', "", raw, perl = TRUE)
		data <- jsonlite::fromJSON(json)$games
		with(data,
				 data.frame(home = paste(htn, htcommon),
				 					 away = paste(atn, atcommon),
				 					 home_score = hts,
				 					 away_score = ats))
	}else{

		stop("You need to be connected to the internet for your NHL updates!")
	}

}

