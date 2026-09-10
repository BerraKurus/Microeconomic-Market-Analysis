# Microeconomic-Market-Analysis
End-to-end microeconomic analysis of Inside Airbnb data using R, SQL, and Tableau.

Analyse microéconomique de bout en bout des données Inside Airbnb à l'aide de R, SQL et Tableau.

### Choose the Report's Language / Choisissez la Langue du Rapport :

<details>
<summary><b>🇬🇧 English Report (Click to read the whole report)</b></summary>
<br>

**Airbnb Microeconomic Market Analysis**

An end-to-end empirical data analysis project investigating microeconomic market dynamics using Airbnb data of 4 metropoles: New York, London, Paris, and Tokyo. 

**1) Scope of the Project**

Microeconomic data from Inside Airbnb was analyzed in terms of market dynamics and their dependencies on key microeconomic indicators.

The dataset includes 4 metropolitan markets (New York, London, Paris, and Tokyo) in order for market dynamics of different continents (North America, Europe, and Asia) to be properly reflected.

**2) Data Access & Architecture**

* **Data Source:** [Inside Airbnb](https://insideairbnb.com) (Public Data Archive)

* **Technologies & Infrastructure:**

R & RStudio: Data retrieval / cleaning

Docker & DBeaver: Database Hosting / Database Management

Microsoft SQL Server & SQL: Exploratory Data Analysis / Data Analytics / Correlations

Tableau: Data Visualization

### R

The raw ingestion and transformation pipeline was engineered in R.

* **Packages:**

tidyverse

lubridate

data.table

arrow

R.utils

* **Indispensable Functions:**

**tribble() :** Created a metadata table containing city names, currencies, exchange rates, and URL’s.

**fread() :** Leveraged a C-backed stream reading to ingest massive listings directly from remote URLs, minimizing memory overhead prior to cleaning.

**select() & mutate() & case_when() & replace_na() & filter() :** Data cleaning / Harmonization

**str_detect() :** Parsed the raw 'amenities' string column using vectorized regular expressions ('regex') to extract structural indicators (WiFi, self check-in, dedicated workspace etc.) as boolean indicators. 

**write_csv() :** Exported the dataset for SQL querying.

* **Dataset:** Due to GitHub repository file size limitations, the full cleaned dataset is hosted externally on Google Drive:

[Processed Airbnb Dataset (CSV)](https://drive.google.com/file/d/1xwBVhIU6OFKY_Cv9ePDZQ42gRMZTo5QX/view?usp=sharing)

### SQL

**Data Importing**

[Click here to view the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Create%20Table%26Data%20Importing.sql)

This query includes CREATE TABLE statement for data importing process.

**1) Exploratory Data Analysis & Host Demographics**

[Click here to view the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Baseline%20EDA%26Overview.sql)

[Click here to view the SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/eda_table.csv)

This SQL query was designed for exploratory data analysis. It examines the empirical relationship between host reputation (host_is_superhost) and key market performance indicators such as price, occupancy, and consumer engagement including average rating and reviews.

**Key Insights:**

**Occupancy & Demand:** Superhost listings display lower short-term availability (avg_availability_30), pointing to higher occupancy rate & demand intensity.

**Reputation Premium:** Superhosts command higher average nightly rates (avg_price), indicating that consumers are willing to pay a premium to reduce quality uncertainty.

**Engagement & Feedback:** Superhosts register higher review volumes and rating scores, reinforcing platform trust.

**2) Hedonic Amenity Valuation & Consumer Satisfaction Dynamics**

[Click here to observe the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/hedonic_amenity_valuation.sql)

[Click here to observe the SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/hedonic_amenity_valuation_table.csv)

**3) Herfindahl-Hirschman Index & Concentration Ratio**

[Click here to observe the unfiltered SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/hhi_index_conc_ratio.sql)

As a result of the unfiltered version of the SQL query, a big table containing thousands of rows was constructed. Therefore, this table is hosted on Google Drive as a CSV file : [Click here to observe the table on Google Drive](https://drive.google.com/file/d/16s3vlZLTW5Z7N59h4f3gAF78L2PJ-FbG/view?usp=sharing)

[Click here to view the filtered SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/top_50_hosts_hhi_conc_ratio.sql) : This filtered query contains top 50 hosts per city, making the analysis more straightforward.

[Click here to view the SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/top_50_hosts_hhi_conc_ratio_table.csv)

**4) Average Price per Guest**

[Click here to observe the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_price_per_accomodate.sql)

