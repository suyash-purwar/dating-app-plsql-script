alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select sysdate, dump(sysdate) as date_bytes from dual;