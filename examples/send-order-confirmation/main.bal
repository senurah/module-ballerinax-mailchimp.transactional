import ballerina/io;
import ballerinax/mailchimp.'transactional as mailchimp;

configurable string key=?;
string serviceUrl = "https://mandrillapp.com/api/1.0";
mailchimp:ConnectionConfig conConfig = check {};

final mailchimp:Client mailchimp = check new(conConfig,serviceUrl);

public function main() returns error? {
    mailchimp:MessagesSendBody payload = {
        'key: key,
        message: {
            fromEmail: "noreply@yourdomain.com",
            to: [{ email: "customer@example.com"}],
            subject: "Your Order Confirmation",
            text: "Hi there,\n\nThank you for your order. Your package will be shipped soon!",
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

