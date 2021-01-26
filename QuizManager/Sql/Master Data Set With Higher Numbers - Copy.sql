-- Populate Users

INSERT INTO public."AspNetUsers" ("Id", "UserName", "NormalizedUserName", "Email", "NormalizedEmail", "EmailConfirmed", "PasswordHash", "SecurityStamp", "ConcurrencyStamp", "PhoneNumber", "PhoneNumberConfirmed", "TwoFactorEnabled", "LockoutEnd", "LockoutEnabled", "AccessFailedCount") VALUES ('2327964a-853c-4bc6-a9de-9c7e939c1721', 'restrictedUser@quiz.com', 'RESTRICTEDUSER@QUIZ.COM', 'restrictedUser@quiz.com', 'RESTRICTEDUSER@QUIZ.COM', false, 'AQAAAAEAACcQAAAAEKW+kNmGgS5JB5ykhHl8yksCT+dQdp7KE3Qusjz3wL6GIZbLG9ZvUyfDlICvo4WcMA==', 'YAVZENNE5PEU6YGCTLHCPRHZ7ROIYUYR', '6b436050-f9c9-4b29-80f4-2f6b52deed4d', null, false, false, null, true, 0);
INSERT INTO public."AspNetUsers" ("Id", "UserName", "NormalizedUserName", "Email", "NormalizedEmail", "EmailConfirmed", "PasswordHash", "SecurityStamp", "ConcurrencyStamp", "PhoneNumber", "PhoneNumberConfirmed", "TwoFactorEnabled", "LockoutEnd", "LockoutEnabled", "AccessFailedCount") VALUES ('03f57249-ffee-463d-8d9f-f6a36ae4ebad', 'userWithView@quiz.com', 'USERWITHVIEW@QUIZ.COM', 'userWithView@quiz.com', 'USERWITHVIEW@QUIZ.COM', false, 'AQAAAAEAACcQAAAAEBf3V14stsWBLlcJIvuCR3BZ7t1a2TA5YPZfnDW5gs1jk4btHFrMR6oSpegpeJ5ghA==', 'H4RGLKFM5GTJNRBOEDIGMKJBZ7II3WXZ', '124d87e1-17f4-4588-9a51-00409db3e5c1', null, false, false, null, true, 0);
INSERT INTO public."AspNetUsers" ("Id", "UserName", "NormalizedUserName", "Email", "NormalizedEmail", "EmailConfirmed", "PasswordHash", "SecurityStamp", "ConcurrencyStamp", "PhoneNumber", "PhoneNumberConfirmed", "TwoFactorEnabled", "LockoutEnd", "LockoutEnabled", "AccessFailedCount") VALUES ('15993389-e472-4ab0-8518-b4b7585f71f5', 'admin@quiz.com', 'ADMIN@QUIZ.COM', 'admin@quiz.com', 'ADMIN@QUIZ.COM', false, 'AQAAAAEAACcQAAAAEJ697ePAxCHDmx4e7IKlKe2FDYtA6t+5cQL4BFZwahDwpLC38IpvtvXecO955T8j9g==', 'OKDNG6UFNFV3OI7DNA5LZISJ7TY7EO57', '182f39b6-791a-4b2f-b6df-83f41a4e222a', null, false, false, null, true, 0);

-- Populate ROLES

INSERT INTO public."AspNetRoles" ("Id", "Name", "NormalizedName", "ConcurrencyStamp") VALUES ('9f8da620-ddba-4f30-a406-19f300200a0b', 'Edit', 'EDIT', '9c2534cd-2cc2-4b27-aa6d-8e5c317c2d2a');
INSERT INTO public."AspNetRoles" ("Id", "Name", "NormalizedName", "ConcurrencyStamp") VALUES ('1b9b616a-71a5-45e6-815c-affa45554ab4', 'View', 'VIEW', '5b13c50e-6b05-4259-a398-ba397a7d01c0');
INSERT INTO public."AspNetRoles" ("Id", "Name", "NormalizedName", "ConcurrencyStamp") VALUES ('ada41906-2170-4382-96b5-5150f9c784ac', 'Restricted', 'RESTRICTED', '3764292d-ea65-42aa-bebc-7c3137a05fe5');

-- Populate UserRoles

INSERT INTO public."AspNetUserRoles" ("UserId", "RoleId") VALUES ('15993389-e472-4ab0-8518-b4b7585f71f5', '9f8da620-ddba-4f30-a406-19f300200a0b');
INSERT INTO public."AspNetUserRoles" ("UserId", "RoleId") VALUES ('03f57249-ffee-463d-8d9f-f6a36ae4ebad', '1b9b616a-71a5-45e6-815c-affa45554ab4');
INSERT INTO public."AspNetUserRoles" ("UserId", "RoleId") VALUES ('2327964a-853c-4bc6-a9de-9c7e939c1721', 'ada41906-2170-4382-96b5-5150f9c784ac');
INSERT INTO public."AspNetUserRoles" ("UserId", "RoleId") VALUES ('15993389-e472-4ab0-8518-b4b7585f71f5', '1b9b616a-71a5-45e6-815c-affa45554ab4');
INSERT INTO public."AspNetUserRoles" ("UserId", "RoleId") VALUES ('03f57249-ffee-463d-8d9f-f6a36ae4ebad', 'ada41906-2170-4382-96b5-5150f9c784ac');
INSERT INTO public."AspNetUserRoles" ("UserId", "RoleId") VALUES ('15993389-e472-4ab0-8518-b4b7585f71f5', 'ada41906-2170-4382-96b5-5150f9c784ac');

-- Populate Quizzes

INSERT INTO public."Quizzes" ("Id", "QuizName") VALUES (100, 'General Knowledge');

-- Populate Questions

INSERT INTO public."Questions" ("Id", "QuizId", "QuestionName") VALUES (100, 100, 'What is the capital of Wales?');
INSERT INTO public."Questions" ("Id", "QuizId", "QuestionName") VALUES (200, 100, 'What is the largest country in the world?');


-- Populate Answers

INSERT INTO public."Answers" ("Id", "AnswerName", "QuestionId", "IsCorrect") VALUES (100, 'Swansea', 100, false);
INSERT INTO public."Answers" ("Id", "AnswerName", "QuestionId", "IsCorrect") VALUES (200, 'Cardiff', 100, true);
INSERT INTO public."Answers" ("Id", "AnswerName", "QuestionId", "IsCorrect") VALUES (300, 'Cheltenham', 100, false);
INSERT INTO public."Answers" ("Id", "AnswerName", "QuestionId", "IsCorrect") VALUES (400, 'Newport', 100, false);
INSERT INTO public."Answers" ("Id", "AnswerName", "QuestionId", "IsCorrect") VALUES (500, 'USA', 200, false);
INSERT INTO public."Answers" ("Id", "AnswerName", "QuestionId", "IsCorrect") VALUES (600, 'China', 200, false);
INSERT INTO public."Answers" ("Id", "AnswerName", "QuestionId", "IsCorrect") VALUES (700, 'Russia', 200, true);
INSERT INTO public."Answers" ("Id", "AnswerName", "QuestionId", "IsCorrect") VALUES (800, 'Canada', 200, false);