[Click here to view the SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_price_per_guest_table.csv)

This query calculates the average price per guest in each neighbourhood in each metropolitan market. New York’s Greenwich Village has the highest average price per guest, driven by Greenwich Village’s exceptionally high touristic willingness to pay due to Manhattan’s historical background, inelastic land supply, and central location. Also, as a result of the overall analysis, New York has higher prices per guest whereas Tokyo is the most affordable city in terms of average unit prices. Tokyo’s situation can be explained by its high guest capacity, and the macroeconomic depreciation of the JPY relative to the USD and EUR.

At the end of the query, a filtering (HAVING COUNT(*) >= 15) was applied in order to prevent sample size bias. Consequently, statistically representative neighbourhoods were included in the list.

Additionally, the ratio of average total price to average accommodates is not entirely equal to average price per guest in the table. This can be explained fundamentally by Jensen’s Inequality, highlighting the mathematical difference between the mean of ratios and the ratio of means.

**5) Price Premium on Average Price Increase when Host is Superhost**

[Click here to view the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Price-Superhost-Relationship.sql)

[Click here to observe the SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/price_superhost_table.csv)

In this CTE-based query, it was intended to calculate the average price increase as a price premium when the host is superhost. The results indicate that maximum superhost premium is observed in Tokyo which is followed by London, Paris, and New York in order.

**6) Average Occupancy Rate based on Host Profiles**

[Click here to view the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_occupancy.sql)

[Clickk here to observe the SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_occupancy_table.csv)

It was intended to analyze average monthly / yearly occupancy rates and prices of different host profiles which were categorized based on the number of their listings. There exist 4 categories as single host, small multi-host, medium multi-host, and commercial host. It is normal to expect that commercial hosts’ rentings would have higher occupancy rates. However, it is worth indicating that in London, New York, and Paris; average yearly occupation rates reach the top at single host profiles. This situation can be explained by several facts:

1-	Single hosts generally rent their own houses or empty rooms to make some money instead of keeping that place empty without earning. Therefore, they underprice their listings relative to commercial hosts who target higher profit margins. The law of demand indicates that quantity demanded increases when the price goes down.

2-	Artificial Occupancy:
Single hosts have tendency to keep the renting blocked when it’s under their own use. The algorithm counts blocked days as occupied days, leading to less availability as a result of the artificial occupancy.

3-	Authentic and more localized guest preference

In terms of average prices per host profiles in each metropole, London and Paris have higher average prices. Also, it is crucial to highlight a counterintuitive fact: In Paris and Tokyo, average price per host profile does not reach its highest value at commercial host category. This incident has a few roots:

1-	Legal Regulations & Space Optimization:
In Paris and Tokyo, there are strict housing laws (Loi Élan in Paris & Minpaku Law in Tokyo), due to which, commercial hosts rent compact studios in order to be able to get legal permission. In this case, they naturally command lower absolute headline prices compared to the larger primary residences listed by non-commercial hosts.

2-	Outliers:
Non-commercial hosts sometimes list high-value, unique residences (e.g., luxury apartments with scenic views), which skew non-commercial averages upward. In contrast, commercial hosts keep the prices at a normal level to not take risks.

**7) Neighbourhoods with Maximum Average Price**

[Click here to view the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/max_price_neighbourhoods.sql)

[Click here to view the SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/max_price_neighbourhoods_table.csv)

### TABLEAU

--

*The detailed analysis report is currently being constructed.*

</details>

<details>
<summary><b>🇫🇷 Rapport Français (Cliquez pour lire le rapport en entier)</b></summary>
<br>

**Analyse microéconomique du marché Airbnb**

Un projet d’analyse empirique de bout en bout des données explorant les dynamiques microéconomiques du marché Airbnb dans 4 métropoles : New York, Londres, Paris et Tokyo.

**1) Cadre du Projet** 

Les données microéconomiques du site “Inside Airbnb” ont été analysées en termes de dynamiques de marché et leur relation avec les indicateurs microéconomiques clés.

L’ensemble de données inclut 4 marchés métropolitains (New York, Londres, Paris et Tokyo) afin que les dynamiques de marché de différents continents (Amérique du Nord, Europe et Asie) soient correctement reflétées.

**2) Accès aux données & Architecture**

