

# A Five Minute Tutorial

The scope of this tutorial is a light introduction to using mojo to 
generate a basic RESTful web service.

For this tutorial, we'll create project inspired by Zork, the cave exploration game. 
For the application, we'll add three resources: locations, treasures, and characters. 

To start, create a directory named `Zork` and navigate into that directory.
To create a project, enter

```[bash]
mojo rest-api create-project --framework webflux --name zork --package acme.zork --base-path /zork/api/v1
```

The ```framework``` parameter selects the framework upon which the application will be built.
Currently, two frameworks are supported: Spring WebMVC and Spring WebFlux.  Either framework
will work for this tutorial.

The ```name``` parameter gives a name to the project. The name becomes the artifact name.

The ```package``` parameter sets the base Java package for the project. The generator adds additional
packages under this base package.

The ```base-path``` sets the base URI of the application and its endpoints. 

Let's add the three resources, a Location to indicate a place within the cave,
a Treasure to indicate treasures discovered, and Character to represent
characters encountered (this can also include the person playing).

```[bash]
mojo rest-api create-endpoint --resource Location --route /location
mojo rest-api create-endpoint --resource Treasure --route /treasure
mojo rest-api create-endpoint --resource Character --route /character
```

With the code generated, adding a Gradle wrapper is next. 
  
```[bash]
gradle wrapper
```
            
Build the code with

```[bash]
./gradlew spotlessApply build
```

The ```spotless``` plugin is included in the ```build.gradle``` to apply consistent code formatting.
The plugin will fail the build if the ```spotlessCheck``` task detects formatting errors. 
                
Boot the application:
  
```[bash]
./gradlew bootRun
```

In another terminal window, use curl or httpie to invoke the endpoints:
                          
```[bash]
http :8080/zork/api/v1/location
http :8080/zork/api/v1/treasure
http :8080/zork/api/v1/character
```
     
The code generator creates sample tables and populates them the auto-generated data.
The SQL files for these can be found in the ```src/main/resources/database``` folder.
The code that applies these SQL files is found in the base project's ``config``` sub-package.

