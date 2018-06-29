-- SOCCER_SQL_001
SELECT 
    COUNT(*) "���̺��� ��" 
FROM TAB;
-- SOCCER_SQL_002
SELECT 
    TEAM_NAME "��ü �౸�� ���" 
FROM TEAM
ORDER BY TEAM_NAME DESC
;
-- SOCCER_SQL_003
-- ������ ����(�ߺ�����,������ �������� ����)
-- NVL2()
SELECT DISTINCT NVL2(POSITION,POSITION,'����') "������" 
FROM PLAYER;
-- SOCCER_SQL_004
-- ������(ID: K02)��Ű��
SELECT PLAYER_NAME �̸�
FROM PLAYER
WHERE TEAM_ID = 'K02'
    AND POSITION = 'GK'
ORDER BY PLAYER_NAME 
;
-- SOCCER_SQL_005
-- ������(ID: K02)Ű�� 170 �̻� ����
-- �̸鼭 ���� ���� ����
SELECT POSITION ������,PLAYER_NAME �̸�
FROM PLAYER
WHERE HEIGHT >= 170
    AND TEAM_ID LIKE 'K02'
    AND SUBSTR(PLAYER_NAME,0,1) LIKE '��'
ORDER BY PLAYER_NAME 
;
-- SUBSTR('ȫ�浿',2,2) �ϸ�
-- �浿�� ��µǴµ�
-- ��2�� ������ġ, ��2�� ���ڼ��� ����
SELECT SUBSTR(PLAYER_NAME,2,2) �׽�Ʈ��
FROM PLAYER
;
-- �ٸ� Ǯ��(����)
SELECT POSITION ������,PLAYER_NAME �̸�
FROM PLAYER
WHERE HEIGHT >= 170
    AND TEAM_ID LIKE 'K02'
    AND PLAYER_NAME LIKE '��%'
ORDER BY PLAYER_NAME 
;
-- SOCCER_SQL_006
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� CM �� KG ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- Ű ��������
SELECT 
    PLAYER_NAME || '����' �̸�,
    NVL2(HEIGHT,HEIGHT,0) || 'CM' Ű,
    NVL2(WEIGHT,WEIGHT,0) || 'KG' ������
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
ORDER BY HEIGHT DESC
;
-- SOCCER_SQL_007
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� CM �� KG ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- BMI���� 
-- Ű ��������
SELECT 
    PLAYER_NAME || '����' �̸�,
    NVL2(HEIGHT,HEIGHT,0) || 'CM' Ű,
    NVL2(WEIGHT,WEIGHT,0) || 'KG' ������,
    ROUND(WEIGHT/((HEIGHT/100)*(HEIGHT/100)),2) "BMI ������"
FROM PLAYER
WHERE TEAM_ID = 'K02'
ORDER BY HEIGHT DESC
;
-- SOCCER_SQL_008
-- ������(ID: K02) �� ������(ID: K10)������ �� ��
-- GK �������� ����
-- ����, ����� ��������
SELECT 
    T.TEAM_NAME,
    P.POSITION,
    P.PLAYER_NAME 
FROM PLAYER P, TEAM T
WHERE T.TEAM_ID = P.TEAM_ID
    AND T.TEAM_ID IN ( 'K02', 'K10')
    AND P.POSITION LIKE 'GK'
ORDER BY T.TEAM_NAME, P.PLAYER_NAME
;
-- ANSI JOIN ���(����)
SELECT 
    T.TEAM_NAME,
    P.POSITION,
    P.PLAYER_NAME 
FROM PLAYER P
INNER JOIN TEAM T
ON T.TEAM_ID LIKE P.TEAM_ID
WHERE T.TEAM_ID IN ( 'K02', 'K10')
    AND P.POSITION LIKE 'GK'
ORDER BY T.TEAM_NAME, P.PLAYER_NAME
;
-- SOCCER_SQL_009
-- ������(ID: K02) �� ������(ID: K10)������ �� ��
-- Ű�� 180 �̻� 183 ������ ������
-- Ű, ����, ����� ��������
SELECT 
    P.HEIGHT || 'CM' Ű,
    T.TEAM_NAME ����,
    P.PLAYER_NAME �̸�
