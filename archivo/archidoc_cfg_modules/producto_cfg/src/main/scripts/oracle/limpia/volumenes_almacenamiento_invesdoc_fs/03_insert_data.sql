INSERT INTO IVOLACTDIR ( VOLID, ACTDIR, NUMFILES ) VALUES ( 
2, 1, 0); 
commit;
 
INSERT INTO IVOLLISTHDR ( ID, NAME, FLAGS, STAT, REMARKS, CRTRID, CRTNDATE, UPDRID,
UPDDATE ) VALUES ( 
2, 'ListFS', 0, 0, NULL, 0,  SYSDATE
, NULL, NULL); 
commit;
 
INSERT INTO IVOLLISTVOL ( LISTID, VOLID, SORTORDER ) VALUES ( 
2, 2, 1);  
commit;
 
INSERT INTO IVOLVOLHDR ( ID, NAME, REPID, INFO, ITEMP, ACTSIZE, NUMFILES, STAT, REMARKS, CRTRID, CRTNDATE,
UPDRID, UPDDATE ) VALUES ( 
2, 'RepFS', 2, '(CLOB)', 0, '0', 0, 0, NULL, 0,  SYSDATE
, 0,  SYSDATE); 
commit;

INSERT INTO IVOLREPHDR ( ID, NAME, TYPE, INFO, STAT, REMARKS, CRTRID, CRTNDATE, UPDRID,
UPDDATE ) VALUES ( 
2, 'RepFS', 3, '(CLOB)', 0, NULL, 0, SYSDATE
, NULL, NULL); 
commit;

