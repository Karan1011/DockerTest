INSERT INTO `settings` (`id`, `type`, `value`, `created_at`, `updated_at`)
    VALUES
(NULL, 'default_ticket_assigned_user', NULL, current_timestamp(), current_timestamp());

CREATE TABLE `support_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `support_categories`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `support_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


CREATE TABLE `support_tickets` (
    `id` int(11) NOT NULL,
    `support_category_id` bigint(20) NOT NULL,
    `sender_user_id` bigint(20) NOT NULL,
    `assigned_user_id` bigint(20) DEFAULT NULL,
    `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    `ticket_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
    `description` longtext COLLATE utf8_unicode_ci NOT NULL,
    `priority` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
    `status` tinyint(4) DEFAULT 0,
    `seen` int(11) NOT NULL DEFAULT 0,
    `assigned_user_seen` int(11) NOT NULL DEFAULT 0,
    `attachments` text COLLATE utf8_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `support_tickets`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `support_tickets`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


CREATE TABLE `support_ticket_replies` (
  `id` int(11) NOT NULL,
  `support_ticket_id` int(11) NOT NULL,
  `replied_user_id` bigint(11) NOT NULL,
  `reply` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `seen` tinyint(4) NOT NULL DEFAULT 0,
  `attachments` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `support_ticket_replies`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `support_ticket_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
