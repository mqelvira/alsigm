
package es.ieci.tecdoc.isicres.admin.sbo.idoc.folder.fdrlink;


import java.util.ArrayList;

import es.ieci.tecdoc.isicres.admin.base.dbex.DbOutputRecord;
import es.ieci.tecdoc.isicres.admin.sbo.idoc.dao.DaoFdrLinkTbl;
import es.ieci.tecdoc.isicres.admin.sbo.idoc.dao.DaoOutputRows;


public final class FolderDaoFdrLinkTokenRows implements DaoOutputRows
{
   private ArrayList  m_al;
     
   public FolderDaoFdrLinkTokenRows()
   {
      m_al = new ArrayList();       
   }
   
   public int count()
   {
      return m_al.size();
   }
   
   public FolderDaoFdrLinkTokenRow getRecord(int index)
   {
      return (FolderDaoFdrLinkTokenRow) m_al.get(index);
   }
   
   public DbOutputRecord newRecord()
   {
      
      FolderDaoFdrLinkTokenRow rec = new FolderDaoFdrLinkTokenRow();
      
      m_al.add(rec);
      
      return rec;
      
   }
   
   public String getColumnNames() throws Exception
   {   
      
      StringBuffer tbdr;
      
      tbdr = new StringBuffer();
      tbdr.append(DaoFdrLinkTbl.getIdColName(false));      
      tbdr.append(",").append(DaoFdrLinkTbl.getNameColName(false));
      tbdr.append(",").append(DaoFdrLinkTbl.getContainerClfIdColName(false));
      tbdr.append(",").append(DaoFdrLinkTbl.getServerArchIdColName(false));
      tbdr.append(",").append(DaoFdrLinkTbl.getServerFdrIdColName(false));

      return tbdr.toString();
      
   }
   
   
   
} // class
