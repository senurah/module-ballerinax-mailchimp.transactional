# Ballerina MailChimp Transactional Emails connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-mailchimp.transactional/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-mailchimp.transactional/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-mailchimp.transactional.svg)](https://github.com/ballerina-platform/module-ballerinax-mailchimp.transactional/commits/master)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/mailchimp.transactional.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%mailchimp.transactional)

## Overview

[Mailchimp Transactional Email](https://mailchimp.com/developer/transactional/) is a reliable and scalable email delivery service provided by Intuit Mailchimp, designed for sending data-driven transactional emails such as password resets, order confirmations, and notifications.

The `ballerinax/mailchimp.transactional` package provides APIs to connect and interact with the [Mailchimp Transactional API](https://mailchimp.com/developer/transactional/api/), enabling seamless integration with applications to manage transactional email sending, templates, messages, and more.

## Setup guide

To use the Mailchimp Transactional Email connector, you need to have a Mailchimp account and access to a Mandrill API key. Follow the steps below to set up your account and generate the required API key.

### Step 1: Create a Mailchimp account

1. Go to the [Mailchimp Sign Up Page](https://login.mailchimp.com/signup/) and create a Mailchimp account.

2. Once signed in, click on your profile icon in the bottom-left corner to access the account menu.

    ![Mailchimp Dashboard](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-mailchimp.transactional/refs/heads/main/docs/setup/resources/mailchimp-dashboard.png)
    ![Mailchimp Profile Menu](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-mailchimp.transactional/refs/heads/main/docs/setup/resources/mailchimp-menu.png)

### Step 2: Enable transactional email

1. In the menu, go to **Billing**.

    ![Mailchimp Billing Section](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-mailchimp.transactional/refs/heads/main/docs/setup/resources/mailchimp-billing.png)

2. Under **Monthly plans or credits**, select the **Transactional email** plan (you can start with the demo plan).

    ![Transactional Email Plan](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-mailchimp.transactional/refs/heads/main/docs/setup/resources/mailchimp-transactional-setup.png)

### Step 3: Generate a Mandrill API key

1. After enabling the transactional email feature, navigate to the **Extras** section and click on **API keys**.

    ![Mailchimp Extra Section](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-mailchimp.transactional/refs/heads/main/docs/setup/resources/mailchimp-api-key-menu.png)

2. Choose **Create Mandrill API key** (not the regular API key). You will be redirected to the [MandrillApp Dashboard](https://mandrillapp.com/).

    ![Mailchimp API Selection](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-mailchimp.transactional/refs/heads/main/docs/setup/resources/mailchimp-create-api-key.png)

3. In the MandrillApp dashboard, click **Add API key** to generate your key.

    ![Mandrill API Key](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-mailchimp.transactional/refs/heads/main/docs/setup/resources/mailchimp-create-mandril-key.png)

4. Copy the generated API key. You will need this to authenticate your connector.

    ![Create Mandrill API key](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-mailchimp.transactional/refs/heads/main/docs/setup/resources/validate-api-key-info.png)

## Quickstart

To use the `Mailchimp Transactional` connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

Import the `mailchimp.transactional` module.

```ballerina
import ballerinax/mailchimp.'transactional as mailchimp;
```
### Step 2: Configure the API key

1. Create a `Config.toml` file and add your Mandrill API key obtained from the setup process:

```bash
key = "<Access Token>"
```

2. Declare the key as a configurable variable and create a `mailchimp.transactional:Client` instance:

```ballerina
configurable string key = ?;
const string SERVER_URL = "server-url";

final mailchimp:Client mailchimp = check new ({}, SERVER_URL);
```

### Step 3: Send a transactional email

Here’s how you can send a simple transactional email using the connector:

```ballerina
public function main() returns error? {
    mailchimp:MessagesSendBody payload = {
        key,
        message: {
            fromEmail: "noreply@yourdomain.com",
            to: [{ email: "customer@example.com"}],
            subject: "Your Order Confirmation",
            text: "Text",
            autoText: true
            
        }
    };
    mailchimp:InlineResponse20028[] sendResponse = check mailchimp->/messages/send.post(payload);
    if sendResponse.length() == 0 {
        io:println("No responses received.");
        return error("Empty response from Mailchimp API");
    }

    foreach var response in sendResponse {
        io:println("Email sent successfully: ", response.toBalString());
    }
}

```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

The `MailChimp Transactional Emails` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-mailchimp.transactional/tree/main/examples/), covering the following use cases:

1. [**Transactional Template Flow**](https://github.com/ballerina-platform/module-ballerinax-mailchimp.transactional/tree/main/examples/transactional-template-flow): Shows how to create, publish, render, list, and delete templates.
2. [**Webhook Lifecyle**](https://github.com/ballerina-platform/module-ballerinax-mailchimp.transactional/tree/main/examples/webhook-lifecycle): Demonstrates creating, retrieving, updating, and deleting webhooks.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`mailchimp.transactional` package](https://central.ballerina.io/ballerinax/mailchimp.transactional/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
