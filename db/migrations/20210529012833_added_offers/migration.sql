/*
  Warnings:

  - You are about to drop the column `offer` on the `contrat` table. All the data in the column will be lost.
  - Added the required column `offerID` to the `contrat` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `contrat` DROP COLUMN `offer`,
    ADD COLUMN `offerID` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `contract_offer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `remboursement` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `contrat` ADD FOREIGN KEY (`offerID`) REFERENCES `contract_offer`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
