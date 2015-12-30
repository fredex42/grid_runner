Grid Runner
===========

A command line tool for running Grid microservices


Commands
--------

* ``` list ```
* ``` run <APP_NAME || 'all' >  ```
* ``` kill <APP_NAME || 'all' >  ```
* ``` restart <APP_NAME || 'all' >  ```

Install
------- 

``` gem install grid_runner ```


Requirements
------------

grid_runner uses a Procfile at the root of your project similar to [Foreman](https://github.com/ddollar/foreman)


Logs
----

Currently grid_runner will put all logs in ./logs/APPNAME.log

* To watch all logs I use ``` tail -f logs/* ```