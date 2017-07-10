DROP DATABASE IF EXISTS lib;
CREATE DATABASE lib CHARACTER SET UTF8;
USE lib;
DROP TABLE IF EXISTS admin;
CREATE TABLE admin (
  aid      VARCHAR(50) NOT NULL,
  password VARCHAR(32) NOT NULL,
  lastdate DATETIME,
  flag INT,
  status INT,
  CONSTRAINT pk_aid PRIMARY KEY (aid)
);
DROP TABLE IF EXISTS member;
CREATE TABLE member (
  mid      VARCHAR(50) NOT NULL,
  name     VARCHAR(50),
  EntryYear CHAR(4),
  sex      INT,
  phone    VARCHAR(32),
  CONSTRAINT pk_aid PRIMARY KEY (mid)
);

DROP TABLE if exists item;
CREATE TABLE item (
  iid INT NOT NULL auto_increment,
  name VARCHAR(100),
  note TEXT,
  CONSTRAINT pk_iid PRIMARY KEY(iid)
);

DROP TABLE if exists services;
CREATE TABLE services (
  sid INT NOT NULL auto_increment,
  iid INT,
  aid VARCHAR(50),
  name VARCHAR(100),
  credate DATETIME,
  status INT,
  note TEXT,
  CONSTRAINT pk_sid PRIMARY KEY(sid),
  CONSTRAINT fk_iid FOREIGN KEY(iid) REFERENCES item(iid) ON DELETE CASCADE,
  CONSTRAINT fk_aid FOREIGN KEY(aid) REFERENCES admin(aid) ON DELETE CASCADE
);

DROP TABLE if exists getserv;
CREATE TABLE getserv (
  gid INT not null auto_increment,
  sid INT,
  mid VARCHAR(50),
  credate DATETIME,
  findate DATETIME,
  CONSTRAINT pk_gid PRIMARY KEY(gid),
  CONSTRAINT fk_sid FOREIGN KEY(sid) REFERENCES services(sid) ON DELETE CASCADE,
  CONSTRAINT fk_mid FOREIGN KEY(mid) REFERENCES member(mid) ON DELETE CASCADE
);


INSERT INTO admin(aid,password,flag,status) VALUES('admin','hello',1,1);