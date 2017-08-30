# Sessions

## Get All Sessions for your Guide


```python
import requests

some_fake_python = request.get(session_url)
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Very Interesting Session",
    "description": "This session is awesome",
    "start_time": "2017-08-09",
    "end_time": "datetime string"
  },
  {
    "id": 2,
    "name": "Very Interesting Session #2",
    "description": "This session is even better",
    "start_time": "2017-08-09",
    "end_time": "datetime string"
  }
]
```

This endpoint retrieves all sessions.

### HTTP Request

`GET http://builder.guidebook.com/open-api/v1/sessions`

### Query Parameters

Parameter | Required | Type    | Description
--------- | -------- | ------- | -----------
guide_id  | yes      | integer | The specific guide you want to fetch session data for

<aside class="success">
Remember — don't forget to include your API key in the `Authorization` header!
</aside>

## Get a Specific Session

```python
import python

python.magic()
```