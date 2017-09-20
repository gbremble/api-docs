# Authentication

> To authorize, use this code:

```python
import requests
api_url = 'https://builder.guidebook.com/example_api/'
api_key = 'JWT API_KEY'
api = requests.get(api_url, headers={'Authorization': api_key})
```
> You must replace `JWT API_KEY` with your personal API key.

THIS IS V2 of the API.  Guidebook offers an REST API to easily manage your data.  Once you have your API key, all API calls need to have the API key included in a header that looks like the following:

`Authorization: JWT API_KEY`

<aside class="notice">
You must replace <code>JWT API_KEY</code> with your personal API key.
</aside>
