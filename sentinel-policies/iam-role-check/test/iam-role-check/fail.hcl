mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-tfplan-v2-fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}