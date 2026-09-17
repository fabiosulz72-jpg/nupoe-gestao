CREATE TABLE `data_imports` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`import_key` text NOT NULL,
	`imported_at` text NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `idx_data_imports_key` ON `data_imports` (`import_key`);--> statement-breakpoint
ALTER TABLE `missions` ADD `source_number` integer;--> statement-breakpoint
ALTER TABLE `missions` ADD `team_reported` text DEFAULT '' NOT NULL;--> statement-breakpoint
ALTER TABLE `missions` ADD `source` text DEFAULT 'Manual' NOT NULL;