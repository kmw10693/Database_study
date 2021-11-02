-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/D5PT6T
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `User` (
    `userIdx` int AUTO_INCREMENT NOT NULL ,
    `name` varchar(100)  NOT NULL ,
    `password` varchar(200)  NOT NULL ,
    `phoneNum` varchar(100)  NOT NULL ,
    `grade` varchar(50)  NOT NULL ,
    `email` varchar(200)  NOT NULL ,
    `profileUrl` text  NULL ,
    `mailRecieve` varchar(1)  NOT NULL DEFAULT 'n',
    `smsRecieve` varchar(1)  NOT NULL DEFAULT 'n',
    `status` varchar(10)  NOT NULL DEFAULT 'active',
    `address` varchar(1000)  NOT NULL ,
    `createdAt` TIMESTAMP  NOT NULL DEFAULT current_time,
    `updatedAt` TIMESTAMP  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `userIdx`
    )
);

CREATE TABLE `Point` (
    `userIdx` int  NOT NULL ,
    `point` int  NOT NULL ,
    `deletePoint` int  NOT NULL ,
    `useDate` DATE  NOT NULL ,
    `usePlace` varchar(500)  NOT NULL ,
    `pointSave` int  NOT NULL ,
    `status` varchar(20)  NOT NULL DEFAULT 'active',
    `createdAt` TIMESTAMP  NOT NULL DEFAULT current_time,
    `updatedAt` TIMESTAMP  NOT NULL DEFAULT current_timestamp
);

CREATE TABLE `Coupon` (
    `userIdx` int  NOT NULL ,
    `couponInfo` varchar(1000)  NOT NULL ,
    `couponPrice` int  NOT NULL ,
    `couponValidate` int  NOT NULL ,
    `status` varchar(20)  NOT NULL DEFAULT 'active',
    `createdAt` TIMESTAMP  NOT NULL DEFAULT current_time,
    `updatedAt` TIMESTAMP  NOT NULL DEFAULT current_timestamp
);

CREATE TABLE `favoriteStore` (
    `userIdx` int  NOT NULL ,
    `storeIdx` int  NOT NULL ,
    `storeName` varchar(200)  NOT NULL ,
    `storeScore` float  NOT NULL ,
    `minimumOrder` int  NOT NULL ,
    `deliveryTip` int  NOT NULL ,
    `status` varchar(20)  NOT NULL DEFAULT 'active',
    `createdAt` TIMESTAMP  NOT NULL DEFAULT current_time,
    `updatedAt` TIMESTAMP  NOT NULL DEFAULT current_timestamp
);

CREATE TABLE `userReview` (
    `userIdx` int  NOT NULL ,
    `reviewScore` float  NOT NULL ,
    `storeIdx` int  NOT NULL ,
    `storeName` varchar(200)  NOT NULL ,
    `reviewPic` text  NOT NULL DEFAULT null,
    `review` varchar(2000)  NOT NULL DEFAULT null,
    `status` varchar(50)  NOT NULL DEFAULT 'active',
    `createdAt` TIMESTAMP  NOT NULL DEFAULT current_time,
    `updatedAt` TIMESTAMP  NOT NULL DEFAULT current_timestamp
);

CREATE TABLE `Category` (
    `categoryIdx` int AUTO_INCREMENT NOT NULL ,
    `categoryName` varchar(100)  NOT NULL ,
    `categoryUrl` text  NOT NULL ,
    `discounturl` text  NOT NULL ,
    `status` varchar(20)  NOT NULL DEFAULT 'active',
    `createdAt` TIMESTAMP  NOT NULL DEFAULT current_time,
    `updatedAt` TIMESTAMP  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `categoryIdx`
    )
);