* **Source des Données :** [Inside Airbnb](https://insideairbnb.com) (Archive Publique de Données)

* **Technologies & Infrastructure :**

R & RStudio: Extraction / Nettoyage de données

Docker & DBeaver: Hébergement / Gestion de base de données

Microsoft SQL Server & SQL: Analyse exploratoire de données / Analytique de données / Corrélations

Tableau: Visualisation de données

### R

La conduite de l’ingestion et de la transformation brutes a été construite en R.

* **Paquets:**

tidyverse

lubridate

data.table

arrow

R.utils

* **Fonctions Indispensables:**

**tribble() :** Une table de métadonnée contenant les noms de villes, unités monétaires, taux d’échange et les URL’S a été créée.

**fread() :** Une lecture en flux optimisée en C a été exploitée pour ingérer des volumes massifs des URL distantes, réduisant aussi la surcharge mémoire avant la phase de nettoyage.

**select() & mutate() & case_when() & replace_na() & filter() :** Nettoyage de Données / Harmonisation

**str_detect() :** La colonne de “amenities” a été analysée à l'aide d'expressions régulières vectorisées (“regex”) afin d'extraire des indicateurs structurels (Wi-Fi, check-in autonome, espace dédié au travail, etc.) sous forme d'indicateurs booléens.

**write_csv() :** L’ensemble de données a été exporté pour l’analyse de SQL.

* **Ensemble de Données :** En raison des limitations de Github concernant la grandeur des documents, l’ensemble complet et nettoyé de données est hébergé sur Google Drive.

[Document de CSV](https://drive.google.com/file/d/1xwBVhIU6OFKY_Cv9ePDZQ42gRMZTo5QX/view?usp=sharing)

### SQL

**Importation de Données**

[Cliquez pour observer les codes de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Create%20Table%26Data%20Importing.sql)

Cette interrogation inclut l'instruction CREATE TABLE pour le processus de l'importation de données.

**1) Analyse Exploratoire de Données & Profiles de Superhôte**

[Cliquez pour observer l'interrogation de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Baseline%20EDA%26Overview.sql)

[Cliquez pour observer la table de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/eda_table.csv)

Cette interrogation a été désignée pour l’analyse exploratoire de données. Elle examine la relation empirique entre la réputation d’hôte (host_is_superhost) et les indicateurs clés de performance du marché comme la prix, le taux d’occupation et l’engagement du client qui inclut l’évaluation moyenne et les critiques.

**Perspectives Clés :**

**Occupation & Demande :** Les inscriptions de superhôte montrent un taux plus bas de disponibilite à court terme (avg_availability_30), indiquant le taux plus haut d’occupation & l’intensité de demande.

**Plus-value de Réputation :** Les superhôtes commandent les prix plus hauts (avg_price), indiquant le fait que les clients sont prêts à payer un supplément afin de réduire l’incertitude de qualité.

**Engagement & Feed-back :** Les superhôtes enregistrent des volumes plus grands de critiques et de meilleurs scores d’évaluation, ceux qui renforcent la confiance envers la plateforme.

**2) Valorisation Hédonique des Équipements et Dynamiques de Satisfaction de Clients**

[Cliquez afin d'observer les codes de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/hedonic_amenity_valuation.sql)

[Cliquez pour observer le tableau de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/hedonic_amenity_valuation_table.csv)

**3) Indexe de Herfindahl-Hirschman & Ratio de Concentration**

[Cliquez afin d'observer l'interrogation non-filtrée de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/hhi_index_conc_ratio.sql)

En raison de la version non-filtrée de l’interrogation de SQL, une table contenant milles des rangs a été construite. D’ailleurs, cette table est hébergée sur Google Drive : [Cliquez pour observer la table sur Google Drive](https://drive.google.com/file/d/16s3vlZLTW5Z7N59h4f3gAF78L2PJ-FbG/view?usp=sharing)

[Cliquez pour voir l'interrogation filtrée de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/top_50_hosts_hhi_conc_ratio.sql) : Cette interrogation filtrée contient les 50 premiers hôtes au zénith, rendant l’analyse plus directe et simple.

[Cliquez afin de voir la table de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/top_50_hosts_hhi_conc_ratio_table.csv)

**4) Prix Moyen par Client**

[Cliquez afin d'observer l'interrogation de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_price_per_accomodate.sql)

[Cliquez pour voir le tableau de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_price_per_guest_table.csv)

Ces codes de SQL calculent le prix moyen par voyageur dans chaque quartier de chaque marché métropolitain. Greenwich Village à New York possède le prix moyen le plus élevé par invité, ce qui est le résultat du consentement à payer touristique exceptionnellement fort en raison du fondement historique de Manhattan, de l’offre foncière inélastique et sa localisation centrale. En plus, selon l’analyse totale, les prix de New York sont plus élevés, alors que Tokyo est la ville la plus abordable en termes de prix unitaires moyens. La situation de Tokyo pourrait s’expliquer par sa grande capacité d’invité et la dépréciation macroéconomique de JPY par rapport à USD et EUR.

Un filtrage (HAVING COUNT(*) >= 15) a aussi été appliqué à la fin de la requête afin d’éviter le biais de taille d'échantillon. Par conséquent, les quartiers statistiquement représentatifs ont été inclus dans la liste.

Additionnellement, le rapport du prix total moyen au nombre de voyageurs moyen n’est pas tout à fait égal au prix moyen par invité dans le tableau. Cela pourrait se clarifier par l’Inégalité de Jensen, soulignant la différence mathématique entre la moyenne des rapports et le rapport des moyennes.

**5) Hausse Moyenne des Prix Induite par le Statut de Superhôte**

[Cliquez pour voir les codes de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Price-Superhost-Relationship.sql)

[Cliquez pour observer la table de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/price_superhost_table.csv)

Le but essentiel de cette interrogation qui aussi contient CTE est de calculer l’augmentation de prix moyenne comme une prime de prix quand l’hôte est un superhôte. Les résultats indiquent que la prime maximale de superhôte est observée à Tokyo qui est suivi par Londres, Paris et New York en ordre.

**6) Taux d'Occupation Moyenne selon la Profile d'Hôte**

