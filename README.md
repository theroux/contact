### Contactually Lite

At its core, Contactually is an online database for your contacts. Your task
is to build a very basic web interface for this database that accepts file
uploads, stores the data in a relational database, and displays the information
back to the user. This is an un-timed exercise.


##### Requirements

- Built in Ruby on Rails.
- Allow a user to upload a tab-delimited file of contacts via a web form. The
  file will contain the following columns: `first_name`, `last_name`, `email_address`,
  `phone_number`, `company_name`. There's an example file included (data.tsv).
- Parse the given file, normalize the data, and store the information in a
  relational database.
- Display the list of contacts and their data.
- Accompanying specs written in [Rspec](https://github.com/rspec/rspec-core)
- Allow deleting specific contacts via Ajax.
- Allow the list of contacts to be filtered via Javascript to show:
  - Only contacts with international numbers
  - Only contacts numbers with an extension
  - Only contacts with `.com` email addresses
  - Order the contacts alphabetically by email address
- Deploy your app to a free instance of [Heroku](https://www.heroku.com/pricing) and email us the link

Use of gems and jQuery is allowed, but no pre-built table-sorting libraries please.

##### Submission Instructions

- Break up your work into separate/logical commits.
- You can use as many branches as you need in order to organize your work, but you must
  make sure your completed code is on the `master` branch before bundling up your work.
- Your code should be clear and well-documented.

When you're done, use `git bundle` to bundle up the repo and email it as an attachment
to 
**NOTE:**
Your application *does not* need to handle authentication or authorization.