FROM PLAYER P, TEAM T
WHERE 
    T.TEAM_ID = P.TEAM_ID
    AND T.TEAM_ID IN ( 'K02', 'K10')
    AND P.HEIGHT BETWEEN 180 AND 183
ORDER BY P.HEIGHT, T.TEAM_NAME, P.PLAYER_NAME
;
-- ANSI JOIN ���(����)
SELECT P.HEIGHT ||'CM' Ű,
    T.TEAM_NAME ����, 
    P.PLAYER_NAME �̸�
FROM PLAYER P
    JOIN TEAM T
    ON P.TEAM_ID LIKE T.TEAM_ID
WHERE T.TEAM_ID IN ('K02', 'K10')
    AND P.HEIGHT BETWEEN 180 AND 183
ORDER BY P.HEIGHT, T.TEAM_NAME, P.PLAYER_NAME
; 
-- SOCCER_SQL_010
--  ��� ������ ��
-- �������� �������� ���� �������� ���� �̸�
-- ����, ����� ��������
SELECT 
    T.TEAM_NAME,
    P.PLAYER_NAME 
FROM PLAYER P, TEAM T
WHERE  P.POSITION IS NULL
ORDER BY T.TEAM_NAME, P.PLAYER_NAME
;
-- SOCCER_SQL_011
-- ���̸�, ��Ÿ��� �̸� ���
SELECT T.TEAM_NAME ����,S.STADIUM_NAME ��Ÿ���
FROM STADIUM S 
    JOIN TEAM T
    ON T.STADIUM_ID LIKE S.STADIUM_ID
ORDER BY T.TEAM_NAME     
;
-- SOCCER_SQL_012
-- 2012�� 3�� 17�Ͽ� ���� �� ����� 
-- ���̸�, ��Ÿ���, ������� �̸� ���
-- ���
SELECT 
    t.team_name "����", 
    st.stadium_name "��Ÿ���", 
    sc.awayteam_id "������ID", 
    sc.sche_date "�����쳯¥"
FROM stadium st
   JOIN schedule sc
   ON sc.stadium_id like st.stadium_id
   JOIN team t
   ON  t.stadium_id like st.stadium_id
where sc.sche_date like '20120317'
ORDER BY t.team_name
;


-- SOCCER_SQL_013
-- 2012�� 3�� 17�� ��⿡ 
-- ���� ��ƿ���� �Ҽ� ��Ű��(GK)
-- ����, ������,���� (����������), 
-- ��Ÿ���, ��⳯¥�� ���Ͻÿ�
-- �������� ���̸��� ������ ���ÿ�
SELECT 
    P.PLAYER_NAME ������,
    P.POSITION ������,
    T.REGION_NAME || '  '||T.TEAM_NAME ����,
    S.STADIUM_NAME ��Ÿ���,
    K.SCHE_DATE �����ٳ�¥
FROM 
    TEAM T    
    JOIN STADIUM S
        ON T.STADIUM_ID LIKE S.STADIUM_ID
    JOIN PLAYER P     
        ON T.TEAM_ID LIKE P.TEAM_ID
    JOIN SCHEDULE K
        ON S.STADIUM_ID LIKE K.STADIUM_ID
WHERE
    K.SCHE_DATE LIKE '20120317'    
    AND P.POSITION LIKE 'GK'
    AND S.STADIUM_NAME LIKE '���׽�ƿ�ߵ�'
ORDER BY P.PLAYER_NAME     
; 
-- SOCCER_SQL_014
-- Ȩ���� 3���̻� ���̷� �¸��� ����� 
-- ����� �̸�, ��� ����
-- Ȩ�� �̸��� ������ �̸���
-- ���Ͻÿ�
SELECT 
    S.STADIUM_NAME ��Ÿ���,
    K.SCHE_DATE ��⳯¥,
    HT.REGION_NAME || '  '||HT.TEAM_NAME Ȩ��,
    AT.REGION_NAME || '  '||AT.TEAM_NAME ������,
    K.HOME_SCORE "Ȩ�� ����",
    K.AWAY_SCORE "������ ����"
