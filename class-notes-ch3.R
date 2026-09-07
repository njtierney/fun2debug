library(tidyverse)
# Goal: Read in data, filter it to a given state, and plot the change in education over time
# 1. Read in data
# Reading in: inputs, outputs?
source("R/plot_education_time.R")
source("R/read_education2.R")
source("R/tidy_education.R")
education_raw <- read_education2(years = 2014:2023)

education_tidy <- tidy_education(education_raw)
# 2. Filter to a given state

education_tas <- education_tidy |> filter(state == "Tasmania")

# 3. Plot the change in education over time

plot_education_time(education_tas)

ggplot(education_tas, aes(x = year, y = n_studying)) +
  geom_line()

# Filtering in: inputs, outputs?
# Plotting: What of, which variables over time?
# Can I sketch out a plot by hand?

# which state has the biggest gap in education numbers between the youngest and the oldest age groups? Is that gap closing over time?

# Write out the steps you need to take to answer this question.

# Read in education data
education <- read_education(2014:2023)
# tidy it up
# already tidy?
# filter down to just the youngest and eldest for each state
# education_young_old <- filter_young_old(education)
education_young_old <- education |>
  group_by(state_territory) |>
  filter(age_group %in% c("15_19", "55_74")) |>
  arrange(state_territory, year, age_group)

education_young_old

# || state | age_group | n_studying | ... | year ||
# || TAS   | 15_19     |
# || TAS   | 55_74     |

# || state | age_15_19 | age_55_74 | ... | year ||

# education |>
#   mutate(age_diff = age_55_74 - age_15_19)

# calculate the difference between the age groups
# education_age_diff <- age_group_difference(education_young_old)
education_young_old |>
  filter(state_territory == "Tas.", year == 2014) |>
  # group_by(state_territory,
  #          year) |>
  mutate(
    lag_n_study = lag(n_studying),
    n_study_diff = lag_n_study - n_studying,
    diff = diff(n_studying),
    .after = n_studying
  )

education_young_old |>
  group_by(state_territory, year) |>
  mutate(
    lag_n_study = lag(n_studying),
    .after = n_studying
  )


education_young_old_wide <- education_young_old |>
  # when doing pivoting:
  ## what are my names
  ## what are my values
  pivot_wider(
    names_from = age_group,
    values_from = c(n_studying, prop_studying, population),
  ) |>
  mutate(
    age_diff = n_studying_age_15_19 - n_studying_age_55_74
  )

education_young_old_wide
# education_young_old_wide$`15_19`

### does that mean different data?
# plot the data
education_age_diff

# plot_age_groups_diff(education_age_diff)

ggplot(
  education_young_old_wide,
  aes(x = year, y = age_diff, colour = state_territory)
) +
  geom_line() +
  facet_wrap(~state_territory)

# Based on the steps, write the function pseudocode, top to bottom
# For each function, write what goes in to its arguments and what comes out.
# Do any of the functions already exist?

# The "Strict" version of "outside-in"
# how to source all the files?
list.files("R/", full.names = TRUE) |> lapply(source, echo = FALSE)

education <- read_education(2014:2023)
education_young_old <- filter_young_old(education)
education_wide <- education_pivot_wide(education_young_old)
education_age_diff <- education_add_diff(education_wide)
gg_education_diff <- plot_education_diff(education_age_diff)
gg_education_diff

# inside out:
# How many Australians are studying, by age group and by state, and is that changing?

education <- read_education(2014:2023)

young_tas <- education |>
  filter(state_territory == "Tas.", age_group == "15_19")

young_tas

ggplot(young_tas, aes(x = year, y = prop_studying)) +
  geom_line()

education_tas <- education |>
  filter(state_territory == "Tas.")

education_tas

ggplot(education_tas, aes(x = year, y = prop_studying)) +
  geom_line() +
  geom_point()

ggplot(education_tas, aes(x = year, y = prop_studying, colour = age_group)) +
  geom_line() +
  geom_point()

ggplot(education_tas, aes(x = year, y = prop_studying)) +
  geom_line() +
  geom_point() +
  facet_wrap(vars(age_group))

plot_education_state <- function(data, state) {
  filtered_data <- data |>
    filter(....)

  ggplot(filtered_data, aes(x = ...))
}
