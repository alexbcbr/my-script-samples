#!/usr/bin/python

from hashlib import sha1
from hmac import new as hmac

key = "qnscAdgRlkIhAUPY1oiexBKtXbGY0opp7OV1I50"
message = "alex com mensagem hash"

print "%s" % hmac(key, message, sha1).digest().encode('base64')[:-1]



