import sys
import pytumblr
import json

blogname = sys.argv[5]
postid = sys.argv[6]

tumblr = pytumblr.TumblrRestClient(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
url = '/v2/blog/{}/posts/{}'.format(blogname, postid)
response = tumblr.request.get(url, {})

print(json.dumps(response))
