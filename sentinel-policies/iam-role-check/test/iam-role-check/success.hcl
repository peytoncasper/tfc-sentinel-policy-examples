mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-tfplan-v2-success.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}