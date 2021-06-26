-- CreateTable
CREATE TABLE `entreprise` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `matFiscal` INTEGER NOT NULL,
    `nom` VARCHAR(191) NOT NULL,
    `adresse` VARCHAR(191) NOT NULL,
    `tel` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contrat` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `unique` VARCHAR(191) NOT NULL,
    `start` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `end` INTEGER NOT NULL,
    `offer` VARCHAR(191) NOT NULL,
    `entID` INTEGER NOT NULL,

    UNIQUE INDEX `contrat.unique_unique`(`unique`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `assure` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `matricule` INTEGER NOT NULL,
    `nom` VARCHAR(191) NOT NULL,
    `prenom` VARCHAR(191) NOT NULL,
    `sexe` VARCHAR(191) NOT NULL,
    `dateNaiss` INTEGER NOT NULL,
    `cID` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sousassure` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `matricule` INTEGER NOT NULL,
    `nom` VARCHAR(191) NOT NULL,
    `prenom` VARCHAR(191) NOT NULL,
    `sexe` VARCHAR(191) NOT NULL,
    `dateNaiss` INTEGER NOT NULL,
    `insurerID` INTEGER NOT NULL,
    `lienParente` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `intervenant` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `CNAM` INTEGER NOT NULL,
    `nom` VARCHAR(191) NOT NULL,
    `prenom` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `acte_medical` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` INTEGER NOT NULL,
    `nom` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reject_cause` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` INTEGER NOT NULL,
    `libelle` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cheque` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `numCh` INTEGER NOT NULL,
    `bank` VARCHAR(191) NOT NULL,
    `idPaim` INTEGER NOT NULL,

    UNIQUE INDEX `cheque_idPaim_unique`(`idPaim`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `virement` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `numVir` INTEGER NOT NULL,
    `numComp` INTEGER NOT NULL,
    `idPaim` INTEGER NOT NULL,

    UNIQUE INDEX `virement_idPaim_unique`(`idPaim`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `recu` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idPaim` INTEGER NOT NULL,

    UNIQUE INDEX `recu_idPaim_unique`(`idPaim`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `paiement` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `statut_bulletin` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `status` INTEGER NOT NULL,
    `bID` INTEGER NOT NULL,
    `rejID` INTEGER NOT NULL,

    UNIQUE INDEX `statut_bulletin_bID_unique`(`bID`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bulletin` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `unique` INTEGER NOT NULL,
    `idSousAss` INTEGER NOT NULL,
    `cID` INTEGER NOT NULL,
    `intervID` INTEGER NOT NULL,
    `actID` INTEGER NOT NULL,
    `mthdID` INTEGER NOT NULL,
    `date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `bulletin.unique_unique`(`unique`),
    UNIQUE INDEX `bulletin_mthdID_unique`(`mthdID`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `insID` INTEGER,
    `entID` INTEGER NOT NULL,
    `relatedID` INTEGER NOT NULL,
    `generatedUsername` VARCHAR(191) NOT NULL,
    `generatedPassword` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `recu` ADD FOREIGN KEY (`idPaim`) REFERENCES `paiement`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sousassure` ADD FOREIGN KEY (`insurerID`) REFERENCES `assure`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cheque` ADD FOREIGN KEY (`idPaim`) REFERENCES `paiement`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `statut_bulletin` ADD FOREIGN KEY (`bID`) REFERENCES `bulletin`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `statut_bulletin` ADD FOREIGN KEY (`rejID`) REFERENCES `reject_cause`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bulletin` ADD FOREIGN KEY (`cID`) REFERENCES `contrat`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bulletin` ADD FOREIGN KEY (`intervID`) REFERENCES `intervenant`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bulletin` ADD FOREIGN KEY (`idSousAss`) REFERENCES `sousassure`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bulletin` ADD FOREIGN KEY (`actID`) REFERENCES `acte_medical`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bulletin` ADD FOREIGN KEY (`mthdID`) REFERENCES `paiement`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `account` ADD FOREIGN KEY (`insID`) REFERENCES `sousassure`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `account` ADD FOREIGN KEY (`entID`) REFERENCES `entreprise`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `virement` ADD FOREIGN KEY (`idPaim`) REFERENCES `paiement`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `assure` ADD FOREIGN KEY (`cID`) REFERENCES `contrat`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `contrat` ADD FOREIGN KEY (`entID`) REFERENCES `entreprise`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
