/*특정 기간동안 대여 가능한 자동차들의 대여비용 구하기*/

SELECT A.CAR_ID, A.CAR_TYPE, ROUND(A.DAILY_FEE*30*(100-C.DISCOUNT_RATE)*0.01) AS FEE
FROM CAR_RENTAL_COMPANY_CAR AS A
LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS B
ON A.CAR_ID = B.CAR_ID
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS C
ON A.CAR_TYPE = C.CAR_TYPE
WHERE A.CAR_ID NOT IN (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE END_DATE > '2022-11-01' AND START_DATE < '2022-12-01'
) AND C.DURATION_TYPE='30일 이상'
GROUP BY A.CAR_ID
HAVING A.CAR_TYPE IN ('세단','SUV') AND (FEE > 500000 AND FEE < 2000000)
ORDER BY FEE DESC, A.CAR_TYPE, A.CAR_ID DESC