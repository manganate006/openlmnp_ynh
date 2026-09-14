OpenLMNP keeps the books of a French furnished rental taxed under the *régime réel* — the
regime that requires a depreciation schedule and a tax return, and the reason most landlords
either pay an accountant or stay on the flat-rate micro-BIC and lose money doing so.

The application splits the property into components (structure, roof, fittings, equipment),
applies each one's useful life and the share actually rented out, carries deferred
depreciation from one fiscal year to the next, and produces at year end the two documents
the tax office expects: the **2031 return with its 2033 annexes** as a PDF, and an **FEC
ledger export** in the format set by article A47 A-1 of the French tax procedure code.

It also imports Airbnb payout statements from CSV, tracks loans and the deductible share of
their interest, and compares the *régime réel* against the micro-BIC before you commit.

Everything runs on a SQLite file on your own server: no accounting, personal or tax data
leaves the machine.
