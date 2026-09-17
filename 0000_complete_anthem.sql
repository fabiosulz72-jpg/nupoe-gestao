CREATE TABLE `audit_logs` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`action` text NOT NULL,
	`entity_type` text NOT NULL,
	`entity_id` integer NOT NULL,
	`actor` text NOT NULL,
	`details` text NOT NULL,
	`created_at` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `idx_audit_entity` ON `audit_logs` (`entity_type`,`entity_id`);--> statement-breakpoint
CREATE INDEX `idx_audit_created` ON `audit_logs` (`created_at`);--> statement-breakpoint
CREATE TABLE `mission_assignments` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`mission_id` integer NOT NULL,
	`officer_id` integer NOT NULL,
	`acknowledged_at` text,
	FOREIGN KEY (`mission_id`) REFERENCES `missions`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`officer_id`) REFERENCES `officers`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE UNIQUE INDEX `idx_assignment_unique` ON `mission_assignments` (`mission_id`,`officer_id`);--> statement-breakpoint
CREATE INDEX `idx_assignments_officer` ON `mission_assignments` (`officer_id`);--> statement-breakpoint
CREATE TABLE `missions` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`title` text NOT NULL,
	`type` text NOT NULL,
	`mission_date` text NOT NULL,
	`mission_time` text NOT NULL,
	`place` text NOT NULL,
	`status` text DEFAULT 'Aguardando ciência' NOT NULL,
	`created_by` text NOT NULL,
	`created_at` text NOT NULL,
	`updated_at` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `idx_missions_date` ON `missions` (`mission_date`);--> statement-breakpoint
CREATE INDEX `idx_missions_title` ON `missions` (`title`);--> statement-breakpoint
CREATE TABLE `officers` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text NOT NULL,
	`badge` text NOT NULL,
	`team` text NOT NULL,
	`role` text NOT NULL,
	`status` text DEFAULT 'Disponível' NOT NULL,
	`active` integer DEFAULT true NOT NULL,
	`created_at` text NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `idx_officers_badge` ON `officers` (`badge`);--> statement-breakpoint
CREATE INDEX `idx_officers_name` ON `officers` (`name`);