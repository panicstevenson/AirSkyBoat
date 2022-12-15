import mariadb

def migration_name():
    return "Adding IP Owner Table"

def check_preconditions(cur):
        return

def needs_to_run(cur):
    # Ensure IP_Exceptions table exists
    cur.execute("SHOW TABLES LIKE 'ip_owners';")
    if not cur.fetchone():
        return True
    return False

def migrate(cur, db):
    try:
        cur.execute("CREATE TABLE IF NOT EXISTS `ip_owners` ( \
                    `client_ip` tinytext NOT NULL, \
                    `accid` int(10) unsigned NOT NULL DEFAULT '0', \
                    PRIMARY KEY (client_ip(15))) \
                    ENGINE=InnoDB;")
        db.commit()

    except mariadb.Error as err:
        print("Something went wrong: {}".format(err))
