ALTER TABLE `users` ADD `referred_by` BIGINT NULL AFTER `user_type`;
ALTER TABLE `users` ADD `referral_comission` INT(1) NOT NULL DEFAULT '0' AFTER `balance`;

ALTER TABLE `wallets` ADD `referral_user` BIGINT NULL AFTER `reciept`;

INSERT INTO `settings` (`id`, `type`, `value`, `created_at`, `updated_at`, `deleted_at`)
VALUES
(NULL, 'referred_by_user_commission', '10', current_timestamp(), current_timestamp(), NULL),
(NULL, 'referral_user_package_purchase_discount', '10', current_timestamp(), current_timestamp(), NULL),
(NULL, 'referral_user_package_purchase_discount_type', 'amount', current_timestamp(), current_timestamp(), NULL);

CREATE TABLE `wallet_withdraw_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0=pending,\r\n1=Accept,\r\n1=Rejected',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `wallet_withdraw_requests`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `wallet_withdraw_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

COMMIT;
