import java.util.*;
import java.sql.*;

public class Connector {
	public static void main(String args[]) {
		Connection con;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/te31456db", "root", "kalpesh@123");
			System.out.println("Connected to mysql !!\n");
			Statement statement = con.createStatement();
			ResultSet rs = null;
			int ch = 0;
			Scanner sc = new Scanner(System.in);
			int sal, empid;
			String fname,lname, address;
			while(true) {
				System.out.println("1. Select\n2. Insert\n3. Update\n 4. Delete\n5. Exit\n");
				System.out.println("Enter your choice: ");
				ch = sc.nextInt();
				switch (ch) {
				case 1: {
					System.out.println("===Retrieving===\n");
					System.out.println("Enter the salary below which you want the list of employee: \nor press -1 for displaying complete table.");
					sal = sc.nextInt();
					if(sal == -1) {
						rs = statement.executeQuery("select * from Employe");
					}else {
						rs = statement.executeQuery("select * from Employe where salary < " + sal);
					}
					System.out.println("Empid\tfname\tlname\tsalary\taddress");
					while (rs.next()) {
						empid = rs.getInt(1);
						fname = rs.getString(2);
						lname = rs.getString(3);
						sal = rs.getInt(4);
						address = rs.getString(5);
						System.out.println(empid + "\t" + fname + "\t" + lname + "\t" + sal + "\t" + address);
					}
					System.out.println();
					break;
				}
				case 2:
					System.out.println("===Inserting the entries===");
					System.out.print("Enter the empid: ");
					empid = sc.nextInt();
					System.out.print("Enter the fname: ");
					fname = sc.next();
					System.out.print("Enter the lname: ");
					lname = sc.next();
					System.out.print("Enter the salary: ");
					sal = sc.nextInt();
					System.out.print("Enter the address: ");
					address = sc.next();
					
					try {
						statement.executeUpdate("insert into Employe values (" + empid + ", '" + fname + "', '" + lname + "', " + sal + ", '" + address + "')");
						System.out.println("Entry with empid = " + empid + "\nfname = " + fname + "\nlname = " + lname + "\nsalary = " + sal + "\naddress = " + address + "\n inserted successfully\n");
					} catch (SQLIntegrityConstraintViolationException e) {
						// Auto-generated catch block
//						e.printStackTrace();
						throw new RuntimeException("Entry already exists in the table\n");
					}
					break;
				case 3:
					System.out.println("===Updating Salary===");
					System.out.println("Enter the empid of Employe of which you want to update salary: ");
					empid = sc.nextInt();
					System.out.println("Enter the updated salary: ");
					sal = sc.nextInt();
					try {
						statement.executeUpdate("update Employe set salary = " + sal + " where empid = " + empid);
						System.out.println("Salary updated sucessfully\n");
					} catch (Exception e) {
						//  Auto-generated catch block
//						e.printStackTrace();
						System.out.println("Employe doesn't exists with given empid\n");
					}
					break;
				case 4:
					System.out.println("===Deleting the Entries===");
					System.out.println("Enter the empid of Employe you want to delete: ");
					empid = sc.nextInt();
					try {
						statement.executeUpdate("delete from Employe where empid = " + empid);
						System.out.println("Entry with empid = " + empid + " deleted successfully.\n");
					} catch (Exception e) {
						//  Auto-generated catch block
//						e.printStackTrace();
						System.out.println("Empid doesn't exists !\n");
					}
					break;
				case 5:
					statement.close();
					con.close();
					System.out.println("Connection broken !\n");
					sc.close();
					System.exit(0);
					break;
				default:
					break;
				}
			}
			
		} catch (Exception e) {
			//  Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
