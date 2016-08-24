package eVote;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
public class DAO{
	Connection conn;
	Statement stmt;
	PreparedStatement ps;
	ResultSet rs;
	void connect () throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "1234");
	}
	public boolean login(String un, String pw,String Usertype) throws Exception{
		connect();
		stmt = conn.createStatement();
		 rs= stmt.executeQuery("select * from evs_tbl_user_Credentials where Userid='"+ un +"' and password='"+ pw+ "'");
		if(rs.next()){
			if(rs.getString("Usertype").equals(Usertype))
			return true;
		}
		 return false;
	}
	public boolean edit(String Username,String Firstname,String Lastname,String Dateofbirth,String Gender,String Street,String Location,String City,String State,String Pincode,String Mobileno,String Emailid) throws Exception{
		connect();
		ps = conn.prepareStatement("update evs_tbl_user_profile set Firstname = ?, Lastname = ?, Dateofbirth = ?,Gender=?,Street=?,Location=?,City=?,State=?,Pincode=?,Mobileno=?,Emailid=? where Userid = ?");
		ps.setString(1, Firstname);
		ps.setString(2, Lastname);
		ps.setString(3, Dateofbirth);
		ps.setString(4, Gender);
		ps.setString(5, Street);
		ps.setString(6, Location);
		ps.setString(7, City);
		ps.setString(8, State);
		ps.setString(9, Pincode);
		ps.setString(10, Mobileno);
		ps.setString(11, Emailid);
		ps.setString(12, Username);
		int r=ps.executeUpdate();
		if(r==1)
		return true;
			return false;
	}
	public boolean changepw(String Userid,String Password,String pw) throws Exception{
	connect ();
	 ps = conn.prepareStatement("update EVS_TBL_User_Credentials SET Password=? where Userid = ? and Password = ?");
	 ps.setString (1, pw);
	 ps.setString (2, Userid);
	 ps.setString (3, Password);
	int r=ps.executeUpdate();
	if(r==1)
	return true;
	    return false;
	 }
	public ResultSet fetch(String un) throws Exception{
		connect();
		stmt = conn.createStatement();
		rs= stmt.executeQuery("select * from evs_tbl_user_profile where Userid ='"+ un +"'");
		return rs;
	}
	public boolean addparty(String Name,String Leader) throws Exception{
	connect();
	ps = conn.prepareStatement("update EVS_TBL_Party set Approve=1 where Name=? and Leader=?");
	ps.setString (1, Name);
	ps.setString (2, Leader);
	ps.executeUpdate();
	return true;
	}
	public String usr_register (String Firstname,String Lastname,String Dateofbirth,String Gender,String Street,String Location,String City,String State,String Pincode,String Mobileno,String Emailid,String Password) throws Exception {
	connect ();
		 	ps = conn.prepareStatement("insert into EVS_TBL_User_Credentials values('USR'||seq1.nextval,?,?)");
			ps.setString (1, Password);
			ps.setString (2, "U");
			ps.executeUpdate();
			ps = conn.prepareStatement("Select Userid from EVS_TBL_User_Credentials where Usertype='U' order by Userid desc");
			rs=ps.executeQuery();
			rs.next();
		ps = conn.prepareStatement("insert into EVS_TBL_User_Profile values(?,?,?,?,?,?,?,?,?,?,?,?)");//for Registering
		ps.setString (1,rs.getString("Userid"));
		ps.setString (2,Firstname);
		ps.setString (3,Lastname);
		ps.setString (4,Dateofbirth);
		ps.setString (5,Gender);
		ps.setString (6,Street);
		ps.setString (7,Location);
		ps.setString (8,City);
		ps.setString (9,State);
		ps.setString (10,Pincode);
		ps.setString (11,Mobileno);
		ps.setString (12,Emailid);
		 int r=ps.executeUpdate();
		 if(r==1)
		 return rs.getString("Userid");
		 else return "null";
	}
	public void Approve(String Userid,String Constituency) throws Exception{
	connect ();
	ps=conn.prepareStatement("update EVS_TBL_Application set Voted=0,VoterId='VOT'||seq1.nextval,Approvedstatus=1 where Userid=? and Constituency=?");
	ps.setString (1, Userid);
	ps.setString (2, Constituency);
	ps.executeUpdate();	
	ps = conn.prepareStatement("select Constituency from EVS_TBL_Election where Constituency=?");
	ps.setString (1,Constituency);
	rs=ps.executeQuery();
	if(rs.next()!=true){
	ps = conn.prepareStatement("insert into EVS_TBL_Election values('null',?,'null',1)");
	}
	else{
	ps = conn.prepareStatement("update EVS_TBL_Election set Votercount=Votercount+1 where Constituency=?");
	}
	ps.setString (1,Constituency);
	ps.executeUpdate();	
	}
	public boolean caste(String Constituency,String Party,String Userid) throws Exception{
	connect();
	ps = conn.prepareStatement("select Voted,VoterId from EVS_TBL_Application where Userid=?");
	ps.setString (1, Userid);
	rs = ps.executeQuery();
	if(rs.next()){
		if((rs.getInt("Voted")==0)&&(rs.getString("VoterId").equals("null")!=true)){
		ps = conn.prepareStatement("update EVS_TBL_Result set Votecount=Votecount+1 where Constituency=? and Partyname=?");
		ps.setString (1, Constituency);
		ps.setString (2, Party);
		ps.executeUpdate();
		ps = conn.prepareStatement("update EVS_TBL_Application set Voted=1 where Userid=?");
		ps.setString (1, Userid);
		ps.executeUpdate();
		return true;
	}}
	return false;
	}
	public String party_register (String Name,String Leader,String Symbol,String Aboutus,String email2,String phone2) throws Exception {
		connect ();
		ps = conn.prepareStatement("insert into EVS_TBL_Party values('PAR'||seq1.nextval,?,?,?,?,?,?,0)");//for Registering
		ps.setString (1,Name );
		ps.setString (2,Leader);
		ps.setString (3,Symbol);
		ps.setString (4,email2);
		ps.setString (5,phone2);
		ps.setString (6,Aboutus);
		int r=ps.executeUpdate();
		 if(r==1){
		ps = conn.prepareStatement("Select PartyId from EVS_TBL_Party order by PartyId desc");
			rs=ps.executeQuery();
			rs.next();
		return rs.getString("PartyId");
		 }
		 else return "null";
	}
	public boolean addschedule(String Electiondate,String Constituency,String Countingdate) throws Exception{
	connect();
	ps = conn.prepareStatement("update EVS_TBL_Election set Electiondate=?,Countingdate=? where Constituency=?");
	ps.setString (1, Electiondate);
	ps.setString (2, Countingdate);
	ps.setString (3, Constituency);
	int r = ps.executeUpdate();
	if(r==1)
	return true;
	return false;
	}
	public String can_register (String Name,String Partyname,String District,String Constituency,String Dateofbirth,String Mobileno ,String Address,String Emailid) throws Exception {
		connect ();
		ps = conn.prepareStatement("insert into EVS_TBL_Candidate values('CAN'||seq1.nextval,?,?,?,?,?,?,?,?,0)");
		ps.setString (1,Name );
		ps.setString (2,Partyname);
		ps.setString (3,District);
		ps.setString (4,Constituency);
		ps.setString (5,Dateofbirth );
		ps.setString (6,Mobileno);
		ps.setString (7,Address);
		ps.setString (8,Emailid);
		int r= ps.executeUpdate();
		if(r==1){
		ps = conn.prepareStatement("Select CandidateId from EVS_TBL_Candidate order by CandidateId desc");
			rs=ps.executeQuery();
			rs.next();
		return rs.getString("CandidateId");
		}
		else return "null";
	}
	public boolean req_voterid(String Userid,String Password,String Constituency,String dobd,String adpd,String photo) throws Exception{
	connect ();
	ps = conn.prepareStatement("select * from EVS_TBL_User_Credentials where Userid = ? and Password = ?");
	ps.setString (1, Userid);
	ps.setString (2, Password);
	rs = ps.executeQuery();
	if (rs.next ()){
	ps = conn.prepareStatement("insert into EVS_TBL_Application values(?,?,?,?,0,'null',null,?)");
	ps.setString (1, Userid);
	ps.setString (2, Constituency);
	ps.setString (3, dobd);
	ps.setString (4, adpd);
	ps.setString (5, photo);
	ps.executeUpdate();
	 return true;
	 }
	else return false;
	}
	public ResultSet viewcandidates(String clas) throws Exception{
	connect();
	if(clas.equals("a")){
	 ps = conn.prepareStatement("select Name,Partyname,Constituency,Approve from EVS_TBL_Candidate where Approve=1");
	}
	else{
	 ps = conn.prepareStatement("select Name,Partyname,Constituency,Approve from EVS_TBL_Candidate");
	}
	rs = ps.executeQuery();
	return rs;
	}
	public ResultSet viewschedule(String clas) throws Exception{
	connect();
	if(clas.equals("a")){
	ps = conn.prepareStatement("select * from EVS_TBL_Election where Electiondate!='null'");
	}
	else{
		ps = conn.prepareStatement("select * from EVS_TBL_Election");
	}
	rs = ps.executeQuery();
	return rs;
	}
	public boolean addcandidates(String Partyname,String Constituency,String Name) throws Exception{
	connect();
	String sym=symbol(Partyname);
	if(sym!=null){
	ps = conn.prepareStatement("update EVS_TBL_Candidate set Approve=1 where Constituency=? and Partyname=?");
	ps.setString (1, Constituency);
	ps.setString (2, Partyname);
	int r = ps.executeUpdate();
	if(r==1){
	ps = conn.prepareStatement("insert into EVS_TBL_Result values(?,?,?,0)");
	ps.setString (1,Constituency);
	ps.setString (2,Partyname);
	ps.setString (3,Name);
	ps.executeUpdate();	
	ps = conn.prepareStatement("select Constituency from EVS_TBL_Election where Constituency=?");
	ps.setString (1,Constituency);
	rs=ps.executeQuery();
	if(rs.next()!=true){
	ps = conn.prepareStatement("insert into EVS_TBL_Election values('null',?,'null',0)");
	ps.setString (1,Constituency);
	ps.executeUpdate();	
	return true;
	}}}
	return false;
	}
	public ResultSet pending(String Constituency,String edate) throws Exception{
	connect();
		ps = conn.prepareStatement("select Electiondate from EVS_TBL_Election where Constituency=?");
		ps.setString (1, Constituency);
		rs = ps.executeQuery();
		if(rs.next()){
		if(rs.getString("Electiondate").equals(edate)){
		ps = conn.prepareStatement("select Partyname,CandidateName from EVS_TBL_Result where Constituency=?");
		ps.setString (1, Constituency);
		rs = ps.executeQuery();
		return rs;
		}
		else{
		rs=null;
		}}
		return rs;
	}
	public boolean pending2(String Constituency,String cdate) throws Exception{
	connect();
		ps = conn.prepareStatement("select Countingdate from EVS_TBL_Election where Constituency=?");
		ps.setString (1, Constituency);
		rs = ps.executeQuery();
		if(rs.next()){
		if(rs.getString("Countingdate").equals(cdate)){
		return true;
		}}
		return false;
	}
	public ResultSet pending3(String Party) throws Exception{
		connect();
		ps = conn.prepareStatement("select Constituency,CandidateName from EVS_TBL_Result where Partyname=?");
		ps.setString (1, Party);
		rs = ps.executeQuery();
		return rs;
	}
	public String symbol(String Party) throws Exception{
		connect();
 		ps = conn.prepareStatement("select Symbol from EVS_TBL_Party where NAME=? and Approve=1");
 		ps.setString (1, Party);
 		rs = ps.executeQuery();
 		if(rs.next()){
 		return rs.getString("Symbol");
 		}
 		return null;
	}
	public ResultSet viewparty(String clas) throws Exception{
		connect();
	if(clas.equals("a")){
	ps = conn.prepareStatement("select Name,Leader,Symbol,Aboutus,Approve from EVS_TBL_Party where Approve=1");
	}
	else {
		ps = conn.prepareStatement("select Name,Leader,Symbol,Aboutus,Approve from EVS_TBL_Party");
	}
	rs = ps.executeQuery();
		return rs;
	}
	public ResultSet voterrequest() throws Exception{
	connect ();
	ps=conn.prepareStatement("select * from EVS_TBL_Application");
	rs = ps.executeQuery();
	return rs;
	}
	public ResultSet viewvoterid(String Userid) throws Exception{
	connect ();
	ps = conn.prepareStatement("select Constituency,Approvedstatus,VoterId,photo from EVS_TBL_Application where Userid = ?");
	ps.setString (1, Userid);
	rs = ps.executeQuery();
	return rs;	
    }	
	public ResultSet getConstituency() throws Exception{
	connect();
	ps = conn.prepareStatement("select Constituency,Votercount from EVS_TBL_Election");
	rs = ps.executeQuery();
	return rs;
	}
	public ResultSet getParty() throws Exception{
	connect();
	ps = conn.prepareStatement("select distinct Partyname from EVS_TBL_Result");
	rs = ps.executeQuery();
	return rs;
	}
	public ResultSet viewresult(String Constituency) throws Exception{
    connect();
	ps = conn.prepareStatement("select * from EVS_TBL_Result where Constituency=?");
	ps.setString (1, Constituency);
	rs = ps.executeQuery();
	return rs;
	}
	public ResultSet view(String Constituency) throws Exception{
	connect();
	ps = conn.prepareStatement("select Partyname,Votecount from EVS_TBL_Result where Votecount=(select max(Votecount) from EVS_TBL_Result where Constituency=?) and Constituency=?");
	ps.setString (1, Constituency);
	ps.setString (2, Constituency);
	rs = ps.executeQuery();
	return rs;
	}
	public String approval(String clas,String id) throws Exception{
	connect();
	if(clas.equals("c")==true){
	ps = conn.prepareStatement("select Approve from EVS_TBL_Candidate where CandidateId=?");
	}
	else{
	ps = conn.prepareStatement("select Approve from EVS_TBL_Party where PartyId=?");
	}
	ps.setString (1,id);
	rs = ps.executeQuery();
	if(rs.next()){
		if(rs.getInt("Approve")==1){
			return "Approved";
			}
	else if(rs.getInt("Approve")==0){
		return "In Progress";
	}}
	return "Invalid";
	}}