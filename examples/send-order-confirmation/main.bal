import ballerina/io;
import ballerinax/mailchimp.'transactional as mailchimp;

configurable string key = ?;
const string SERVER_URL = "https://mandrillapp.com/api/1.0";
final mailchimp:Client mailchimp = check new ({}, SERVER_URL);

public function main() returns error? {
    mailchimp:MessagesSendBody payload = {
        'key: key,
        // message: {
        //     fromEmail: "noreply@yourdomain.com",
        //     to: [{email: "email@example.com"}],
        //     subject: "Your Order Confirmation",
        //     text: "Hi there,\n\nThank you for your order. Your package will be shipped soon!",
        //     autoText: true
        // }
        message: {
            fromEmail: "senura.20232013@iit.ac.lk",
            to: [{email: "senura.hesara48@gmail.com"}],
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

    string? messageId = sendResponse[0].id;
    mailchimp:MessagesInfoBody infoPayload = {
        'key: key,
        id: messageId.toString()
    };

    mailchimp:InlineResponse20032 messageInfo = check mailchimp->/messages/info.post(infoPayload);
    io:println("Messages Info : ", messageInfo);
}

