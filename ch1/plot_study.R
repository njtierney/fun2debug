# Proportion studying, broken down by whatever column you name in `y`.
plot_study_by <- function(data, y) {
  data |>
    group_by({{ y }}) |>
    summarise(
      prop_studying = sum(n_studying) / sum(population),
      .groups = "drop"
    ) |>
    ggplot(aes(x = prop_studying, y = {{ y }})) +
    geom_col(fill = "#1B9E77") +
    scale_x_continuous(labels = scales::percent) +
    labs(
      x = "Studying",
      y = NULL,
      title = "Proportion of people studying"
    ) +
    theme_minimal(base_size = 12)
}

# Proportion studying over time, for one state, one panel per age group.
plot_study_over_time <- function(data, state) {
  data |>
    filter(state_territory == state) |>
    mutate(year = as.integer(year)) |>
    ggplot(aes(x = year, y = prop_studying)) +
    geom_line(colour = "#1B9E77", linewidth = 0.8) +
    facet_wrap(~age_group) +
    scale_y_continuous(labels = scales::percent) +
    labs(
      x = NULL,
      y = "Studying",
      title = "Proportion of people studying, by age group",
      subtitle = state
    ) +
    theme_minimal(base_size = 12)
}
