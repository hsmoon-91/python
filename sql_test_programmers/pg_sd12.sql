/*이름에 EL이 들어가는 동물 찾기*/

SELECT
ANIMAL_ID,
NAME
FROM ANIMAL_INS
WHERE ANIMAL_TYPE = 'Dog' AND NAME LIKE '%EL%'
ORDER BY NAME
