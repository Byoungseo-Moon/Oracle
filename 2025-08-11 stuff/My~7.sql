--1. 1학년과 3학년 학생이 듣는 수업 출력, 데이터는 학년을 기준으로 내림 차순
SELECT *
FROM SUBJECT
WHERE SUB_GRADE IN( 1,3)  -- SUB_GRADE = 1 OR SUB_GRADE = 3
ORDER BY SUB_GRADE DESC, SUB_NO;

--2. 과목에 '설계'가 들어가는 데이터 출력
SELECT *
FROM SUBJECT
WHERE SUB_NAME LIKE '%설계%';

--3. 과목번호가 105이상인 수업 출력, 데이터는 과목번호를 기준으로 오름 차순
SELECT *
FROM SUBJECT
WHERE SUB_NO >= 105
ORDER BY SUB_NO;

--4. SUB_NO 컬럼을 PK로 변경(테이블 우클릭 -> 편집 -> 대상컬럼 왼쪽 PK부분 클릭)

--5. 과목번호가 '201', 과목명이 '자바', 담당교수가 '홍길동' 나머지 정보는 없는 데이터 삽입
INSERT INTO SUBJECT(SUB_NO, SUB_NAME, SUB_PROF)
VALUES('201', '자바', '홍길동');     
       -- 나머지 2개를 NULL로 놓으면 컬럼명 생략가능

--6. 과목번호가 '202', 과목명이 '오라클', 담당교수가 '박영희', 학년이 '1', 학과가 '컴퓨터정보' 데이터 삽입
INSERT INTO SUBJECT --(SUB_NO, SUB_NAME, SUB_PROF, SUB_GRADE, SUB_DEPT)
VALUES('202', '오라클', '박영희', 1, '컴퓨터정보');
COMMIT;

--7. 5번에서 생성한 과목번호가 201인 데이터에 학년을 '2', 학과는 '컴퓨터정보'로 수정
UPDATE SUBJECT
SET
    SUB_GRADE = 2,
    SUB_DEPT = '컴퓨터정보'
WHERE SUB_NO = 201;
COMMIT;

--8. 과목번호가 200이상인 과목들을 삭제
DELETE SUBJECT 
WHERE SUB_NO >=200;
COMMIT;


