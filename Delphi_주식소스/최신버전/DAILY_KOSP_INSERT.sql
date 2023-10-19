USE [STOCK_INFO]
GO

/****** Object:  Trigger [dbo].[DAILY_KOSP_INSERT]    Script Date: 2019-01-20 ���� 11:46:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE TRIGGER [dbo].[DAILY_KOSP_INSERT] ON      
	[dbo].[DAILY_KOSP]
AFTER INSERT 
AS 
BEGIN 
     declare @CCODE VARCHAR(20)
     declare @DDATE VARCHAR(20)
	 declare @ENDPRICE VARCHAR(20)
	 declare @CUR_VAR CURSOR
	 declare @CUR_VAR1 CURSOR
	 declare @CUR_VAR2 CURSOR

     declare @DAY5 VARCHAR(20)
     declare @DAY10 VARCHAR(20)
	 declare @DAY20 VARCHAR(20)  
	 declare @DAY60 VARCHAR(20)
	 declare @DAY120 VARCHAR(20)
	 declare @DAY240 VARCHAR(20)
	 declare @AVGDAY5 VARCHAR(20)
     declare @AVGDAY10 VARCHAR(20)
	 
     declare @STOK5 VARCHAR(20)
	 declare @STOK3 VARCHAR(20)
	 declare @STOD3 VARCHAR(20)
	 declare @STOK20 VARCHAR(20)
	 declare @STOK12 VARCHAR(20) 
	 declare @STOD12 VARCHAR(20) 
	 declare @SMAX VARCHAR(20) 
	 declare @SMIN VARCHAR(20) 
	 declare @VSTDEV VARCHAR(20) 
	 declare @PREV20DAY5 VARCHAR(20) 
	 declare @DAY20UP VARCHAR(20)
	 declare @DAYGAP VARCHAR(20)
	 declare @DAY10SUM VARCHAR(20)
	 declare @DAY10COUNT VARCHAR(20)
	 declare @GURAESTDEV VARCHAR(20)
	 declare @DAY20SUM VARCHAR(20)
	 declare @DAY20COUNT VARCHAR(20)
	 declare @DAY60SUM VARCHAR(20)
	 declare @DAY60COUNT VARCHAR(20)
	 declare @DAY40SUM VARCHAR(20)
	 declare @DAY40COUNT VARCHAR(20)
	 declare @MAX240 VARCHAR(20)
	 declare @MIN240 VARCHAR(20)
	 declare @GURAE20 VARCHAR(20)
	 declare @GURAE40 VARCHAR(20)
	 declare @PREUPDOWN1 VARCHAR(20)
	 declare @PREUPDOWN2 VARCHAR(20)


	 SET @CUR_VAR = CURSOR for Select CCODE, DDATE, ENDPRICE From INSERTED
	 OPEN @CUR_VAR
	 Fetch next From @CUR_VAR INTO @CCODE, @DDATE, @ENDPRICE
	 While (@@FETCH_STATUS = 0)
	 BEGIN

        	SELECT @DAY5=AVG(ENDPRICE), @STOK5=((@ENDPRICE- MIN(ENDPRICE))/(NULLIF(MAX(ENDPRICE)-MIN(ENDPRICE),0))) * 100 FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,ENDPRICE FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 5
			SELECT @DAY10=AVG(ENDPRICE) FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,ENDPRICE FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 10
			SELECT @DAY20=AVG(ENDPRICE), @STOK20=((@ENDPRICE- MIN(ENDPRICE))/(NULLIF(MAX(ENDPRICE)-MIN(ENDPRICE),0))) * 100 FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,ENDPRICE FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 20
			SELECT @DAY60=AVG(ENDPRICE) FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,ENDPRICE FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 60
			SELECT @DAY120=AVG(ENDPRICE) FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,ENDPRICE FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 120
		    SELECT @DAY240=AVG(ENDPRICE) FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,ENDPRICE FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 240

            

			UPDATE DAILY_KOSP 
			SET DAY5=@DAY5,DAY10=@DAY10,DAY20=@DAY20,DAY60=@DAY60,DAY120=@DAY120,DAY240=@DAY240,STOK5=ISNULL(@STOK5,0),STOK20=ISNULL(@STOK20,0)
			WHERE CCODE= @CCODE AND DDATE = @DDATE


       --     INSERT INTO DAILY_KOSP_STOK (CCODE, DDATE, STOK5,STOK20) VALUES(@CCODE,@DDATE,ISNULL(@STOK5,0),ISNULL(@STOK20,0))

	        Fetch next From @CUR_VAR INTO @CCODE, @DDATE, @ENDPRICE
			
     END

	 SET @CUR_VAR1 = CURSOR for Select CCODE, DDATE From INSERTED

	 OPEN @CUR_VAR1
	 Fetch next From @CUR_VAR1 INTO @CCODE, @DDATE
	 While (@@FETCH_STATUS = 0)
	 BEGIN
            

			SELECT @STOK3=AVG(STOK5) FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,STOK5 FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 3
		    SELECT @STOK12=AVG(STOK20) FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,STOK20 FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 12
		    
			UPDATE DAILY_KOSP 
			SET STOK3=ISNULL(@STOK3,0),STOK12=ISNULL(@STOK12,0) WHERE CCODE= @CCODE AND DDATE = @DDATE

	        Fetch next From @CUR_VAR1 INTO @CCODE, @DDATE
			
     END
	 
	 SET @CUR_VAR2 = CURSOR for Select CCODE, DDATE From INSERTED

	 OPEN @CUR_VAR2
	 Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
	 While (@@FETCH_STATUS = 0)
	 BEGIN
            

			SELECT @STOD3=AVG(STOK3) FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,STOK3 FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 3
		    SELECT @STOD12=AVG(STOK12) FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,STOK12 FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 12

			UPDATE DAILY_KOSP 
			SET STOD3=ISNULL(@STOD3,0),STOD12=ISNULL(@STOD12,0) WHERE CCODE= @CCODE AND DDATE = @DDATE

	        Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
			
     END

	 SET @CUR_VAR2 = CURSOR for Select CCODE, DDATE From INSERTED
	 OPEN @CUR_VAR2
	 Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
	 While (@@FETCH_STATUS = 0)
	 BEGIN
            

			SELECT @AVGDAY5=AVG(DAY5) FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,DAY5 FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 3
		    SELECT @AVGDAY10=AVG(DAY10) FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,DAY10 FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 3

			UPDATE DAILY_KOSP 
			SET AVGDAY5=ISNULL(@AVGDAY5,0),AVGDAY10=ISNULL(@AVGDAY10,0) WHERE CCODE= @CCODE AND DDATE = @DDATE

	        Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
			
     END

	 SET @CUR_VAR2 = CURSOR for Select CCODE, DDATE From INSERTED
	 OPEN @CUR_VAR2
	 Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
	 While (@@FETCH_STATUS = 0)
	 BEGIN
            

			SELECT @SMAX= MAX(HIGHPRICE) FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,HIGHPRICE FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 240
		    SELECT @SMIN=AVG(LOWPRICE) FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,LOWPRICE FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 240

			UPDATE DAILY_KOSP 
			SET SMAX=ISNULL(@SMAX,0),SMIN=ISNULL(@SMIN,0) WHERE CCODE= @CCODE AND DDATE = @DDATE

	        Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
			
     END

	 SET @CUR_VAR2 = CURSOR for Select CCODE, DDATE From INSERTED
	 OPEN @CUR_VAR2
	 Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
	 While (@@FETCH_STATUS = 0)
	 BEGIN
            

			SELECT @VSTDEV= STDEV(ROUND((HIGHPRICE-LOWPRICE)*100 / DAY5,2)) FROM 
			              (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,HIGHPRICE,LOWPRICE, DAY5
						   FROM DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 20
            
            SELECT @PREV20DAY5 = A.DAY5  FROM DAILY_KOSP A 
            INNER JOIN (SELECT TOP 1 CCODE,DDATE,DAY5, MIN(DDATE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS 
            BETWEEN CURRENT ROW AND 20 FOLLOWING) AS MINDAY FROM DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) B
            ON(A.CCODE=B.CCODE AND A.DDATE = B.MINDAY) 

			UPDATE DAILY_KOSP 
			SET VSTDEV=ISNULL(@VSTDEV,0), PREV20DAY5=@PREV20DAY5  
			WHERE CCODE= @CCODE AND DDATE = @DDATE

	        Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
     END


	 SET @CUR_VAR2 = CURSOR for Select CCODE, DDATE From INSERTED
	 OPEN @CUR_VAR2
	 Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
	 While (@@FETCH_STATUS = 0)
	 BEGIN
            

            SELECT TOP 1 @DAY20UP = B.DAY20UP  FROM DAILY_KOSP A 
            INNER JOIN (SELECT CCODE,DDATE, LEAD (DAY20, 1, 0) OVER(PARTITION BY CCODE ORDER BY DDATE DESC)
                               -LEAD (DAY5, 1, 0)  OVER(PARTITION BY CCODE ORDER BY DDATE DESC) AS DAY20UP FROM DAILY_KOSP 
					    WHERE CCODE=@CCODE AND DDATE <= @DDATE) B  ON(A.CCODE=B.CCODE AND A.DDATE = B.DDATE) 


			UPDATE DAILY_KOSP 
			SET DAY20UP = @DAY20UP  
			WHERE CCODE= @CCODE AND DDATE = @DDATE

	        Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
     END

	 SET @CUR_VAR2 = CURSOR for Select CCODE, DDATE From INSERTED
	 OPEN @CUR_VAR2
	 Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
	 While (@@FETCH_STATUS = 0)
	 BEGIN
            

            SELECT @DAYGAP = B.DAYGAP  FROM DAILY_KOSP A 
            INNER JOIN (SELECT TOP 1 CCODE,DDATE, ENDPRICE
                               -LEAD (ENDPRICE, 1, 0)  OVER(PARTITION BY CCODE ORDER BY DDATE DESC) AS DAYGAP FROM DAILY_KOSP 
					    WHERE CCODE=@CCODE AND DDATE <= @DDATE) B  ON(A.CCODE=B.CCODE AND A.DDATE = B.DDATE) 


			UPDATE DAILY_KOSP 
			SET DAYGAP = @DAYGAP  
			WHERE CCODE= @CCODE AND DDATE = @DDATE

	        Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
     END


	 SET @CUR_VAR2 = CURSOR for Select CCODE, DDATE From INSERTED
	 OPEN @CUR_VAR2
	 Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
	 While (@@FETCH_STATUS = 0)
	 BEGIN
            

			SELECT TOP 1 
			       @DAY10SUM= SUM(DAYGAP) OVER (PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 9 FOLLOWING),
				   @DAY10COUNT= SUM(CASE WHEN DAYGAP > 0 THEN 1 WHEN DAYGAP =0 THEN 0.4 ELSE 0 END) OVER (PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 9 FOLLOWING),
				   @DAY20SUM= SUM(DAYGAP) OVER (PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 19 FOLLOWING),
				   @DAY20COUNT= SUM(CASE WHEN DAYGAP > 0 THEN 1 WHEN DAYGAP =0 THEN 0.4 ELSE 0 END) OVER (PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 19 FOLLOWING), 
				   @DAY40SUM= SUM(DAYGAP) OVER (PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 39 FOLLOWING),
				   @DAY40COUNT= SUM(CASE WHEN DAYGAP > 0 THEN 1 WHEN DAYGAP =0 THEN 0.4 ELSE 0 END) OVER (PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 39 FOLLOWING), 
				   @DAY60SUM= SUM(DAYGAP) OVER (PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 59 FOLLOWING),
				   @DAY60COUNT= SUM(CASE WHEN DAYGAP > 0 THEN 1 WHEN DAYGAP =0 THEN 0.4 ELSE 0 END) OVER (PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 59 FOLLOWING) 
			FROM DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE

            

			UPDATE DAILY_KOSP 
			SET DAY10SUM=@DAY10SUM, DAY10COUNT=@DAY10COUNT,DAY20SUM=@DAY20SUM, DAY20COUNT=@DAY20COUNT,DAY40SUM=@DAY40SUM, DAY40COUNT=@DAY40COUNT, DAY60SUM=@DAY60SUM, DAY60COUNT=@DAY60COUNT
			WHERE CCODE= @CCODE AND DDATE = @DDATE

	        Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
     END


	 SET @CUR_VAR2 = CURSOR for Select CCODE, DDATE From INSERTED
	 OPEN @CUR_VAR2
	 Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
	 While (@@FETCH_STATUS = 0)
	 BEGIN
            

			SELECT TOP 1 @GURAESTDEV= STDEV(COALESCE(ROUND(A.GURAE * 100 /NULLIF(A.GAVG,0),2),0)) OVER(PARTITION BY A.CCODE 
			       ORDER BY A.DDATE DESC ROWS BETWEEN CURRENT ROW AND 20 FOLLOWING) 
				   FROM (SELECT CCODE,DDATE, GURAE, AVG(GURAE) OVER(PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 60 FOLLOWING) AS GAVG
                   FROM DAILY_KOSP  WHERE CCODE=@CCODE AND DDATE <= @DDATE ) A

 
			UPDATE DAILY_KOSP 
			SET GURAESTDEV=@GURAESTDEV 
			WHERE CCODE= @CCODE AND DDATE = @DDATE

	        Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
     END

	 SET @CUR_VAR2 = CURSOR for Select CCODE, DDATE From INSERTED
	 OPEN @CUR_VAR2
	 Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
	 While (@@FETCH_STATUS = 0)
	 BEGIN
            

			SELECT @MAX240= MAX(ENDPRICE) FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,ENDPRICE FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 240
		    SELECT @MIN240= MIN(ENDPRICE) FROM (select row_number() OVER (PARTITION BY CCODE ORDER BY DDATE DESC) AS ROW,ENDPRICE FROM 
	                            DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE) A WHERE A.ROW <= 240

			UPDATE DAILY_KOSP 
			SET MAX240=ISNULL(@MAX240,0),MIN240=ISNULL(@MIN240,0) WHERE CCODE= @CCODE AND DDATE = @DDATE

	        Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
			
     END

	 SET @CUR_VAR2 = CURSOR for Select CCODE, DDATE From INSERTED
	 OPEN @CUR_VAR2
	 Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
	 While (@@FETCH_STATUS = 0)
	 BEGIN
            

			SELECT TOP 1 
			       @GURAE20= ROUND((SUM(GURAE) OVER (PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 20 FOLLOWING) - GURAE)/20,0),
				   @GURAE40= ROUND((SUM(GURAE) OVER (PARTITION BY CCODE ORDER BY DDATE DESC ROWS BETWEEN CURRENT ROW AND 40 FOLLOWING) - GURAE)/40,0)
		    FROM DAILY_KOSP WHERE CCODE=@CCODE AND DDATE <= @DDATE

			UPDATE DAILY_KOSP 
			SET GURAE20=ISNULL(@GURAE20,0),GURAE40=ISNULL(@GURAE40,0) WHERE CCODE= @CCODE AND DDATE = @DDATE

	        Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
			
     END

	 SET @CUR_VAR2 = CURSOR for Select CCODE, DDATE From INSERTED
	 OPEN @CUR_VAR2
	 Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
	 While (@@FETCH_STATUS = 0)
	 BEGIN
            

            SELECT @PREUPDOWN1 = ISNULL(ROUND(((B.PREGAP1)/nullif(B.PREPRICE1-B.PREGAP1,0)) * 100,2),0),
			       @PREUPDOWN2 = ISNULL(ROUND(((B.PREGAP2)/nullif(B.PREPRICE2-B.PREGAP2,0)) * 100,2),0)
		    FROM DAILY_KOSP A 
            INNER JOIN (SELECT TOP 1 CCODE,DDATE, 
			            LEAD (ENDPRICE, 1, 0)  OVER(PARTITION BY CCODE ORDER BY DDATE DESC) AS PREPRICE1,
						LEAD(DAYGAP, 1, 0)  OVER(PARTITION BY CCODE ORDER BY DDATE DESC) AS PREGAP1,
						LEAD (ENDPRICE, 2, 0)  OVER(PARTITION BY CCODE ORDER BY DDATE DESC) AS PREPRICE2,
						LEAD(DAYGAP, 2, 0)  OVER(PARTITION BY CCODE ORDER BY DDATE DESC) AS PREGAP2
						FROM DAILY_KOSP 
					    WHERE CCODE=@CCODE AND DDATE <= @DDATE) B  ON(A.CCODE=B.CCODE AND A.DDATE = B.DDATE) 


			UPDATE DAILY_KOSP 
			SET PREUPDOWN1 = @PREUPDOWN1, PREUPDOWN2=@PREUPDOWN2  
			WHERE CCODE= @CCODE AND DDATE = @DDATE

	        Fetch next From @CUR_VAR2 INTO @CCODE, @DDATE
     END


END






GO


