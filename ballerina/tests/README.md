# Running Tests

## Prerequisites

You need a valid **Mandrill API key** from your Mailchimp Transactional account to run the live tests.

To generate the API key, follow the [Setup Guide](../README.md#setup-guide) provided in the main module documentation.

---

## Test Environments

There are two test environments for running the Mailchimp Transactional API connector tests. By default, tests run against the **mock server**. You can also run tests against the **live Mailchimp Transactional API**.

 Test Groups  | Environment                                    
---------------|---------------------------------------------------
 mock          | Mock server for Mailchimp Transactional API (Default)  
 live          | Mailchimp Transactional API (Live environment)          

---

## Running Tests with the Mock Server

To run the tests using the mock server (default environment), ensure the `useMock` configuration is set to `true` or left unset in the `Config.toml` file located in the `tests` directory.

### Option 1: Using `Config.toml` File

Create a `Config.toml` file in the `tests` directory with the following content:

```toml
useMock = true
```
### Option 2: Using Environment Variables

On Linux/macOS:
```bash
export useMock=true
```
On Windows:
```bash
setx useMock true
```
Then, run the following command to execute the tests:
```bash
bal test
```
You can also explicitly run only mock group tests:
```bash
bal test --groups mock
```

## Running Tests Against Live Mailchimp Transactional API

To run tests against the actual Mailchimp Transactional API, you must provide a valid Mandrill API key.

### Option 1: Using ```Config.toml``` File

Create a ```Config.toml``` file in the ```tests``` directory with the following:

```bash
useMock = false
MAILCHIMP_API_KEY = "<your-mandrill-api-key>"
```
### Option 2: Using Environment Variables

On Linux/macOS:
```bash
export useMock=true
```
On Windows:
```bash
setx useMock true
```
Then, run the following command to execute the tests:
```bash
bal test --groups live
```

## Running All Tests

To run all test groups (mock by default):
```bash
bal test
```
To run only a specific test group:
```bash
bal test --groups mock
bal test --groups live
```



