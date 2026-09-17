CREATE TABLE `absences` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`officer_id` integer NOT NULL,
	`type` text NOT NULL,
	`start_date` text NOT NULL,
	`end_date` text NOT NULL,
	`notes` text DEFAULT '' NOT NULL,
	`status` text DEFAULT 'Ativa' NOT NULL,
	`created_by` text NOT NULL,
	`created_at` text NOT NULL,
	FOREIGN KEY (`officer_id`) REFERENCES `officers`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE INDEX `idx_absences_officer` ON `absences` (`officer_id`);--> statement-breakpoint
CREATE INDEX `idx_absences_type_status` ON `absences` (`type`,`status`);--> statement-breakpoint
CREATE TABLE `time_off_credits` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`officer_id` integer NOT NULL,
	`service_date` text NOT NULL,
	`description` text NOT NULL,
	`credit_days` integer DEFAULT 1 NOT NULL,
	`used_days` integer DEFAULT 0 NOT NULL,
	`created_by` text NOT NULL,
	`created_at` text NOT NULL,
	FOREIGN KEY (`officer_id`) REFERENCES `officers`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE INDEX `idx_time_off_officer` ON `time_off_credits` (`officer_id`);--> statement-breakpoint
CREATE INDEX `idx_time_off_date` ON `time_off_credits` (`service_date`);