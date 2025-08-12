-- INSERT 테이블에 데이터 삽입

--특정 컬럼에만 데이터를 넣는 경우

INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT) -- 넣어야할 컬럼 정해야 함
VALUES('12341234', '홍길동', '기계'); -- 나머지 부분은 NULL처리됨

INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT) -- 학번을 PK로 설정되어 동일 학번 삽입 불가
VALUES('12341234', '김철수', '컴퓨터정보'); -- 실행하면 ERROR

INSERT INTO STUDENT(STU_NO, STU_NAME) -- STU_DEPT가 NOT NULL로 선정되면 NULL로 데이터가 없으면 ERROR
VALUES('12345678', '김철수');

-- 모든 컬럼에 데이터를 넣는 경우
-- 컬럼명 생략이 되면 : 값을 넣을 때 순서를 잘 지켜야 하고, 모든 DATA를 다 넣어야 함. 그렇지 않으면 ERROR
INSERT INTO STUDENT
VALUES('12345678', '김철수', '전기전자', 2, 'A', 'M', 175, 70);
COMMIT;
