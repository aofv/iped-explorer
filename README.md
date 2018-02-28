# IPEDS Exlorer

A live example if this application can be found [here](https://school-data.athletesofvalor.com)

This repo contains a set of 3 tools:
* A series of import scripts which import a selection of NCES IPEDS Data into a postgres database
* An API for serving this data
* A static web app for consuming the API and reporting

## Import Tools
These tools can be run by executing a rake task:
```
rake iped:import
```
 It is possible to only import select data, see `./lib/tasks/iped.rake`.

 ## API
 To run the API:
 ```
 bundle
 rake db:create
 rake db:migrate
 rails s
 ```

 ## Web App
 The webapp is located in `./ui` folder is written in Vue. To run it:
 ```
 npm install
 npm run dev
 ```
