OpenLMNP keeps the books of a French furnished rental taxed under the *régime réel* — the
regime that requires a depreciation schedule and a full tax return, which is why most
landlords either pay an accountant or fall back on the flat-rate micro-BIC.

The application splits the property into components — structure, roof, electrics,
waterproofing, interior fittings, plumbing, each with its own useful life — applies the
share actually rented out, carries deferred depreciation from one fiscal year to the next,
and produces at year end the two documents the tax office expects: the **2031 return with
its 2033 annexes** as a PDF, and an **FEC ledger export** in the format set by article
A47 A-1 of the French tax procedure code.

It also imports Airbnb payout statements from CSV, tracks loans and the deductible share of
their interest, and compares the *régime réel* against the micro-BIC on your own figures, so
the choice between them is a calculation rather than a guess.

**Who this is for.** Only landlords taxed in France: the forms, the depreciation practice
and the ledger format are French ones, and **the interface is in French only**. Everything
runs on a SQLite file on your own server — no accounting, personal or tax data leaves the
machine, and the daily install counter is off unless you turn it on at installation.
