SELECT customers.customerNumber
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products ON orderdetails.productCode = products.productCode
WHERE products.productLine = 'Classic Cars'
GROUP BY customers.customerNumber
HAVING COUNT(*) > 23;