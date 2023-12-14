--create synonym
create synonym for MyServer.MyDatabase.MySchema.MyTable;

Drop synonym if exists MyNameTable;

--Authentication: create user for login
create user [myUser] for login [myUser]

GO
--Authorization: allow a user to access to tables,... with GRANT
GRANT select on [dbo].[MyNewTable] to [myUser]

