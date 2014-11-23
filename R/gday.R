#' Is it Gameday?
#'
#' This function returns TRUE if your NHL team plays today
#' and FALSE otherwise
#'
#' You know then problem: You're in your office writing R code and
#' suddenly have the urge to check whether your NHL team has a game today.
#' Before you know it you just wasted 15 minutes browsing the lastest
#' news on your favorite hockey webpage.
#' Suffer no more! You can now ask R directly, without tempting yourself
#' by firing up your web browser.
#'
#' @param team The team name you wish you search for. Defaults to \code{Canucks}
#' @param date Specified date to check whether the team is playing. Defaults to today's date
#' @return \code{TRUE} if \code{team} has an NHL game on \code{date},
#' \code{FALSE} otherwise
#' @keywords misc
#' @note case in \code{team} is ignored
#' @export
#' @examples
#' gday()
#' gday("canucks")
#' gday("Kings")


gday <- function(team = "canucks", date = Sys.Date()) {

	assert_that(check_date(date))

	if(internet_connection()) {

		url <- paste0("http://live.nhle.com/GameData/GCScoreboard/", date, ".jsonp")

		}else{

		stop("You need to be connected to the internet for your NHL updates!")
	}

	grepl(team, getURL(url), ignore.case=TRUE)
}
