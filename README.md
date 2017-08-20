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
         
   
 

