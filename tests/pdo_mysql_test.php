<?php

try {

    /**
     * Test Pdo\Mysql
     */
//        $connection = new \Phalcon\Db\Adapter\Pdo\Mysql((array)($config->database));
//
//        $sql = 'SELECT * FROM phalcon3.user ORDER BY username';
//
//        // Send a SQL statement to the database system
//        $result = $connection->query($sql);
//
//        // Print each robot name
//        while ($robot = $result->fetch()) {
//            echo $robot['name'];
//        }
//
//        // Get all rows in an array
//        $users = $connection->fetchAll($sql);
//        echo '<pre>';
//        foreach ($users as $user) {
//            print_r( $user );
//        }
//
//        // Get only the first row
//        $user = $connection->fetchOne($sql);
//
//        print_r($user);
//        die;


} catch (\Throwable $t) {
    echo $t->getMessage() . '<br>';
    echo '<pre>' . $t->getTraceAsString() . '</pre>';
}

