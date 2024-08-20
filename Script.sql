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