FROM 
    SCHEDULE K    
    JOIN STADIUM S
        ON K.STADIUM_ID LIKE S.STADIUM_ID
    JOIN TEAM HT     
        ON K.HOMETEAM_ID LIKE HT.TEAM_ID
    JOIN TEAM AT
        ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
WHERE
    K.HOME_SCORE >= K.AWAY_SCORE +3 
ORDER BY K.SCHE_DATE     
;
-- SOCCER_SQL_015
-- STADIUM �� ��ϵ� ��� �߿���
-- Ȩ���� ���� �������� ���� ��������
SELECT 
    S.STADIUM_NAME,
    S.STADIUM_ID,
    S.SEAT_COUNT,
    S.HOMETEAM_ID,
    T.E_TEAM_NAME
FROM STADIUM S
    LEFT JOIN TEAM T
        ON S.HOMETEAM_ID LIKE T.TEAM_ID
ORDER BY S.HOMETEAM_ID
;
-- SOCCER_SQL_016
-- �Ҽ��� �Ｚ ������� ���� �������
-- ���� �巡�������� �������� ���� ����
---- UNION VERSION
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
    T.TEAM_ID LIKE 'K02'
UNION
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
    T.TEAM_ID LIKE 'K07'
;
---- OR VERSION
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
    T.TEAM_ID LIKE 'K02' 
    OR T.TEAM_ID LIKE 'K07'
;
---- IN VERSION
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
    T.TEAM_ID IN ('K02', 'K07')
;
-- SOCCER_SQL_017
-- �Ҽ��� �Ｚ ������� ���� �������
-- ���� �巡�������� �������� ���� ����
---- SUBQUERY VERSION
SELECT T.TEAM_NAME       ����,
      P.PLAYER_NAME     ������,
      P.POSITION        ������,
      P.BACK_NO         ��ѹ�,
      P.HEIGHT          Ű
 FROM PLAYER P 
    JOIN TEAM T 
    ON P.TEAM_ID LIKE T.TEAM_ID
WHERE T.TEAM_ID IN
          ((SELECT TEAM_ID
              FROM TEAM
             WHERE TEAM_NAME IN ('�Ｚ�������', '�巡����')));


-- SOCCER_SQL_018
-- ��ȣ�� ������ �Ҽ����� ������, ��ѹ��� �����Դϱ�
SELECT
    T.TEAM_NAME ����,
    P.POSITION ������,
    P.BACK_NO ��ѹ�
FROM
    TEAM T 
    JOIN PLAYER P
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE
    P.PLAYER_NAME LIKE '��ȣ��'
;
-- SOCCER_SQL_019
-- ������Ƽ���� MF ���Ű�� ���Դϱ�? 174.87
SELECT 
    ROUND(AVG(P.HEIGHT),2) ���Ű 
FROM 
    TEAM T 
    JOIN PLAYER P
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE
    T.TEAM_NAME LIKE '��Ƽ��'
    AND P.POSITION LIKE 'MF'
;

-- SOCCER_SQL_020
-- 2012�� ���� ������ ���Ͻÿ�

