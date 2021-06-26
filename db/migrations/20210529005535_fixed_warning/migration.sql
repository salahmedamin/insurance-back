/*
  Warnings:

  - You are about to drop the column `entID` on the `account` table. All the data in the column will be lost.
  - You are about to drop the column `insID` on the `account` table. All the data in the column will be lost.
  - You are about to drop the column `relatedID` on the `account` table. All the data in the column will be lost.
  - Added the required column `isEnterprise` to the `account` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `account` DROP FOREIGN KEY `account_ibfk_2`;

-- DropForeignKey
ALTER TABLE `account` DROP FOREIGN KEY `account_ibfk_1`;

-- AlterTable
ALTER TABLE `account` DROP COLUMN `entID`,
    DROP COLUMN `insID`,
    DROP COLUMN `relatedID`,
    ADD COLUMN `isEnterprise` BOOLEAN NOT NULL;
