Grid Runner
===========

A command line tool for running Grid microservices

Install
------- 

``` gem install grid_runner ```


Requirements
------------

grid_runner uses a Procfile at the root of your project similar to [Foreman](https://github.com/ddollar/foreman)


Commands
--------

* ``` grid_runner list ```
* ``` grid_runner run <APP_NAME || 'all' >  ```
* ``` grid_runner kill <APP_NAME || 'all' >  ```
* ``` grid_runner restart <APP_NAME || 'all' >  ```


Logs
----

Currently grid_runner will put all logs in ./logs/APPNAME.log

* To watch all logs I use ``` tail -f logs/* ```