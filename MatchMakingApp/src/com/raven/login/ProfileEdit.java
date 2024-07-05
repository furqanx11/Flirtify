/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package com.raven.login;

import com.microsoft.sqlserver.jdbc.SQLServerException;
import java.awt.event.ActionEvent;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.event.DocumentEvent;

/**
 *
 * @author hammad
 */
public class ProfileEdit extends javax.swing.JFrame {
    Connection conn;
    int user_Id=0;
    Statement stmt = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    private File selectedFile;
    personaldetails pd = new personaldetails();
    ImageIcon imageIcon;
    private boolean fieldsChanged = false;

    /**
     * Creates new form ProfileEdit
     */
    private ProfileEdit() {
        initComponents();
        conn = ConnectionDB.getConnection();
        user_Id = 14;
        pd.getCountries(conn, cb_Country);
        fetchUserData();
        
        
    }
    
    public ProfileEdit(Connection conn, int user_id) {
        initComponents();
        this.conn = conn;
        this.user_Id = user_id;
        pd.getCountries(conn, cb_Country);
        fetchUserData();
        
        
    }
    
    
    
    private void fetchUserData() {
    try {
        // Establish the database connection
       

        // Create the SQL query
        String query = "SELECT uv.name, uv.email, uv.phone, uv.age, uv.gender, "
            + "lv.country_name, lv.state_name, lv.city_name, rv.religion_name, rv.sect_name, "
            + "upv.photo "
            + "FROM vw_UserView uv "
            + "JOIN vw_LocationView lv ON uv.user_id = lv.user_id "
            + "JOIN vw_UserReligionView rv ON uv.user_id = rv.user_id "
            + "JOIN User_Photos_View upv ON uv.user_id = upv.user_id "
            + "WHERE uv.user_id = " + user_Id;

        // Execute the query
         stmt = conn.createStatement();
         rs = stmt.executeQuery(query);

        // Fetch the first row of data
        if (rs.next()) {
            // Retrieve the column values from the result set
            String name = rs.getString("name");
            String email = rs.getString("email");
            String phone = rs.getString("phone");
            int age = rs.getInt("age");
            
            String country = rs.getString("country_name");
            String state = rs.getString("state_name");
            String city = rs.getString("city_name");
            byte[] photo = rs.getBytes("photo");

            // Set the values on the JLabel components
            lbl_name.setText(name);
            txt_email.setText(email);
            txt_phone.setText(phone);
            txt_age.setText(String.valueOf(age));
            
            cb_Country.setSelectedItem(country);
            
            cb_State.setSelectedItem(state);
            
            cb_City.setSelectedItem(city);
            
            System.out.println(state+city);
            
            // Set the photo on the lbl_photo component
            if (photo != null) {
                imageIcon = new ImageIcon(photo);
                lbl_photo.setIcon(imageIcon);
            } else {
                lbl_photo.setIcon(null);
            }
        }

        // Close the result set, statement, and connection
        rs.close();
        stmt.close();
        
     
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
    
  private void updateUserInformation(File photoFile) {
    try {
        // Establish the database connection
       
        // Get the values from the text fields
        
        String email = txt_email.getText();
        String phone = txt_phone.getText();
        int age = Integer.parseInt(txt_age.getText());
        
        String country = (String) cb_Country.getSelectedItem();
        String state = (String) cb_State.getSelectedItem();
        String city = (String) cb_City.getSelectedItem();

        // Create the SQL query
        String query = "{call sp_updateuserinformation(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        // Create a CallableStatement
        CallableStatement cstmt = conn.prepareCall(query);

        // Set the input parameters
        cstmt.setInt(1, user_Id);
        cstmt.setString(2, email);
        cstmt.setString(3, phone);
        cstmt.setInt(4, age);
       
        // Set the photo parameter if the photoFile is provided
        if (photoFile != null) {
            FileInputStream fis = new FileInputStream(photoFile);
            cstmt.setBinaryStream(7, fis, (int) photoFile.length());
        } else {
            // Exclude the photo parameter from the stored procedure call
            cstmt.setNull(7, Types.BLOB);
        }
        cstmt.setString(8, country);
        cstmt.setString(9, state);
        cstmt.setString(10, city);

        // Execute the stored procedure
        cstmt.executeUpdate();

        // Close the statement and connection
        cstmt.close();
        conn.close();
        
        // Display a success message
        JOptionPane.showMessageDialog(null, "User information updated successfully.");

    } catch (SQLServerException e) {
        JOptionPane.showMessageDialog(null, "Error updating user information. Please check the entered values.", "Error", JOptionPane.ERROR_MESSAGE);
        e.printStackTrace(); // Optional: Print the stack trace for debugging purposes
    } catch (Exception e) {
        JOptionPane.showMessageDialog(null, "An error occurred while updating user information.", "Error", JOptionPane.ERROR_MESSAGE);
        e.printStackTrace(); // Optional: Print the stack trace for debugging purposes
    }
}



    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        txt_age = new javax.swing.JTextField();
        txt_email = new javax.swing.JTextField();
        txt_phone = new javax.swing.JTextField();
        cb_Country = new javax.swing.JComboBox<>();
        cb_State = new javax.swing.JComboBox<>();
        cb_City = new javax.swing.JComboBox<>();
        lbl_photo = new javax.swing.JLabel();
        btn_update = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        lbl_name = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setText("Edit Your Profile");

        jLabel2.setText("Name");

        jLabel3.setText("Email");

        jLabel4.setText("Phone");

        jLabel5.setText("Age");

        jLabel7.setText("Country");

        jLabel8.setText("State");

        jLabel9.setText("City");

        cb_Country.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        cb_Country.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cb_CountryActionPerformed(evt);
            }
        });

        cb_State.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "New York", "California", "England", "Scotland", "Ontario", "Quebec", "New South Wales", "Victoria", "Bavaria", "Berlin" }));
        cb_State.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cb_StateActionPerformed(evt);
            }
        });

        cb_City.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "New York City", "Los Angeles", "London", "Edinburgh", "Toronto", "Montreal", "Sydney", "Melbourne", "Munich", "Berlin" }));
        cb_City.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cb_CityActionPerformed(evt);
            }
        });

        lbl_photo.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));

        btn_update.setText("Update");
        btn_update.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_updateActionPerformed(evt);
            }
        });

        jButton2.setText("Upload");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        lbl_name.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                lbl_nameActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(361, 361, 361)
                        .addComponent(jLabel1))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2)
                            .addComponent(jLabel3)
                            .addComponent(jLabel8)
                            .addComponent(jLabel9)
                            .addComponent(jLabel7)
                            .addComponent(jLabel4)
                            .addComponent(jLabel5))
                        .addGap(84, 84, 84)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(cb_Country, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(txt_email, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(txt_phone, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(txt_age, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(cb_State, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(lbl_photo, javax.swing.GroupLayout.PREFERRED_SIZE, 330, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addGap(0, 0, Short.MAX_VALUE)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                        .addComponent(btn_update)
                                        .addGap(34, 34, 34))
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                        .addComponent(jButton2)
                                        .addGap(255, 255, 255))))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(lbl_name, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(cb_City, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(0, 566, Short.MAX_VALUE)))))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(47, 47, 47)
                                .addComponent(jLabel2))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(jLabel1))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(lbl_name, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel3)
                            .addComponent(txt_email, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(33, 33, 33)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel4)
                            .addComponent(txt_phone, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 33, Short.MAX_VALUE)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel5)
                            .addComponent(txt_age, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(27, 27, 27)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel7)
                            .addComponent(cb_Country, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(23, 23, 23)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel8)
                            .addComponent(cb_State, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addComponent(lbl_photo, javax.swing.GroupLayout.PREFERRED_SIZE, 233, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton2))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(39, 39, 39)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(cb_City, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel9))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 53, Short.MAX_VALUE)
                .addComponent(btn_update)
                .addGap(26, 26, 26))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 47, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
    

    

    
    private void cb_CountryActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cb_CountryActionPerformed
        String selectedCountry = (String) cb_Country.getSelectedItem();
        pd.getStates(conn,selectedCountry,cb_State);
    }//GEN-LAST:event_cb_CountryActionPerformed

    private void cb_StateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cb_StateActionPerformed
        String selectedState = (String) cb_State.getSelectedItem();
        pd.getCities(conn,selectedState,cb_City);
    }//GEN-LAST:event_cb_StateActionPerformed

    private void cb_CityActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cb_CityActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cb_CityActionPerformed

    private void btn_updateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_updateActionPerformed
                                                
     Icon icon = lbl_photo.getIcon();

    try {
        if (icon instanceof ImageIcon) {
            ImageIcon imageIcon = (ImageIcon) icon;
            String filePath = imageIcon.getDescription(); // Assuming the icon description contains the file path
            selectedFile = new File(filePath);
        } else {
            throw new IllegalArgumentException("File is null.");
        }

        // Check if the selected file exists and is not null
        if (selectedFile != null && selectedFile.exists()) {
            updateUserInformation(selectedFile);
            JOptionPane.showMessageDialog(null, "User information updated successfully.", "Success", JOptionPane.INFORMATION_MESSAGE);
        } else {
            // If the file is not provided, update user information without updating the photo
            updateUserInformation(null);
            JOptionPane.showMessageDialog(null, "User information updated successfully.", "Success", JOptionPane.INFORMATION_MESSAGE);
        }
    } catch (Exception e) {
        JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    }

    }//GEN-LAST:event_btn_updateActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
       JFileChooser chooser = new JFileChooser();
    chooser.showOpenDialog(null);
    File f = chooser.getSelectedFile();

    if (f != null && f.exists()) {
        selectedFile = f;
        lbl_photo.setIcon(new ImageIcon(f.toString()));
        // Perform additional operations with the selected file
    }
        
    }//GEN-LAST:event_jButton2ActionPerformed

    private void lbl_nameActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_lbl_nameActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_lbl_nameActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ProfileEdit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ProfileEdit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ProfileEdit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ProfileEdit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ProfileEdit().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn_update;
    private javax.swing.JComboBox<String> cb_City;
    private javax.swing.JComboBox<String> cb_Country;
    private javax.swing.JComboBox<String> cb_State;
    private javax.swing.JButton jButton2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JTextField lbl_name;
    private javax.swing.JLabel lbl_photo;
    private javax.swing.JTextField txt_age;
    private javax.swing.JTextField txt_email;
    private javax.swing.JTextField txt_phone;
    // End of variables declaration//GEN-END:variables
}
