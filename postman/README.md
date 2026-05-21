# Restful E-Commerce QA Test Suite

This directory contains a professional, production-grade Postman collection and Newman configuration for the `restful-ecommerce` API, adhering to QA best practices.

## Features Included
- **Automated Authentication**: A collection-level script checks for token existence and expiry, automatically logging in (using environment variables) when needed.
- **Negative Testing**: Verifies behavior against malformed bodies, invalid tokens, and missing authorization headers.
- **Persistence Checks**: E2E scenarios where changes (POST, PUT, PATCH, DELETE) are immediately verified via subsequent GET requests to ensure data actually persisted to the datastore.
- **Guard Assertions**: Every single request contains a `< 500` status guard and `< 1000ms` response time guard.
- **Idempotent Data**: Data is generated dynamically using `{{$timestamp}}` to avoid collision in repeated test runs.

## Prerequisites
- Node.js (v16 or higher)
- Newman & Newman HTML Extra Reporter:
  ```bash
  npm install -g newman newman-reporter-htmlextra
  ```

## Running from Postman UI
1. Open Postman.
2. Go to **File > Import**.
3. Select both `restful-ecommerce-collection.json` and `environments/environment-qa.json`.
4. Make sure the API is running locally on `http://localhost:3004`.
5. Select the **Restful E-Commerce - QA** environment in the top right corner.
6. Run the collection using the Collection Runner.

> **Note on Image Upload:** The "06 - Image Upload" request requires a file. To run it successfully, click on the Body tab in Postman, find the `image` field, and manually select a JPG or PNG file from your computer before sending.

## Running from CLI (Newman)
For automated pipelines or terminal execution, a Windows batch file is included.
1. Ensure the API is running on `http://localhost:3004`.
2. Open a Command Prompt in this (`postman/`) directory.
3. Run the batch script:
   ```cmd
   newman-run.bat
   ```
4. A new HTML report will be generated inside the `reports/` folder with a timestamped directory. Open `report.html` in your browser to view the detailed results! Additionally, a `results.xml` file (JUnit standard format) is generated in the same folder, which is perfectly formatted for integration into CI/CD pipelines (like GitHub Actions or Jenkins).
