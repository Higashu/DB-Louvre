-- suppression base de donnée --

SELECT
    'drop table if exists "' || tablename || '" cascade;' as pg_drop
FROM
    pg_tables
WHERE
    schemaname='public';