CREATE TABLE `audit_logs` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `action` text NOT NULL,
  `entity_type` text NOT NULL,
  `entity_id` integer NOT NULL,
  `actor` text NOT NULL,
  `details` text NOT NULL,
  `created_at` text NOT NULL
);
CREATE INDEX `idx_audit_entity` ON `audit_logs` (`entity_type`,`entity_id`);
CREATE INDEX `idx_audit_created` ON `audit_logs` (`created_at`);

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
  `updated_at` text NOT NULL,
  `source_number` integer,
  `team_reported` text DEFAULT '' NOT NULL,
  `source` text DEFAULT 'Manual' NOT NULL
);
CREATE INDEX `idx_missions_date` ON `missions` (`mission_date`);
CREATE INDEX `idx_missions_title` ON `missions` (`title`);

CREATE TABLE `officers` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `name` text NOT NULL,
  `badge` text NOT NULL,
  `team` text NOT NULL,
  `role` text NOT NULL,
  `status` text DEFAULT 'Disponível' NOT NULL,
  `active` integer DEFAULT true NOT NULL,
  `created_at` text NOT NULL,
  `delta` text DEFAULT '' NOT NULL
);
CREATE UNIQUE INDEX `idx_officers_badge` ON `officers` (`badge`);
CREATE INDEX `idx_officers_name` ON `officers` (`name`);

CREATE TABLE `mission_assignments` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `mission_id` integer NOT NULL,
  `officer_id` integer NOT NULL,
  `acknowledged_at` text,
  FOREIGN KEY (`mission_id`) REFERENCES `missions`(`id`),
  FOREIGN KEY (`officer_id`) REFERENCES `officers`(`id`)
);
CREATE UNIQUE INDEX `idx_assignment_unique` ON `mission_assignments` (`mission_id`,`officer_id`);
CREATE INDEX `idx_assignments_officer` ON `mission_assignments` (`officer_id`);

CREATE TABLE `teams` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `name` text NOT NULL,
  `active` integer DEFAULT true NOT NULL,
  `created_at` text NOT NULL
);
CREATE UNIQUE INDEX `idx_teams_name` ON `teams` (`name`);

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
  FOREIGN KEY (`officer_id`) REFERENCES `officers`(`id`)
);
CREATE INDEX `idx_absences_officer` ON `absences` (`officer_id`);
CREATE INDEX `idx_absences_type_status` ON `absences` (`type`,`status`);

CREATE TABLE `time_off_credits` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `officer_id` integer NOT NULL,
  `service_date` text NOT NULL,
  `description` text NOT NULL,
  `credit_days` integer DEFAULT 1 NOT NULL,
  `used_days` integer DEFAULT 0 NOT NULL,
  `created_by` text NOT NULL,
  `created_at` text NOT NULL,
  FOREIGN KEY (`officer_id`) REFERENCES `officers`(`id`)
);
CREATE INDEX `idx_time_off_officer` ON `time_off_credits` (`officer_id`);
CREATE INDEX `idx_time_off_date` ON `time_off_credits` (`service_date`);

CREATE TABLE `data_imports` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `import_key` text NOT NULL,
  `imported_at` text NOT NULL
);
CREATE UNIQUE INDEX `idx_data_imports_key` ON `data_imports` (`import_key`);
