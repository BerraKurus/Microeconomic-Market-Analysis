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

**R**

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

**SQL**

**Data Importing**

[Click here to view the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Create%20Table%26Data%20Importing.sql)

This query includes CREATE TABLE statement for data importing process.

**1) Superhost Profiles & Exploratory Data Analysis**

[Click here to view the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Baseline%20EDA%26Overview.sql)

[Click here to view the SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/eda_table.csv)

This SQL query was designed for exploratory data analysis. It examines the empirical relationship between host reputation (host_is_superhost) and key market performance indicators such as price, occupancy, and consumer engagement including average rating and reviews.

**Key Insights:**

**Occupancy & Demand:** Superhost listings display lower short-term availability (avg_availability_30), pointing to higher occupancy rate & demand intensity.

**Reputation Premium:** Superhosts command higher average nightly rates (avg_price), indicating that consumers are willing to pay a premium to reduce quality uncertainty.

**Engagement & Feedback:** Superhosts register higher review volumes and rating scores, reinforcing platform trust.

**2) Markup Point on Average Price Increase when Host is Superhost**

[Click here to view the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Price-Superhost-Relationship.sql)

[Click here to observe the SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/price_superhost_table.csv)

**3) Herfindahl-Hirschman Index & Concentration Ratio Analyses**

[Click here to observe the unfiltered SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/hhi_index_conc_ratio.sql)

As a result of the unfiltered version of the SQL query, a big table containing thousands of rows was constructed. Therefore, this table is hosted on Google Drive as a CSV file.

[Click here to observe the table on Google Drive](https://drive.google.com/file/d/16s3vlZLTW5Z7N59h4f3gAF78L2PJ-FbG/view?usp=sharing)

[Click here to view the filtered SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/top_50_hosts_hhi_conc_ratio.sql) :

This filtered query contains top 50 hosts per city, making the analysis more straightforward.

[Click here to view the filtered SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/top_50_hosts_hhi_conc_ratio_table.csv)

**4) Average Price per Guest**

[Click here to observe the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_price_per_accomodate.sql)

[Click here to view the SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_price_per_guest_table.csv)

**5) Average Occupancy Rate based on Host Profiles**

[Click here to view the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_occupancy.sql)

[Clickk here to observe the SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_occupancy_table.csv)

**6) Neighbourhoods with Maximum Average Price**

[Click here to view the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/max_price_neighbourhoods.sql)

[Click here to view the SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/max_price_neighbourhoods_table.csv)

**TABLEAU**

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

**R**

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

**SQL**

**Importation de Données**

[Cliquez pour observer les codes de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Create%20Table%26Data%20Importing.sql)

Cette interrogation inclut l'instruction CREATE TABLE pour le processus de l'importation de données.

**1)Profiles de Superhôte & Analyse Exploratoire de Données**

[Cliquez pour observer l'interrogation de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Baseline%20EDA%26Overview.sql)

[Cliquez pour observer la table de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/eda_table.csv)

Cette interrogation a été désignée pour l’analyse exploratoire de données. Elle examine la relation empirique entre la réputation d’hôte (host_is_superhost) et les indicateurs clés de performance du marché comme la prix, le taux d’occupation et l’engagement du client qui inclut l’évaluation moyenne et les critiques.

**Perspectives Clés :**

**Occupation & Demande :** Les inscriptions de superhôte montrent un taux plus bas de disponibilite à court terme (avg_availability_30), indiquant le taux plus haut d’occupation & l’intensité de demande.

**Plus-value de Réputation :** Les superhôtes commandent les prix plus hauts (avg_price), indiquant le fait que les clients sont prêts à payer un supplément afin de réduire l’incertitude de qualité.

**Engagement & Feed-back :** Les superhôtes enregistrent des volumes plus grands de critiques et de meilleurs scores d’évaluation, ceux qui renforcent la confiance envers la plateforme.

**2) Hausse Moyenne des Prix Induite par le Statut de Superhôte**

[Cliquez pour voir les codes de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Price-Superhost-Relationship.sql)

[Cliquez pour observer la table de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/price_superhost_table.csv)

**3)**

**4) Prix Moyenne par Client**

[Cliquez afin d'observer l'interrogation de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_price_per_accomodate.sql)

[Cliquez pour voir la table de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_price_per_guest_table.csv)

**5) Taux d'Occupation Moyenne selon la Profile d'Hôte**

[Cliquez pour voir les codes de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_occupancy.sql)

[Cliquez afin d'observer la table de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/avg_occupancy_table.csv)

**6) Quartiers avec la Prix Moyenne Maximale**

[Cliquez afin de voir les codes de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/max_price_neighbourhoods.sql)

[Cliquez pour observer la table de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/max_price_neighbourhoods_table.csv)

**TABLEAU**

--

*Le rapport d'analyse détaillée est en train de se produire.*

</details>
