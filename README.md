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



**2) Data Access & Architecture**

* **Data Source:** [Inside Airbnb](https://insideairbnb.com) (Public Data Archive)

* **Technologies & Infrastructure:**

R & RStudio: Data retrieval / cleaning

Docker & DBeaver: Database Hosting / Database Management

Microsoft SQL Server & SQL: Exploratory Data Analysis / Data Analytics / Correlations

Tableau: Data Visualization

**R**

--

* **Dataset:** Due to GitHub repository file size limitations, the full cleaned dataset is hosted externally on Google Drive:

[Processed Airbnb Dataset (CSV)](https://drive.google.com/file/d/1xwBVhIU6OFKY_Cv9ePDZQ42gRMZTo5QX/view?usp=sharing)

**SQL**

**Data Importing**

[Click here to view the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Create%20Table%26Data%20Importing.sql)

This query includes CREATE TABLE statement for data importing process.

**a) Superhost Profiles & Exploratory Data Analysis**

[Click here to view the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Baseline%20EDA%26Overview.sql)

[Click here to view the SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/eda_table.csv)

This SQL query was designed for exploratory data analysis. It examines the empirical relationship between host reputation (host_is_superhost) and key market performance indicators such as price, occupancy, and consumer engagement including average rating and reviews.

**Key Insights:**

**Occupancy & Demand:** Superhost listings display lower short-term availability (avg_availability_30), pointing to higher occupancy rate & demand intensity.

**Reputation Premium:** Superhosts command higher average nightly rates (avg_price), indicating that consumers are willing to pay a premium to reduce quality uncertainty.

**Engagement & Feedback:** Superhosts register higher review volumes and rating scores, reinforcing platform trust.

**b) Markup Point on Average Price Increase when Host is Superhost**

[Click here to view the SQL query](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Price-Superhost-Relationship.sql)

[Click here to observe the SQL table](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/price_superhost_table.csv)

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

**2) Accès aux données & Architecture**

* **Source des Données :** [Inside Airbnb](https://insideairbnb.com) (Archive Publique de Données)

* **Technologies & Infrastructure :**

R & RStudio: Extraction / Nettoyage de données

Docker & DBeaver: Hébergement / Gestion de base de données

Microsoft SQL Server & SQL: Analyse exploratoire de données / Analytique de données / Corrélations

Tableau: Visualisation de données

**R**

--

* **Ensemble de Données :** En raison des limitations de Github concernant la grandeur des documents, l’ensemble complet et nettoyé de données est hébergé sur Google Drive.

[Document de CSV](https://drive.google.com/file/d/1xwBVhIU6OFKY_Cv9ePDZQ42gRMZTo5QX/view?usp=sharing)

**SQL**

**Importation de Données**

[Cliquez pour observer les codes de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Create%20Table%26Data%20Importing.sql)

Cette interrogation inclut l'instruction CREATE TABLE pour le processus de l'importation de données.

**a)Profiles de Superhôte & Analyse Exploratoire de Données**

[Cliquez pour observer l'interrogation de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Baseline%20EDA%26Overview.sql)

[Cliquez pour observer la table de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/eda_table.csv)

Cette interrogation a été désignée pour l’analyse exploratoire de données. Elle examine la relation empirique entre la réputation d’hôte (host_is_superhost) et les indicateurs clés de performance du marché comme la prix, le taux d’occupation et l’engagement du client qui inclut l’évaluation moyenne et les critiques.

**Perspectives Clés :**

**Occupation & Demande :** Les inscriptions de superhôte montrent un taux plus bas de disponibilite à court terme (avg_availability_30), indiquant le taux plus haut d’occupation & l’intensité de demande.

**Plus-value de Réputation :** Les superhôtes commandent les prix plus hauts (avg_price), indiquant le fait que les clients sont prêts à payer un supplément afin de réduire l’incertitude de qualité.

**Engagement & Feed-back :** Les superhôtes enregistrent des volumes plus grands de critiques et de meilleurs scores d’évaluation, ceux qui renforcent la confiance envers la plateforme.

**b) Hausse Moyenne des Prix Induite par le Statut de Superhôte**

[Cliquez pour voir les codes de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/Price-Superhost-Relationship.sql)

[Cliquez pour observer la table de SQL](https://github.com/BerraKurus/Microeconomic-Market-Analysis/blob/main/price_superhost_table.csv)

**TABLEAU**

--

*Le rapport d'analyse détaillée est en train de se produire.*

</details>
