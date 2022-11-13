import mariadb

def migration_name():
    return "Adding IP Bans Table"

def check_preconditions(cur):
        return

def needs_to_run(cur):
    # Ensure IP_Exceptions table exists
    cur.execute("SHOW TABLES LIKE 'ip_bans';")
    if not cur.fetchone():
        return True
    return False

def migrate(cur, db):
    try:
        cur.execute("CREATE TABLE IF NOT EXISTS `ip_bans` ( \
                    address int(15) unsigned NOT NULL DEFAULT 0,\
                    mask    int(15) unsigned NOT NULL DEFAULT 0,\
                    reason  varchar(30) NOT NULL,\
                    owner   varchar(20) NOT NULL,\
                    PRIMARY KEY (address,mask)) \
                    ENGINE=InnoDB;")
        db.commit()

    except mariadb.Error as err:
        print("Something went wrong: {}".format(err))
