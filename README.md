# fuber
fuber is an online call taxi service


## Requirements
* ruby - 2.4.1
* rails - 5.1
* postgres


## Setting up

* Clone the Repo

       git clone git@github.com:tessie/fuber.git
       cd fuber

 * Install the gems

        bundle

 * Copy database.yml.example to database.yml.

       cp config/database.yml.example config/database.yml

  *  Create and migrate the database.

         rake db:create
         rake db:migrate


  * Seed the database

        rake db:seed

  * Runnning local

        rails s


  ## Test

        rails test


## API Doc

### GET /cabs

Response:


         {
           "status":"success",
           "cabs":[
              {
                 "id":4,
                 "registration_number":"KL452304",
                 "status":"available",
                 "color":null,
                 "modelname":null,
                 "lat":10.057906,
                 "long":76.346362,
                 "created_at":"2017-08-20T18:15:01.811Z",
                 "updated_at":"2017-08-20T18:15:01.811Z"
              },
              {
                 "id":3,
                 "registration_number":"KL451334",
                 "status":"available",
                 "color":null,
                 "modelname":null,
                 "lat":9.99848,
                 "long":9.99848,
                 "created_at":"2017-08-20T18:15:01.804Z",
                 "updated_at":"2017-08-20T18:15:01.804Z"
              },
              {
                 "id":1,
                 "registration_number":"KL452134",
                 "status":"available",
                 "color":null,
                 "modelname":null,
                 "lat":9.99709,
                 "long":76.302815,
                 "created_at":"2017-08-20T18:15:01.785Z",
                 "updated_at":"2017-08-20T18:15:01.785Z"
              }
           ]
        }

### POST /cabs/book-nearest

Request

       {
          "lat" : 1,
          "long" : 1
          "customer_id" : 1
          "color" : "pink"
       }

Response


        {
           "status":"success",
           "cab":{
              "lat":9.99709,
              "status":"booked",
              "id":1,
              "registration_number":"KL452134",
              "color":"pink,
              "modelname":null,
              "long":76.302815,
              "created_at":"2017-08-20T18:15:01.785Z",
              "updated_at":"2017-08-20T18:30:50.209Z"
           },
           "trip_id": 5,
           "message":"Booking Success"
        }

Response Failure:

     {
       "status":"failure",
       "message":"Sorry no cabs are available"
    }


### POST  /trips/1/start

Request

        {
          "lat":1,
          "long": 1
        }

Response Success

      {
         "status":"success",
         "message":"Ride Started"
      }

 Failure(when attempting to start a trip ie to yet scheduled)

     {
       "status":"failure",
       "message":"Sorry.trip could not be started"
    }

### POST  /trips/1/end

Request (same as start trip)

Response Success

    {
       "status":"success",
       "message":"Ride End",
       "amount":"4.87 Dogecoin"
    }

Response Failure

    {
       "status":"failure",
       "message":"Sorry.Could mot end trip"
    }
