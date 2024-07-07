## DBT, Snowpark, and OpenAI Integration for Vulnerability Data Analysis

This repository contains the dbt projects and Python scripts used to process, analyze, and generate summaries from disclosed vulnerability data sourced from HackerOne. The goal is to utilize dbt for data transformation, Snowpark to facilitate Python operations within Snowflake, and OpenAI's machine learning algorithms to identify significant trends and automate the creation of comprehensive whitepapers on cybersecurity vulnerabilities.

### Overview:

The pipeline extracts vulnerability data from HackerOne, transforms and enriches the data using dbt in Snowflake, and applies machine learning models via Snowpark and OpenAI to derive insights and automated summaries. These summaries are then formatted into whitepapers, aiding cybersecurity education and awareness.

### Project Structure

/models: Contains the dbt models that define the transformations and data manipulations.
/analysis: Scripts and notebooks for analyzing transformed data using Snowpark and Python.
/tests: Includes dbt tests to ensure data integrity and accuracy.
/macros: dbt macros used across the models for custom logic.
/scripts: Python scripts that integrate with OpenAI for generating text and analyzing trends.

### Setup and Configuration

Snowflake account with appropriate permissions.
dbt Cloud or dbt CLI installed and configured to connect to Snowflake.
Access to Snowpark library and Python environment setup.
An API key from OpenAI for using their machine learning models.
