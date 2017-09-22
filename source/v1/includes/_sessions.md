# Sessions

## How to Create a Session


```python
import requests

session_url =  'http://builder.guidebook.com/open-api/v1/session/'
post_data =
{
	"start_time": "2017-09-18T16:00:00",
	"end_time": "2017-09-18T17:00:00",
	"guide": 1,
	"description_html": "<p>This is a description field that supports basic HTML</p>",
	"name": "Test Session Created via the Open API"
}
response = request.post(session_url, data=post_data)

# example with schedule tracks
post_data =
{
	"start_time": "2017-09-18T16:00:00",
	"end_time": "2017-09-18T17:00:00",
	"guide": 1,
	"description_html": "<p>This is a description field that supports basic HTML</p>",
	"name": "Test Session Created via the Open API",
	"schedule_tracks": [3,42,47,101]
}
response = request.post(session_url, data=post_data)

```

> The above command returns JSON structured like this:

```json
{
	"id": 106,
	"created_at": "2017-09-18T22:13:25.766623+0000",
	"last_updated": "2017-09-18T22:13:25.766653+0000",
	"start_time": "2017-09-18T16:00:00.000000+0000",
	"end_time": "2017-09-18T17:00:00.000000+0000",
	"all_day": false,
	"name": "Test Session Created via the Open API",
	"description_html": "<p>This is a description field that supports basic HTML</p>",
	"image": null,
	"thumbnail": null,
	"import_id": null,
	"allow_rating": false,
	"add_to_schedule": false,
	"guide": 1,
	"schedule_tracks": []
}
# example with schedule tracks
{
	"id": 106,
	"created_at": "2017-09-18T22:13:25.766623+0000",
	"last_updated": "2017-09-18T22:13:25.766653+0000",
	"start_time": "2017-09-18T16:00:00.000000+0000",
	"end_time": "2017-09-18T17:00:00.000000+0000",
	"all_day": false,
	"name": "Test Session Created via the Open API",
	"description_html": "<p>This is a description field that supports basic HTML</p>",
	"image": null,
	"thumbnail": null,
	"import_id": null,
	"allow_rating": false,
	"add_to_schedule": false,
	"guide": 1,
	"schedule_tracks": [3,42,47,101]
}
```


This endpoint will create a session for your guide.

### HTTP Request

`POST http://builder.guidebook.com/open-api/v1/session/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
guide           | yes | integer  | The specific guide your session belongs to.  See section on Guides for more info.
name            | yes | string   | The title of your session.
description_html| yes | string   | A text description of the session. This field supports basic HTML.
start_time      | yes | datetime | The start time of the event,
end_time        | no  | datetime | The end time of the event.  Leave blank for all day events.
all_day         | no  | boolean  | A boolean value indicating if a session runs for the entire day.
allow_rating    | no  | boolean  | A boolean value indicating if end-users can rate this session.
add_to_schedule | no  | boolean  | A boolean value indicating if end-users can add this session to their personal schedule.
image           | no  | image file | Image file displayed above the session description in the app.
thumbnail       | no  | image file | Image file displayed in list views of the schedule.
import_id       | no  | string     | A string field you can used to input your own identifier.  This is for when you have your own IDs for sessions in your data store.
schedule_tracks | no  | list of integers | List of IDs of Schedule Tracks this session should belong to.  See section on Schedule Tracks.


<aside class="success">
Remember — don't forget to include your API key in the `Authorization` header!
</aside>
