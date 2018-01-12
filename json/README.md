# JSON Serializer
Serializes internal representations of JSON into a string

## Usage
1. Navigate to the json dir in the project, and follow the [usage instructions in the main README](../../README.md) to open up the `ghci` interpreter. Once in the interpreter, load the file:
```
GHCi, version 8.0.2: http://www.haskell.org/ghc/  :? for help
Prelude> :l json.hs
```

2. Define a JSON object:
```
*PrintJSON> jsonobject = (Array
						  (Element (Object
									  (KeyVal "young?" (B True)
									  (KeyVal "name" (S "Willy Wonka")
									   EmptyKeyVal)))
						  (Element (B False)
						  (Element (I 3)
						  (Element (Object
									  (KeyVal "young?" (B False)
									  (KeyVal "name" Null
									   EmptyKeyVal)))
									EmptyArrayList))))))
```

3. And then call the `toString` function on the JSON Value and pass that to `putStr`.
```
*PrintJSON> putStr (toString jsonobject)
[ { "young?": true,
    "name": "Willy Wonka"" },
  false,
  3,
  { "young?": false,
    "name": null } ]
```

To see an example, simply call `serialize` after step 1.
