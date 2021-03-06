context("use_dependency")

test_that("messages only when changing", {
  tmp <- tempfile()
  expect_output(create_package(tmp, rstudio = FALSE))

  expect_output(
    use_dependency("crayon", "Imports", base_path = tmp),
    "Adding 'crayon' to Imports field"
  )

  expect_output(
    use_dependency("crayon", "Imports", base_path = tmp),
    NA
  )
})

test_that("or when changing the version", {
  tmp <- tempfile()
  expect_output({
    create_package(tmp, rstudio = FALSE)
    use_dependency("crayon", "Imports", base_path = tmp)
  })

  expect_output(
    use_dependency("crayon", "Imports", "> 1.0", base_path = tmp),
    "Setting 'crayon'"
  )

  expect_output(
    use_dependency("crayon", "Imports", "> 1.0", base_path = tmp),
    NA
  )

})
