SELECT tb.* FROM TB_BSSH tb

-- 상호명이 '스타벅스'인 것 select (1464개)
SELECT tb.* FROM TB_BSSH tb WHERE CMPNM_NM LIKE '%스타벅스%';
-- 상호명이 '스타벅스', BHF_NM(지점명)이 '강남'인 것(19개)
SELECT tb.* FROM TB_BSSH tb WHERE CMPNM_NM LIKE '%스타벅스%' AND BHF_NM LIKE '%강남%';

SELECT
	tb.BSSH_NO -- PK
	, tb.CMPNM_NM -- 상호명
	, tb.BHF_NM -- 지점명
	, POPLTN.cnt -- 해당 행정동의 인구 수
	, tr.RN -- 도로명주소
FROM TB_BSSH tb 
	INNER JOIN TB_ADSTRD ta ON tb.ADSTRD_CD = ta.ADSTRD_CD 
	INNER JOIN (
		SELECT
			ADSTRD_CD 
			, SUM(POPLTN_CNT) AS cnt
		FROM TB_POPLTN tp 
			GROUP BY ADSTRD_CD 
	) POPLTN ON tb.ADSTRD_CD = POPLTN.ADSTRD_CD
	INNER JOIN TB_RN tr ON tb.RN_CD = tr.RN_CD 
	WHERE tb.CMPNM_NM LIKE '%스타벅스%'
		AND tb.BHF_NM LIKE '%강남%'
ORDER BY tb.BSSH_NO ;

SELECT
	tb.BSSH_NO -- PK
	, tb.CMPNM_NM -- 상호명
	, tb.BHF_NM -- 지점명
	, POPLTN.cnt_M -- 해당 행정동의 남성 인구 수
	, POPLTN.cnt_F -- 해당 행정동의 여성 인구 수
	, tr.RN -- 도로명주소
	, (
		SELECT AA.induty_cl_nm
		FROM TB_INDUTY_CL AA
		WHERE tb.INDUTY_LRGE_CL_CD = AA.induty_cl_cd
	) AS lgCd -- 업종 대분류명
	, (
		SELECT AA.induty_cl_nm
		FROM TB_INDUTY_CL AA
		WHERE tb.INDUTY_MIDDL_CL_CD = AA.induty_cl_cd
	) AS mdCd -- 업종 중분류명
	, (
		SELECT AA.induty_cl_nm
		FROM TB_INDUTY_CL AA
		WHERE tb.INDUTY_SMALL_CL_CD = AA.induty_cl_cd
	) AS smCd -- 업종 소분류명
FROM TB_BSSH tb 
	INNER JOIN TB_ADSTRD ta ON tb.ADSTRD_CD = ta.ADSTRD_CD 
	INNER JOIN (
		SELECT
			ADSTRD_CD 
			, SUM(
				CASE WHEN tp.POPLTN_SE_CD = 'M'
					THEN POPLTN_CNT ELSE 0
				END
			) AS cnt_M
			, SUM (
				CASE WHEN tp.POPLTN_SE_CD = 'F'
					THEN POPLTN_CNT ELSE 0
				END
			) AS cnt_F
		FROM TB_POPLTN tp 
			GROUP BY ADSTRD_CD 
	) POPLTN ON tb.ADSTRD_CD = POPLTN.ADSTRD_CD
	INNER JOIN TB_RN tr ON tb.RN_CD = tr.RN_CD 
	WHERE tb.CMPNM_NM LIKE '%스타벅스%'
		AND tb.BHF_NM LIKE '%강남%'
ORDER BY tb.BSSH_NO ;


-- 0821
-- 2020년 10월 시작시간 08:00~10:00 사이 2호선의 각 역별 승차 인원의 합계를 높은순으르 역순정렬, 상위 10행만 출력
-- SUBWAY_STATN_NO, LN_NM, STATN_NM, TK_GFF_SE_NM, CNT ( TB_SUBWAY_STATN, TB_SUBWAY_STATN_TK_GFF)

SELECT * FROM (
SELECT
	tss.SUBWAY_STATN_NO -- 고유 번호
	, tss.LN_NM -- 호선 번호
	, tss.STATN_NM -- 역 정보
	, ttgs.TK_GFF_SE_NM -- 승하차구분
	, SUM(tsstg.TK_GFF_CNT) AS CNT -- 승객 수
FROM TB_SUBWAY_STATN tss
	INNER JOIN TB_SUBWAY_STATN_TK_GFF tsstg ON tss.SUBWAY_STATN_NO = tsstg.SUBWAY_STATN_NO
	INNER JOIN TB_TK_GFF_SE ttgs ON ttgs.TK_GFF_SE_CD = tsstg.TK_GFF_SE_CD
	WHERE tsstg.BEGIN_TIME BETWEEN '0800' AND '1000'
		AND tsstg.STD_YM = '202010'
		AND tss.LN_NM = '2호선'
		AND ttgs.TK_GFF_SE_NM = '승차'
	GROUP BY tss.SUBWAY_STATN_NO, tss.LN_NM, tss.STATN_NM, ttgs.TK_GFF_SE_NM
ORDER BY CNT DESC
) WHERE ROWNUM <= 10;
-- FETCH FIRST 10 ROWS ONLY -- SELECT문 추가 없이 할때, 오라클 12 이상


