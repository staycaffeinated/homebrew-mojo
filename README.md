
This is the Homebrew tap for the staycaffeinated/mojo code generator.

### Installation

```
brew tap staycaffeinated/mojo
brew install mojo
```

### Execution

#### Generate a skeleton Spring project

```mojo rest-api create-project --framework webmvc --name=[application-name] --base-path=[base-URL] --package=[package-name]```

For example,

```mojo rest-api create-project --framework webmvc --name=bar-service --base-path=/bar-service --package=org.example.barservice```

#### Generate a project with support for Postgres, TestContainers, and Liquibase


```mojo rest-api create-project --framework webmvc --name=bar-service --base-path=/bar-service --package=org.example.barservice --support postgres testcontainers liquibase```

### Add resources and their routes to the application

```
mojo rest-api create-endpoint --route /wine --resource Wine
mojo rest-api create-endpoint --route /beer --resource Beer
```

For more, see a [Five Minute Tutorial](FiveMinuteTutorial.md)

