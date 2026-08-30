# Build the path to one year of education data.
education_path <- function(year) {
  glue("data/tidy/education_{year}.csv") |> here()
}

# Undo that naming: pull the year back out of a path, as text.
# basename() first, or parse_number() finds a number in the folder names.
year_from_path <- function(path) {
  basename(path) |>
    parse_number() |>
    as.character()
}

# Read any number of years, and put the year back on as a column.
read_education <- function(year) {
  files <- education_path(year)
  education_raw <- read_csv(files, id = "path")

  education_raw |>
    mutate(year = year_from_path(path)) |>
    select(-path)
}
