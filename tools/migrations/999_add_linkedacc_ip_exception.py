import mariadb

def migration_name():
    return "Adding linkedacc column to ip_exception table"

def check_preconditions(cur):
    return

def needs_to_run(cur):
    # Ensure chatfilters column exists in chars
    cur.execute("SHOW COLUMNS FROM ip_exceptions LIKE 'linkedacc'")
    if not cur.fetchone():
        return True
    return False

def migrate(cur, db):
    try:
        cur.execute("ALTER TABLE `ip_exceptions` ADD COLUMN IF NOT EXISTS linkedacc int(10) unsigned NOT NULL DEFAULT '0' AFTER `exception`;")
        db.commit()
    except mariadb.Error as err:
        print("Something went wrong: {}".format(err))
