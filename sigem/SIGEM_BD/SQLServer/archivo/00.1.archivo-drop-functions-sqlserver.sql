IF OBJECT_ID('dbo.GREATEST') IS NOT NULL BEGIN
	DROP FUNCTION dbo.GREATEST;
END;
GO

IF OBJECT_ID('dbo.DEVOLVERMARCA') IS NOT NULL BEGIN
	DROP FUNCTION dbo.DEVOLVERMARCA;
END;
GO

IF OBJECT_ID('dbo.CALCULARFINALCODREFPADRE') IS NOT NULL BEGIN
	DROP FUNCTION dbo.CALCULARFINALCODREFPADRE;
END;
GO

IF OBJECT_ID('dbo.GETNUMERICPOSITIVE') IS NOT NULL BEGIN
	DROP FUNCTION dbo.GETNUMERICPOSITIVE;
END;
GO

IF OBJECT_ID('dbo.GETFINCODREFPADRE') IS NOT NULL BEGIN
	DROP FUNCTION dbo.GETFINCODREFPADRE;
END;
GO

IF OBJECT_ID('dbo.GETCODREF') IS NOT NULL BEGIN
	DROP FUNCTION dbo.GETCODREF;
END;
GO