# Build the path to one year of education data.
education_path <- function(year) {
  glue("data/tidy/education_{year}.csv") |> here()
}

# Read any number of years, and put the year back on as a column.
# basename() first, or parse_number() finds a number in the folder names.
read_education <- function(year) {
  files <- education_path(year)
  education_raw <- read_csv(files, id = "path")

  education_raw |>
    mutate(year = basename(path) |> parse_number() |> as.character()) |>
    select(-path)
}
