# create class table
create table `class`(
`id` int not null,
`name` varchar(45),
primary key (`id`)
);

#create student table
CREATE TABLE `student` (
    `id` INT NOT NULL,
    `name` VARCHAR(45) NULL,
    `age` INT NULL,
    `country` VARCHAR(45) NULL,
    PRIMARY KEY (`id`)
);
