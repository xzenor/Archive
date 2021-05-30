# looping through files with spaces

``` bash
#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for f in *
do
  echo "$f"
done
IFS=$SAVEIFS
```
