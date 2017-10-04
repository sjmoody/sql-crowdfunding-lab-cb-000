# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
# Join projects table with pledges table.  project_id = projects.id.  SORT by projects.name
"SELECT projects.title, SUM(pledges.amount) FROM projects
JOIN pledges ON pledges.project_id = projects.id
GROUP BY projects.title"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
# Tables: user(name, age) pledge(amount) SORT BY user.name
# Expect (username, age, pledge.amount) = Albus, 113, 470
#userid 15 = pledge19($20) and pledge30 (450)
#But I'm only returning the last one?
# SO I need to sum pledge amounts
"SELECT users.name, users.age, SUM(pledges.amount) FROM users
LEFT JOIN pledges ON pledges.user_id = users.id
GROUP BY users.name
ORDER BY users.name"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  #Select projec titles and amount over goal where amount > goal
  #Issue 1: sum of amounts not right.
  #MyBookonSQL should return 20
  #next Inna-Gadda-Davida should return 342 probably
  # Issue 2: getting formula for sum of funding_goal and amount
  # Issue 3: sorting by formula

  "SELECT projects.title, (SUM(pledges.amount)  - projects.funding_goal) as amount_over_goal
  FROM projects
    JOIN pledges ON pledges.project_id = projects.id
    GROUP BY projects.title
      HAVING amount_over_goal >= 0"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
  "SELECT
	users.name,
	SUM(pledges.amount ) as total_pledges
FROM
	users
JOIN
	pledges ON pledges.user_id = users.id
GROUP BY
	pledges.user_id
ORDER BY
	total_pledges ASC,
	users.name ASC;"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT
  	projects.category, pledges.amount
  FROM
  	projects
  JOIN
  	pledges ON pledges.project_id = projects.id
  WHERE
  		projects.category = 'music'"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
"SELECT
  	projects.category, SUM(pledges.amount)
  FROM
  	projects
  JOIN
  	pledges ON pledges.project_id = projects.id
  WHERE
  		projects.category = 'books'"
end
