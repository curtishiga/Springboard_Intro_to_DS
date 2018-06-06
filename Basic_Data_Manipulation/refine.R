library("dplyr")
library("tidyr")

# Clean up brand names
company_clean <- refine_original %>% select(company) %>% 
  mutate(
    company_name = case_when(
      startsWith(tolower(company),"p") ~ "phillips",
      startsWith(tolower(company),"a") ~ "akzo",
      startsWith(tolower(company),"v") ~ "van houten",
      startsWith(tolower(company),"u") ~ "unilever",
      startsWith(tolower(company),"f") ~ "phillips"
    )
  )

# Separate product code and number
product_info <- refine_original %>% separate('Product code / number',
                                             c("product_code","product_number"),
                                             sep="-")

# Add product categories
product_category <- product_info %>% select(product_code) %>%
    mutate(
      product_cat = case_when(
        product_code == "p" ~ "Smartphone",
        product_code == "v" ~ "TV",
        product_code == "x" ~ "Laptop",
        product_code == "q" ~ "Tablet"
      )
    )

# Add full addresses for geocoding
addresses <- refine_original %>% unite("full_address", address, city, country,sep=",")

# Create dummy variables for company and product category

company_phillips <- as.numeric(company_clean$company_name == "phillips")
company_akzo <- as.numeric(company_clean$company_name == "akzo")
company_van_houten <- as.numeric(company_clean$company_name == "van houten")
company_unilever <- as.numeric(company_clean$company_name == "unilever")

product_smartphone <- as.numeric(product_category$product_cat == "Smartphone")
product_tv <- as.numeric(product_category$product_cat == "TV")
product_laptop <- as.numeric(product_category$product_cat == "Laptop")
product_tablet <- as.numeric(product_category$product_cat == "Tablet")

# New data frame
refine_clean <- data_frame("Company" = company_clean$company_name,
                           "product_code" = product_info$product_code,
                           "product_number" = product_info$product_number,
                           "product_category" = product_category$product_cat,
                           "full_address" = addresses$full_address,
                           company_phillips,
                           company_akzo,
                           company_van_houten,
                           company_unilever,
                           product_smartphone,
                           product_tv,
                           product_laptop,
                           product_tablet)

write.csv(refine_clean,file = "refine_clean.csv")