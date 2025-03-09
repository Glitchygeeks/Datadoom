library(ggplot2)
logistic_growth <- function(r, K, N0, t) {
  N <- K / (1 + (K / N0 - 1) * exp(-r * t))
  return(N)
}
get_region_data <- function() {
  region_name <- readline("Enter region name: ")
  population <- as.numeric(readline("Enter population: "))
  area <- as.numeric(readline("Enter area: "))
  return(data.frame(Region = region_name, Population = population, Area = area))
}
create_age_pyramid <- function(){
  age_groups_str <- readline("Enter age groups separated by commas: ")
  male_pop_str <- readline("Enter male population for each age group separated by commas: ")
  female_pop_str <- readline("Enter female population for each age group separated by commas: ")
  male_literacy_str <- readline("Enter male literacy rate for each age group separated by commas: ")
  female_literacy_str <- readline("Enter female literacy rate for each age group separated by commas: ")
  age_groups <- suppressWarnings(as.numeric(strsplit(age_groups_str, ",")[[1]]))
  male_pop <- suppressWarnings(as.numeric(strsplit(male_pop_str, ",")[[1]]))
  female_pop <- suppressWarnings(as.numeric(strsplit(female_pop_str, ",")[[1]]))
  male_literacy <- suppressWarnings(as.numeric(strsplit(male_literacy_str, ",")[[1]]))
  female_literacy <- suppressWarnings(as.numeric(strsplit(female_literacy_str, ",")[[1]]))
  data <- data.frame(
    Age_Group = rep(age_groups, 2),
    Gender = rep(c("Male", "Female"), each = length(age_groups)),
    Population = c(-male_pop, female_pop),
    Literacy = c(male_literacy, female_literacy)
  )
  ggplot(data, aes(x = Age_Group, y = Population, fill = Gender, group = Gender)) +
    geom_col(position = "identity") +
    scale_x_continuous(breaks = age_groups) +
    coord_flip() +
    labs(title = "Age Pyramid", x = "Age Group", y = "Population") +
    scale_fill_manual(values = c("Male" = "blue", "Female" = "pink"))

      if (max(female_pop) > max(male_pop)) {
    print("Shape: Urn-shaped (top-heavy)")
    print("Population Status: Decreasing")
    print("you may go extinct good for your competitors but not for your gene but you have many reserve natural resources and good breathing space")
  } else if (max(female_pop) < max(male_pop)) {
    print("Shape: Bell-shaped (expanding)")
    print("Population Status: Increasing")
    print("you have plenty of human resource but shelter space maybe reduced with increasing poverty and pollution ")
  } else {
    print("Shape: Columnar (stable)")
    print("A balanced population! Keep up the good work in maintaining this equilibrium.")
   print("Population Status: Increasing")
  ggplot(data, aes(x = Age_Group, y = Literacy, color = Gender, group = Gender)) +
    geom_line() +
    geom_point() +
    labs(title = "Literacy Rate by Age and Gender", x = "Age Group", y = "Literacy Rate (%)")
}
}
main_function<- function() {
 while (TRUE) {
    user_choice <- readline("Enter 'logistic', 'agepyramid', 'density', or 'stop': ")

    if (user_choice == "logistic") {
      N0_initial <- as.numeric(readline("Enter the initial population size (N0): "))
      time_elapsed <- as.numeric(readline("Enter the time elapsed (in years): "))

      if (is.finite(time_elapsed)==TRUE) {
        deaths <- as.numeric(readline("Enter the total number of deaths: "))
        births <- as.numeric(readline("Enter the total number of births: "))
        N_final <- N0_initial + births - deaths

        r <- (log(N_final / N0_initial)) / time_elapsed

        K <- N_final * exp(r * time_elapsed)
        time <- seq(0, time_elapsed, by = 0.1) 
        population <- logistic_growth(r, K, N0_initial, time)
        plot(time, population, type = "l", xlab = "Time (years)", ylab = "Population Size", main = "Logistic Population Growth")
      } else {
        print("Invalid time")
      }
    } else if (user_choice == "agepyramid") {
      create_age_pyramid()
    } else if (user_choice == "density") {
      num_regions <- as.numeric(readline("Enter the number of regions: "))
      region_data <- data.frame()
      for (i in 1:num_regions) {
        region_data <- rbind(region_data, get_region_data())
      }
      region_data$Density <- region_data$Population / region_data$Area
      ggplot(region_data, aes(x = Region, y = Density, fill = Region)) +
        geom_bar(stat = "identity") +
        labs(title = "Population Density Distribution by Region", x = "Region", y = "Population Density") +
        theme(axis.text.x = element_text(angle = 45, hjust = 1))
        threshhold<-as.numeric(readline("enter threshhold"))
    if (sd(region_data$Density) > threshold) {
      print("Consider policies to address regional disparities in population density.")
    } else {
      print("Population density distribution appears relatively balanced.")
    }
    } else if (user_choice == "stop") {
      break
    } else {
      print("Invalid choice. Please enter 'logistic', 'agepyramid', 'density', or 'stop'.")
    }
  }

  print("Do you have any questions or suggestions? (yes/no)")
  user_input <- readline()
  if (tolower(user_input) == "yes") {
    question <- readline("What's your question or suggestion?")
    print("Thanks for your ques/suggestion! I'll try to improve response.")
  }
}

