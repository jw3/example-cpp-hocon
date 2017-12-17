typesafe config with cpp
===

see puppet's https://github.com/puppetlabs/cpp-hocon

requires puppets' https://github.com/puppetlabs/leatherman

### example

from https://www.pdal.io/pipeline.html

#### in hocon

```hocon
pipeline = [
    {
      filename: A.las
      spatialreference: "EPSG:26916"
    }
    {
      type: filters.reprojection
      in_srs: "EPSG:26916"
      out_srs: "EPSG:4326"
      tag: A2
    }
    {
      filename: B.las
      tag: B
    }
    {
      type: filters.merge
      tag: merged
      inputs: [A2, B]
    }
    {
      type: writers.gdal
      filename: output.tif
    }
]
```


#### out json

```json
{
    "pipeline" : [
        {
            "filename" : "A.las",
            "spatialreference" : "EPSG:26916"
        },
        {
            "in_srs" : "EPSG:26916",
            "out_srs" : "EPSG:4326",
            "tag" : "A2",
            "type" : "filters.reprojection"
        },
        {
            "filename" : "B.las",
            "tag" : "B"
        },
        {
            "inputs" : [
                "A2",
                "B"
            ],
            "tag" : "merged",
            "type" : "filters.merge"
        },
        {
            "filename" : "output.tif",
            "type" : "writers.gdal"
        }
    ]
}
```
