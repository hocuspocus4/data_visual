library(tidyverse)
wholesale <- read_csv(
  file = if (file.exists("Wholesale_customers_data.csv")) {
    "Wholesale_customers_data.csv"
  } else {
    "Lecture 1 - dplyr/data/Wholesale_customers_data.csv"
  },
  show_col_types = FALSE
)

wholesale

wholesale |>
  glimpse(width = 70)

library(skimr)
skim(wholesale)

# Without pipe
summarize(group_by(wholesale, Channel), mean_fresh = mean(Fresh))

wholesale |>
  group_by(Channel) |>
  summarise(count = n())

# With pipe (much more readable!)
wholesale |>
  group_by(Channel) |>
  summarize(mean_fresh = mean(Fresh))

# Without pipe: filter(wholesale, Channel == "Retail")

filter(wholesale, Channel == "Retail")

wholesale |>
  filter(Channel == "Retail")

# AND: both conditions must be true
print(n=48,wholesale |>
  filter(Channel == "Retail", Fresh > 10000))


# OR: at least one condition must be true
# Without pipe: filter(wholesale,
#                             Channel == "Retail" | Fresh > 50000)
wholesale |>
  filter(Channel == "Retail" | Fresh > 50000)

wholesale |>
  filter(Fresh + Milk + Grocery + Frozen > 20000) |>
  select(Fresh, Milk, Grocery)

wholesale |> select(starts_with("De"))

wholesale |> select(-Region)

wholesale |>
  arrange(desc(Grocery)) |>
  select(Channel, Region, Grocery, Milk, Detergents_Paper)

wholesale <- wholesale |>
  mutate(
    total_spend = Fresh +
      Milk +
      Grocery +
      Frozen +
      Detergents_Paper +
      Delicassen
  )

wholesale
#1.
wholesale |>
  mutate(
    share_fresh = Fresh / total_spend,
    share_grocery = Grocery / total_spend
  ) |>filter(share_grocery>0.3)|>
  arrange(desc(total_spend))|>
  select(Channel,total_spend)

 
wholesale |>
  summarise(
    n = n(),
    avg_total = mean(total_spend),
    med_total = median(total_spend),
    .by = Channel
  )
 
wholesale

#2.
wholesale|>
  summarise(n=n(),
            avg_fresh=mean(Fresh),
            median_fresh=median(Fresh),
            std_dev_fresh=sd(Fresh),
            cov=sd(Fresh)/mean(Fresh),
            .by=Channel
)

wholesale|>group_by(Region)|>
            slice_max(order_by=Milk,n=5)|>ungroup()

wholesale |> mutate(
    high_spender = total_spend > median(total_spend, na.rm = TRUE)) |>
  count(Channel, high_spender)


                    

