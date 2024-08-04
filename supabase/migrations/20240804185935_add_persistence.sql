alter table "public"."daily_plans" add column "persistent" boolean not null default false;

alter table "public"."daily_plans" alter column "description" set default ''::text;