SELECT 
    (SELECT COUNT(*) "1��"
    FROM SCHEDULE
    WHERE SCHE_DATE LIKE '201201%') "1��",
    (SELECT COUNT(*) "2��"
    FROM SCHEDULE
    WHERE SCHE_DATE LIKE '201202%') "2��",
    (SELECT COUNT(*) "3��"
    FROM SCHEDULE
    WHERE SCHE_DATE LIKE '201203%') "3��",
    (SELECT COUNT(*) "4��" 
    FROM SCHEDULE
    WHERE SCHE_DATE LIKE '201204%') "4��",
    (SELECT COUNT(*) "5��"
    FROM SCHEDULE
    WHERE SCHE_DATE LIKE '201205%') "5��",
    (SELECT COUNT(*) "6��"
    FROM SCHEDULE
    WHERE SCHE_DATE LIKE '201206%') "6��",
    (SELECT COUNT(*) "7��"
    FROM SCHEDULE
    WHERE SCHE_DATE LIKE '201207%') "7��",
    (SELECT COUNT(*) "8��"
    FROM SCHEDULE
    WHERE SCHE_DATE LIKE '201208%') "8��",
    (SELECT COUNT(*) "9��"
    FROM SCHEDULE
    WHERE SCHE_DATE LIKE '201209%') "9��",
    (SELECT COUNT(*) "10��"
    FROM SCHEDULE
    WHERE SCHE_DATE LIKE '201210%') "10��",
    (SELECT COUNT(*) "11��"
    FROM SCHEDULE
    WHERE SCHE_DATE LIKE '201211%') "11��",
    (SELECT COUNT(*) "12��"
    FROM SCHEDULE
    WHERE SCHE_DATE LIKE '201212%') "12��"
FROM DUAL
;

-- SOCCER_SQL_021
-- 2012�� ���� ����� ����(GUBUN IS YES)�� ���Ͻÿ�
-- ����� 1��:20��� �̷�������...
SELECT SUBSTR(sche_date,1,6) �������,
    COUNT(gubun) ����
FROM schedule 
WHERE gubun LIKE 'Y'
GROUP BY SUBSTR(sche_date,1,6)
ORDER BY SUBSTR(sche_date,1,6)
;

-- SOCCER_SQL_022
-- 2012�� 9�� 14�Ͽ� ������ ���� ���� ����Դϱ�
-- Ȩ��: ?   ������: ? �� ���
SELECT 
    HT.TEAM_NAME Ȩ��,
    AT.TEAM_NAME ������
FROM 
    SCHEDULE K
    JOIN TEAM HT
        ON K.HOMETEAM_ID LIKE HT.TEAM_ID
    JOIN TEAM AT
        ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
WHERE
    K.SCHE_DATE LIKE '20120914'
;
-- SOCCER_SQL_023
-- GROUP BY ���
-- ���� ������ ��
-- ������ũ 20��
-- �巡���� 19��...
SELECT 
    COUNT(P.PLAYER_ID) �����ο�,
    (SELECT 
        A.TEAM_NAME
     FROM 
        TEAM A
     WHERE 
        A.TEAM_ID LIKE T.TEAM_ID   
 )����
FROM 
    TEAM T
    JOIN PLAYER P
    ON T.TEAM_ID LIKE P.TEAM_ID
GROUP BY 
    T.TEAM_ID
ORDER BY
    T.TEAM_ID
;
-- SOCCER_SQL_024
-- ������ ������(�ѱ� ǥ��) ���
-- ������ '����'���� ǥ��
SELECT
   PLAYER_NAME �̸�,
   CASE
       WHEN POSITION IS NULL THEN '����'
       WHEN POSITION LIKE 'GK' THEN '��Ű��'
       WHEN POSITION LIKE 'DF' THEN '�����'
       WHEN POSITION LIKE 'MF' THEN '�̵��ʴ�'
       WHEN POSITION LIKE 'FW' THEN '���ݼ�'
       ELSE POSITION
   END ����
FROM
  PLAYER
WHERE
   TEAM_ID = 'K08'
;
-- SOCCER_SQL_025
-- �Ｚ�������� Ű������  11������
-- 20������ ���
SELECT 
    B.*
FROM
(SELECT
    ROWNUM RNUM,
    A.*
FROM  (SELECT 
   
    T.TEAM_NAME ����,
    P.PLAYER_NAME ������,
    P.POSITION ������,
    P.BACK_NO ��ѹ�,
    P.HEIGHT Ű
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
    T.TEAM_ID LIKE 
        (SELECT TEAM_ID
FROM TEAM
WHERE TEAM_NAME LIKE '�Ｚ�������')
 AND P.HEIGHT IS NOT NULL 
ORDER BY P.HEIGHT DESC)A)B
WHERE B.RNUM BETWEEN 11 AND 20
;
-- SOCCER_SQL_026
-- ���� ��Ű���� ��� Ű����
-- ���� ���Ű�� ū ������ ? ��� ����
-- ����
SELECT
   A.TNAME
