DROP TABLE Item;
DROP TABLE Report;
DROP TABLE NextID;

CREATE TABLE Report (
  ID            INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  RVersion      VARCHAR(255),
  RHost         VARCHAR(255),
  RHostComment  VARCHAR(255),
  RUser         VARCHAR(255),
  RLocation     VARCHAR(255),
  RDateTime     VARCHAR(16),
  RComplete     BIT NOT NULL
);

CREATE TABLE Item (
  INum          INT,
  IPage         VARCHAR(100),
  IDevice       VARCHAR(255),
  IGroup        VARCHAR(255),
  IField        VARCHAR(255),
  IValue        VARCHAR(255),
  IIcon         INT,
  IID           INT,
  ReportID      INT UNSIGNED NOT NULL,
	
  CONSTRAINT    cnstI1 FOREIGN KEY(ReportID) REFERENCES Report(ID)
);

CREATE TABLE NextID (
  TableName     VARCHAR(6) PRIMARY KEY,
  NextID        INT NOT NULL
);

INSERT INTO NextID (TableName, NextID) VALUES ('Report', 1);
