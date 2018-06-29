select team_name, player_name
from team, player
where team.team_id = player.team_id and
           position is null
order by team_name, player_name;

select t.team_name, p.player_name
from player p
    join team t
    on p.team_id like t.team_id
where p.position is null
order by t.team_name, p.player_name;

select t.team_name, s.stadium_name
from team t
    join stadium s
    on t.stadium_id like s.STADIUM_id;

--012
select t.team_name ����, s.stadium_name ��Ÿ���, 
       sc.awayteam_id ������, sc.SCHE_DATE �����ٳ�¥
from team t
    join stadium s
    on t.stadium_id like s.STADIUM_id
    join schedule sc
    on s.stadium_id like sc.stadium_id
where sc.sche_date = 20120317;

--013
select p.player_name ������, p.position ������,
       t.region_name||' '||t.team_name ����, s.stadium_name ��Ÿ���, 
       sc.sche_date �����ٳ�¥
from player p
    join team t
    on p.team_id like t.team_id
    join stadium s
    on t.stadium_id like s.stadium_id
    join schedule sc
    on s.stadium_id like sc.stadium_id
where sc.sche_date like 20120317 and
      t.team_id like 'K03' and
      p.position like 'GK'
order by p.player_name;
      


--014
select s.stadium_name ��Ÿ���, sc.sche_date ��⳯¥,
       t1.region_name|| ' '||t1.team_name Ȩ��, t2.region_name|| ' '||t2.team_name ������,
       sc.home_score Ȩ������,
       sc.away_score ����������
--from team t1
--    join stadium s
--    on t1.stadium_id like s.stadium_id
--    join schedule sc
--    on s.stadium_id like sc.stadium_id
--    join team t2
--    on t1.stadium_id like t2.stadium_id
from schedule sc
    join stadium s
    on sc1.stadium_id like s.stadium_id
    --join team t1
    --on s.stadium_id like t1.stadium_id
    join schedule sc
    on t1.team_id like sc.awayteam_id
    join team t2
    on t2.team_id like sc.hometeam_id
where 
      sc.home_score >= 3 --and
    --  t1.team_id like sc.hometeam_id and
    --  t2.team_id like sc.awayteam_id
order by sche_date;

      
      
select s.stadium_name ��Ÿ���, sc.sche_date ��⳯¥,
       t1.region_name||' '||t1.team_name Ȩ��, t2.region_name||' '||t2.team_name ������,
       sc.home_score Ȩ������,
       sc.away_score ����������
from team t1, team t2
    join stadium s
    on t1.stadium_id like s.stadium_id
    join stadium s
    on t2.stadium_id like s.stadium_id
    join schedule sc
    on s.stadium_id like sc.stadium_id
where sc.home_score >= 3 and
      t1.team_id like sc.hometeam_id
order by sc.sche_date;
      
      
      --014
select s.stadium_name ��Ÿ���, sc.sche_date ��⳯¥,
       t1.region_name|| ' '||t1.team_name Ȩ��, t2.region_name|| ' '||t2.team_name ������,
       sc.home_score Ȩ������,
       sc.away_score ����������
from schedule sc
    join stadium s
    on sc.stadium_id like s.stadium_id
    join team t1
    on sc.hometeam_id like t1.team_id
    join team t2
    on sc.awayteam_id like t2.team_id
where 
      sc.home_score - sc.away_score >= 3
order by sche_date;


--015
select s.stadium_name, s.stadium_id, s.SEAT_COUNT, s.HOMETEAM_ID, t.E_TEAM_NAME
from stadium s
    left join team t
    on s.stadium_id like t.team_id;

--017
SELECT
    T.TEAM_NAME ����,
    P.PLAYER_NAME ������,
    P.POSITION ������,
    P.BACK_NO ��ѹ�,
    P.HEIGHT Ű
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE
    T.TEAM_ID IN (select team_id
                  from team
                  where team_name in ('�Ｚ�������', '�巡����'))
;



select p.height||'cm' Ű, t.team_name ����, p.player_name �̸�
from player p
inner join team t
on p.team_id like t.team_id
where  p.team_id in ((select team_id
                      from team
                      where team_nmae in ('�Ｚ�������', '��Ƽ��'))) 
                      and
                      p.height between 180 and 183
order by p.height, t.team_name, p.player_name;

select team_id
from team
where team_nmae in ('�����Ｚ');


select team_id, team_name
from team
where team_name in ('�Ｚ�������', '��Ƽ��');

select team_id, team_name
from team;


select t.team_name, p.player_name
from player p
    join team t
    on p.team_id like t.team_id
where p.position is null and p.team_id in((
                                    select team_id
                                    from team))
order by t.team_name, p.player_name;

select player_name, height
from player
where height >= (select avg(height)
                 from player);
                 
select avg(height)
from player;

