--CREATE DATABASE [Ballershop]
USE [Ballershop]
GO
-----------------------------------------------------------------
/****** Object:  Table [dbo].[bill] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[bill_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[total] [money] NOT NULL,
	[payment] [varchar](250) NOT NULL,
	[address] [ntext] NOT NULL,
	[date] [date] NOT NULL,
	[phone] [bigint] NOT NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[bill_detail] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_detail](
	[detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[bill_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[size] [nchar](10) NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_bill_detail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[cart] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cart_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[product_img] [varchar](255) NOT NULL,
	[product_price] [float] NOT NULL,
	[total] [float] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[category] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[product] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [varchar](100) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[product_price] [money] NOT NULL,
	[product_describe] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[product_img] [varchar](255) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[product_size] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_size](
	[product_id] [varchar](100) NOT NULL,
	[size] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[users] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](200) NULL,
	[user_email] [varchar](255) NOT NULL,
	[user_pass] [nvarchar](255) NOT NULL,
	[isAdmin] [nvarchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
---------------------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[bill] ON 
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (20, 2, 2998000.000, N'MOMO', N'Hà Đông, Hà Nội', CAST(N'2022-02-23' AS Date), 0835765421)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (21, 3, 1700000.000, N'MOMO', N'Bắc Ninh', CAST(N'2021-05-20' AS Date), 0456327864)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (22, 4, 700000.000, N'VNPAY', N'Quảng Ninh', CAST(N'2022-02-12' AS Date), 0368759426)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (23, 2, 800000.000, N'Chưa thanh toán(VNPAY)', N'Hà Nội', CAST(N'2022-03-04' AS Date), 0835765421)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (24, 2, 799000.000, N'Chưa thanh toán(MOMO)', N'Hoà Bình', CAST(N'2022-03-03' AS Date), 0835765421)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (25, 4, 2400000.000, N'MOMO', N'Mỹ Đình, Hà Nội', CAST(N'2021-11-09' AS Date), 0368759426)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (26, 3, 749000.000, N'MOMO', N'Hoà Bình', CAST(N'2021-10-06' AS Date), 0456327864)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (27, 5, 749000.000, N'VNPAY', N'Hoà Lạc', CAST(N'2022-01-29' AS Date), 0145876595)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (28, 2, 850000.000, N'MOMO', N'New York', CAST(N'2022-03-01' AS Date), 0835765421)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (29, 5, 1499000.000, N'VNPAY', N'New York', CAST(N'2021-12-30' AS Date), 0145876595)
SET IDENTITY_INSERT [dbo].[bill] OFF
GO

SET IDENTITY_INSERT [dbo].[bill_detail] ON 
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [price]) VALUES (104, 20, N'P003',  2, N'37', 2998000.000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [price]) VALUES (105, 21, N'GA011', 2, N'43', 1700000.000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [price]) VALUES (106, 22, N'DL095', 1, N'42', 700000.000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [price]) VALUES (107, 23, N'KI063', 1, N'41', 800000.000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [price]) VALUES (108, 24, N'P001',  1, N'41', 799000.000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [price]) VALUES (109, 25, N'KI063', 3, N'42', 2400000.000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [price]) VALUES (111, 26, N'LB034', 1, N'42', 749000.000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [price]) VALUES (112, 27, N'LB034', 1, N'39', 749000.000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [price]) VALUES (113, 28, N'GA011', 1, N'42', 850000.000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [price]) VALUES (114, 29, N'P003',  1, N'38', 1499000.000)
SET IDENTITY_INSERT [dbo].[bill_detail] OFF
GO

SET IDENTITY_INSERT [dbo].[category] ON 
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'PEAK')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (2, N'NIKE')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (3, N'ADIDAS')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (4, N'JORDAN')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (5, N'UNDER ARMOUR')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (6, N'Bóng rổ')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (7, N'Phụ Kiện')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (8, N'Đồng Phục Thi Đấu')
SET IDENTITY_INSERT [dbo].[category] OFF
GO

INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'P001', 1, N'Giày PEAK Streetball Master black', 799000.000, N'Giày bóng rổ PEAK Streetball Master DA830551: 
Phần upper sử dụng chất liệu thân dệt và cao su giúp bề mặt thoáng và bền khi chơi Outdoor. Xung quanh mũi giày và gót giày được phủ bằng lớp cao su để tăng độ bền.
Đế giày được sản xuất dựa trên công nghệ Peak outdoor RB với chất liệu cao su chuyên dụng cho cùng vân đế hình lục giác, rãnh sâu bảo chứng cho độ bền vô địch khi “cày quốc” sân Outdoor.', 
543, N'images/P001.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'P002', 1, N'Giày PEAK Streetball Master red', 799000.000,N'Giày bóng rổ PEAK Streetball Master DA830551: 
Phần upper sử dụng chất liệu thân dệt và cao su giúp bề mặt thoáng và bền khi chơi Outdoor. Xung quanh mũi giày và gót giày được phủ bằng lớp cao su để tăng độ bền.
Đế giày được sản xuất dựa trên công nghệ Peak outdoor RB với chất liệu cao su chuyên dụng cho cùng vân đế hình lục giác, rãnh sâu bảo chứng cho độ bền vô địch khi “cày quốc” sân Outdoor.', 
234, N'images/P002.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'P003', 1, N'Giày PEAK Taichi Flash 2.0', 1499000.000, N'Giày bóng rổ PEAK Taichi Flash 2.0: 
Đôi giày có sự thay đổi lớn khi áp dụng công nghệ Taichi mới và công nghệ Super P-Motive ở phần đế giữa, hỗ trợ mang lại hiệu suất đệm và cảm giác chân tuyệt vời nhất cho người dùng. 
Trọng lượng tổng thể của đôi giày thể thao này có thể được kiểm soát tốt.
Sử dụng thiết kế màng PP và lưới hiệu suất cao, để đảm bảo độ thoáng khí tổng thể của đôi giày.', 
145, N'images/P003.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'P004', 1, N'Giày PEAK Uprising', 1349000.000, N'Giày bóng rổ PEAK Uprising E13121A:
Chức năng: hấp thụ sốc, chống trượt, chống mài mòn, thoáng khí, bao bọc, hỗ trợ, cân bằng, ánh sáng, phục hồi.
Sử dụng chất liệu da tổng hợp có độ bền cao, giữ phom lâu dài và dễ dàng vệ sinh.
Đệm Taichi hấp thụ chấn động và phản hồi cực nhạy cho trải nghiệm chân êm ái hơn khi di chuyển.', 
345, N'images/P004.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'P005', 1, N'Giày PEAK Beast', 1609000.000, N'Giày bóng rổ PEAK Beast E14021A:
Lấy cảm hứng từ những chiếc răng sắc nhọn của quái thú, đôi giày mang thiết kế độc đáo phần upper chiếm chọn cảm tình của những dân chơi bóng rổ thứ thiệt.
Upper sử dụng da kết hợp vải dệt thoáng khí giúp đôi chân dễ thở sau những quãng vật động tốc độ cao.
Hệ thống dây giày đan xen linh hoạt giúp tăng khả năng ôm sát bàn chân.', 
167, N'images/P005.png')
-----
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'GA011', 2, N'Giày Nike Freak 2', 850000.000, N'Giày bóng rổ Nike Freak 2 - Giannis Antetokounmpo: hàng Replica.
Sự kết hợp giữa đệm Zoom Air ở bàn chân trước và đệm siêu mềm, nhạy giúp bạn khai thác sức mạnh của mình trên sân.
Một miếng TPU đúc ở mặt trước bên ngoài được thiết kế cho một trong những bước di chuyển hiệu quả nhất của Giannis, giúp ổn định bàn chân trong suốt trận đấu.
Cao su đế ngoài được tách thành 2 khu vực với một miếng hỗ trợ cứng ở giữa. Điều này giúp giảm trọng lượng và cải thiện tính linh hoạt.', 
446, N'images/GA011.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'KB023', 2, N'Giày Nike Kobe 5', 900000.000,N'Giày bóng rổ Nike Kobe 5 - Kobe Bryant: hàng Replica.
Sự cam kết của Kobe Bryant đối với các trận đấu trong và ngoài sân đấu phản ánh Tinh thần Mamba đã giúp anh trở thành nhà vô địch năm lần và là một trong những vận động viên vĩ đại nhất trong thế hệ của anh.', 
235, N'images/KB023.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'KI063', 2, N'Giày Nike Kyrie 7', 800000.000, N'Giày bóng rổ Nike Kyrie 7 - Kyrie Irving: hàng Replica.
Kyrie Irving được biết đến với sự nhanh nhẹn và linh hoạt trên sân đấu.Cảm giác tiếp đất của đôi giày rất chân thực và được đánh giá cao. 
Những người chơi bóng chắc chắn sẽ đánh giá cao khả năng phản hồi của bộ phận Air Zoom Turbo ở bàn chân trước, cũng được sử dụng trong các loại giày bóng rổ khác của Nike.
Chất liệu của đôi giày mang tới cảm giác mềm và linh hoạt ngay khi vừa khui ra khỏi hộp.', 
135, N'images/KI063.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'LB034', 2, N'Giày Nike Lebron 18', 749000.000, N'Giày bóng rổ Nike Lebron 18 - Lebron James: hàng Replica.
Để kỷ niệm lần thứ 18 liên tiếp Lebron James góp mặt tại NBA và chức vô địch anh ấy mới đem về cho Laker thì Nike đã ra mắt liền tay phiên bản thứ 18 của dòng giày signature của Lebron: Lebron 18. 
Bộ đệm được sử dụng là những bộ đêm nổi tiếng của Nike Air Max, Zoom Air, Cushlon. 
Bộ traction được chia thành 2 phần với phần đế phía đầu mũi chân là những họa tiết hình ô vuông như miếng bánh waffle, rất tốt cho những pha xử lý linh hoạt và tăng tốc độ.
Còn phần phía gót chân là những họa tiết vân nổi đa hướng, giúp tăng tối đa khả năng bám sàn và độ lì lợm của đôi giày. ', 
254, N'images/LB034.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'PG055', 2, N'Giày Nike PG 5', 609000.000, N'Giày bóng rổ Nike PG 5 - Paul George: hàng Replica.
PG 5 EP là sự kết hợp giữa thiết kế giày cổ thấp nhanh nhẹn mà Paul yêu thích với lớp đệm Nike Air Dot Weld Strobel linh hoạt. 
Công nghệ Air có được khâu trực tiếp lên phần upper, mang lại phần đệm êm ái, mềm mại ngay dưới chân — hoàn hảo khiến bạn có cảm giác như đang di chuyển trên mây. 
Phiên bản EP này sử dụng đế ngoài siêu bền, lý tưởng cho các sân bóng ngoài trời.',  
467, N'images/PG055.png')
-----
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'JH045', 3, N'Giày Adidas Harden Vol 5', 799000.000, N'Giày bóng rổ Adidas Harden Vol 5 - James Harden: hàng Replica.
Đôi Adidas Harden Vol 5 sở hữu công nghệ “Futurenatural” mới của Adidas Basketball. Đôi giày là sản phẩm hợp tác giữa James Harden và hãng giày Adidas. 
Đồng thời đánh dấu sự ra mắt của công nghệ mới “Futurenatural” của Adidas. Đôi giày bóng rổ Adidas của The Beard kết hợp hệ thống ôm bàn chân 360 độ liền mạch với bộ đệm kết hợp. 
Chúng tạo ra một thiết kế nhẹ nhưng hỗ trợ chuyển động tự do toàn diện trên sân bóng rổ.',  
124, N'images/JH045.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'DL095', 3, N'Giày Adidas Dame 5', 700000.000, N'Giày bóng rổ Adidas Dame 5 - Damian Lillard: hàng Replica.
Giày bóng rổ Adidas Dame 5 sử dụng bộ đệm Full Bounce vô cùng bền bỉ. Dù không được trang bị bộ đệm tân tiến nhất của Adidas là đệm Boost, nhưng rõ ràng Dame 5 đã cho thấy không phải cứ xịn nhất là tốt nhất.
Upper được chia làm 2 phần rõ rệt, phần nửa sau sử dụng chất liệu nỉ trắng, trong khi đó phần mũi giày lại được đan dạng lưới dựa trên công nghệ dệt sợi bọc kim giúp linh hoạt, thoáng khi tốt hơn.',  
213, N'images/DL095.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'RW025', 4, N'Giày Jordan Why Not Zero 4', 950000.000, N'Giày bóng rổ Jordan Why Not Zero 4 - Russell Westbrook: hàng Replica.
Bộ đệm được thay đổi với việc Nike đặt 2 miếng Zoom xếp chồng lên nhau ở phần đầu mũi chân và cho người dùng thấy nó bằng một lỗ nhỏ có ký hiệu Jumpman.
Bố đế của Why Not Zer0.4 được đánh giá là rất tốt khi nó nhận được nhiều nhận xét tốt về hiệu năng hoạt động ở cả mặt sân trong nhà và ngoài trời.',  
124, N'images/RW025.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'MJ032', 4, N'Giày Jordan 35', 859000.000, N'Giày bóng rổ Jordan 35 - Michael Jordan: hàng Replica.
Phiên bản thứ 35 của dòng giày đánh số thương hiệu Jordan tiếp tục được ra mắt với hàng loạt điểm nhấn, sự hoài niệm đến từ các phiên bản tiền bối tuy vẫn giữ bộ khung giống như Air Jordan 34.
2 miếng Zoom Air lớn được đặt ở phần thân trước và gót giày rất đàn hồi, sức bật nảy rất tốt và đặc biết êm ái. 
Có vẻ như các nhà thiết kế của Jordan đã tăng kích thước của bộ đệm phía trước mũi chân, khiến cho nó cực kỳ thoải mái và bảo vệ bàn chân cực kỳ tốt.
Đế ngoài của Jordan 35 có họa tiết herringbone đa hướng với chất liệu cao su mềm, tương tự như Jordan 34 và vẫn đem lại những hiệu quả tương xứng. 
Do vân đế được đánh giá là khả mỏng và có những rãnh rất dễ dàng bám đất, vì vậy đôi giày này thực sự chỉ hiệu quả với những mặt sân indoor sạch sẽ hoặc được chải chuốt nhiều.',  
533, N'images/MJ032.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'SC030', 5, N'Giày UA Curry 8', 800000.000, N'Giày bóng rổ UA Curry 8 - Stephen Curry: hàng Replica.
Mẫu giày đỉnh nhất của shooter đẳng cấp Stephen Curry với bộ đệm kèm đế Flow cho bạn độ bám dính sàn cùng độ nhạy trên từng bước chân.',  
245, N'images/SC030.png')
-----
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'BR001', 6, N'Bóng rổ da Spalding', 350000.000, N'Bóng rổ da Spalding, Wilson - bóng tiêu chuẩn NBA.', 145, N'images/BR001.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'BR002', 6, N'Bóng rổ da Molten', 300000.000, N'Bóng rổ da Molten BGG7X  - bóng tiêu chuẩn FIBA.', 132, N'images/BR002.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'BR003', 7, N'Tất bóng rổ NBA', 50000.000, N'Tất bóng rổ NBA - tất logo NBA và mang thiết kế của các đội bóng và các cầu thủ.', 734, N'images/BR003.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'BR004', 8, N'Bộ quần áo bóng rổ Bulls', 300000.000, N'Bộ quần áo thi đấu NBA  - Chicago Bulls Jerseys.', 300, N'images/BR004.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [product_img]) 
VALUES (N'BR005', 8, N'Bộ quần áo bóng rổ GSW', 300000.000, N'Bộ quần áo thi đấu NBA  - Golden State Warriors Jerseys.', 300, N'images/BR005.png')
GO

INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P001', N'36')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P001', N'37')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P001', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P001', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P001', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P001', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P001', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P001', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P001', N'44')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P002', N'36')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P002', N'37')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P002', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P002', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P002', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P002', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P002', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P002', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P002', N'44')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P003', N'36')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P003', N'37')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P003', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P003', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P003', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P003', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P003', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P003', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P003', N'44')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P004', N'36')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P004', N'37')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P004', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P004', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P004', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P004', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P004', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P004', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P004', N'44')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P005', N'36')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P005', N'37')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P005', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P005', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P005', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P005', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P005', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P005', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'P005', N'44')
--------------------------------------------------------------------------
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'GA011', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'GA011', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'GA011', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'GA011', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'GA011', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'GA011', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'GA011', N'44')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KB023', N'36')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KB023', N'37')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KB023', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KB023', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KB023', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KB023', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KB023', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KB023', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KB023', N'44')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KI063', N'36')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KI063', N'37')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KI063', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KI063', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KI063', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KI063', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KI063', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KI063', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'KI063', N'44')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'LB034', N'37')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'LB034', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'LB034', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'LB034', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'LB034', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'LB034', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'LB034', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'LB034', N'44')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PG055', N'36')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PG055', N'37')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PG055', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PG055', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PG055', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PG055', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PG055', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PG055', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PG055', N'44')
--------------------------------------------------------------------------
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'JH045', N'36')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'JH045', N'37')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'JH045', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'JH045', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'JH045', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'JH045', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'JH045', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'JH045', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'JH045', N'44')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'DL095', N'36')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'DL095', N'37')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'DL095', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'DL095', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'DL095', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'DL095', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'DL095', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'DL095', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'DL095', N'44')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'RW025', N'36')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'RW025', N'37')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'RW025', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'RW025', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'RW025', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'RW025', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'RW025', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'RW025', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'RW025', N'44')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'MJ032', N'37')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'MJ032', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'MJ032', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'MJ032', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'MJ032', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'MJ032', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'MJ032', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'MJ032', N'44')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SC030', N'36')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SC030', N'37')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SC030', N'38')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SC030', N'39')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SC030', N'40')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SC030', N'41')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SC030', N'42')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SC030', N'43')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SC030', N'44')
---------------------------------------------------------------------------
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'BR001', N'Size 6')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'BR001', N'Size 7')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'BR002', N'Size 6')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'BR002', N'Size 7')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'BR004', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'BR004', N'M')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'BR004', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'BR004', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'BR004', N'2XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'BR005', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'BR005', N'M')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'BR005', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'BR005', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'BR005', N'2XL')
GO

SET IDENTITY_INSERT [dbo].[users] ON 
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (1, N'Admin', N'ducwww2001@gmail.com', N'ducwww2001', N'TRUE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (2, N'ducnguyen', N'nguyenduc@gmail.com', N'12345', N'FALSE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (3, N'duc', N'ducduc123@gmail.com', N'123456', N'FALSE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (4, N'shop', N'shopcuatui@gmail.com', N'1423', N'FALSE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (5, N'lisa', N'lisa9486@yahoo.com', N'123', N'FALSE')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
--------------------------------------------------------------------------------------------------
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_users]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[bill] ([bill_id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_bill]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_product]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[product_size]  WITH CHECK ADD  CONSTRAINT [FK_product_size_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_size] CHECK CONSTRAINT [FK_product_size_product]
GO
----------------------------------------------------------------------------------------------------------------