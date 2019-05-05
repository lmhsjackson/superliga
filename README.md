<a href="https://codeclimate.com/github/thisisnotanorganization/superliga/maintainability"><img src="https://api.codeclimate.com/v1/badges/8b424e1ddbb7e03eb32e/maintainability" /></a>
<a href="https://codeclimate.com/github/thisisnotanorganization/superliga/test_coverage"><img src="https://api.codeclimate.com/v1/badges/8b424e1ddbb7e03eb32e/test_coverage" /></a>
[![Build Status](https://travis-ci.org/thisisnotanorganization/superliga.svg?branch=master)](https://travis-ci.org/thisisnotanorganization/superliga)
# Superliga

Superliga (spanish for superleague) it's an app to easily manage the   [Go](https://en.wikipedia.org/wiki/Go_(game)) monthly leagues, of the [Argentinian Go Association<F6>](http://aago.org.ar/)
It is also intended as an opensource project anyone can contribute to.

Why is it cool?
  - The code is simple and readable.
  - It was designed with coding quality standards and mantainability in mind.
  - It uses tools like Simplecov, Travis, Codeclimate and Rubocop.
  - It is deployed on AWS

Some of the features for the first mvp are:

* Enter a match result ✔
* See the league table ✔
* CRUD of matches/players/leagues ✔
* Upload game records (kifus).
* Login/logout
* Admin capabilities.

Things on the wishlist are:

* Player profile: pics, statistics, rank history graph.
* Filtered match search (multiple filters)
* View records on embedded board (gokibitz or similar)

This app may evolve into a separate frontend in a js framework in the future, but for now will be a monolithic app.
