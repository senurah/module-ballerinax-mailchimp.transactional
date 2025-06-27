# Webhook Lifecycle 

This example demonstrates how to manage the full lifecycle of a webhook using the Mailchimp Transactional API. It covers:

- Creating a webhook
- Retrieving webhook information
- Updating an existing webhook
- Deleting the webhook

This is useful for scenarios where webhooks are used to receive notifications from Mailchimp about events such as email opens, clicks, bounces, and more.

---

## Prerequisites

### 1. Mailchimp Transactional API Key

You need a valid **Mailchimp Transactional (Mandrill) API key**.

Refer to the [Mailchimp Transactional API Setup Guide](../../README.md#setup-guide) to obtain your API key.

### 2. Webhook Receiver (Optional for Testing)

To test webhook creation with a real endpoint, you can use services like:

- [https://webhook.site](https://webhook.site)
- [https://requestbin.com](https://requestbin.com)

These will provide you with a temporary public URL to act as a webhook receiver.

---

## Configuration

Create a `Config.toml` file in the root directory of the example with the following content:

```toml
key = "<Your Mandrill API key>"
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```

##  Example Output

- Adds a Webhook using the provided URL.
- Retrieves the Webhook Info using its ID.
- Updates the Webhook (can be extended to modify the URL or description).
- Deletes the Webhook for cleanup.

All steps are printed to the console as they complete.

## Notes
- Replace the webhook URL with your own generated URL when testing live.
- Ensure your API key has the required permissions.