[Cliquez pour voir les codes de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_occupancy.sql)

[Cliquez afin d'observer le tableau de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_occupancy_table.csv)

Les taux d’occupation mensuelle / annuelle moyenne et les prix des profiles d’ hôte différents qui ont été catégorisés selon le nombre de leurs annonces ont été analysés. L’échantillon distingue 4 catégories: hôte individuel, hôte modeste, hôte moyen, hôte commercial. C’est normal de présumer que les locations des hôtes commerciaux auraient les taux d’occupation plus élevés. Néanmoins, il faut indiquer que les taux d’occupation annuelle moyenne accèdent au zénith chez les profiles d’hôte individuel à Londres, New York et Paris. Cette situation pourrait se clarifier par des faits suivants :

1-	Puisque les hôtes individuels généralement louent leurs propres appartements ou chambres vides afin de gagner un peu d’argent au lieu de tenir vacant cet espace, sans revenu; ils sous-évaluent leurs logements proposés relative aux hôtes commerciaux qui pointe aux marges bénéficiaires plus hautes.  La loi de demande indique que la quantité demandée augmente quand le prix se positionne vers le bas.

2-	Occupation Artificielle: 
Les hôtes individuels possèdent la tendance de bloquer les dates sur leurs calendriers pendant leurs propres usages. L’algorithme compte les jours bloqués comme les jours occupés, conduisant à moins de disponibilité à la conséquence de l’occupation artificielle.

3-	Préférence authentique et plus localisée de voyageurs

En termes de prix moyens par profiles d’hôte dans chaque marché métropolitain, Londres et Paris ont des prix moyens plus élevés. En plus, il est indispensable de souligner un fait à contre-pied : À Paris et Tokyo, le prix moyen par profile n’accède pas à sa valeur maximale dans la catégorie d’hôte commercial. Cet incident a certaines racines :

1-	Régulations Légales & Optimisation d’Espace: 
Paris et Tokyo imposent des lois strictes d’hébergement (Loi Élan Paris & Loi de Minpaku Tokyo), en raison desquelles les hôtes commerciaux louent des studios compacts afin de pouvoir obtenir la permission légale. Dans ce cas, ils affichent naturellement des prix faciaux absolus plus bas que les résidences principales de plus grande taille proposées par des hôtes non commerciaux.

2-	Valeurs Aberrantes: 
Les hôtes non commerciaux listent parfois des résidences uniques de valeur haute ( par exemple des appartements luxueux ayant des vues panoramiques) qui inclinent les moyennes non commerciales vers le haut. Au contraire, les hôtes commerciaux préfèrent conserver la stabilité et le niveau normal des prix pour ne pas prendre de risque.

**7) Quartiers avec le Prix Moyen Maximal**

[Cliquez afin de voir les codes de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/max_price_neighbourhoods.sql)

[Cliquez pour observer la table de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/max_price_neighbourhoods_table.csv)

### TABLEAU

--

*Le rapport d'analyse détaillée est en train de se produire.*

</details>
