# Sessions

## How to Create a Session


```python
import requests

session_url =  'http://builder.guidebook.com/open-api/v1/session/'
post_data =
{
	"start_time": "2017-09-18T16:00:00",
	"end_time": "2017-09-18T17:00:00",
	"guide": "1",
	"description_html": "<p>This is a description field that supports basical HTML</p>",
	"name": "Test Session Created via Open API"
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
	"name": "Test Session Created via Open API",
	"description_html": "<p>This is a description field that supports basical HTML</p>",
	"image": null,
	"thumbnail": null,
	"import_id": null,
	"allow_rating": false,
	"add_to_schedule": false,
	"guide": 1,
	"schedule_tracks": [],
	"locations": []
}
```



This endpoint will create a session for your guide.

### HTTP Request

`POST http://builder.guidebook.com/open-api/v1/session/`

### Model Fields

Parameter | Required | Type    | Description
--------- | -------- | ------- | -----------
guide_id  | yes      | integer | The specific guide your session belongs to
name      | yes      | string  | The title of your session
description_html| yest | string | A text description of the session.  This field supports basic HTML.

<aside class="success">
Remember — don't forget to include your API key in the `Authorization` header!
</aside>
