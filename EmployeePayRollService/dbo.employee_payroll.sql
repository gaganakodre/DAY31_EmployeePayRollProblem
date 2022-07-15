CREATE TABLE [dbo].[employee_payroll] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [Name]      VARCHAR (200) NULL,
    [Salary]    FLOAT (53)    NULL,
    [StartDate] DATETIME      NULL,
    [Gender]    CHAR (1)      NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

