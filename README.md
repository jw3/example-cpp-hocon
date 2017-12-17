typesafe config with cpp
===

see puppet's https://github.com/puppetlabs/cpp-hocon

requires puppets' https://github.com/puppetlabs/leatherman

### in hocon

```hocon
pipeline = [
    {
      filename: in.las
      tag: a
    }

    {
      type: readers.shp
      path: world-continents.shp
      layer: world-continents
      tag: b
    }

    {
      type: filters.merge
      tag: ab
      inputs:
      [
        a
        b
      ]
    }

    {
      type: writers.null
    }
]
```


### out json

```json
{
    "pipeline" : [
        {
            "filename" : "in.las",
            "tag" : "a"
        },
        {
            "layer" : "world-continents",
            "path" : "world-continents.shp",
            "tag" : "b",
            "type" : "readers.shp"
        },
        {
            "inputs" : [
                "a",
                "b"
            ],
            "tag" : "ab",
            "type" : "filters.merge"
        },
        {
            "type" : "writers.null"
        }
    ]
}
```
