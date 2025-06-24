## Add and List Denylisted Emails

This use case demonstrates how the Mailchimp Transactional API can be utilized to manage denylisted emails. The example involves adding an email to the denylist and then retrieving the list of denylisted emails using the Mailchimp Transactional API.

## Prerequisites

### 1. Setup Mailchimp Transactional API

Refer to the [Mailchimp Transactional API Setup Guid](../../README.md#setup-guide) to obtain te necessary Mailchimp API key as follows.

### 2. Configuration

Create a `Config.toml` file in the example's root directory and, provide your Mailchimp API key as follows:

```bash
key = "<Your Mandril API key>"
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```