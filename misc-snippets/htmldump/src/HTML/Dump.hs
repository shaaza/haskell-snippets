module HTML.Dump (dump) where

import Network.Wreq (get)

dump url = get url

somePrivateFn = [1..]
