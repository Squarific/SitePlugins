CREATE DATABASE `pluginmods`;
USE `pluginmods`;

CREATE TABLE IF NOT EXISTS `plugins` (
    uuid binary(16),
    useruuid binary(16),

    name VARCHAR(255),
    description TEXT,

    creation datetime DEFAULT CURRENT_TIMESTAMP,
    updatedatetime datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY(uuid),
    INDEX(name),
    INDEX(useruuid),
    INDEX(creation),
    INDEX(updatedatetime)
);

CREATE TABLE IF NOT EXISTS `versions` (
    pluginuuid binary(16),
    major TINYINT UNSIGNED,
    minor TINYINT UNSIGNED,
    patch TINYINT UNSIGNED,
    releasenotes TEXT,
    creation datetime DEFAULT CURRENT_TIMESTAMP,
    updatedatetime datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX(pluginuuid),
    INDEX(updatedatetime),
    INDEX(major, minor, patch),
    INDEX(creation)
);
