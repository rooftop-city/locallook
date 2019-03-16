-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;

CREATE SCHEMA `locallook`;


-- ************************************** `locallook`.`user`

CREATE TABLE `locallook`.`user`
(
 `User_ID`      integer NOT NULL AUTO_INCREMENT ,
 `User_Name`    varchar(45) NOT NULL ,
 `Stripe_Token` text NOT NULL ,
 `UUID`         varchar(40) NOT NULL ,
 `Profile_Img`  text NOT NULL ,
PRIMARY KEY (`User_ID`)
);






-- ************************************** `locallook`.`status`

CREATE TABLE `locallook`.`status`
(
 `Status_ID` integer NOT NULL ,
 `Status`    varchar(45) NOT NULL ,
PRIMARY KEY (`Status_ID`)
);






-- ************************************** `image`

CREATE TABLE `image`
(
 `Image_ID` integer NOT NULL ,
 `Img`      text NOT NULL ,
PRIMARY KEY (`Image_ID`)
);






-- ************************************** `locallook`.`city`

CREATE TABLE `locallook`.`city`
(
 `City_ID`   integer NOT NULL AUTO_INCREMENT ,
 `City_Name` varchar(100) NOT NULL ,
 `City_Img`  text NOT NULL ,
PRIMARY KEY (`City_ID`)
);






-- ************************************** `locallook`.`attribute`

CREATE TABLE `locallook`.`attribute`
(
 `Attribute_ID` integer NOT NULL ,
 `Name`         text NOT NULL ,
PRIMARY KEY (`Attribute_ID`)
);






-- ************************************** `locallook`.`partner`

CREATE TABLE `locallook`.`partner`
(
 `Partner_ID`   integer NOT NULL AUTO_INCREMENT ,
 `User_ID`      integer NOT NULL ,
 `Payout_Info`  text NOT NULL ,
 `Introduction` text NOT NULL ,
 `UUID`         varchar(40) NOT NULL ,
PRIMARY KEY (`Partner_ID`),
KEY `fkIdx_72` (`User_ID`),
CONSTRAINT `FK_72` FOREIGN KEY `fkIdx_72` (`User_ID`) REFERENCES `locallook`.`user` (`User_ID`)
);






-- ************************************** `locallook`.`service`

CREATE TABLE `locallook`.`service`
(
 `Service_ID` integer NOT NULL AUTO_INCREMENT ,
 `Details`    text NOT NULL ,
 `Partner_ID` integer NOT NULL ,
 `City_ID`    integer NOT NULL ,
 `Created_At` datetime NOT NULL ,
 `UUID`       varchar(40) NOT NULL ,
PRIMARY KEY (`Service_ID`),
KEY `fkIdx_75` (`Partner_ID`),
CONSTRAINT `FK_75` FOREIGN KEY `fkIdx_75` (`Partner_ID`) REFERENCES `locallook`.`partner` (`Partner_ID`),
KEY `fkIdx_82` (`City_ID`),
CONSTRAINT `FK_82` FOREIGN KEY `fkIdx_82` (`City_ID`) REFERENCES `locallook`.`city` (`City_ID`)
);






-- ************************************** `locallook`.`review`

CREATE TABLE `locallook`.`review`
(
 `Review_ID`  integer NOT NULL ,
 `Partner_ID` integer NOT NULL ,
 `Stars`      integer NOT NULL ,
 `Comment`    text NOT NULL ,
 `Created_At` datetime NOT NULL ,
PRIMARY KEY (`Review_ID`),
KEY `fkIdx_89` (`Partner_ID`),
CONSTRAINT `FK_89` FOREIGN KEY `fkIdx_89` (`Partner_ID`) REFERENCES `locallook`.`partner` (`Partner_ID`)
);






-- ************************************** `service_image`

CREATE TABLE `service_image`
(
 `Service_Image` integer NOT NULL ,
 `Service_ID`    integer NOT NULL ,
 `Image_ID`      integer NOT NULL ,
PRIMARY KEY (`Service_Image`),
KEY `fkIdx_183` (`Service_ID`),
CONSTRAINT `FK_183` FOREIGN KEY `fkIdx_183` (`Service_ID`) REFERENCES `locallook`.`service` (`Service_ID`),
KEY `fkIdx_186` (`Image_ID`),
CONSTRAINT `FK_186` FOREIGN KEY `fkIdx_186` (`Image_ID`) REFERENCES `image` (`Image_ID`)
);






-- ************************************** `locallook`.`request`

