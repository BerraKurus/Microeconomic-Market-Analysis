install.packages("tidyverse")
install.packages("data.table")
install.packages("arrow")
install.packages("R.utils", dependencies = TRUE)

library(tidyverse)
library(lubridate)
library(data.table)
library(arrow) 
library(R.utils)

# Creating a metadata table
cities_meta <- tribble(
  ~city,      ~currency, ~fx_rate_to_eur, ~url,
  "Paris",    "EUR",     1.00, "https://data.insideairbnb.com/france/ile-de-france/paris/2026-06-16/data/listings.csv.gz",
  "London",   "GBP",     1.17, "https://data.insideairbnb.com/united-kingdom/england/london/2026-06-19/data/listings.csv.gz", # 1 GBP ≈ 1.17 EUR
  "New York", "USD",     0.86, "https://data.insideairbnb.com/united-states/ny/new-york-city/2026-08-10/data/listings.csv.gz", # 1 USD ≈ 0.86 EUR
  "Tokyo",    "JPY",     0.0054, "https://data.insideairbnb.com/japan/kantō/tokyo/2026-06-30/data/listings.csv.gz" # 1 JPY ≈ 0.0054 EUR
)

clean_data <- function(city_name, curr, fx_rate, file_url) {
  
  # Reading into memory 
  raw_df <- fread(file_url, showProgress = FALSE, encoding = "UTF-8") %>% 
    as_tibble()
  
  # Column Filtering and Data Cleaning 
  cleaned_df <- raw_df %>%
    select(
      id, host_id, host_is_superhost, host_identity_verified,
      calculated_host_listings_count,
      neighbourhood_cleansed, latitude, longitude,
      property_type, room_type, accommodates, bedrooms, beds,
      amenities, price, minimum_nights, maximum_nights,
      availability_30, availability_365,
      number_of_reviews, last_review, reviews_per_month,
      review_scores_rating, review_scores_cleanliness, review_scores_location
    ) %>%
    
    # New columns are created in the selected table
    mutate(
      city = city_name,
      original_currency = curr,
      
      # Price Transformation to Euro
      price_local = as.numeric(str_remove_all(price, "[^0-9.]")),
      price_euro = price_local * fx_rate,
      
      # Case When's
      host_is_superhost = case_when(
        host_is_superhost == "t" ~ TRUE,
        host_is_superhost == "f" ~ FALSE,
        TRUE ~ NA
      ),
      host_identity_verified = case_when(
        host_identity_verified == "t" ~ TRUE,
        host_identity_verified == "f" ~ FALSE,
        TRUE ~ NA
      ),
      
      # Date Formatting
      last_review = ymd(last_review),
      
      # NA Handling
      reviews_per_month = replace_na(reviews_per_month, 0),
      
      # Creating new variables
      has_wifi = coalesce(str_detect(amenities, regex("wifi", ignore_case = TRUE)),FALSE),
      has_workspace = coalesce(str_detect(amenities, regex("dedicated workspace|workspace", ignore_case = TRUE)), FALSE),
      has_aircon = coalesce(str_detect(amenities, regex("air conditioning", ignore_case = TRUE)), FALSE),
      has_kitchen = coalesce(str_detect(amenities, regex("kitchen" , ignore_case = TRUE)), FALSE),
      has_free_parking = coalesce(str_detect(amenities, regex("free parking" , ignore_case = TRUE)), FALSE),
      has_luggage_dropoff = coalesce(str_detect(amenities, regex("luggage dropoff allowed" , ignore_case = TRUE)), FALSE),
      has_elevator = coalesce(str_detect(amenities, regex("elevator" , ignore_case = TRUE)), FALSE),
      has_self_check_in = coalesce(str_detect(amenities, regex("self check-in" , ignore_case = TRUE)), FALSE),
      has_refrigerator = coalesce(str_detect(amenities, regex("refrigerator" , ignore_case = TRUE)), FALSE),
      has_washer = coalesce(str_detect(amenities, regex("washer|washing machine", ignore_case = TRUE)), FALSE),
      has_dryer  = coalesce(str_detect(amenities, regex("dryer", ignore_case = TRUE)), FALSE),
      has_balcony = coalesce(str_detect(amenities, regex("balcony|patio|terrace|veranda|deck", ignore_case = TRUE)), FALSE),
      has_pool = coalesce(str_detect(amenities, regex("pool", ignore_case = TRUE)), FALSE),
      has_hottub = coalesce(str_detect(amenities, regex("hot tub|bathtub|jacuzzi|jetted tub", ignore_case = TRUE)), FALSE),
      amenities_count = if_else(is.na(amenities) | amenities == "[]", 0, str_count(amenities, ",") + 1),
      
      # Property Category
      property_category = case_when(
        str_detect(property_type, regex("apartment|condo|loft|entire rental unit", ignore_case = TRUE)) ~ "Apartment",
        str_detect(property_type, regex("house|villa|entire home|townhouse", ignore_case = TRUE)) ~ "House",
        TRUE ~ "Other"
      )
    ) %>%
    
    # Cleaning
    filter(
      !is.na(price_euro),
      price_euro >= 10,
      price_euro <= quantile(price_euro, 0.99, na.rm = TRUE), # %99 Percentile Method to eliminate outliers
      minimum_nights <= 30,
      !is.na(latitude),
      !is.na(longitude)
    ) %>%
    
    select(-amenities, -property_type, -price, -price_local)
  
  return(cleaned_df)
}

airbnb_data <- pmap_dfr(
  list(
    cities_meta$city,
    cities_meta$currency,
    cities_meta$fx_rate_to_eur,
    cities_meta$url
  ),
  clean_data
)

write_csv(airbnb_data, "airbnb_data.csv", na = "")