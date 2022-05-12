CREATE TABLE `class` (
    `id` INT NOT NULL,
    `name` VARCHAR(45),
    PRIMARY KEY (`id`)
);

CREATE TABLE `student` (
    `id` INT NOT NULL,
    `name` VARCHAR(45) NULL,
    `age` INT NULL,
    `country` VARCHAR(45) NULL,
    PRIMARY KEY (`id`)
);