FROM
(SELECT
   (SELECT
   TEAM_NAME
FROM
   TEAM 
WHERE TEAM_ID LIKE T.TEAM_ID) TNAME,
   AVG(P.HEIGHT) AVG_HT,
   T.TEAM_ID
FROM
   TEAM T
   JOIN
   PLAYER P
       ON
       T.TEAM_ID LIKE P.TEAM_ID
WHERE
   P.POSITION LIKE 'GK'
GROUP BY T.TEAM_ID
ORDER BY AVG_HT DESC)A
WHERE ROWNUM = 1
;
-- SOCCER_SQL_027
-- �� ���ܺ� ������ ���Ű�� �Ｚ �����������
-- ���Ű���� ���� ���� �̸��� �ش� ���� ���Ű�� 
-- ���Ͻÿ� 
--  ���� (��: 8��)
SELECT ROWNUM NO, A.����, A.Ű
 FROM (  SELECT (SELECT TEAM_NAME
                   FROM TEAM
                  WHERE TEAM_ID LIKE T.TEAM_ID)
                    ����,
                ROUND (AVG (P.HEIGHT), 2)
                    Ű
           FROM PLAYER P
               JOIN TEAM T
                   ON P.TEAM_ID LIKE T.TEAM_ID
          WHERE P.HEIGHT IS NOT NULL
       GROUP BY T.TEAM_ID) A,
      (  SELECT (SELECT TEAM_NAME
                   FROM TEAM
                  WHERE TEAM_ID LIKE T.TEAM_ID)
                    ����,
                ROUND (AVG (P.HEIGHT), 2)
                    Ű
           FROM PLAYER P
               JOIN TEAM T
               ON P.TEAM_ID LIKE T.TEAM_ID
       GROUP BY T.TEAM_ID
         HAVING T.TEAM_ID LIKE
                    (SELECT TEAM_ID
                       FROM TEAM
                      WHERE TEAM_NAME LIKE '�Ｚ�������')) B
WHERE A.Ű < B.Ű
;
-- ����
select
   (select tb.team_name
   from team tb
   where tb.team_id like t.team_id) ����,
   round(avg(p.height),2) ���Ű 
from player p
   join team t
       on p.team_id like t.team_id
group by t.team_id
having avg(p.height)<(
       select avg(pa.height)
       from player pa
           join team ta
               on pa.team_id like ta.team_id
       where ta.team_name like '�Ｚ�������')
;
-- SOCCER_SQL_028
-- 2012�� ��� �߿��� �������� ���� ū ��� 
-- 20120317, ��ȭõ�� VS ������Ƽ��, 6�������
-- ����
SELECT B.SCHE_DATE                    �����,
      B.WTEAM || 'VS' || B.LTEAM     Ȩ��VS������,
      B.DSCORE || '�������'     ������
 FROM (SELECT ROWNUM RNUM, A.*
         FROM (  SELECT SC.SCHE_DATE,
                        ABS (SC.HOME_SCORE - SC.AWAY_SCORE)     
                                                    DSCORE,
                        HT.TEAM_NAME  WTEAM,
                        AT.TEAM_NAME  LTEAM
                   FROM SCHEDULE SC
                        JOIN TEAM HT 
                            ON HT.TEAM_ID LIKE SC.HOMETEAM_ID
                        JOIN TEAM AT 
                            ON AT.TEAM_ID LIKE SC.AWAYTEAM_ID
                  WHERE     SC.SCHE_DATE LIKE '2012%'
                        AND SC.HOME_SCORE IS NOT NULL
               ORDER BY DSCORE DESC) A) B
WHERE B.RNUM = 1;
-- ����
select
   a.*
