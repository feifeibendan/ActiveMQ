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
              <authorizationEntry queue=">" read="admins" write="admins" admin="admins"/>
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


## Credits
[Offical site of ActiveMQ](https://activemq.apache.org)