codeunit 50002 "SK API EXEMPLE"
{
    Subtype = Normal;

    procedure CallExternalAPI()
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        JsonObject: JsonObject;
        JsonText: Text;
        StatusCode: Integer;
    begin
        // Build JSON payload
        JsonObject.Add('name', 'John Doe');
        JsonObject.Add('email', 'john@example.com');
        JsonObject.WriteTo(JsonText);

        // Prepare HTTP request
        Request.Method := 'POST';
        Request.SetRequestUri('https://api.example.com/customers'); // Replace with your API endpoint

        // Set request content and headers
        Content.WriteFrom(JsonText);
        Content.GetHeaders().Clear();
        Content.GetHeaders().Add('Content-Type', 'application/json');
        Request.Content := Content;

        // Optional: Add authentication header (Bearer token example)
        Request.GetHeaders().Add('Authorization', 'Bearer YOUR_ACCESS_TOKEN');

        // Send request
        if Client.Send(Request, Response) then begin
            StatusCode := Response.HttpStatusCode();
            Response.Content().ReadAs(JsonText);

            if StatusCode >= 200 and StatusCode < 300 then
                Message('Success! Status: %1, Response: %2', StatusCode, JsonText)
            else
                Error('API call failed. Status: %1, Response: %2', StatusCode, JsonText);
        end else
            Error('Failed to send HTTP request.');
    end;
}
