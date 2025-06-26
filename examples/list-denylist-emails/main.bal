import ballerina/io;
import ballerinax/mailchimp.'transactional as mailchimp;

configurable string key = ?;
const string SERVER_URL = "https://mandrillapp.com/api/1.0";
final mailchimp:Client mailchimp = check new ({}, SERVER_URL);

public function main() returns error? {
    mailchimp:RejectsAddBody addPayload = {
        'key: key,
        email: "test@example.com",
        comment: "Testing denylist functionality"
    };

    mailchimp:InlineResponse20040 addResponse = check mailchimp->/rejects/add.post(addPayload);
    if addResponse is mailchimp:InlineResponse20040 {
        io:println("Email added to denylist successfully :", addResponse.toString());
    }

    mailchimp:RejectsListBody listPayload = {
        'key: key,
        includeExpired: true,
        email: "test@example.com"
    };

    mailchimp:InlineResponse20041[] listResponse = check mailchimp->/rejects/list.post(listPayload);
    if listResponse.length() == 0 {
        io:println("No denylisted emails found");
        return;
    }

    io:println("List Response: ", listResponse.toString());
    foreach mailchimp:InlineResponse20041 entry in listResponse {
        io:println("Denied Email :", entry.email.toString());
        io:println("Reason :", entry.reason.toString());
    }
}
