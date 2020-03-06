DROP TABLE Logs;
DROP TABLE Statistic;

CREATE TABLE Logs(str STRING);
CREATE TABLE Statistic(ip STRING,average DECIMAL(18,2),sum INTEGER);

LOAD DATA LOCAL INPATH '000000' OVERWRITE INTO TABLE Logs;

INSERT INTO Statistic
SELECT
	val.ip,
	AVERAGE(length),
	SUM(length)
FROM (
		SELECT 
			REGEXP_EXTRACT(str,'ip\\d+',0) AS ip,
			NVL(
				CAST(
					SPLIT(
						REGEXP_EXTRACT(str,'\\d+ \\d+',0),' ')[1] AS DECIMAL(18,2)
				), 0
			) AS length
		FROM Statistic
	) val
GROUP BY val.ip;

SELECT * FROM Statistic;