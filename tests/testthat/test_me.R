# Check if case is ignored
test_that("case is ignored", {
	expect_equal(gday("canucks"), gday("CANUCKS"))
})

# Checking date that team did play
test_that("Vancouver Canucks had a game against Nashville Predators on 2014-11-02", {
	expect_true(gday(team = "canucks",   date = "2014-11-02"))
	expect_true(gday(team = "predators", date = "2014-11-02"))
})

# Checking date that a team did not play
test_that("Toronto Maple Leafs did not have a game on 2014-11-11", {
	expect_false(gday(team = "maple leafs",   date = "2014-11-11"))
})

# Checking date that a team will play
test_that("Toronto Maple Leafs have a game on 2014-10-08", {
	expect_true(gday(team = "maple leafs",   date = "2014-10-08"))
})

# Check for INVALID date
test_that("Nashville Predators cannot play on invalid dates", {
	expect_error(gday(team = "predators", date = "20144-11-22"))
	expect_error(gday(team = "predators", date = "2014-1113-22"))
	expect_error(gday(team = "predators", date = "hello"))
})

# Check score is of output data.frame
test_that("score returns a data.frame", {
	expect_is(score(Sys.Date()), class = "data.frame")
})

# Check for INVALID date
test_that("The date is of an invalid type.", {
	expect_error(score(date = "20144-11-22"))
	expect_error(score(date = "2014-111-22"))
	expect_error(score(date = "hello"))
})



