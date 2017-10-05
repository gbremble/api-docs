# Locations

`Location` objects can be added to `Sessions` and `CustomListItems` to give users additional context about where an event or point of interest is located.

## Listing `Locations`


```python
import requests

url = 'https://builder.guidebook.com/open-api/v1/locations/'
api_key = 'API_KEY'
response = requests.get(guides_url, headers={'Authorization': 'JWT ' + api_key}).json()
```

> The above command returns JSON structured like this:

```json
{
  "count": 3,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 2,
      "guide": 1,
      "name": "Conference Hall A",
      "description": null,
      "location_type": 2,
      "latitude": null,
      "longitude": null,
      "import_id": null,
      "created_at": "2017-08-31T20:18:28.018529+0000"
    },
    {
      "id": 3,
      "guide": 1,
      "name": "Lobby",
      "description": null,
      "location_type": 2,
      "latitude": null,
      "longitude": null,
      "import_id": null,
      "created_at": "2017-08-31T20:18:28.038556+0000"
    },
    {
      "id": 4,
      "guide": 1,
      "name": "Meeting Place",
      "description": null,
      "location_type": 3,
      "latitude": 37.7749,
      "longitude": -122.4194,
      "import_id": null,
      "created_at": "2017-08-31T20:18:28.052157+0000"
    }
  ]
}
```


### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/locations/`

### Location Properties

Property          | Type        | Description
---------         | --------    | --------
id                | integer     | id of the `Location` object.
created_at        | datetime    | Time when this `Location` was created - UTC.
guide             | integer     | id of the `Guide` this `Location` belongs to.
name              | string      | Name of this `Location`.
import_id         | string      | A string field you can used to input your own identifier. This is for when you have your own IDs for `Locations` in your data store.
location_type     | integer     | Either 2 or 3. If 3, indicates that this `Location` is a "google maps Location"; if `location_type=3` latitude and longitude are required.
latitude          | float       | Latitude of this `Location` - only required if this `Location` has `location_type=3` ("google maps `Location`").
longitude         | float       | Longitude of this `Location` - only required if this `Location` has `location_type=3` ("google maps `Location`").

### Filtering `Locations`

To filter the returned `Locations` by their `location_type` include the query parameter `location_type`. The following request, for examples, filters for `Locations` with `location_type` 2.

`GET https://builder.guidebook.com/open-api/v1/locations/?location_type=2`

## Creating `Locations`


```python

url = 'https://builder.guidebook.com/open-api/v1/locations/'
api_key = 'API_KEY'
post_data =
{
  "guide": 1,
  "name": "Stadium",
  "description": null,
  "location_type": 3,
  "latitude": 37.3327,
  "longitude": -121.901236,
  "import_id": null
}
response = requests.post(url, data=post_data, headers={'Authorization': 'JWT ' + api_key}).json()
```

> The above command returns JSON structured like this:

```json
{
  "id": 89,
  "guide": 1,
  "name": "Stadium",
  "description": null,
  "location_type": 3,
  "latitude": 37.3327,
  "longitude": -121.901236,
  "import_id": null,
  "created_at": "2017-09-25T20:18:28.052157+0000"
}
```


### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/locations/`

## Manipulating Individual `Locations`


> Update the name of a `Location`

```python

url = 'https://builder.guidebook.com/open-api/v1/locations/156/'
api_key = 'API_KEY'
patch_data =
{
  "name": "San Jose Sharks Stadium"
}
response = requests.patch(url, data=patch_data, headers={'Authorization': 'JWT ' + api_key}).json()
```

> PATCH requests (to update) and GET requests (to retrieve) an individual Location will return a JSON structure like this:

```json
{
  "id": 89,
  "guide": 1,
  "name": "San Jose Sharks Stadium",
  "description": null,
  "location_type": 3,
  "latitude": 37.3327,
  "longitude": -121.901236,
  "import_id": null,
  "created_at": "2017-09-25T20:18:28.052157+0000"
}
```


To access and manipulate an individual `Location` object, use a url that ends with the id of a `Location` object:

`https://builder.guidebook.com/open-api/v1/locations/<location_id>/`

## Retrieving a Location
In the following examples, we will assume that the id of the `Locations` we'd like to modify is 89.
To retrieve an individual `Location` object, issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/locations/89/`

## Updating a `Location`

To modify an existing `Location` object, issue a `PATCH` request like:

`PATCH https://builder.guidebook.com/open-api/v1/locations/89/`

## Deleting a `Location`

To delete a particular `Location`, issue a `DELETE` request to the url that points to the specific `Location` you'd like deleted:

`DELETE https://builder.guidebook.com/open-api/v1/locations/89/`
