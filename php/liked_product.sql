CREATE TABLE likedproduct (
    lid INT PRIMARY KEY AUTO_INCREMENT,
    pid INT,
    imageurl VARCHAR(255),
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    categoryid INT,
    seller_id INT,
    gst DECIMAL(5, 2),
    email_id VARCHAR(255)
);