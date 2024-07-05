/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raven.form;

import com.raven.login.Matches;
import com.raven.login.View_Profile;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

/**
 *
 * @author RAVEN
 */
public class Form_1 extends javax.swing.JPanel {
    Connection conn;
    Statement stmt = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    int pr1_id, pr2_id, pr3_id;
    int userId;
    /**
     * Creates new form Form_1
     */
    private Form_1() {
        initComponents();
        
    }
    
    public Form_1(Connection conn, int userId){
        initComponents();
        this.conn = conn;
        this.userId = userId;
        fetchUserData();
        
    }
     
    private void fetchUserData() {
    try {
        // Establish the database connection
       

        // Create the SQL query
         // Provide the user ID

String query = "SELECT TOP 3 lv.state_name, lv.city_name, rv.user_id, rv.name, uv.age, rv.religion_name, rv.sect_name, pv.occupation, upv.photo "
             + "FROM dbo.vw_LocationView lv "
             + "JOIN dbo.vw_UserReligionView rv ON lv.user_id = rv.user_id "
             + "JOIN vw_UserView uv ON lv.user_id = uv.user_id "
             + "JOIN dbo.vw_UserProfessionView pv ON lv.user_id = pv.user_id "
             + "JOIN User_Photos_View upv ON lv.user_id = upv.user_id "
             + "WHERE lv.state_name = (SELECT state_name FROM dbo.vw_LocationView WHERE user_id = " + userId + ") "
             + "AND rv.religion_name = (SELECT religion_name FROM dbo.vw_UserReligionView WHERE user_id = " + userId + ") "
             + "AND lv.user_id != " + userId + " "
             + "ORDER BY lv.user_id ASC;";





        // Execute the query
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        // Fetch the first row of data
        if (rs.next()) {
            // Retrieve the column values from the result set
            
            byte[] photo = rs.getBytes("photo");

            // Set the values on the JLabel components
            pr1_id = rs.getInt("user_id");
            prof1_lbl_name.setText(rs.getString("name"));
            prof1_lbl_age.setText(rs.getString("age"));
            prof1_lbl_occ.setText(rs.getString("occupation"));
            // Set the photo on the lbl_photo component
            if (photo != null) {
                ImageIcon imageIcon = new ImageIcon(photo);
                lbl_photo1.setIcon(imageIcon);
            } else {
                lbl_photo1.setIcon(null);
            }
        }
        if (rs.next()) {
            // Retrieve the column values from the result set
            
            byte[] photo = rs.getBytes("photo");

            // Set the values on the JLabel components
            pr2_id = rs.getInt("user_id");
            prof2_lbl_name.setText(rs.getString("name"));
            prof2_lbl_age.setText(rs.getString("age"));
            prof2_lbl_occ.setText(rs.getString("occupation"));
            // Set the photo on the lbl_photo component
            if (photo != null) {
                ImageIcon imageIcon = new ImageIcon(photo);
                lbl_photo2.setIcon(imageIcon);
            } else {
                lbl_photo2.setIcon(null);
            }
        }
        if (rs.next()) {
            // Retrieve the column values from the result set
            
            byte[] photo = rs.getBytes("photo");

            // Set the values on the JLabel components
            pr3_id = rs.getInt("user_id");
            prof3_lbl_name.setText(rs.getString("name"));
            prof3_lbl_age.setText(rs.getString("age"));
            prof3_lbl_occ.setText(rs.getString("occupation"));
            // Set the photo on the lbl_photo component
            if (photo != null) {
                ImageIcon imageIcon = new ImageIcon(photo);
                lbl_photo3.setIcon(imageIcon);
            } else {
                lbl_photo3.setIcon(null);
            }
        }

        // Close the result set, statement, and connection
        rs.close();
        stmt.close();
        //conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

    
     public void insertMatchRequest(int senderId) {
        try  {
             String query = "{CALL InsertMatchRequest(?,?)}";
            CallableStatement cstmt = conn.prepareCall(query);
            cstmt.setInt(1, senderId);
            cstmt.setInt(2, userId);
            cstmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Match request sent");
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
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
        jLabel2 = new javax.swing.JLabel();
        prof1_lbl_name = new javax.swing.JLabel();
        prof1_lbl_age = new javax.swing.JLabel();
        prof1_lbl_occ = new javax.swing.JLabel();
        lbl_photo1 = new javax.swing.JLabel();
        vw_profile1 = new javax.swing.JButton();
        connect1 = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        prof2_lbl_name = new javax.swing.JLabel();
        prof2_lbl_age = new javax.swing.JLabel();
        prof2_lbl_occ = new javax.swing.JLabel();
        lbl_photo2 = new javax.swing.JLabel();
        vw_profile2 = new javax.swing.JButton();
        connect2 = new javax.swing.JButton();
        jPanel3 = new javax.swing.JPanel();
        prof3_lbl_name = new javax.swing.JLabel();
        prof3_lbl_age = new javax.swing.JLabel();
        prof3_lbl_occ = new javax.swing.JLabel();
        lbl_photo3 = new javax.swing.JLabel();
        vw_profile3 = new javax.swing.JButton();
        connect3 = new javax.swing.JButton();

        jLabel2.setText("Profile Matches for you");

        prof1_lbl_name.setText("Name");

        prof1_lbl_age.setText("Age");

        prof1_lbl_occ.setText("Occupation");

        lbl_photo1.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));

        vw_profile1.setText("View Profile");
        vw_profile1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                vw_profile1ActionPerformed(evt);
            }
        });

        connect1.setText("Connect");
        connect1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                connect1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(354, 354, 354)
                .addComponent(jLabel2)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(prof1_lbl_name)
                    .addComponent(prof1_lbl_age)
                    .addComponent(prof1_lbl_occ)
                    .addComponent(vw_profile1)
                    .addComponent(connect1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 62, Short.MAX_VALUE)
                .addComponent(lbl_photo1, javax.swing.GroupLayout.PREFERRED_SIZE, 391, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(41, 41, 41)
                        .addComponent(prof1_lbl_name)
                        .addGap(30, 30, 30)
                        .addComponent(prof1_lbl_age)
                        .addGap(33, 33, 33)
                        .addComponent(prof1_lbl_occ)
                        .addGap(36, 36, 36)
                        .addComponent(vw_profile1)
                        .addGap(18, 18, 18)
                        .addComponent(connect1))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(14, 14, 14)
                        .addComponent(lbl_photo1, javax.swing.GroupLayout.PREFERRED_SIZE, 261, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        prof2_lbl_name.setText("Name");

        prof2_lbl_age.setText("Age");

        prof2_lbl_occ.setText("Occupation");

        lbl_photo2.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));

        vw_profile2.setText("View Profile");
        vw_profile2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                vw_profile2ActionPerformed(evt);
            }
        });

        connect2.setText("Connect");
        connect2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                connect2ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(prof2_lbl_name)
                    .addComponent(prof2_lbl_age)
                    .addComponent(prof2_lbl_occ)
                    .addComponent(vw_profile2)
                    .addComponent(connect2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 74, Short.MAX_VALUE)
                .addComponent(lbl_photo2, javax.swing.GroupLayout.PREFERRED_SIZE, 391, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(65, 65, 65)
                .addComponent(prof2_lbl_name)
                .addGap(30, 30, 30)
                .addComponent(prof2_lbl_age)
                .addGap(33, 33, 33)
                .addComponent(prof2_lbl_occ)
                .addGap(36, 36, 36)
                .addComponent(vw_profile2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 29, Short.MAX_VALUE)
                .addComponent(connect2)
                .addGap(16, 16, 16))
            .addComponent(lbl_photo2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        prof3_lbl_name.setText("Name");

        prof3_lbl_age.setText("Age");

        prof3_lbl_occ.setText("Occupation");

        lbl_photo3.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));

        vw_profile3.setText("View Profile");
        vw_profile3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                vw_profile3ActionPerformed(evt);
            }
        });

        connect3.setText("Connect");
        connect3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                connect3ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(prof3_lbl_name)
                    .addComponent(prof3_lbl_age)
                    .addComponent(prof3_lbl_occ)
                    .addComponent(vw_profile3)
                    .addComponent(connect3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 62, Short.MAX_VALUE)
                .addComponent(lbl_photo3, javax.swing.GroupLayout.PREFERRED_SIZE, 397, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(65, 65, 65)
                .addComponent(prof3_lbl_name)
                .addGap(30, 30, 30)
                .addComponent(prof3_lbl_age)
                .addGap(33, 33, 33)
                .addComponent(prof3_lbl_occ)
                .addGap(36, 36, 36)
                .addComponent(vw_profile3)
                .addGap(18, 18, 18)
                .addComponent(connect3)
                .addContainerGap(15, Short.MAX_VALUE))
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(38, 38, 38)
                .addComponent(lbl_photo3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(29, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents

    private void vw_profile1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_vw_profile1ActionPerformed
        // TODO add your handling code here:
        new View_Profile(conn,pr1_id).setVisible(true);
        //this.dispose();
    }//GEN-LAST:event_vw_profile1ActionPerformed

    private void connect1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_connect1ActionPerformed
        // TODO add your handling code here:
        insertMatchRequest(pr1_id);

    }//GEN-LAST:event_connect1ActionPerformed

    private void vw_profile2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_vw_profile2ActionPerformed
        new View_Profile(conn,pr2_id).setVisible(true);
        //this.dispose();
    }//GEN-LAST:event_vw_profile2ActionPerformed

    private void connect2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_connect2ActionPerformed
        // TODO add your handling code here:
        insertMatchRequest(pr2_id);
    }//GEN-LAST:event_connect2ActionPerformed

    private void vw_profile3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_vw_profile3ActionPerformed
        new View_Profile(conn,pr3_id).setVisible(true);
        //this.dispose();
    }//GEN-LAST:event_vw_profile3ActionPerformed

    private void connect3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_connect3ActionPerformed
        // TODO add your handling code here:
        insertMatchRequest(pr3_id);
    }//GEN-LAST:event_connect3ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton connect1;
    private javax.swing.JButton connect2;
    private javax.swing.JButton connect3;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JLabel lbl_photo1;
    private javax.swing.JLabel lbl_photo2;
    private javax.swing.JLabel lbl_photo3;
    private javax.swing.JLabel prof1_lbl_age;
    private javax.swing.JLabel prof1_lbl_name;
    private javax.swing.JLabel prof1_lbl_occ;
    private javax.swing.JLabel prof2_lbl_age;
    private javax.swing.JLabel prof2_lbl_name;
    private javax.swing.JLabel prof2_lbl_occ;
    private javax.swing.JLabel prof3_lbl_age;
    private javax.swing.JLabel prof3_lbl_name;
    private javax.swing.JLabel prof3_lbl_occ;
    private javax.swing.JButton vw_profile1;
    private javax.swing.JButton vw_profile2;
    private javax.swing.JButton vw_profile3;
    // End of variables declaration//GEN-END:variables
}
