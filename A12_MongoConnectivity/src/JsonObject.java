
import java.util.Scanner;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

//import java.net.UnknownHostException;

public class JsonObject {
	public static void main(String[] args) {
		try {
			MongoClient mongo = new MongoClient("localhost", 27017);
			MongoDatabase database = mongo.getDatabase("kaldb");
			MongoCollection<Document> collection = database.getCollection("Students");
			int ch, roll, marks, weight;
			String name, city, dept;
			Scanner sc = new Scanner(System.in);
			while (true) {
				System.out.println(
						"1. Display the collection\n2. Insert document into collection\n3. Update document\n4. Delete document\n5. Drop collection\n6. Exit\n");
				System.out.println("Enter the choice: ");
				ch = sc.nextInt();
				switch (ch) {
				case 1: {
					System.out.println("*****Displaying the Collection*****");
					FindIterable<Document> iter = collection.find();
					MongoCursor<Document> cursor = iter.iterator();
					while (cursor.hasNext()) {
						System.out.println(cursor.next());
					}
					System.out.println();
					break;
				}
				case 2: {
					System.out.println("****Inserting the document****");
					System.out.print("Enter the roll no of the student: ");
					roll = sc.nextInt();
					System.out.print("Enter the marks of the student: ");
					marks = sc.nextInt();
					System.out.print("Enter the weight of the student: ");
					weight = sc.nextInt();
					System.out.print("Enter the name of the student: ");
					name = sc.next();
					System.out.print("Enter the city of the student: ");
					city = sc.next();
					System.out.print("Enter the deptartment of the student (C, I, E): ");
					dept = sc.next();
					Document document = new Document("_id", roll).append("name", name).append("marks", marks)
							.append("weight", weight).append("city", city).append("deptartment", dept);
					collection.insertOne(document);
					System.out.println("Document inserted successfully..\n");
					break;
				}
				case 3: {
					System.out.println("****Updating****");
					System.out.println("Enter the roll no of student to update the data: ");
					roll = sc.nextInt();
					System.out.println("==Update==\n1. Marks\n2. Weight\n3. City\n" + "Enter the choice: ");
					ch = sc.nextInt();
					switch (ch) {
					case 1: {
						System.out.println("Enter the updated marks: ");
						marks = sc.nextInt();
						collection.updateOne(Filters.eq("_id", roll), Updates.set("marks", marks));
						System.out.println("Marks updated successfully..\n");
						break;						
					}
					case 2: {
						System.out.println("Enter the updated weight: ");
						weight = sc.nextInt();
						collection.updateOne(Filters.eq("_id", roll), Updates.set("weight", weight));
						System.out.println("Weight updated successfully..\n");
						break;						
					}
					case 3: {
						System.out.println("Enter the updated city: ");
						city = sc.next();
						collection.updateOne(Filters.eq("_id", roll), Updates.set("marks", city));
						System.out.println("City updated successfully..\n");
						break;						
					}
					default:
						throw new IllegalArgumentException("Unexpected value: " + ch);
					}
					break;
				}
				case 4: {
					System.out.println("****Deleting***");
					System.out.println("Enter the roll no of student to delete the data: ");
					roll = sc.nextInt();
					collection.deleteOne(Filters.eq("_id", roll));
					System.out.println("Document deleted successfully..\n");
					break;
				}
				case 5: {
					collection.drop();
					sc.close();
					mongo.close();
					System.exit(0);
					break;
				}
				case 6: {
					sc.close();
					mongo.close();
					System.exit(0);
					break;
				}
				default:
					throw new IllegalArgumentException("Unexpected value: " + ch);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
