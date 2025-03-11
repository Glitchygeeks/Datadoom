import com.google.gson.Gson;
import com.google.gson.JsonObject;
import spark.Spark;
import java.sql.*;
import java.nio.file.*;
import java.io.InputStream;
import java.util.Map;
import java.util.Random;

public class biocodebackend {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/biocode";
    private static final String JDBC_USER = "your_mysql_username"; // Replace with your MySQL username
    private static final String JDBC_PASSWORD = "your_mysql_password"; // Replace with your MySQL password
    private static final String UPLOAD_DIR = "uploads/";

    public static void main(String[] args) {
        Spark.port(4567);

        Path uploadPath = Paths.get(UPLOAD_DIR);
        if (!Files.exists(uploadPath)) {
            try {
                Files.createDirectories(uploadPath);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        Spark.post("/login", (request, response) -> {
            response.type("application/json");
            String username = request.queryParams("username");
            String contact = request.queryParams("contact");
            String name = request.queryParams("name");
            String address = request.queryParams("address");

            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                PreparedStatement checkStmt = conn.prepareStatement("SELECT id FROM users WHERE username = ?");
                checkStmt.setString(1, username);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    PreparedStatement stmt = conn.prepareStatement("SELECT id FROM users WHERE username = ? AND contact = ?");
                    stmt.setString(1, username);
                    stmt.setString(2, contact);
                    ResultSet rs2 = stmt.executeQuery();
                    if(rs2.next()){
                        JsonObject jsonResponse = new JsonObject();
                        jsonResponse.addProperty("success", true);
                        JsonObject userJson = new JsonObject();
                        userJson.addProperty("id", rs2.getInt("id"));
                        userJson.addProperty("username", username);
                        userJson.addProperty("contact", contact);
                        jsonResponse.add("user", userJson);
                        return jsonResponse.toString();
                    }else{
                        return new Gson().toJson(Map.of("success", false, "message", "Invalid credentials"));
                    }

                } else {
                    PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO users (username, contact, name, address) VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
                    insertStmt.setString(1, username);
                    insertStmt.setString(2, contact);
                    insertStmt.setString(3, name);
                    insertStmt.setString(4, address);
                    insertStmt.executeUpdate();
                    ResultSet generatedKeys = insertStmt.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        JsonObject jsonResponse = new JsonObject();
                        jsonResponse.addProperty("success", true);
                        JsonObject userJson = new JsonObject();
                        userJson.addProperty("id", generatedKeys.getInt(1));
                        userJson.addProperty("username", username);
                        userJson.addProperty("contact", contact);
                        jsonResponse.add("user", userJson);
                        return jsonResponse.toString();
                    } else {
                        return new Gson().toJson(Map.of("success", false, "message", "Signup failed."));
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                return new Gson().toJson(Map.of("success", false, "message", "Database error"));
            }
        });

        Spark.get("/inspiration", (request, response) -> {
            response.type("application/json");
            String[] topics = {"Machine Learning for Drug Discovery", "AI in Genomics", "Bioinformatics for Personalized Medicine", "Computational Biology for Disease Modeling", "Data Analysis in Ecology"};
            Random rand = new Random();
            int randomIndex = rand.nextInt(topics.length);
            return new Gson().toJson(Map.of("topic", topics[randomIndex]));
        });

        Spark.post("/store", (request, response) -> {
            response.type("application/json");
            int userId = Integer.parseInt(request.queryParams("userId"));
            try (InputStream is = request.raw().getPart("pythonFile").getInputStream();
                 Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("INSERT INTO inventions (userId, inventionName, filePath) VALUES (?, ?, ?)")) {
                String fileName = System.currentTimeMillis() + "_" + request.raw().getPart("pythonFile").getSubmittedFileName();
                String filePath = UPLOAD_DIR + fileName;
                Files.copy(is, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
                stmt.setInt(1, userId);
                stmt.setString(2, request.raw().getPart("pythonFile").getSubmittedFileName());
                stmt.setString(3, filePath);
                stmt.executeUpdate();
                return new Gson().toJson(Map.of("success", true, "message", "Invention stored successfully."));
            } catch (Exception e) {
                e.printStackTrace();
                return new Gson().toJson(Map.of("success", false, "message", "Storage failed: " + e.getMessage()));
            }
        });

        Spark.post("/sell", (request, response) -> {
            response.type("application/json");
            int userId = Integer.parseInt(request.queryParams("userId"));
            double price = Double.parseDouble(request.queryParams("price"));

            try (InputStream is = request.raw().getPart("pythonFile").getInputStream();
                 Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("INSERT INTO inventions (userId, inventionName, filePath, price) VALUES (?, ?, ?, ?)")) {
                String fileName = System.currentTimeMillis() + "_" + request.raw().getPart("pythonFile").getSubmittedFileName();
                String filePath = UPLOAD_DIR + fileName;
                Files.copy(is, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
                stmt.setInt(1, userId);
                stmt.setString(2, request.raw().getPart("pythonFile").getSubmittedFileName());
                stmt.setString(3, filePath);
                stmt.setDouble(4, price);
                stmt.executeUpdate();
                return new Gson().toJson(Map.of("success", true, "message", "Invention listed for sale."));
            } catch (Exception e) {
                e.printStackTrace();
                return new Gson().toJson(Map.of("success", false, "message", "Sale listing failed: " + e.getMessage()));
            }
        });

        Spark.post("/certify", (request, response) -> {
            response.type("application/json");
            int userId = Integer.parseInt(request.queryParams("userId"));
            try (InputStream is = request.raw().getPart("pythonFile").getInputStream();
                 Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("INSERT INTO inventions (userId, inventionName, filePath, isCertified) VALUES (?, ?, ?, ?)")) {
                String fileName = System.currentTimeMillis() + "_" + request.raw().getPart("pythonFile").getSubmittedFileName();
                String filePath = UPLOAD_DIR + fileName;
                Files.copy(is, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
                stmt.setInt(1, userId);
                stmt.setString(2, request.raw().getPart("pythonFile").getSubmittedFileName());
                stmt.setString(3, filePath);
                stmt.setBoolean(4, true);
                stmt.executeUpdate();
                return new Gson().toJson(Map.of("success", true, "message", "Invention certified and patented."));
            } catch (Exception e) {
                e.printStackTrace();
                return new Gson().toJson(Map.of("success", false, "message", "Certification failed: " + e.getMessage()));
            }
        });

        Spark.post("/check", (request, response) -> {
            response.type("application/json");
            // Implement uniqueness check logic here
            return new Gson().toJson(Map.of("success", true, "message", "Uniqueness checked."));
        });
    }
}