-- 승하차횟수가 가장 많은 5건의 역이름과 승하차인원, 호선, 시간 출력
-- CNT, LN_NM, STATN_NM, BEGIN_TIME
SELECT
	tsstg.TK_GFF_CNT AS CNT -- 승하차 횟수
	, tss.LN_NM -- 호선 번호
	, tss.STATN_NM -- 역 정보
	, tsstg.BEGIN_TIME -- 시각 정보
FROM TB_SUBWAY_STATN tss
	INNER JOIN TB_SUBWAY_STATN_TK_GFF tsstg
		ON tss.SUBWAY_STATN_NO = tsstg.SUBWAY_STATN_NO
ORDER BY CNT DESC
FETCH FIRST 5 ROWS ONLY;


-- 행정동명 기준으로 인구수가 가장 많은 데이터를 연령대와 함께 인구수의 역순으로 정렬하여 출력
SELECT 
	ta.ADSTRD_NM
	, tas.AGRDE_SE_NM
	, SUM(tp.POPLTN_CNT) AS CNT
FROM TB_ADSTRD ta 
	INNER JOIN TB_POPLTN tp ON ta.ADSTRD_CD = tp.ADSTRD_CD 
	INNER JOIN TB_POPLTN_SE tps ON tp.POPLTN_SE_CD = tps.POPLTN_SE_CD 
	INNER JOIN TB_AGRDE_SE tas ON tas.AGRDE_SE_CD = tp.AGRDE_SE_CD 
WHERE tps.POPLTN_SE_CD = 'T'
	GROUP BY ta.ADSTRD_NM, tas.AGRDE_SE_NM 
ORDER BY CNT DESC;
SELECT 
	ta.ADSTRD_NM
	, tas.AGRDE_SE_NM
	, tp.POPLTN_CNT AS CNT
FROM TB_ADSTRD ta 
	INNER JOIN TB_POPLTN tp ON ta.ADSTRD_CD = tp.ADSTRD_CD 
	INNER JOIN TB_AGRDE_SE tas ON tas.AGRDE_SE_CD = tp.AGRDE_SE_CD
ORDER BY CNT DESC;

-- 업종분류가 한식 또는 분식이고 상가 업종의 대분류가 음식이고 주소분류명이 경기도인 음식점 이름의 오름차순으로 청렬
SELECT 
	tb.CMPNM_NM -- 음식점 이름
	, tic.INDUTY_CL_NM  -- 중분류
	, tac.ADRES_CL_NM  -- 주소
FROM TB_BSSH tb 
	INNER JOIN TB_INDUTY_CL tic ON tb.INDUTY_MIDDL_CL_CD = tic.INDUTY_CL_CD -- 중분류로 조인
	INNER JOIN TB_ADRES_CL tac ON tb.SIGNGU_CD = tac.ADRES_CL_CD -- 주소로 조인
WHERE tic.INDUTY_CL_NM IN ('한식', '분식')
	AND tb.INDUTY_LRGE_CL_CD = 'Q'
	AND tac.UPPER_ADRES_CL_CD = '41'
ORDER BY tic.INDUTY_CL_NM ASC;

SELECT 
	C.CMPNM_NM -- 음식점 명
	, B.INDUTY_CL_NM -- 중분류
	, D.ADRES_CL_NM -- 시군구
FROM TB_INDUTY_CL A
	INNER JOIN TB_INDUTY_CL B
		ON A.INDUTY_CL_CD = B.UPPER_INDUTY_CL_CD 
	INNER JOIN TB_BSSH C
		ON A.INDUTY_CL_CD = C.INDUTY_LRGE_CL_CD 
	INNER JOIN TB_ADRES_CL D
		ON C.SIGNGU_CD = D.ADRES_CL_CD 
WHERE A.INDUTY_CL_SE_CD = 'ICS001' -- 음식
	AND B.INDUTY_CL_NM IN ('한식', '분식')
	AND C.LNM_ADRES LIKE '%경기도%'
ORDER BY B.INDUTY_CL_NM ASC;