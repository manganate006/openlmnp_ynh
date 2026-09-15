OpenLMNP tient la comptabilité d'un loueur en meublé non professionnel au **régime réel** —
celui qui réclame un tableau d'amortissements et une liasse fiscale, et la raison pour
laquelle la plupart des bailleurs paient un comptable ou se rabattent sur le micro-BIC.

Le logiciel découpe le bien en composants — gros œuvre, toiture, installations électriques,
étanchéité, agencements intérieurs, plomberie, chacun avec sa durée d'amortissement —
applique la quote-part réellement louée, reporte les amortissements différés d'un exercice
à l'autre, puis produit en fin d'année les deux documents que l'administration attend : la
**liasse 2031 et ses annexes 2033** en PDF, et un **export FEC** au format de l'article
A47 A-1 du livre des procédures fiscales.

Il importe aussi les relevés de versement Airbnb au format CSV, suit les emprunts et la part
déductible des intérêts, et compare le régime réel au micro-BIC sur vos propres chiffres :
le choix entre les deux devient un calcul plutôt qu'une intuition.

Tout tourne sur une base SQLite hébergée chez vous : aucune donnée comptable, personnelle ou
fiscale ne quitte le serveur, et le comptage d'installations reste éteint sauf si vous
l'activez à l'installation.
