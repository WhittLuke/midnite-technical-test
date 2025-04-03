# Midnite Senior Data Engineer Technical Take Home

## Challenge Goal

This technical challenge is designed to allow you to showcase your Python, SQL and general data engineering skills.

We would like you to showcase your knowledge of engineering best practices that you feel are relevant.
These could include:

- Writing high quality code (e.g. following DRY and SOLID principles etc)
- Writing appropriate unit tests (we love testing here at Midnite!!!)
- Handling common errors
- Considering edge cases
- Securely handling secrets
- Data quality testing / monitoring
- etc

If you don't have time to implement everything, that's fine. We don't expect you to spend a week on the task.
Feel free to explain what you would consider or do differently to make this a full production quality setup if you had more time in the `NOTES.md` file.
These will make great talking points during the final interview.

## Setup

**NOTE: The below instructions have only been tested on MacOS.**

1. Run `make build; make up` to start the docker containers
2. Run `make shell` and then run `cd analytics; dbt debug; cd ../; python3 run.py` to confirm everything is setup as expected

Note: If you want to reset the database, including re-loading the dummy data in the `raw` schema, then run `make reset-db`.

Feel free to adapt the `Makefile`, `Dockerfile` or any part of the code as you see fit.

## Background Information & Context

- You are working as part of the data team at Better Betting Ltd.
- Better Betting provides online betting and gambling services.... Just like Midnite.
- Better Betting currently operates in Ireland and in the UK. The company does not have a license to operate in any other country at this stage, so we should not have any users from other countries.
- Since Better Betting operates in multiple countries, it needs to do all of its reporting and analytics in USD. So any reports generated must be in USD.
- All the raw data tables are described in the `Raw Data Sources` section at the end of this file.
- There can be a delay from when a bet is placed to when it is settled. For example, a user places a bet on football on 2024-01-01, but the game doesn't finish until 2024-01-02. The bet is settled on 2024-01-02.

## Requirements

### Part 1: Data Ingestion

With the attached example `src/landed_files/bets.csv` file write a Python daemon that:
1. Monitors the `landed_files` directory for new files
2. When a new file arrives in the directory, the daemon should read the file and insert the data into the `raw.bet` table in the database

Feel free to use any libraries or packages you feel are necessary to complete this task, but be ready to justify your choices.

As mentioned in the `Challenge Goal` section above, treat this as a mini-production setup and showcase relevant engineering best practices. 

### Part 2: Data Cleaning & Modeling

In addition to the data loaded into `raw.bets` in Part 1, there are a number of pre-loaded tables in the `raw` schema.

Using the background information above and the details in `Raw Data Sources`, clean the incoming data and build an appropriately modeled layer in the `core` postgres schema.  

The models in this `core` schema will serve as the cleaned and conformed data layer of the data warehouse and will be used to generate downstream reports, marts, dashboards and other analytics.

Briefly justify why you used the data modeling paradigm that you did in the `NOTES.md`

As with part 1, make sure to showcase your wider engineering skills, data modeling, and dbt knowledge.

## Raw Source Data

All the data for this challenge is automatically loaded when you build and start the postgres docker container. The data is stored in the schema called `raw`.

The `raw` schema contains 6 tables: `users`, `user_address`, `bet`, `bet_outcome`, `game`, and `fx_rates`. 

### Tables

#### Users

| Column       | Data Type | Notes                                                             |
| ------------ | --------- | ----------------------------------------------------------------- |
| id           | int       | The unique ID of the user                                         |
| Name         | varchar   | The first name of the user                                        |
| IsTestUser   | boolean   | Set to true if the user is an internal / development test account |
| CurrencyCode | varchar   | 3-character currency code of either `EUR` or `GBP`                |
| CreatedAt    | timestamp | The datetime when the user registered / created their account     |

#### User Address

| Column       | Data Type | Notes                                                      |
| ------------ | --------- | ---------------------------------------------------------- |
| user_id      | int       | The unique ID of the user                                  |
| address      | varchar   | The street address of where the user lives                 |
| country_code | varchar   | The ISO 3166 country code of the user. Either `IE` or `GB` |

#### Bet Outcome

| Column  | Data Type | Notes                                                                |
| ------- | --------- | -------------------------------------------------------------------- |
| id      | int       | The unique ID of the bet outcome type                                |
| outcome | varchar   | The name of the bet outcome type. Either `winner`, `loser` or `draw` |

#### Game

| Column     | Data Type | Notes                                                                              |
| ---------- | --------- | ---------------------------------------------------------------------------------- |
| id         | int       | The unique ID of the game which can be bet on                                      |
| name       | varchar   | The display name of the game (e.g. `Golf`, `Tennis`, `Rugby League`)               |
| vertical   | varchar   | The product vertical the game belongs to of either `sports`, `esports` or `casino` |
| created_at | timestamp | The date the game was created in the database                                      |

#### Bet

| Column         | Data Type | Notes                                                                                  |
| -------------- | --------- | -------------------------------------------------------------------------------------- |
| id             | int       | The unique ID of the bet                                                               |
| user_id        | int       | ID of the user who placed the bet                                                      |
| bet_outcome_id | int       | The bet outcome ID. `NULL` until the game has finished (i.e. the bet has settled)      |
| game_id        | int       | The ID of the game which the user placed a bet on                                      |
| wager          | decimal   | The amount wagered by the user on the bet (e.g. the user placed a £10 bet).            |
| is_cash_wager  | boolean   | True if the bet is an all cash wager. If false, then the bet was made with free credit |
| winnings       | decimal   | The amount of cash paid to the user when the bet has been settled. Cannot be < 0.      |
| created_at     | timestamp | The date the bet was placed                                                            |
| settled_at     | timestamp | The date when the bet settles (i.e. the bet is won, lost or draw)                      |

_NOTE: All financial attributes (i.e. `wager` and `winnings`) are recorded in the users' account currency (e.g. GBP, EUR) depending on the currency_code in the user table_

#### FX Rates

| Column        | Data Type | Notes                                                                           |
| ------------- | --------- | ------------------------------------------------------------------------------- |
| date          | date      | The exchange rate date                                                          |
| currency_code | varchar   | 3-character currency code of either `EUR` or `GBP`                              |
| rate          | decimal   | The FX rate to convert the financial attributes from the user's currency to USD |