CREATE TABLE `Basket` (
    `basketIdx` int AUTO_INCREMENT NOT NULL ,
    `userIdx` int  NOT NULL ,
    `menuInfo` varchar(1000)  NOT NULL ,
    `menuPrice` int  NOT NULL ,
    `totalPrice` int  NOT NULL ,
    `status` varchar(20)  NOT NULL DEFAULT 'active',
    `createdAt` TIMESTAMP  NOT NULL DEFAULT current_time,
    `updatedAt` TIMESTAMP  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `basketIdx`
    )
);

CREATE TABLE `Order` (
    `orderIdx` int AUTO_INCREMENT NOT NULL ,
    `address` varchar(1000)  NOT NULL ,
    `phoneNum` varchar(100)  NOT NULL ,
    `request` varchar(500)  NOT NULL ,
    `paymentMethod` varchar(500)  NOT NULL ,
    `totalPrice` int  NOT NULL ,
    `status` varchar(20)  NOT NULL DEFAULT 'active',
    `createdAt` TIMESTAMP  NOT NULL DEFAULT current_time,
    `updatedAt` TIMESTAMP  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `orderIdx`
    )
);

CREATE TABLE `StoreReview` (
    `StoreIdx` int  NOT NULL ,
    `storeName` varchar(500)  NOT NULL ,
    `storeScore` float  NOT NULL ,
    `status` varchar(20)  NOT NULL DEFAULT 'active',
    `createdAt` TIMESTAMP  NOT NULL DEFAULT current_time,
    `updatedAt` TIMESTAMP  NOT NULL DEFAULT current_timestamp
);

CREATE TABLE `Store` (
    `storeIdx` int AUTO_INCREMENT NOT NULL ,
    `categoryIdx` int  NOT NULL ,
    `storeName` varchar(500)  NOT NULL ,
    `storeScore` float  NOT NULL ,
    `storeInfo` varchar(5000)  NOT NULL ,
    `minimumOrder` int  NOT NULL ,
    `deliveryTip` int  NOT NULL DEFAULT 0,
    `storeUrl` text  NOT NULL ,
    `openlistCheck` varchar(1)  NOT NULL ,
    `status` varchar(10)  NOT NULL DEFAULT 'active',
    `createdAt` TIMESTAMP  NOT NULL DEFAULT current_time,
    `updatedAt` TIMESTAMP  NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (
        `storeIdx`
    )
);




ALTER TABLE `Point` ADD CONSTRAINT `fk_Point_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `Coupon` ADD CONSTRAINT `fk_Coupon_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `favoriteStore` ADD CONSTRAINT `fk_favoriteStore_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `favoriteStore` ADD CONSTRAINT `fk_favoriteStore_storeIdx_storeName_storeScore_minimumOrder_deliveryTip` FOREIGN KEY(`storeIdx`, `storeName`, `storeScore`, `minimumOrder`, `deliveryTip`)
REFERENCES `Store` (`storeIdx`, `storeName`, `storeScore`, `minimumOrder`, `deliveryTip`);

ALTER TABLE `userReview` ADD CONSTRAINT `fk_userReview_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `userReview` ADD CONSTRAINT `fk_userReview_storeIdx_storeName` FOREIGN KEY(`storeIdx`, `storeName`)
REFERENCES `Store` (`storeIdx`, `storeName`);

ALTER TABLE `Basket` ADD CONSTRAINT `fk_Basket_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `Order` ADD CONSTRAINT `fk_Order_address_phoneNum` FOREIGN KEY(`address`, `phoneNum`)
REFERENCES `User` (`address`, `phoneNum`);

ALTER TABLE `StoreReview` ADD CONSTRAINT `fk_StoreReview_StoreIdx_storeName_storeScore` FOREIGN KEY(`StoreIdx`, `storeName`, `storeScore`)
REFERENCES `Store` (`storeIdx`, `storeName`, `storeScore`);

ALTER TABLE `Store` ADD CONSTRAINT `fk_Store_categoryIdx` FOREIGN KEY(`categoryIdx`)
REFERENCES `Category` (`categoryIdx`);




