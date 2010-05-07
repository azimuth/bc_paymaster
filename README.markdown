pay-calc
========

Calculate pay for a basecamp time report csv export

TODO
----

* rename project to bc-paymaster 
* Database rates, rate types, client company
* Basecamp integration
* Sinatra-ize (starting interfaces: "Rates and Rate type", "Pay")
* Multi-payee, database different rates for different (payee + client company + rate type) 
combinations (add interface "Payees", alter "Rates and Rate Types", 
"Pay selection screen (one user or all users)")
* Add reporting of missing / defaulted RATE_TYPE and RATE entries
* Handle overtime (requires custom logic and basecamp integration)

USAGE
-----

Currently, you download a time-report.csv into your pay-calc directory and then run:

    ruby calc.rb