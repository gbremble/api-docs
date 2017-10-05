# Attendees

## How to Create a `Attendee`


```python
import requests

attendees_lists_url =  'https://builder.guidebook.com/open-api/v1/attendees/'
api_key = 'API_KEY'
post_data =
{
	"guide": 1,
	"email": "open_api@example.com",
	"first_name": "Open API",
	"last_name": "Example User"
}
response = request.post(attendees_lists_url, data=post_data, headers={'Authorization': 'JWT ' + api_key})

```

> The above command returns JSON structured like this:

```json
{
	"id": 1,
	"guide_id": 1,
	"account_id": 2,
	"first_name": "Open API",
	"last_name": "Example User",
	"email": "open_api@example.com",
	"avatar": null,
	"cover": null,
	"app_profile": {
		"website": "",
		"position": "",
		"company": "",
		"contact_email": ""
	},
	"revoked": false,
	"status": 0
}

```


This endpoint will create an `Attendee` that is owned by your `Account`.  An `Attendee` is an object that formally defines a relation between a `Guide` and a Guidebook App end-user.  When importing your `Attendees`, we will attempt to match to existing users in the Guidebook database.  If no user is found via email matching, we will create a placeholder `Account` that the end-user can later claim by logging in.  Email invite functionality is not available via the Open API.  To send out email invites to your Attendees, please login to Builder and use the UI to send out email invites.

### HTTP Request

`POST https://builder.guidebook.com/open-api/v1/attendees/`

### Model Fields

Parameter       | Required  | Type    | Description
---------       | --------  | ------- | -----------
guide           | yes | integer  | The specific `Guide` your `Attendee` belongs to.  See section on [Guides](#guides) for more info.
email           | yes | string    | Email address of the `Attendee`.  We will search existing Guidebook users and attempt to associate with an existing account.
first_name      | no  | string    | First name of the Attendee.  Only used if no existing Guidebook Account was found via email matching. Otherwise, this field is ignored.
last_name      | no  | string    | Last name of the Attendee.  Only used if no existing Guidebook Account was found via email matching. Otherwise, this field is ignored.



## How to Fetch Data on `Attendees`


```python
import requests

attendees_url =  'https://builder.guidebook.com/open-api/v1/attendees/'
api_key = 'API_KEY'

# This will return all attendees you have access to
response = request.get(attendees_url, headers={'Authorization': 'JWT ' + api_key})
```

> The above command returns JSON structured like this:

```json
{
	"count": 4,
	"next": null,
	"previous": null,
	"results": [
		{
			"id": 2,
			"guide_id": 2,
			"account_id": 4,
			"first_name": "",
			"last_name": "",
			"email": "a@example.com",
			"avatar": null,
			"cover": null,
			"app_profile": {
				"website": "",
				"position": "",
				"company": "",
				"contact_email": ""
			},
			"revoked": false,
			"status": 1
		},
		{
			"id": 3,
			"guide_id": 2,
			"account_id": 5,
			"first_name": "",
			"last_name": "",
			"email": "b@example.com",
			"avatar": null,
			"cover": null,
			"app_profile": {
				"website": "",
				"position": "",
				"company": "",
				"contact_email": ""
			},
			"revoked": false,
			"status": 1
		},
		{
			"id": 4,
			"guide_id": 2,
			"account_id": 6,
			"first_name": "",
			"last_name": "",
			"email": "c@example.com",
			"avatar": null,
			"cover": null,
			"app_profile": {
				"website": "",
				"position": "",
				"company": "",
				"contact_email": ""
			},
			"revoked": false,
			"status": 1
		},
		{
			"id": 5,
			"guide_id": 3,
			"account_id": 7,
			"first_name": "",
			"last_name": "",
			"email": "d@example.com",
			"avatar": null,
			"cover": null,
			"app_profile": {
				"website": "",
				"position": "",
				"company": "",
				"contact_email": ""
			},
			"revoked": false,
			"status": 1
		}
	]
}
```


This endpoint can also be used to read data on `Attendees`.  Typically, this endpoint is called with a `guide_id` filter such that it returns a list of `Attendees` associated to a lone `Guide` object that is owned by you.

### HTTP Request

`GET https://builder.guidebook.com/open-api/v1/attendees/`

### Model Fields

The fields returned in the `GET` responses are far more detailed and include the following fields:

Parameter       | Type    | Description
---------       | ------- | -----------
id              | integer  | An unique identifier for your `Attendee`.
created_at      | datetime | Time when this `Attendee` was created - UTC.
guide_id        | integer  | The specific `Guide` your `Attendee` belongs to.  See section on [Guides](#guides) for more info.
account_id      | integer  | The unique ID for the `Account` object that this attendee is linked to.
first_name      | string   | First name of the `Attendee`.
last_name       | string   | Last name of the `Attendee`.
email           | string   | Email address of the `Attendee`.
avatar          | string   | URL to the avatar image for this `Attendee`.
cover           | string   | URL to the cover (background) image for the `Attendee`.
app_profile     | dictionary of strings | Contains profile information filed out by the `Attendee`.  Possible keys include `company`, `position`, `contact_email`, `website`.  Note that these keys can change at anytime!
revoked         | boolean  | Indicates if this `Attendee` still has access to this guide.  This field is only relevant if your `Guide` is using the `invite-only` security option.
status          | integer  |  Integer status code.  0 - Attendee Created, 1 - New Account Created, Email Invite Sent, 2 - Existing Account matched, Email Invite Sent, 3 - Email Invite Accepted/Attendee Logged In.


### Filtering data by `Guide` id and other fields

Including a query parameter `guide` allows you to filter for all `Attendees` related to a `Guide` you have access to (`Guide` 47 in the following example):

`GET https://builder.guidebook.com/open-api/v1/attendees/?guide=47`

You are also able to filter by the fields `revoked` and `status` if you want to fetch a list of `Attendees` fitting specific criteria.  See examples below for how to filter on to these fields and combining multiple filters:

`GET https://builder.guidebook.com/open-api/v1/attendees/?guide=47&status=3`

`GET https://builder.guidebook.com/open-api/v1/attendees/?guide=47&revoked=True`


### Sorting Returned Data

When fetching a list of your `Attendees`, you're also able to control the order of the returned data if this is important for your needs.  The fields that you can sort by are `email`, `first_name`, `last_name`, `revoked`, and `status`. The following example will sort all `Attendees` from `Guide` 47 by `email` in alphabetical order:

`GET https://builder.guidebook.com/open-api/v1/attendees/?guide=47&ordering=email`

Prepending `-` in front of an ordering field reverses it.  The following example with sort by last name in reverse alphabetical order and then do a secondary sort in alphabetical order by first name:

`GET https://builder.guidebook.com/open-api/v1/attendees/?guide=47&ordering=-last_name,first_name`


## Retrieving an `Attendee`

To retrieve an individual `Attendee` object issue a `GET` request like:

`GET https://builder.guidebook.com/open-api/v1/attendees/71/`

The above request will fetch data for the `Attendee` with the id 71.

## Deleting an `Attendee` or Updating `Attendee` info

The `Attendee` object is a crucial component that's used in our metrics tracking system.  In order to preserve the integrity of our metrics tracking stack, we do NOT allow Attendee objects to be deleted once they been created.  Fields such as the `status` of the `Attendee` are strictly controlled by specific metrics events happening and can not be manipulated via the Open API. Additionally we do not allow you to manipulate the profile information of the individual accounts.  These are controlled by the end-user themselves.

We do allow various Open API operations for objects that are related to an `Attendee` and a `Guide`. i.e [Personalized Schedules](#personalizedschedules) for a given `Attendee`.

