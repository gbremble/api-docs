# Schedule Tracks

## How to Create a Schedule Track


```python
import requests

schedule_tracks_url =  'http://builder.guidebook.com/open-api/v1/schedule-tracks/'
api_key = 'API_KEY'
post_data =
{
	"guide": 1,
	"name": "Test Schedule Track Created via the Open API",
	"color": "#000080"
}
response = request.post(schedule_tracks_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
	"id": 234,
	"guide": 337,
	"name": "Test Schedule Track Created via the Open API",
	"color": "#000080"
}

```


This endpoint will create a Schedule Track for your guide.

### HTTP Request

`POST http://builder.guidebook.com/open-api/v1/schedule-tracks/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
guide           | yes | integer  | The specific guide your Schedule Track belongs to.  See section on Guides for more info.
name            | yes | string   | The title of your Schedule Track.
color           | no  | string   | Hex value of the color you want this track to be. Used for highlighting sessions in the app.
Example: "#000080" for blue.


## How to Fetch Data on Schedule Tracks


```python
import requests

schedule_tracks_url =  'http://builder.guidebook.com/open-api/v1/schedule-tracks/'
api_key = 'API_KEY'

# This will return all schedule tracks you have access to
response = request.get(schedule_tracks_url, headers={'Authorization': 'JWT ' + api_key})

# This will return all Schedule Tracks for a guide you have access to. Guide 47 in this example
response = request.get('{}guide=47'.format(schedule_tracks_url), headers={'Authorization': 'JWT ' + api_key})

# This will return a specific Schedule Track.  Schedule Track number 1234 in this example
response = request.get('{}1234/'.format(schedule_tracks_url), headers={'Authorization': 'JWT ' + api_key})


```

> The above command returns JSON structured like this:

```json
{
	"count": 4,
	"next": null,
	"previous": null,
	"results": [
		{
			"id": 210,
			"guide": 308,
			"name": "Test Track 1",
			"color": null
		},
		{
			"id": 211,
			"guide": 308,
			"name": "Test Track 2",
			"color": null
		},
		{
			"id": 212,
			"guide": 308,
			"name": "Test Track 3",
			"color": null
		},
		{
			"id": 213,
			"guide": 309,
			"name": "Test Track 4, Different Guide",
			"color": null
		}
	]
}
```


This endpoint can also be used to read data on Schedule Tracks.

### HTTP Request

`GET http://builder.guidebook.com/open-api/v1/schedule-tracks/`

### Model Fields

Same as the fields used in creation.