main_function()
population_status <- readline("Enter population status (increasing/decreasing): ")
if (population_status == "decreasing") {
  
  desired_action <- readline("Do you want to sustain, increase, or spread your population? ")
  if (desired_action == "sustain") {
    mode <- readline("Do you want to go good or evil mode? ")
    if (mode == "good") {
      print("improve health,hygiene,working conditions and safety measures,common laws,maintain gender ratio n literacy rate,allocate barren lands for industries & good land for dense habitation")
    } else {
      print("favour your people by resrvation,free shelter,allow polygamy,women & children work from home,increase automation to let humans grow in other aspects")
      print("promote investment to young and reduce their burden by paying old people,promote more child by govt schemes,make artificial water n food source,deform landforms for construction to reduce altitude to make favourable environment,deforest safe from wild and gain heat energy")
    }
  } else if (desired_action == "increase") {
    mode <- readline("Do you want to go good or evil mode? ")
    if (mode == "good") {
      print("promote organic nutritious food for good health and fertility not only survival,socialise people n promote easy online contact,reduce job competition,give dignity n maternity leave to women,make open-minded to accept all")
    } else {
      print("glorify love,reduce consequence of live-in relationship & marriage age,use anime to fantasize & induce repr*ductive maturity in k*ds to grow good in fertile age of teens")
    }
  } else {
    mode <- readline("Do you want to go good or evil mode? ")
        if (mode == "good") {
      print("market your culture,invest in infrastucture for tourists,promote business to attract best talents,promote citizenship by marriage(spread m add gene n values)")
    } else {
      print("allow immigration by forced conversion,compulsory education n compulsory teaching self defense")
    }
  }
} else {
  desired_action <- readline("Do you want to utilize, reduce, or sustain your population? ")
  if (desired_action == "sustain") {
    mode <- readline("Do you want to go good or evil mode? ")
    if (mode == "good") {
      print("grow wheat as can grow anywhere,anytemp,can be made hyv & pest resistant crop easily with good calories for survival,save resources using 3R's")
      print("use eco_friendly disposal of waste like composting,introduce forest & wildlife to keep population in check n replenish natural resources,promote sci-fi shows and books to encourage hustle")
    } else {
      print("conquer lands,feed GMO's,teach reproduction science to know its real cause & not exploit it,reduce pension to reduce govt costs,limit no. of child,reduce purifying water,make others selfish & individualistic,increase arms but not defense")
    }
  } else if (desired_action == "utilize") {
    mode <- readline("Do you want to go good or evil mode? ")
    if (mode == "good") {
      print("export human resources(job) for good ties,their resources and forex reserves,ggod division of labour for right talent")
    } else {
      print("run science or data experiments,introduce slavery,make immigration difficult,enhance artificial bionic humans")
    }
  } else {
    mode <- readline("Do you want to go good or evil mode? ")
    if (mode == "good") {
      print("use c*ntraceptives,invest more in education(scholarships)than healthcare,stricter & extend marriage age & boundations(genes),choose best by increasing competition,glorify being single (free life)")
      print("c**doms may not be the best but are safest with privacy and no permanent toll on health")
       print("pills can induce hormonal problems while iut's arent private while vasectomy is irreversible,to be considered")
    } else {
      print("engage in a w*r as civilians only get hurt in this,start a gen*c*de,spread a pandem*c,tolerate civil v*olence,heavy workload(mental issues),promote risky jobs,no hygiene or safety,support illegal emmigration")
    }
  }
}