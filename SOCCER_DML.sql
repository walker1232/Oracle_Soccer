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
select t.team_name 팀명, s.stadium_name 스타디움, 
       sc.awayteam_id 원정팀, sc.SCHE_DATE 스케줄날짜
from team t
    join stadium s
    on t.stadium_id like s.STADIUM_id
    join schedule sc
    on s.stadium_id like sc.stadium_id
where sc.sche_date = 20120317;

--013
select p.player_name 선수명, p.position 포지션,
       t.region_name||' '||t.team_name 팀명, s.stadium_name 스타디움, 
       sc.sche_date 스케줄날짜
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
select s.stadium_name 스타디움, sc.sche_date 경기날짜,
       t1.region_name|| ' '||t1.team_name 홈팀, t2.region_name|| ' '||t2.team_name 원정팀,
       sc.home_score 홈팀점수,
       sc.away_score 원정팀점수
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

      
      
select s.stadium_name 스타디움, sc.sche_date 경기날짜,
       t1.region_name||' '||t1.team_name 홈팀, t2.region_name||' '||t2.team_name 원정팀,
       sc.home_score 홈팀점수,
       sc.away_score 원정팀점수
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
select s.stadium_name 스타디움, sc.sche_date 경기날짜,
       t1.region_name|| ' '||t1.team_name 홈팀, t2.region_name|| ' '||t2.team_name 원정팀,
       sc.home_score 홈팀점수,
       sc.away_score 원정팀점수
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
    T.TEAM_NAME 팀명,
    P.PLAYER_NAME 선수명,
    P.POSITION 포지션,
    P.BACK_NO 백넘버,
    P.HEIGHT 키
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE
    T.TEAM_ID IN (select team_id
                  from team
                  where team_name in ('삼성블루윙즈', '드래곤즈'))
;



select p.height||'cm' 키, t.team_name 팀명, p.player_name 이름
from player p
inner join team t
on p.team_id like t.team_id
where  p.team_id in ((select team_id
                      from team
                      where team_nmae in ('삼성블루윙즈', '시티즌'))) 
                      and
                      p.height between 180 and 183
order by p.height, t.team_name, p.player_name;

select team_id
from team
where team_nmae in ('수원삼성');


select team_id, team_name
from team
where team_name in ('삼성블루윙즈', '시티즌');

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

select p.height||'cm' 키, t.team_name 팀명, p.player_name 이름
from player p
inner join team t
on p.team_id like t.team_id
where  p.team_id in ((select team_id
                      from team
                      where team_nmae in ('삼성블루윙즈', '시티즌'))) 
                      and
                      p.height between 180 and 183
order by p.height, t.team_name, p.player_name;

select p.height||'cm' 키, t.team_name 팀명, p.player_name 이름
from (select team_id
       from team
       where team_name in ('삼성블루윙즈', '시티즌')) t, player p
where t.team_id like p.team_id;


select p.player_name, p.team_id, t.team_id
from
    (select team_id
    from team
    where team_name like '시티즌') t, player p
where t.team_id like p.team_id;


select team_id
from team
where team_name like '시티즌'

-- SOCCER_SQL 018
-- 소속이 삼성 블루윙즈 팀인 선수들과
-- 전남 드래곤즈팀인 선수들의 선수 정보
-- SUBQUERY VERSION
-- 최호진 선수의 소속팀과 포지션, 백넘버는 무엇입니까

select t.team_name 팀명, p.position 포지션, p.back_no 백넘버
from
    (select p.team_id, p.position, p.back_no
    from player p
    where p.player_name like '최호진') p, team t
where p.team_id like t.team_id;


-- 019
-- 대전시티즌의 MF 평균키는 얼마입니까

select round(avg(height),2) 평균키
from
    (select team_id, team_name
    from team
    where team_name like '시티즌') t, player p
where t.team_id like p.team_id and
      p.position like 'MF';

-- 020
-- 2012년 월별 경기수를 구하시오
select count(gubun) 경기수
from schedule
where gubun like 'Y';

select 
    (select count(gubun)
     where s.sche_date between 20120501 and 20120530) 1월 경기수,
     (select count(gubun)
     where s.sche_date between 20120201 and 20120228) 2월 경기수,
     (select count(gubun)
     where s.sche_date between 20120301 and 20120331) 3월 경기수,
     (select count(gubun)
     where s.sche_date between 20120401 and 20120430) 4월 경기수,
     (select count(gubun)
     where s.sche_date between 20120501 and 20120530) 5월 경기수,
     (select count(gubun)
     where s.sche_date between 20120601 and 20120630) 6월 경기수,
     (select count(gubun)
     where s.sche_date between 20120701 and 20120731) 7월 경기수,
     (select count(gubun)
     where s.sche_date between 20120801 and 20120531) 8월 경기수,
     (select count(gubun)
     where s.sche_date between 20120901 and 20120930) 9월 경기수,
     (select count(gubun)
     where s.sche_date between 20121001 and 20121031) 10월 경기수,
     (select count(gubun)
     where s.sche_date between 20121101 and 20121130) 11월 경기수,
     (select count(gubun)
     where s.sche_date between 20121201 and 20121231) 12월 경기수,
from schedule s
where gubun like 'Y';

select count(s1.sche_date) "1월", count(s2.sche_date) "2월",
       count(s3.sche_date) "3월", count(s4.sche_date) "4월",
       count(s5.sche_date) "5월", count(s6.sche_date) "6월",
       count(s7.sche_date) "7월", count(s8.sche_date) "8월",
       count(s9.sche_date) "9월", count(s10.sche_date) "10월",
       count(s11.sche_date) "11월", count(s12.sche_date) "12월"
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
      
select count(s5.sche_date) "5월", count(s7.sche_date) "7월"
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
-- 2012년 월별 경기수(GUBUN IS YES)를 구하시오
-- 출력은 1월 120경기 이런식으로












