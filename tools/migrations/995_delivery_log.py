import mariadb

def migration_name():
    return "Adding Delivery box log Table"

def check_preconditions(cur):
        return

def needs_to_run(cur):
    # Ensure IP_Exceptions table exists
    cur.execute("SHOW TABLES LIKE 'delivery_box_log';")
    if not cur.fetchone():
        return True
    return False

def migrate(cur, db):
    try:
        cur.execute("CREATE TABLE `delivery_box_log` (\
                    id int(10) unsigned NOT NULL AUTO_INCREMENT, \
                    itemid smallint(5) unsigned NOT NULL DEFAULT 0, \
                    quantity int(10) unsigned NOT NULL DEFAULT 0, \
                    sender int(10) unsigned NOT NULL DEFAULT 0, \
                    sender_name varchar(15) DEFAULT NULL, \
                    receiver int(10) unsigned NOT NULL DEFAULT 0, \
                    receiver_name varchar(15) DEFAULT NULL, \
                    price int(10) unsigned NOT NULL DEFAULT 0, \
                    date int(10) unsigned NOT NULL DEFAULT 0, \
                    PRIMARY KEY (id), \
                    KEY itemid (itemid), \
                    KEY charid (sender)) \
                    ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;")
        db.commit()

    except mariadb.Error as err:
        print("Something went wrong: {}".format(err))
