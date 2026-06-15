# Dataset Information & Origin

The data used in this project is the widely recognised **Online Retail Dataset**, originally sourced from the UCI Machine Learning Repository and hosted on Kaggle.

* **Data Source Link:** [Kaggle - Online Retail II UCI](https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci)
* **Dataset Size:** ~44 MB (.csv format)
* **Context :** Transnational transactions occurring between 01/12/2009 and 09/12/2011.
* **Target Domain:** A UK-based, registered non-store online retail company specialising in unique all-occasion gifts.

### Raw Schema Overview

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| **InvoiceNo** | Nominal | Invoice number. A 6-digit integral number uniquely assigned to each transaction. If this code starts with the letter 'c', it indicates a cancellation. |
| **StockCode** | Nominal | Product (item) code. A 5-digit integral number uniquely assigned to each distinct product. |
| **Description** | Nominal | Product (item) name. |
| **Quantity** | Numeric | The quantities of each product (item) per transaction. |
| **InvoiceDate** | Numeric | Invoice date and time. The day and time when a transaction was generated. |
| **UnitPrice** | Numeric | Unit price. Product price per unit in sterling (£). |
| **CustomerID** | Nominal | Customer number. A 5-digit integral number uniquely assigned to each customer. |
| **Country** | Nominal | Country name. The name of the country where a customer resides. |
