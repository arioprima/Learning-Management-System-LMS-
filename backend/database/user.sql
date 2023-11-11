CREATE TABLE "users" (
                         "user_id" varchar(36) PRIMARY KEY,
                         "username" varchar(36) UNIQUE NOT NULL,
                         "email" varchar(36) UNIQUE NOT NULL,
                         "password" varchar(255) NOT NULL,
                         "role" varchar(20) DEFAULT 'student',
                         "created_at" timestamp DEFAULT (current_timestamp),
                         "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "student" (
                           "student_id" varchar(36) PRIMARY KEY,
                           "first_name" varchar(100) NOT NULL,
                           "last_name" varchar(100),
                           "place_of_birth" varchar(50),
                           "date_of_birth" date,
                           "school" varchar(100),
                           "class_name" varchar(10),
                           "address" varchar(255),
                           "phone" varchar(20),
                           "image" varchar(255),
                           "user_id" varchar(36) NOT NULL,
                           "created_at" timestamp DEFAULT (current_timestamp),
                           "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "mentor" (
                          "mentor_id" varchar(36) PRIMARY KEY,
                          "first_name" varchar(100) NOT NULL,
                          "last_name" varchar(100),
                          "place_of_birth" varchar(50),
                          "date_of_birth" date,
                          "address" varchar(255),
                          "phone" varchar(20),
                          "image" varchar(255),
                          "user_id" varchar(36) NOT NULL,
                          "created_at" timestamp DEFAULT (current_timestamp),
                          "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "admin" (
                         "admin_id" varchar(36) PRIMARY KEY,
                         "first_name" varchar(100) NOT NULL,
                         "last_name" varchar(100),
                         "image" varchar(255),
                         "user_id" varchar(36) NOT NULL,
                         "created_at" timestamp DEFAULT (current_timestamp),
                         "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "class_type" (
                              "class_type_id" varchar(36) PRIMARY KEY,
                              "class_type_name" varchar(100) NOT NULL
);

CREATE TABLE "class" (
                         "class_id" varchar(36) PRIMARY KEY,
                         "class_name" varchar(255) NOT NULL,
                         "class_type_id" varchar(36) NOT NULL
);

CREATE TABLE "subjects" (
                            "subjects_id" varchar(36) PRIMARY KEY,
                            "subjects_name" varchar(255) NOT NULL,
                            "class_id" varchar(36) NOT NULL,
                            "is_accessible" boolean DEFAULT false,
                            "created_at" timestamp DEFAULT (current_timestamp),
                            "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "enrollments" (
                               "enrollments_id" varchar(36) PRIMARY KEY,
                               "student_id" varchar(36) NOT NULL,
                               "class_id" varchar(36) NOT NULL,
                               "status_pembayaran" smallint DEFAULT 0,
                               "created_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "orders" (
                          "orders_id" varchar(36) PRIMARY KEY,
                          "price" int NOT NULL,
                          "class_id" varchar(36) NOT NULL,
                          "student_id" varchar(36) NOT NULL,
                          "start_access" date,
                          "end_access" date,
                          "orders_status" smallint DEFAULT 0,
                          "created_at" timestamp DEFAULT (current_timestamp)
);

ALTER TABLE "student" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "mentor" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "admin" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "class" ADD FOREIGN KEY ("class_type_id") REFERENCES "class_type" ("class_type_id");

ALTER TABLE "subjects" ADD FOREIGN KEY ("class_id") REFERENCES "class" ("class_id");

ALTER TABLE "enrollments" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");

ALTER TABLE "enrollments" ADD FOREIGN KEY ("class_id") REFERENCES "class" ("class_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("class_id") REFERENCES "class" ("class_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");