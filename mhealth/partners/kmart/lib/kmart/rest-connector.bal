import ballerina/http;

type EDIData record {|
    string ediType;
    string fileName?;
    string content;
|};

service /kmart_edi on new http:Listener(9090) {

    resource function get albums() returns Album[] {
        return albums.toArray();
    }

    resource function post r_834(EDIData ediData) returns anydata {
                     
    }
}