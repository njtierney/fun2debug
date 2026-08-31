read_education <- function(year) {
  education_path(year) |> read_csv()
}

education_path <- function(year) {
  path <- glue("data/tidy/education_{year}.csv") |> here()
  # does_file_exist <- file.exists(path)
  # if (!does_file_exist) {
  #   stop("Hey, your file doesn't exist")
  # }
}


# no function for education_path
read_education <- function(year) {
  year_path <- glue("data/tidy/education_{year}.csv") |> here()
  read_csv(year_path)
}

read_education <- function(year) {
  education_path(year) |> read_csv()
}

read_education(2005)

year <- 2012:2022
glue("a/file/path_{year}.csv")
paste0("a/file/path_", year, ".csv")

education_path(2021)
education_path(2021) |> read_csv()
education_path(2021:2022)
education_path(2021:2022) |> read_csv()

read_education <- function(year) {
  education_path(year) |>
    read_csv() |>
    mutate(year = year)
}

ed_2022 <- read_education(2022)
ed_2023 <- read_education(2023)
bind_rows(
  ed_2022,
  ed_2023
)

## an aside into bind_rows
read_education <- function(year) {
  education_path(year) |>
    read_csv()
}

ed_2022 <- read_education(2022)
ed_2023 <- read_education(2023)
bind_rows(
  ed_2022,
  ed_2023
)

bind_rows(
  "2022" = ed_2022,
  "2023" = ed_2023,
  .id = "year"
)
##

education_data_path <- education_path(2021:2022) |>
  read_csv(id = "path")

education_data_path

# goal: extract 2021 out
education_path(2021)

education_path(2021)
# basename - give me the last part of the file path - the base:
education_path(2021) |> basename()

## an aside into a nice function
# tools::file_path_sans_ext()
# remove extension from filepath, e.g.,
# "education_2021.csv" --> "education_2021"
education_path(2021) |> basename() |> tools::file_path_sans_ext()
# ----

# what we want: The year out of the this file path
education_path(2021) |> basename() |> readr::parse_number()

education_path(2014:2023) |> basename() |> readr::parse_number()

year_from_path <- function(path) {
  path |> basename() |> parse_number()
}

education_path(2014:2023) |> year_from_path()

# let's put it together

read_education <- function(year) {
  education_path(year) |>
    read_csv(id = "path")
}

education <- read_education(2014:2023)

education_with_year <- education |>
  mutate(
    year = year_from_path(path)
  )

View(education_with_year)

education_with_year <- education |>
  mutate(
    year = year_from_path(path),
    .before = path
  )

education_with_year

View(education_with_year)

# this will drop "path", as we don't need it anymore
education_with_year |>
  # just drop path, keep the others
  select(-path)

## let's put it together
read_education <- function(year) {
  education_path(year) |>
    read_csv(id = "path") |>
    mutate(
      year = year_from_path(path),
      .before = path
    ) |>
    select(-path)
}

## with intermediate objects:
read_education <- function(year) {
  files <- education_path(year)
  education_raw <- read_csv(files, id = "path")

  education_raw |>
    mutate(year = year_from_path(path)) |>
    select(-path)
}
# %>%
# "ligatures" --> font: Fira Sans
# |> = | >
# !=
# >=
seq(1, 10, by = 0.1) |> sum()
seq(1, 10, by = 0.1) %>% sum()

# under the hood
quote(seq(1, 10, by = 0.1) |> sum())
quote(seq(1, 10, by = 0.1) %>% sum())

lobstr::ast(seq(1, 10, by = 0.1) |> sum())
lobstr::ast(seq(1, 10, by = 0.1) %>% sum())

`%>%`(seq(1, 10, by = 0.1), sum)

## Perhaps a question to pick up on in the office hours

education <- read_education(2014:2023)


# an aside on vector recycling "tidyverse rules: do not recycle vectors that are not length 1, or
# length of the number of rows
# this errors
ed_2021$example_year <- 1:2
ed_2021

# however, if we make this a data.frame()
df_2021 <- as.data.frame(ed_2021)

head(df_2021)
dim(df_2021)

df_2021$example_year <- 1:2
head(df_2021)

df_2021$example_year <- 1:71
head(df_2021)
# this is a "footgun"
df_2021$example_year <- 1:9
head(df_2021)
tail(df_2021)
