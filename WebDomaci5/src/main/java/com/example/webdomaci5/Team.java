package com.example.webdomaci5;

import java.io.Serializable;

public class Team implements Serializable {
    private String name;
    private String email;
    private String phoneNumber;
    private String teamMoto;
    private String referral;
    private int TeamSize;

    public Team() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getTeamMoto() {
        return teamMoto;
    }

    public void setTeamMoto(String teamMoto) {
        this.teamMoto = teamMoto;
    }

    public String getReferral() {
        return referral;
    }

    public void setReferral(String referral) {
        this.referral = referral;
    }

    public int getTeamSize() {
        return TeamSize;
    }

    public void setTeamSize(int teamSize) {
        this.TeamSize = teamSize;
    }

    @Override
    public String toString() {
        return "Team{" +
                "name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", teamMoto='" + teamMoto + '\'' +
                ", referral='" + referral + '\'' +
                ", teamSize=" + TeamSize +
                '}';
    }
}
