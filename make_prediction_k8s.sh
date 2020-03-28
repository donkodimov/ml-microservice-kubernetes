#!/usr/bin/env bash

URL=$(minikube service prediction --url)
echo "URL: $URL"

# POST method predict
curl -d '{  
   "CHAS":{  
      "0":2
   },
   "RM":{  
      "0":6.575
   },
   "TAX":{  
      "0":296.0
   },
   "PTRATIO":{  
      "0":200.3
   },
   "B":{  
      "0":396.9
   },
   "LSTAT":{  
      "0":4.98
   }
}'\
     -H "Content-Type: application/json" \
     -X POST $URL/predict
