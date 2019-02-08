# Example Implementations

Our [public github repo](https://github.com/Guidebook/) contains several source code samples of how to integrate Guidebook with other services.  These are provided as an additional resource to assist developers in learning about the possiblities enabled with our API.  Clients are welcome to use these examples as a starting point to create their own custom integrations.

## Eventbrite Integration
Our [Eventbrite Integration](https://github.com/Guidebook/guidebook-eventbrite-integration) is the open sourced code of how the default Eventbrite integration in [Guidebook Builder](https://builder.guidebook.com/) runs.  The standard integration imports Attendees from Eventbrite and groups them by Ticket Type.  If you would like to run your own custom Eventbrite integration, you can use this code as a starting point.

## Icalendar Integration
Icalendar is a popular format for representing schedules.  The [Icalendar Integration](https://github.com/Guidebook/guidebook-ical-integration) example we provide shows how you can import session data into Guidebook from an ical source.  Icalendar feeds can be incredibly complicated and if your ical feed incorporates non standard properties (X-prefixed properties), you can customize our ical integration to fit your needs.
