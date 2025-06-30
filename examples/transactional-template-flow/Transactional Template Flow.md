# Transactional Template Flow Example

This example demonstrates how to manage the lifecycle of a transactional email template using the Mailchimp Transactional API. It covers:

- Creating a new email template
- Publishing the template
- Rendering the template with custom content
- Listing existing templates
- Deleting a template

This workflow is useful in scenarios where dynamic, transactional email templates are created and customized programmatically - such as user onboarding, password resets, or personalized notifications.

---

## Prerequisites

### 1. Mailchimp Transactional API Key

To use this example, you need a valid **Mailchimp Transactional (Mandrill) API key**.

Follow the steps in the [Mailchimp Transactional API Setup Guide](https://github.com/ballerina-platform/module-ballerinax-mailchimp.transactional/tree/main/README.md#setup-guide) to obtain the key.

### 2. Configuration

Create a `Config.toml` file in the root directory of this example and add your API key:

```toml
key = "<Your Mandrill API key>"
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```

## Example Output

The program will:

- Add and publish a new transactional template.
- Render the template with given content.
- List all available templates.
- Delete the created template.

## Notes

- The example uses `templateName = "signup-template"` as the template name. You can modify it based on your use case.
- Ensure your API key has sufficient permissions for all operations.
