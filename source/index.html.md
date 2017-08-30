---
title: Guidebook Open API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - python

toc_footers:
  - <a href='https://builder.guidebook.com/'>Sign Up for a Guidebook API Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Guidebook Open Api!

# Authentication

> To authorize, use this code:

```python
import requests
api_url = 'https://builder.guidebook.com/'
api = requests.get(api_url)
```
> Insert warning message here.

Guidebook offers an REST API to easily manager your data.  Once you have your API key, all API calls need to have the API key included in a header that looks like the following:

`Authorization: JWT API_KEY`

<aside class="notice">
You must replace <code>JWT API_KEY</code> with your personal API key.
</aside>

# Sessions

## Updating Sessions
