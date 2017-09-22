# CustomListItemRelations

The `CustomListItemRelation` resource is the "through" object that links a `CustomListItem` to a `CustomList`. For example, to add a `CustomListItem` named "Peter Lada" to a `CustomList` named "Programmer Conference 2017 Speakers", a new `CustomListItemRelation` object would be created with the id of the "Peter Lada" `CustomListItem` and the id of the "Programmer Conference 2017 Speakers" `CustomList`. When more than one `CustomListItem` exists inside of a `CustomList`, display order can be controlled by the `rank` field on `CustomListItemRelation`.

## Listing CustomListItemRelations

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
id             | int         | id of the Guide object
created_at     | datetime    | Time when Guide was created          
name           | str         | Name of the Guide

### Filtering By id

To filter the listing for one `Guide` in particular you can issue a request with a query parameter `id`. The following request, for examples, filters for `Guide` with `id` 21.

`GET https://builder.guidebook.com/open-api/v1/guides/?id=21`
