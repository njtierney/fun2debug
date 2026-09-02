## functions and argument
## - argumetns can also be called: parameters, formals
formals(hist)
# hist()
formals(plot)
# plot()
formals(lm)
# lm()

## other parts of functions:
### ... - is called "dots" or "ellipsis"
### - mostly used to extend the function in ways where you could provide many other arguments.
### - the dplyr::select() function is a good example of this.

formals(select)

select(
  .data = data,
  var1,
  var2,
  var3
)

gg_ed_2023 <- ggplot(ed_2023, aes(x = n_studying, y = age_group)) +
  geom_col()

gg_ed_2023

set.seed(2026 - 09 - 01)
hist(rnorm(10000))
set.seed(2026 - 09 - 01)
hist(rnorm(10000), breaks = "FD")

## these two are equivalent!

# but prefer no return unless returning early
my_hist2 <- function(values) {
  the_plot <- hist(values, main = "Histogram of values", breaks = "FD")
  the_plot
}

my_hist2 <- function(values) {
  the_plot <- hist(values, main = "Histogram of values", breaks = "FD")
  return(the_plot)
}

## The "best practice" rule with using `return` is:
## - only use return when returning early
## So, if you have a condition that triggers early, use return()

pct_studying <- function(data, age = "25_29") {
  data_summary <- data |>
    filter(age_group == age) |>
    summarise(
      studying = sum(n_studying),
      people = sum(population)
    ) |>
    mutate(pct = round(studying / people * 100, 1))
  data_summary
}

# best practice - name arguments
pct_studying(data = ed_2023, age = "25_29")
# caveat: you will often drop the first argument
pct_studying(ed_2023, age = "25_29")


pct_studying(age = "25_29", data = ed_2023)

# once you use a name, the "next" position will be used by the next argument
pct_studying(age = "25_29", ed_2023)

## the pipe! The pipe will always put things into the first argument position by default, otherwise, it uses `_` to specify where the object from the LHS of the
## pipe goes

ed_2023 |> pct_studying(age = "25_29")
ed_2023 |> pct_studying("25_29")

# useing the placeholder `_`
# I would not typically start a pipe with a single value
"25_29" |> pct_studying(data = ed_2023, age = _)

# with the magrittr pipe you did "." - not `_`
"25_29" %>% pct_studying(data = ed_2023, age = .)


# this is the better example of using placeholders
penguins |>
  lm(bill_dep ~ island + species, data = _)

## Also worth noting - you cannot use `_` twice in a single |> function
penguins |>
  mutate(bill = bill_dep + bill_len, nrows = nrow(_))

# technically this is doing:
penguins |>
  mutate(.data = _, bill = bill_dep + bill_len, nrows = nrow(_))


## using variable names in ggplot2
plot_study_by <- function(data, title) {
  ggplot(data, aes(x = n_studying, y = age_group)) +
    geom_col() +
    labs(
      title = title
    )
}


plot_study_by(data = tas_2023, title = "Tas.")
plot_study_by(data = ed_2023, title = "All of Australia")

plot_study_by <- function(data, title, yvar) {
  browser()
  ggplot(data, aes(x = n_studying, y = yvar)) +
    geom_col() +
    labs(title = title)
}

plot_study_by(data = ed_2023, yvar = age_group, title = "Tas.")

ggplot(ed_2023, aes(x = n_studying, y = age_group)) +
  geom_col() +
  labs(title = title)


plot_study_by <- function(data, title, yvar) {
  browser()

  quo_yvar <- rlang::enquo(yvar)

  ## {{ yvar }}
  # is equivalent to:
  # quo_yvar <- rlang::enquo(yvar)
  # !!quo_yvar
  # but just in one place

  ggplot(
    data = data,
    aes(
      x = n_studying,
      ## {{}} is a New Idea - this didn't exist until about 2019ish
      ## {{}} is not related to lists and [] and [[]]
      ## glue("here is some data, it has {nrow(data)} rows")
      y = !!quo_yvar
    )
  ) +
    geom_col() +
    labs(title = title)
}

plot_study_by(data = ed_2023, yvar = age_group, title = "Australia")
plot_study_by(data = ed_2023, yvar = state_territory, title = "Australia")


plot_study_by <- function(data, title, yvar) {
  browser()

  ggplot(
    data = data,
    aes(
      x = n_studying,
      y = {{ yvar }}
    )
  ) +
    geom_col() +
    labs(title = title)
}

plot_study_by(data = ed_2023, yvar = age_group, title = "Australia")
plot_study_by(data = ed_2023, yvar = state_territor, title = "Australia")
## Why does n_studying work? But we need to do something special with yvar
## n_studying works because it is not an argument in the function, like yvar is

aggregate(weight ~ feed, data = chickwts, mean)

