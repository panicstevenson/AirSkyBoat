def migration_name():
    return "Changing data types for music day in zones"


def check_preconditions(cur):
    return


def needs_to_run(cur):
    # Ensure column doesn't already exist.
    cur.execute("SELECT DATA_TYPE from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'zone_settings' and COLUMN_NAME = 'music_day';")

    row = cur.fetchone()[0]
    if not row or row != "smallint":
        return False

    return True


def migrate(cur, db):
    cur.execute(
        "ALTER TABLE `zone_settings` MODIFY COLUMN `music_day` smallint(5) unsigned;"
    )
    db.commit()
