INSERT [dbo].[TradeOrderTypes] ([Id], [Name]) VALUES (1, N'Buy')
INSERT [dbo].[TradeOrderTypes] ([Id], [Name]) VALUES (2, N'Sell')
GO

INSERT [dbo].[OperationTypes] ([Id], [Name]) VALUES (1, N'Deposit')
INSERT [dbo].[OperationTypes] ([Id], [Name]) VALUES (2, N'Withdrawal')
INSERT [dbo].[OperationTypes] ([Id], [Name]) VALUES (3, N'TradeOrder')
GO

SET IDENTITY_INSERT [dbo].[Operations] ON;  
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (1, 1, CAST(1000.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (2, 3, CAST(-500.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (3, 3, CAST(-200.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (4, 3, CAST(-300.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (5, 3, CAST(1000.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (6, 3, CAST(600.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (7, 3, CAST(450.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (8, 2, CAST(-500.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (9, 3, CAST(-400.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (10, 3, CAST(-200.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (11, 3, CAST(-700.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (12, 3, CAST(800.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (13, 3, CAST(100.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (14, 1, CAST(5000.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (15, 3, CAST(-4000.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (16, 3, CAST(-1500.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (17, 3, CAST(8000.000000000 AS Decimal(18, 9)))
INSERT [dbo].[Operations] ([Id], [OperationTypeId], [Amount]) VALUES (18, 2, CAST(-5000.000000000 AS Decimal(18, 9)))
SET IDENTITY_INSERT [dbo].[Operations] OFF;  
GO

SET IDENTITY_INSERT [dbo].[TradeOrders] ON;  
INSERT [dbo].[TradeOrders] ([Id], [OperationId], [Amount], [TradeOrderTypeId]) VALUES (1, 2, CAST(-500.000000000 AS Decimal(18, 9)), 2)
INSERT [dbo].[TradeOrders] ([Id], [OperationId], [Amount], [TradeOrderTypeId]) VALUES (2, 3, CAST(-200.000000000 AS Decimal(18, 9)), 2)
INSERT [dbo].[TradeOrders] ([Id], [OperationId], [Amount], [TradeOrderTypeId]) VALUES (3, 4, CAST(-300.000000000 AS Decimal(18, 9)), 2)
INSERT [dbo].[TradeOrders] ([Id], [OperationId], [Amount], [TradeOrderTypeId]) VALUES (4, 5, CAST(1000.000000000 AS Decimal(18, 9)), 1)
INSERT [dbo].[TradeOrders] ([Id], [OperationId], [Amount], [TradeOrderTypeId]) VALUES (5, 6, CAST(600.000000000 AS Decimal(18, 9)), 1)
INSERT [dbo].[TradeOrders] ([Id], [OperationId], [Amount], [TradeOrderTypeId]) VALUES (6, 7, CAST(450.000000000 AS Decimal(18, 9)), 1)
INSERT [dbo].[TradeOrders] ([Id], [OperationId], [Amount], [TradeOrderTypeId]) VALUES (7, 9, CAST(-400.000000000 AS Decimal(18, 9)), 2)
INSERT [dbo].[TradeOrders] ([Id], [OperationId], [Amount], [TradeOrderTypeId]) VALUES (8, 10, CAST(-200.000000000 AS Decimal(18, 9)), 2)
INSERT [dbo].[TradeOrders] ([Id], [OperationId], [Amount], [TradeOrderTypeId]) VALUES (9, 11, CAST(-700.000000000 AS Decimal(18, 9)), 2)
INSERT [dbo].[TradeOrders] ([Id], [OperationId], [Amount], [TradeOrderTypeId]) VALUES (10, 12, CAST(800.000000000 AS Decimal(18, 9)), 1)
INSERT [dbo].[TradeOrders] ([Id], [OperationId], [Amount], [TradeOrderTypeId]) VALUES (11, 13, CAST(100.000000000 AS Decimal(18, 9)), 1)
INSERT [dbo].[TradeOrders] ([Id], [OperationId], [Amount], [TradeOrderTypeId]) VALUES (12, 15, CAST(-4000.000000000 AS Decimal(18, 9)), 2)
INSERT [dbo].[TradeOrders] ([Id], [OperationId], [Amount], [TradeOrderTypeId]) VALUES (13, 16, CAST(-1500.000000000 AS Decimal(18, 9)), 2)
INSERT [dbo].[TradeOrders] ([Id], [OperationId], [Amount], [TradeOrderTypeId]) VALUES (14, 17, CAST(8000.000000000 AS Decimal(18, 9)), 1)
SET IDENTITY_INSERT [dbo].[TradeOrders] OFF;  
GO

SET IDENTITY_INSERT [dbo].[Deposits] ON;  
INSERT [dbo].[Deposits] ([Id], [OperationId], [Amount], [FromAddress]) VALUES (1, 1, CAST(1000.000000000 AS Decimal(18, 9)), N'0xdac17f958d2ee523a2206206994597c13d831ec7')
INSERT [dbo].[Deposits] ([Id], [OperationId], [Amount], [FromAddress]) VALUES (2, 14, CAST(5000.000000000 AS Decimal(18, 9)), N'0xdac17f958d2ee523a2206206994597c13d831ec7')
SET IDENTITY_INSERT [dbo].[Deposits] OFF;  
GO

SET IDENTITY_INSERT [dbo].[Withdrawals] ON;  
INSERT [dbo].[Withdrawals] ([Id], [OperationId], [Amount], [WasApprovedByUser2FA], [ToAddress]) VALUES (1, 8, CAST(-500.000000000 AS Decimal(18, 9)), 1, N'0xdac17f958d2ee523a2206206994597c13d831ec7')
INSERT [dbo].[Withdrawals] ([Id], [OperationId], [Amount], [WasApprovedByUser2FA], [ToAddress]) VALUES (2, 18, CAST(-5000.000000000 AS Decimal(18, 9)), 0, N'0xdac17f958d2ee523a2206206994597c13d831ec7')
SET IDENTITY_INSERT [dbo].[Withdrawals] OFF;  
GO
