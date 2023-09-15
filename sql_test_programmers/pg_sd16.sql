/*카테고리별 상품 개수 구하기*/

SELECT
SUBSTR(PRODUCT_CODE, 1,2) CATEGORY,
COUNT(*) PRODUCTS
FROM PRODUCT
GROUP BY CATEGORY
ORDER BY 1