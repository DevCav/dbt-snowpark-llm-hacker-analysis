use role sysadmin;
create database raw;
create database analytics;

create warehouse loading
    warehouse_size = xsmall
    auto_suspend = 60
    auto_resume = true
    initially_suspended = true;

create warehouse transforming
    warehouse_size = xsmall
    auto_suspend = 60
    auto_resume = true
    initially_suspended = true;

create warehouse reporting
    warehouse_size = xsmall
    auto_suspend = 60
    auto_resume = true
    initially_suspended = true;


use role securityadmin;

create role loader;
grant all on warehouse loading to role loader; 

create role transformer;
grant all on warehouse transforming to role transformer;

create role reporter;
grant all on warehouse reporting to role reporter;



create user fivetran_user -- or fivetran_user
    password = ''
    default_warehouse = loading
    default_role = loader; 

create user dbt_user
    password = ''
    default_warehouse = transforming
    default_role = transformer;

create user bi_user -- or mode_user etc.
    password = ''
    default_warehouse = reporting
    default_role = reporter;

-- then grant these roles to each user
grant role loader to user fivetran_user; -- or fivetran_user
grant role transformer to user dbt_user;
grant role transformer to user cavagnarod; -- or amy, jeremy
grant role reporter to user bi_user; -- or mode_user, periscope_user


use role sysadmin;
grant all on database raw to role loader;

use role accountadmin;
grant usage on database raw to role transformer;
grant usage on future schemas in database raw to role transformer;
grant select on future tables in database raw to role transformer;
grant select on future views in database raw to role transformer;

use role sysadmin;
grant all on database analytics to role transformer;

use role accountadmin;
grant usage on database analytics to role reporter;
grant usage on future schemas in database analytics to role reporter;
grant select on future tables in database analytics to role reporter;
grant select on future views in database analytics to role reporter;