select p.height||'cm' Ű, t.team_name ����, p.player_name �̸�
from player p
inner join team t
on p.team_id like t.team_id
where  p.team_id in ((select team_id
                      from team
                      where team_nmae in ('�Ｚ�������', '��Ƽ��'))) 
                      and
                      p.height between 180 and 183
order by p.height, t.team_name, p.player_name;

select p.height||'cm' Ű, t.team_name ����, p.player_name �̸�
from (select team_id
       from team
       where team_name in ('�Ｚ�������', '��Ƽ��')) t, player p
where t.team_id like p.team_id;


select p.player_name, p.team_id, t.team_id
from
    (select team_id
    from team
    where team_name like '��Ƽ��') t, player p
where t.team_id like p.team_id;


select team_id
from team
where team_name like '��Ƽ��'

-- SOCCER_SQL 018
-- �Ҽ��� �Ｚ ������� ���� �������
-- ���� �巡�������� �������� ���� ����
-- SUBQUERY VERSION
-- ��ȣ�� ������ �Ҽ����� ������, ��ѹ��� �����Դϱ�

select t.team_name ����, p.position ������, p.back_no ��ѹ�
from
    (select p.team_id, p.position, p.back_no
    from player p
    where p.player_name like '��ȣ��') p, team t
where p.team_id like t.team_id;


-- 019
-- ������Ƽ���� MF ���Ű�� ���Դϱ�

select round(avg(height),2) ���Ű
from
    (select team_id, team_name
    from team
    where team_name like '��Ƽ��') t, player p
where t.team_id like p.team_id and
      p.position like 'MF';

-- 020
-- 2012�� ���� ������ ���Ͻÿ�
select count(gubun) ����
from schedule
where gubun like 'Y';

select 
    (select count(gubun)
     where s.sche_date between 20120501 and 20120530) 1�� ����,
     (select count(gubun)
     where s.sche_date between 20120201 and 20120228) 2�� ����,
     (select count(gubun)
     where s.sche_date between 20120301 and 20120331) 3�� ����,
     (select count(gubun)
     where s.sche_date between 20120401 and 20120430) 4�� ����,
     (select count(gubun)
     where s.sche_date between 20120501 and 20120530) 5�� ����,
     (select count(gubun)
     where s.sche_date between 20120601 and 20120630) 6�� ����,
     (select count(gubun)
     where s.sche_date between 20120701 and 20120731) 7�� ����,
     (select count(gubun)
     where s.sche_date between 20120801 and 20120531) 8�� ����,
     (select count(gubun)
     where s.sche_date between 20120901 and 20120930) 9�� ����,
     (select count(gubun)
     where s.sche_date between 20121001 and 20121031) 10�� ����,
     (select count(gubun)
     where s.sche_date between 20121101 and 20121130) 11�� ����,
     (select count(gubun)
     where s.sche_date between 20121201 and 20121231) 12�� ����,
from schedule s
where gubun like 'Y';

select count(s1.sche_date) "1��", count(s2.sche_date) "2��",
       count(s3.sche_date) "3��", count(s4.sche_date) "4��",
       count(s5.sche_date) "5��", count(s6.sche_date) "6��",
       count(s7.sche_date) "7��", count(s8.sche_date) "8��",
       count(s9.sche_date) "9��", count(s10.sche_date) "10��",
       count(s11.sche_date) "11��", count(s12.sche_date) "12��"
from schedule s1, schedule s2, schedule s3, schedule s4,
     schedule s5, schedule s6, schedule s7, schedule s8,
     schedule s9, schedule s10, schedule s11, schedule s12
where (s1.sche_date between 20120101 and 20120131) and
      (s2.sche_date between 20120201 and 20120228) and
      (s3.sche_date between 20120301 and 20120331) and
      (s4.sche_date between 20120401 and 20120430) and
      (s5.sche_date between 20120501 and 20120531) and
      (s6.sche_date between 20120601 and 20120630) and
      (s7.sche_date between 20120701 and 20120731) and
      (s8.sche_date between 20120801 and 20120831) and
      (s9.sche_date between 20120901 and 20120930) and
      (s10.sche_date between 20121001 and 20121031) and
      (s11.sche_date between 20121101 and 20121130) and
      (s12.sche_date between 20121231 and 20121231)
      ;
      
select count(s5.sche_date) "5��", count(s7.sche_date) "7��"
from schedule s
    join schedule s7
        on s7.sche_date like s.sche_date
    join schedule s5
        on s5.sche_date like s.sche_date
where (s5.sche_date between 20120501 and 20120531) and
      (s7.sche_date between 20120701 and 20120731);

select sche_date
from schedule;

      


select gubun, sche_date
from schedule
where gubun

-- 021
-- 2012�� ���� ����(GUBUN IS YES)�� ���Ͻÿ�
-- ����� 1�� 120��� �̷�������












