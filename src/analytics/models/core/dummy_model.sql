{{ config(materialized='table') }}

select 
    bets.created_at aas bet_created_at
    , bets.id
    , users.user_id
    , bets.settled_at as bet_settled_at
    , game.name as game_name
    , game.vertical
    , bet_outcome.outcome as bet_outcome
    , bets.is_cash_wager
    , bets.wager
    , bets.winnings
    , (bets.wager * fx_rate.rates) as wager_usd
    , (bets.winngins * fx_rates) as winnings_usd
    , users.currency_code

from {{ var('bets') }} as bets 

left join {{ var('users') }} as users
on bets.id = users.bet_id 

left join {{ var('game') }} as game 
on bets.game_id = game.id

left join {{ var('bet_outcome') }} as bet_outcome
on bets.bet_outcome_id = bet_outcome.id

left join {{ var('fx_rate') }} as fx_rates
on 
    fx_rate.currency_code = users.currency_code and 
    fx_rates.date = cast(bets.created_at as date)

where 
    users.is_test_user = false 