CREATE TABLE `locallook`.`request`
(
 `Request_ID` integer NOT NULL AUTO_INCREMENT ,
 `User_ID`    integer NOT NULL ,
 `Service_ID` integer NOT NULL ,
 `Created_At` datetime NOT NULL ,
 `Status_ID`  integer NOT NULL ,
 `UUID`       varchar(40) NOT NULL ,
PRIMARY KEY (`Request_ID`),
KEY `fkIdx_14` (`User_ID`),
CONSTRAINT `FK_14` FOREIGN KEY `fkIdx_14` (`User_ID`) REFERENCES `locallook`.`user` (`User_ID`),
KEY `fkIdx_150` (`Status_ID`),
CONSTRAINT `FK_150` FOREIGN KEY `fkIdx_150` (`Status_ID`) REFERENCES `locallook`.`status` (`Status_ID`),
KEY `fkIdx_50` (`Service_ID`),
CONSTRAINT `FK_50` FOREIGN KEY `fkIdx_50` (`Service_ID`) REFERENCES `locallook`.`service` (`Service_ID`)
);






-- ************************************** `locallook`.`request_attribute`

CREATE TABLE `locallook`.`request_attribute`
(
 `Request_Attribute_ID` integer NOT NULL ,
 `Attribute_ID`         integer NOT NULL ,
 `Request_ID`           integer NOT NULL ,
 `Value`                text NOT NULL ,
PRIMARY KEY (`Request_Attribute_ID`),
KEY `fkIdx_130` (`Attribute_ID`),
CONSTRAINT `FK_130` FOREIGN KEY `fkIdx_130` (`Attribute_ID`) REFERENCES `locallook`.`attribute` (`Attribute_ID`),
KEY `fkIdx_133` (`Request_ID`),
CONSTRAINT `FK_133` FOREIGN KEY `fkIdx_133` (`Request_ID`) REFERENCES `locallook`.`request` (`Request_ID`)
);






-- ************************************** `locallook`.`report`

CREATE TABLE `locallook`.`report`
(
 `Report_ID`  integer NOT NULL ,
 `Request_ID` integer NOT NULL ,
 `Created_At` datetime NOT NULL ,
 `UUID`       varchar(40) NOT NULL ,
PRIMARY KEY (`Report_ID`),
KEY `fkIdx_119` (`Request_ID`),
CONSTRAINT `FK_119` FOREIGN KEY `fkIdx_119` (`Request_ID`) REFERENCES `locallook`.`request` (`Request_ID`)
);






-- ************************************** `report_image`

CREATE TABLE `report_image`
(
 `Report_Image` integer NOT NULL ,
 `Image_ID`     integer NOT NULL ,
 `Report_ID`    integer NOT NULL ,
PRIMARY KEY (`Report_Image`),
KEY `fkIdx_192` (`Image_ID`),
CONSTRAINT `FK_192` FOREIGN KEY `fkIdx_192` (`Image_ID`) REFERENCES `image` (`Image_ID`),
KEY `fkIdx_198` (`Report_ID`),
CONSTRAINT `FK_198` FOREIGN KEY `fkIdx_198` (`Report_ID`) REFERENCES `locallook`.`report` (`Report_ID`)
);






-- ************************************** `locallook`.`report_attribute`

CREATE TABLE `locallook`.`report_attribute`
(
 `Report_Attribute_ID` integer NOT NULL ,
 `Attribute_ID`        integer NOT NULL ,
 `Report_ID`           integer NOT NULL ,
 `Value`               text NOT NULL ,
PRIMARY KEY (`Report_Attribute_ID`),
KEY `fkIdx_139` (`Attribute_ID`),
CONSTRAINT `FK_139` FOREIGN KEY `fkIdx_139` (`Attribute_ID`) REFERENCES `locallook`.`attribute` (`Attribute_ID`),
KEY `fkIdx_142` (`Report_ID`),
CONSTRAINT `FK_142` FOREIGN KEY `fkIdx_142` (`Report_ID`) REFERENCES `locallook`.`report` (`Report_ID`)
);






-- ************************************** `locallook`.`payment`

CREATE TABLE `locallook`.`payment`
(
 `Payment_ID` integer NOT NULL ,
 `User_ID`    integer NOT NULL ,
 `Report_ID`  integer NOT NULL ,
 `UUID`       varchar(40) NOT NULL ,
PRIMARY KEY (`Payment_ID`),
KEY `fkIdx_110` (`User_ID`),
CONSTRAINT `FK_110` FOREIGN KEY `fkIdx_110` (`User_ID`) REFERENCES `locallook`.`user` (`User_ID`),
KEY `fkIdx_154` (`Report_ID`),
CONSTRAINT `FK_154` FOREIGN KEY `fkIdx_154` (`Report_ID`) REFERENCES `locallook`.`report` (`Report_ID`)
) COMMENT='Keeps transaction history
';





