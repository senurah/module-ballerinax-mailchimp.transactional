# Running tests

## Prerequisites

You need a valid **Mandrill API key** from your Mailchimp Transactional account to run the live tests.

To generate the API key, follow the [Setup Guide](../README.md#setup-guide) provided in the main module documentation.

---

## Test environments

There are two test environments for running the Mailchimp Transactional API connector tests. By default, tests run against the **mock server**. You can also run tests against the **live Mailchimp Transactional API**.

 Test Groups  | Environment                                    
---------------|---------------------------------------------------
 mock          | Mock server for Mailchimp Transactional API (Default)  
 live          | Mailchimp Transactional API (Live environment)          

---

## Running tests with the mock server

To run the tests using the mock server (default environment), ensure the `isLiveServer` configuration is set to `false` or left unset in the `Config.toml` file located in the `tests` directory.

### Option 1: Using `Config.toml` file

Create a `Config.toml` file in the `tests` directory with the following content:

```toml
isLiveServer = false
```
### Option 2: Using environment variables

On Linux/macOS:
```bash
export isLiveServer = false
```
On Windows:
```bash
setx isLiveServer = false
```
Then, run the following command to execute the tests:
```bash
bal test
```
You can also explicitly run only mock group tests:
```bash
bal test --groups mock
```

## Running tests against live mailchimp transactional API

To run tests against the actual Mailchimp Transactional API, you must provide a valid Mandrill API key.

### Option 1: Using ```Config.toml``` file

Create a ```Config.toml``` file in the ```tests``` directory with the following:

```bash
key = "<your-mandrill-api-key>"
isLiveServer = true
```
### Option 2: Using environment variables

On Linux/macOS:
```bash
export key = "<your-mandrill-api-key>"
export isLiveServer = true
```
On Windows:
```bash
setx key "<your-mandrill-api-key>"
setx isLiveServer true
```
Then, run the following command to execute the tests:
```bash
bal test --groups live
```

## Running all tests

To run all test groups (mock by default):
```bash
bal test
```
To run only a specific test group:
```bash
bal test --groups mock
bal test --groups live
```
