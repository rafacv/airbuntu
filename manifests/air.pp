node default {
  stage { first: before => Stage[main] }
  stage { last:  require => Stage[main] }

  include air::setup
  include air::install
}
