use master 
create database PRJ_ASM
use database PRJ_ASM


CREATE TABLE Account (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    isAdmin int
);

insert into Account values
(1,N'he187019' ,'123',1 ),
(2,N'huy' ,'123',0 ),
(3,N'dung' ,'123',0 ),
(4,N'manh' ,'123',1 ),
(5,N'van' ,'123',0 ),
(6,N'quang' ,'123',0 ),
(7,N'thu' ,'123',0 ),
(8,N'trong' ,'123',1 ),
(9,N'van' ,'123',0 ),
(10,N'tien' ,'123',0 )

CREATE TABLE Course (
		course_id INT IDENTITY(1,1) PRIMARY KEY,
		name NVARCHAR(100) NOT NULL,
		image_url VARCHAR(255),
		price INT,
		description NVARCHAR(500)
	);

INSERT INTO Course (name, image_url, price, description) VALUES 
(N'Lập trình Fullstack', N'https://cdn-main.28tech.com.vn/thumbs/anh-khoa-hoc/fullstack_thumb_500.jpg',12900000, N'Khóa học dành cho các bạn học viên có định hướng phát triển website hoàn chỉnh từ A đến Z sử dụng các công nghệ hiện đại như NodeJS, ExpressJS, ReactJS, NextJS, Typescript và các công nghệ khác có liên quan'),
(N'Lập trình C++ Cơ bản tới Nâng cao', N'https://cdn-main.28tech.com.vn/thumbs/anh-khoa-hoc/c%2B%2B%20co%20ban%20toi%20nc_thumb_500.png', 2600000, N'Khóa học Lập trình C++ từ Cơ bản tới Nâng cao là khóa học cung cấp trọn vẹn kiến thức của ngôn ngữ lập trình C++. Mục tiêu là xây dựng tư duy logic, kỹ năng giải quyết bài toán, nền tảng thuật toán và cấu trúc dữ liệu cho học viên bằng cách sử dụng ngôn ngữ lập trình C++'),
(N'Lập trình C++ Nâng cao', N'https://cdn-main.28tech.com.vn/thumbs/anh-khoa-hoc/l%E1%BA%ADp%20tr%C3%ACnh%20c%2B%2B%20n%C3%A2ng%20cao__thumb_500.png', 2750000, N'Khóa học Lập trình C++ Nâng cao là khóa học cung cấp trọn vẹn kiến thức của ngôn ngữ lập trình C++. Mục tiêu là xây dựng tư duy logic, kỹ năng giải quyết bài toán, nền tảng thuật toán và cấu trúc dữ liệu cho học viên bằng cách sử dụng ngôn ngữ lập trình C++. Khóa học sẽ có số lượng bài tập lớn hơn và mức độ khó hơn so với khóa cơ bản tới nâng cao'),
(N'Cấu trúc dữ liệu và Giải thuật', N'https://cdn-main.28tech.com.vn/thumbs/anh-khoa-hoc/ca%CC%82%CC%81u%20tru%CC%81c%20du%CC%9B%CC%83%20lie%CC%A3%CC%82u%20va%CC%80%20gia%CC%89i%20thua%CC%A3%CC%82tpng_thumb_500.png', 2950000, N'Khóa học Thuật toán cung cấp đầy đủ các kiến thức về Cấu trúc dữ liệu và Giải thuật phục vụ việc học tập tại đại học, tham gia các kỳ thi lập trình, học sinh giỏi các cấp, phỏng vấn xin việc'),
(N'Lập Trình Thi Đấu', N'https://cdn-main.28tech.com.vn/thumbs/anh-khoa-hoc/competitive%20programming_thumb_500.png', 6990000, N'Khóa học lập trình thi đấu dành cho các bạn học sinh, sinh viên IT yêu thích thuật toán và có định hướng học thuật toán để thi đấu các kỳ thi học sinh giỏi, tin học trẻ, Olympic tin học sinh viên'),
(N'Lập trình Java và SQL', N'https://cdn-main.28tech.com.vn/thumbs/anh-khoa-hoc/l%E1%BA%ADp%20tr%C3%ACnh%20java%20_%20sql_thumb_500.png', 2800000, N'Khóa học Java & SQL cung cấp kiến thức về ngôn ngữ lập trình Java, ngôn ngữ truy vấn SQL và các khái niệm về cơ sở dữ liệu. Ngoài ra bạn còn được học kiến thức về JSP, Servlet, một kiến thức quan trọng nếu bạn muốn theo đuổi Java web'),
(N'Lập trình Front-end', N'https://cdn-main.28tech.com.vn/thumbs/anh-khoa-hoc/fe_thumb_500.jpg', 5800000, N'Khóa học dành cho các bạn học viên có định hướng phát triển website Frontend sử dụng ReactJS, NextJS và các Framework liên quan'),
(N'Lập trình Back-end NodeJS', N'https://cdn-main.28tech.com.vn/thumbs/anh-khoa-hoc/be-node_thumb_500.png', 7000000, N'Khóa học dành cho các bạn học viên có định hướng theo phát triển website phía Backend sử dụng NodeJS và các Framework liên quan'),
(N'Lập trình Back-end Java', N'https://cdn-main.28tech.com.vn/thumbs/anh-khoa-hoc/be-java_thumb_500.png', 7000000, N'Khóa học Back-end Java sử dụng Framework Spring mới mục tiêu cung cấp kỹ năng về phát triển website cho học viên, phục vụ công việc học tập tại đại học, intern hoặc fresher');

CREATE TABLE Genre (
		genre_id INT IDENTITY(1,1) PRIMARY KEY ,
		name VARCHAR(50) NOT NULL
	);
INSERT INTO Genre (name) VALUES 
	('1tr-4trđ'),
	('4tr-6trđ'),
	('6tr-10trđ'),
	('10tr-14trđ')

	
CREATE TABLE Course_Genre (
		course_id INT,
		genre_id INT,
		PRIMARY KEY (course_id, genre_id),
		FOREIGN KEY (course_id) REFERENCES Course (course_id),
		FOREIGN KEY (genre_id) REFERENCES Genre (genre_id)
	);
	INSERT INTO Course_Genre (course_id, genre_id) VALUES
	(1, 4), -- full stack (4)
	(2, 1), -- c++ cơ bản (1)
	(3, 1), -- c++ nâng cao(1)
	(4, 1), -- cấu trúc dữ liệu (1)
	(5, 3), -- lập trình thi đấu (3)
	(6, 1), -- javasa ql (1)
	(7, 2),-- font end (2)
	(8, 3),-- backend nodejs (3)
	(9, 3) -- backend java (3)

CREATE TABLE Cart (
    cart_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    course_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Account(user_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Bill (
    bill_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    total MONEY NOT NULL,
    name NVARCHAR(255) NOT NULL,
    address NTEXT NOT NULL,
    payment VARCHAR(250) NOT NULL,
    date DATE NOT NULL,
    phone BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Account(user_id)
);

CREATE TABLE BillDetail (
    bill_detail_id INT IDENTITY(1,1) PRIMARY KEY,
    bill_id INT NOT NULL,
    course_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (bill_id) REFERENCES Bill(bill_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
