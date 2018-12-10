package com.websrv.theaterseat.dto;

public class SeatDto {
    private int s_idx;
    private char seatRow;
    private int seatNum;
    private int p_idx;

    public int getS_idx() {
        return s_idx;
    }

    public void setS_idx(int s_idx) {
        this.s_idx = s_idx;
    }

    public char getSeatRow() {
        return seatRow;
    }

    public void setSeatRow(char seatRow) {
        this.seatRow = seatRow;
    }

    public int getSeatNum() {
        return seatNum;
    }

    public void setSeatNum(int seatNum) {
        this.seatNum = seatNum;
    }

    public int getP_idx() { return p_idx; }

    public void setP_idx(int p_idx) { this.p_idx = p_idx; }
}