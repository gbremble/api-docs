# Spaces

A Space is a branded "container" for a customer's guides. A Space lives within a single custom MobileApp and/or one or more Guidebook flagship apps.

## Listing `Spaces`

```python
import requests

spaces_url = 'https://builder.guidebook.com/open-api/v1/spaces/'
api_key = 'API_KEY'
response = requests.get(spaces_url, headers={'Authorization': 'JWT ' + api_key}).json()
```

> The above command returns JSON structured like this:

```json
{
    "count": 2,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 1,
            "name": "My Space",
            "description": "For all my conferences"
        },
        {
            "id": 2,
            "name": "My Other Space",
            "description": "For all my other conferences"
        }
    ]
}
```

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/spaces/`

### Space Properties

Property           | Type        | Description
---------          | --------    | --------
id                 | int         | id of the `Space` object.
name               | str         | Name of the `Space`.
description        | str         | A description of the `Space`.