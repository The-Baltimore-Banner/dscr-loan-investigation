library(vroom)
library(tidyverse)
library(lubridate)


hmda_24 <- vroom("data/raw/hmda/hmda_2024_all.csv")
hmda_23 <- vroom("data/raw/hmda/hmda_2023_all.csv")
hmda_22 <- vroom("data/raw/hmda/hmda_2022_all.csv")
hmda_21 <- vroom("data/raw/hmda/hmda_2021_all.csv")
hmda_20 <- vroom("data/raw/hmda/hmda_2020_all.csv")
hmda_19 <- vroom("data/raw/hmda/hmda_2019_all.csv")
hmda_18 <- vroom("data/raw/hmda/hmda_2018_all.csv")

# this function cleans our HMDA data and gets us to the total universe of our loans:
# First-time liens issued on just residential investment properties,
# only loans offered and accepted, and no open lines of credit.
hmda_cln <- function(df){

  unit_lst <- c(1,2,3,4)

  temp <- df %>%
    # cleans col names
    clean_names() %>%
    # selects relevant cols
    select(activity_year, lei, derived_msa_md, state_code, county_code, census_tract, lien_status, occupancy_type, action_taken, open_end_line_of_credit, debt_to_income_ratio, income, loan_amount, interest_rate, total_units, loan_term, business_or_commercial_purpose, purchaser_type, tract_minority_population_percent, tract_owner_occupied_units) %>%
    # makes msa code and year numeric
    mutate(activity_year = as.numeric(activity_year),
           derived_msa_md = as.numeric(derived_msa_md)) %>%
    filter(lien_status == 1) %>% # first lien
    filter(occupancy_type == 3) %>% # just investment properties
    filter(action_taken == 1)  %>% # only actual loans offered and accepted
    filter(open_end_line_of_credit == 2) %>% # only traditional closed lines of credit
    mutate(total_units = as.numeric(total_units)) %>% # total units as numeric
    filter(total_units %in% unit_lst) # filter only loans issued to secure between 1 and 4 dwelling units (no giant apartment buildings)

  return(temp)

}


# apply fxn
hmda_24_cln <- hmda_cln(hmda_24)
hmda_23_cln <- hmda_cln(hmda_23)
hmda_22_cln <- hmda_cln(hmda_22)
hmda_21_cln <- hmda_cln(hmda_21)
hmda_20_cln <- hmda_cln(hmda_20)
hmda_19_cln <- hmda_cln(hmda_19)
hmda_18_cln <- hmda_cln(hmda_18)

# convert income to char to bind rows
hmda_22_cln <- hmda_22_cln %>% mutate(income = as.character(income))
hmda_20_cln <- hmda_20_cln %>% mutate(income = as.character(income))
hmda_19_cln <- hmda_19_cln %>% mutate(income = as.character(income))
hmda_18_cln <- hmda_18_cln %>% mutate(income = as.character(income))

# bind rows
hmda_all <- bind_rows(hmda_18_cln, hmda_19_cln, hmda_20_cln, hmda_21_cln, hmda_22_cln, hmda_23_cln, hmda_24_cln)

write_csv(hmda_all, "data/output/hmda_18_24_cln.csv")