from
   (select
       sche_date ��¥,
       (select t.team_name 
       from team t 
       where t.team_id like sc.hometeam_id) Ȩ��,
   (select t.team_name 
   from team t 
   where t.team_id like sc.awayteam_id) ������,
       abs(sc.home_score-sc.away_score) ������
   from schedule sc
   where sc.sche_date like '2012%'
       and sc.GUBUN like 'Y'
   order by ������ desc)a
where rownum =1 
;
-- ����
SELECT A.*
FROM(SELECT
        K.SCHE_DATE ��⳯¥,
        HT.TEAM_NAME || ' VS ' || AT.TEAM_NAME ���,
        CASE
            WHEN K.HOME_SCORE >= 
                K.AWAY_SCORE THEN (K.HOME_SCORE - K.AWAY_SCORE)
            ELSE K.AWAY_SCORE - K.HOME_SCORE
        END ������
     FROM
        SCHEDULE K
        JOIN TEAM HT
            ON K.HOMETEAM_ID LIKE HT.TEAM_ID
        JOIN TEAM AT
            ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
     WHERE
        K.SCHE_DATE LIKE '2012%'
        AND K.GUBUN LIKE 'Y'
    
     ORDER BY ������ DESC) A
WHERE ROWNUM LIKE 1
;
-- SOCCER_SQL_029
-- �¼����� ���� ��� ��Ÿ��� ���� �ű��
-- ����
SELECT
    ROWNUM "����",
    A.*
FROM(SELECT
        STADIUM_NAME ��Ÿ���,
        SEAT_COUNT �¼���
     FROM
        STADIUM
     ORDER BY SEAT_COUNT DESC) A
;
-- SOCCER_SQL_030
-- 2012�� ���� �¸� ������ �����ű��
-- 
SELECT    
   A.TEAM_NAME ����,    
   COUNT(A.SCORE)+COUNT(B.SCORE) �¼�
FROM    (SELECT    
           SC.HOME_SCORE - SC.AWAY_SCORE SCORE,
           HT.TEAM_ID TEAM_ID,
           HT.TEAM_NAME TEAM_NAME
       FROM SCHEDULE SC
           JOIN TEAM HT ON HT.TEAM_ID LIKE SC.HOMETEAM_ID
           JOIN TEAM AT ON AT.TEAM_ID LIKE SC.AWAYTEAM_ID
       WHERE
           SC.HOME_SCORE - SC.AWAY_SCORE >0
           AND SC.SCHE_DATE LIKE '2012%') A JOIN
       (SELECT    
           SC1.AWAY_SCORE - SC1.HOME_SCORE SCORE,
           AT1.TEAM_ID TEAM_ID,
           AT1.TEAM_NAME TEAM_NAME
       FROM SCHEDULE SC1
           JOIN TEAM HT1 ON HT1.TEAM_ID LIKE SC1.HOMETEAM_ID
           JOIN TEAM AT1 ON AT1.TEAM_ID LIKE SC1.AWAYTEAM_ID
       WHERE
           SC1.AWAY_SCORE - SC1.HOME_SCORE >0
           AND SC1.SCHE_DATE LIKE '2012%') B 
            ON A.TEAM_ID LIKE B.TEAM_ID
GROUP BY
       A.TEAM_ID,A.TEAM_NAME
ORDER BY    
       COUNT(A.SCORE) DESC
;
-- ����
SELECT 
    A.WINNER,
    COUNT(A.WINNER) �¸�
FROM(SELECT
        K.SCHE_DATE ��⳯¥,
        CASE
            WHEN K.HOME_SCORE > K.AWAY_SCORE THEN HT.TEAM_NAME
            WHEN K.AWAY_SCORE > K.HOME_SCORE THEN AT.TEAM_NAME
            ELSE '���º�'
        END WINNER
     FROM SCHEDULE K
            JOIN TEAM HT
                ON K.HOMETEAM_ID LIKE HT.TEAM_ID
            JOIN TEAM AT
                ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
     WHERE
        K.GUBUN LIKE 'Y'
        AND K.SCHE_DATE LIKE '2012%'
    )A
WHERE A.WINNER NOT LIKE '���º�'
GROUP BY A.WINNER
ORDER BY �¸� DESC
;