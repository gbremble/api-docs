# A Note on Timezones + UTC

Guidebook's servers, internally, store all inputted datetime values in the [Universal Time Zone (UTC)](https://en.wikipedia.org/wiki/Coordinated_Universal_Time). As such, when the Guidebook Open API reports a datetime, it returns a datetime value in UTC. For example, `Guide.created_at`,  `Session.start_time`, and `Session.end_time` all report themselves in UTC. To minimize confusion and error, we recommend that your applications send datetimes to the Guidebook Open API in UTC. For example, `2017-09-26T09:35:00.000000-0700` ("September 26th 2017 9:35AM US/Pacific") would be sent as `2017-09-26T16:35:00.000000+0000` ("September 26th 2017 4:35PM UTC").



guide timezone


we are possibly ISO8601 compliant??

Notes about guaranteed return format

perhaps give the c print formatters used?


in iso notation??? 	yyyy-mm-ddThh:mm:ss.nnnnnn+|-hhmm

we suggest communicating strictly in UTC
