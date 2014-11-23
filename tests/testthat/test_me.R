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
test_that("Toronto Maple Leaves had a game on 2014-11-02", {
	expect_false(gday(team = "maple leaves",   date = "2014-11-20"))
})

# Checking date that a team did play
test_that("Toronto Maple Leaves had a game on 2014-11-22", {
	expect_true(gday(team = "maple leaves",   date = "2014-11-22"))
})

# Check for INVALID date
test_that("Nashville Predators cannot play on invalid dates", {
	expect_false(gday(team = "predators", date = "20144-11-22"))
	expect_false(gday(team = "predators", date = "2014-1113-22"))
	expect_false(gday(team = "predators", date = "hello"))
})

# Check score is of output data.frame
test_that("score returns a data.frame", {
	expect_is(score(Sys.Date()), class = "data.frame")
})

# Check for INVALID date
test_that("The date is of an invalid type.", {
	expect_false(score(date = "20144-11-22"))
	expect_false(score(date = "2014-111-22"))
	expect_false(score(date = "hello"))
})



