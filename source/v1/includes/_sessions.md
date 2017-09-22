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


## How to Fetch Data on a Session


```python
import requests

session_url =  'http://builder.guidebook.com/open-api/v1/session/'

# This will return all sessions you have access to
response = request.get(session_url, data=post_data)

# This will return all sessions for a guide you have access to. Guide 47 in this example

response = request.get('{}guide=47'.format(session_url), data=post_data)

# This will return a specific session.  Session number 8348 in this example
response = request.get('{}8348/'.format(session_url), data=post_data)


```

> The above command returns JSON structured like this:

```json
{
	"count": 4,
	"next": null,
	"previous": null,
	"results": [
		{
			"id": 21,
			"created_at": "2017-09-18T21:28:35.429989+0000",
			"last_updated": "2017-09-18T21:28:35.430011+0000",
			"start_time": "2017-09-18T21:28:35.428248+0000",
			"end_time": "2017-09-18T22:28:35.428257+0000",
			"all_day": false,
			"name": "Test Session 1",
			"description_html": null,
			"image": null,
			"thumbnail": null,
			"import_id": null,
			"allow_rating": true,
			"add_to_schedule": true,
			"guide": 42,
			"schedule_tracks": []
		},
		{
			"id": 22,
			"created_at": "2017-09-18T21:28:35.432366+0000",
			"last_updated": "2017-09-18T21:28:35.432388+0000",
			"start_time": "2017-09-18T21:28:35.431034+0000",
			"end_time": "2017-09-18T22:28:35.431042+0000",
			"all_day": false,
			"name": "Test Session 2",
			"description_html": null,
			"image": null,
			"thumbnail": null,
			"import_id": null,
			"allow_rating": true,
			"add_to_schedule": true,
			"guide": 42,
			"schedule_tracks": []
		},
		{
			"id": 23,
			"created_at": "2017-09-18T21:28:35.434402+0000",
			"last_updated": "2017-09-18T21:28:35.434422+0000",
			"start_time": "2017-09-18T21:28:35.433197+0000",
			"end_time": "2017-09-18T22:28:35.433205+0000",
			"all_day": false,
			"name": "Test Session 3",
			"description_html": null,
			"image": null,
			"thumbnail": null,
			"import_id": null,
			"allow_rating": true,
			"add_to_schedule": true,
			"guide": 42,
			"schedule_tracks": []
		},
		{
			"id": 24,
			"created_at": "2017-09-18T21:28:35.436433+0000",
			"last_updated": "2017-09-18T21:28:35.436452+0000",
			"start_time": "2017-09-18T21:28:35.435265+0000",
			"end_time": "2017-09-18T22:28:35.435273+0000",
			"all_day": false,
			"name": "Test Session 4, Different Guide",
			"description_html": null,
			"image": null,
			"thumbnail": null,
			"import_id": null,
			"allow_rating": true,
			"add_to_schedule": true,
			"guide": 43,
			"schedule_tracks": []
		}
	]
}
```


This endpoint can also be used to read data on sessions.

### HTTP Request

`GET http://builder.guidebook.com/open-api/v1/session/`

### Model Fields

Same as the fields used in creation.
