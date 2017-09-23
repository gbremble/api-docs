# Guides

Many of the resources exposed by the Guidebook Open API relate to a class of objects called `Guide`. `Guide` objects are typically containers for the set of data related to an event like a conference. For example, if you were hosting a conference called, "Programmer Summit 2017" you would likely have one `Guide` object that contained the schedule for the conference, a list of speakers for that conference, and a list of users who you expect to attend the conference.

As of now, `Guide` objects themselves are primarily managed via the [Guidebook Builder CMS](https://builder.guidebook.com) (and not via the Open API). Resources exposed by the Open API, however, will contain references to the id of `Guide` objects they belong to. For example, every `Session` object returned in the Open API will report the id of the one `Guide` that `Session` belongs to (e.g. `"guide": 1`). In general, resources cannot be transferred or otherwise shared amongst more than one `Guide` -- once a `Session` is created under a given `Guide` object, it lives under that `Guide` permanently and cannot be moved to a different `Guide`.

## Listing Guides

```python
import requests

guides_url = 'https://builder.guidebook.com/open-api/v1/guides/'
api_key = 'API_KEY'
response = requests.get(guides_url, headers={'Authorization': 'JWT ' + api_key}).json()
```

> The above command returns JSON structured like this:

```json
{
	"count": 2,
	"next": null,
	"previous": null,
	"results": [
		{
			"id": 21,
			"created_at": "2017-09-18T21:28:35.429989+0000",
			"name": "Programmer Summit 2017"
		},
		{
			"id": 22,
			"created_at": "2017-09-18T21:28:35.436433+0000",
			"name": "Programmer Summit 2018"
		}
	]
}
```

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/guides/`

### Guide Properties

Property       | Type        | Description
---------      | --------    | --------    
id             | int         | id of the Guide object.
created_at     | datetime    | Time when Guide was created -- in UTC.
name           | str         | Name of the Guide.

### Filtering By id

To filter the listing for one `Guide` in particular you can issue a request with a query parameter `id`. The following request, for examples, filters for `Guide` with `id` 21.

`GET https://builder.guidebook.com/open-api/v1/guides/?id=21`
