import mariadb

def migration_name():
    return "Adding vendor sell log Table"

def check_preconditions(cur):
        return

def needs_to_run(cur):
    # Ensure IP_Exceptions table exists
    cur.execute("SHOW TABLES LIKE 'vendor_sell_log';")
    if not cur.fetchone():
        return True
    return False

def migrate(cur, db):
    try:
        cur.execute("CREATE TABLE IF NOT EXISTS `vendor_sell_log` (\
                    id int(10) unsigned NOT NULL AUTO_INCREMENT,\
                    itemid smallint(5) unsigned NOT NULL DEFAULT 0,\
                    quantity int(10) unsigned NOT NULL DEFAULT 0,\
                    seller int(10) unsigned NOT NULL DEFAULT 0,\
                    seller_name varchar(15) DEFAULT NULL,\
                    baseprice int(10) unsigned NOT NULL DEFAULT 0,\
                    totalprice int(10) unsigned NOT NULL DEFAULT 0,\
                    date int(10) unsigned NOT NULL DEFAULT 0,\
                    PRIMARY KEY (id),\
                    KEY itemid (itemid),\
                    KEY charid (seller)\
                    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;")
        db.commit()

    except mariadb.Error as err:
        print("Something went wrong: {}".format(err))
