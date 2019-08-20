# ActiveMQ
Basic knowledge of ActiveMQ and how to config, setup, and get it running with example.

## Configuring Authentication
To add authentication to ActiveMQ server.

1. Open the file in "conf/users.properties" to add user
    - format "username = password"
2. Open the file in "conf/groups.properties" and assign user to each group
    - format "group name = user"
      -  group could be: admins, users, guests</br>
        
        |  Example      |
        |---------------|
        | admins = user1|
        | users = user2 |
        | guests = user3|

3. Open the file in "conf/activemq.xml" to setup role base authorization for Queues and Topics

    Example:
    ```
    <broker> 
    .. 
    <plugins> 
      .. 
      <authorizationPlugin> 
        <map> 
          <authorizationMap> 
            <authorizationEntries> 
              <authorizationEntry queue=">" read="admins" write="admins" admin="admins"/><!--Access all queue-->
              <authorizationEntry queue="TEST." read="users" write="users" admin="users" />

              <authorizationEntry topic=">" read="admins" write="admins" admin="admins"/>
              <authorizationEntry topic="ActiveMQ.Advisory.>" read="all" write="all" admin="all"/> 
            </authorizationEntries> 
          </authorizationMap> 
        </map> 
      </authorizationPlugin> 
      .. 
    </plugins> 
    .. 
    </broker>
    ```
    * here queue=">"indicate all the Queues ( here > used as a wildcard )
    * TEST.> indicates the Queues starts with TEST.  in the name ( i,e: TEST.TestQueue )


## Config ActiveMQ dashboard
1. Dashboard url: http://localhost:8161/admin
2. Open the file in "conf/jetty-realm.properties" to add user who can access ActiveMQ dashboard
    - format: "user: password, role"

3. Open the file in "conf/jetty.xml" find the following line
    ```
    <property name="authenticate" value="false" />
        change to 
    <property name="authenticate" value="true" />

    Then web server will look at conf/jetty-realm.properties file to match provided credentials with user listed in the file

    ```

## Config ActiveMQ jvm memory
Increase the memory usage of ActiveMQ by open the file in bin/env
    
```
locate "ACTIVEMQ_OPTS_MEMORY", original value is
    ACTIVEMQ_OPTS_MEMORY="-Xms64M -Xmx1G"
    change to whatever to make application work
    M stand for MB, G stand for GB
```

## Config ActiveMQ concurrent connection
By default, the concurrent connections is set to 1000, it can config to allow more or less of concurrent connection

```
In file conf/activemq.xml, locate
<transportConnectors>
    <!-- DOS protection, limit concurrent connections to 1000 and frame size to 100MB -->
    <transportConnector name="openwire" uri="tcp://0.0.0.0:61616?maximumConnections=1000&amp;wireFormat.maxFrameSize=104857600"/>
    ...
</transportConnectors>

change to

<transportConnectors>
    <!-- DOS protection, limit concurrent connections to 1000 and frame size to 100MB -->
    <transportConnector name="openwire" uri="tcp://0.0.0.0:61616?maximumConnections=<any number of connection need>&amp;wireFormat.maxFrameSize=104857600"/>
    ...
</transportConnectors>
```

## Credits
[Official site of ActiveMQ](https://activemq.apache.org)