# Webhook lifecycle

This example demonstrates how to manage the full lifecycle of a webhook using the Mailchimp Transactional API. It covers:

- Creating a webhook
- Retrieving webhook information
- Updating an existing webhook
- Deleting the webhook

This is useful for scenarios where webhooks are used to receive notifications from Mailchimp about events such as email opens, clicks, bounces, and more.

---

## Prerequisites

### 1. Mailchimp Transactional API key

You need a valid **Mailchimp Transactional (Mandrill) API key**.

Follow the steps in the [Mailchimp Transactional API Setup Guide](https://github.com/ballerina-platform/module-ballerinax-mailchimp.transactional/tree/main/README.md#setup-guide) to obtain the key.

### 2. Webhook receiver (Optional for testing)

To test webhook creation with a real endpoint, you can use services like:

- [https://webhook.site](https://webhook.site)
- [https://requestbin.com](https://requestbin.com)

These will provide you with a temporary public URL to act as a webhook receiver.

---

## Configuration

Create a `Config.toml` file in the root directory of the example with the following content:

```toml
key = "<Your Mandrill API key>"
webhookURL="Your Webhook URL"
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```

## Example output

- Adds a Webhook using the provided URL.
- Retrieves the Webhook Info using its ID.
- Updates the Webhook (can be extended to modify the URL or description).
- Deletes the Webhook for cleanup.

All steps are printed to the console as they complete.

## Notes

- Replace the webhook URL with your own generated URL when testing live.
- Ensure your API key has the required permissions.
