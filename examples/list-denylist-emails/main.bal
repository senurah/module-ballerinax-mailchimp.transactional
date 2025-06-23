import ballerina/io;
import ballerinax/mailchimp.transactional;

configurable string apiKey = ?;
transactional:ConnectionConfig config = check  {};

public function main() {
    io:println("Hello, World!",apiKey);
}
