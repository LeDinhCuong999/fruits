package com.t2010a.fruits.entity.myenum;

public enum CartItemStatus {
    CTIVE(1),DEACTIVE(0),UNDEFINE(-2);

    private int value;
    CartItemStatus(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
    public static CartItemStatus of(int value){
        for (CartItemStatus status :
                CartItemStatus.values()){
            if (status.getValue() == value){
                return status;
            }
        }
        return UNDEFINE;
    }
}
