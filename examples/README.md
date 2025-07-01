# Examples

The `ballerinax/mailchimp.transactional` connector provides practical examples illustrating usage in various scenarios.

1. Transactional Template Flow: Shows how to create, publish, render, list, and delete templates.
2. Webhook Lifecyle: Demonstrates creating, retrieving, updating, and deleting webhooks.

## Prerequisites

### 1. Mailchimp Transactional API key

To use this example, you need a valid **Mailchimp Transactional (Mandrill) API key**.

Follow the steps in the [Mailchimp Transactional API Setup Guide](https://github.com/ballerina-platform/module-ballerinax-mailchimp.transactional/tree/main/README.md#setup-guide) to obtain the key.

### 2. Configuration

Create a `Config.toml` file in the root directory of this example and add your API key:

```toml
key = "<Your Mandrill API key>"
```

## Running an example

Execute the following commands to build an example from the source:

- To build an example:

  ```bash
  bal build
  ```

- To run an example:

  ```bash
  bal run
  ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

- To build all the examples:

  ```bash
  ./build.sh build
  ```

- To run all the examples:

  ```bash
  ./build.sh run
  ```