## with dplyr
ed_2023 |>
  group_by(age_group) |>
  summarise(
    t_study = sum(n_studying),
    t_pop = sum(population)
  ) |>
  # compute_column = mutate
  mutate(
    prop_study = t_study / t_pop
  )

ed_2023 |>
  group_by(state_territory) |>
  summarise(
    t_study = sum(n_studying),
    t_pop = sum(population)
  ) |>
  # compute_column = mutate
  mutate(
    prop_study = t_study / t_pop
  )

prop_study <- function(data, grouping) {
  data |>
    group_by(grouping) |>
    summarise(
      t_study = sum(n_studying),
      t_pop = sum(population)
    ) |>
    # compute_column = mutate
    mutate(
      prop_study = t_study / t_pop
    )
}

# error!
prop_study(ed_2023, state_territory)

## Curly-curly to the rescue!
prop_study <- function(data, grouping) {
  data |>
    group_by(
      {{ grouping }}
    ) |>
    summarise(
      t_study = sum(n_studying),
      t_pop = sum(population)
    ) |>
    # compute_column = mutate
    mutate(
      prop_study = t_study / t_pop
    )
}

prop_study(ed_2023, age_group)
prop_study(ed_2023, state_territory)

## When do I look for  using {{}} ?
## When you are:
## using a function
## referring to a variable "bare" or without it's data
## so not as: data$variable
## but as only: variable

## Final Your turn:
library(dplyr)
library(readr)
library(ggplot2)
library(glue)
library(here)

education <- read_education(2014:2023)
ed_2023 <- education |> filter(year)
tas_2023 <- education |> filter(year == 2023, state_territory == "Tas.")

plot_study_by <- function(data, y) {
  ggplot(data, aes(x = n_studying, y = {{ y }})) +
    geom_col(fill = "#1B9E77") +
    ## a mistake!
    # scale_x_continuous(labels = scales::percent) +
    ## use scales::label_number
    scale_x_continuous(
      labels = label_number(scale = 1000, big.mark = ","),
      expand = expansion(mult = c(0, 0.05))
    ) +
    labs(x = "# Studying", y = NULL) +
    theme_minimal(base_size = 12) +
    theme_sub_panel(grid.major.y = element_blank())
}

# 1. Use plot_study_by() on the ACT in 2023, broken down by age_group.
## get some ACT data
unique(ed_2023$state_territory)
act_2023 <- ed_2023 |>
  filter(state_territory == "ACT")

act_2023

plot_study_by(data = act_2023, y = age_group)

# 2. Write median_by() yourself, on the same shape as mean_by(), and use it to get the median by age_group.
mean_median_by <- function(data, grouping) {
  data |>
    group_by({{ grouping }}) |>
    summarise(
      median_study = median(n_studying),
      mean_study = mean(n_studying)
    )
}

mean_median_by(ed_2023, age_group)
mean_median_by(ed_2023, state_territory)

# 3. Give plot_study_by() a default for y, so that plot_study_by(tas_2023) works with no second argument.

plot_study_by <- function(data, y = state_territory) {
  ggplot(data, aes(x = n_studying, y = {{ y }})) +
    geom_col(fill = "#1B9E77") +
    ## a mistake!
    # scale_x_continuous(labels = scales::percent) +
    ## use scales::label_number
    scale_x_continuous(
      labels = label_number(scale = 1000, big.mark = ","),
      expand = expansion(mult = c(0, 0.05))
    ) +
    labs(x = "# Studying", y = NULL) +
    theme_minimal(base_size = 12) +
    theme_sub_panel(grid.major.y = element_blank())
}

## Question is: How do I get the character name of yvar out
## e.g., if I want to use "age_group" and do some text transformation on it

str_replace(string = "age_group", pattern = "_", replacement = " ") |>
  str_to_title()

var_to_title <- function(variable) {
  str_replace(string = variable, pattern = "_", replacement = " ") |>
    str_to_title()
}

var_to_title("age_group")
var_to_title("state_territory")

plot_study_by <- function(data, y) {
  # capture y as a string
  y_string <- deparse(substitute(y))
  ggplot(data, aes(x = n_studying, y = {{ y }})) +
    geom_col(fill = "#1B9E77") +
    ## a mistake!
    # scale_x_continuous(labels = scales::percent) +
    ## use scales::label_number
    scale_x_continuous(
      labels = label_number(scale = 1000, big.mark = ","),
      expand = expansion(mult = c(0, 0.05))
    ) +
    labs(x = "# Studying", y = var_to_title(y_string)) +
    theme_minimal(base_size = 12) +
    theme_sub_panel(grid.major.y = element_blank())
}

plot_study_by(data = ed_2023, y = state_territory)

## [[]] and [] and lists
