DROP TABLE Item;
DROP TABLE Report;
DROP TABLE NextID;

CREATE TABLE Report (
  ID            NUMERIC(9,0) IDENTITY PRIMARY KEY NOT NULL,
  RVersion      VARCHAR(255),
  RHost         VARCHAR(255),
  RHostComment  VARCHAR(255),
  RUser         VARCHAR(255),
  RLocation     VARCHAR(255),
  RDateTime     VARCHAR(16),
  RComplete     SMALLINT
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
  ReportID      NUMERIC(9,0) NOT NULL,
	
  CONSTRAINT    cnstI1 FOREIGN KEY(ReportID) REFERENCES Report(ID)
);

CREATE TABLE NextID (
  TableName     VARCHAR(6) PRIMARY KEY,
  NextID        INT NOT NULL
);

INSERT INTO NextID (TableName, NextID) VALUES ('Report', 1);
