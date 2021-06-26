package com.cn.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class SmOrder implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sm_order.so_id
     *
     * @mbg.generated
     */
    private Integer soId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sm_order.so_user_name
     *
     * @mbg.generated
     */
    private String soUserName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sm_order.so_user_address
     *
     * @mbg.generated
     */
    private String soUserAddress;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sm_order.so_name
     *
     * @mbg.generated
     */
    private String soName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sm_order.so_create_time
     *
     * @mbg.generated
     */
    private Date soCreateTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sm_order.sod_quantity
     *
     * @mbg.generated
     */
    private Integer sodQuantity;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sm_order.so_cost
     *
     * @mbg.generated
     */
    private BigDecimal soCost;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sm_order.so_status
     *
     * @mbg.generated
     */
    private Integer soStatus;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table sm_order
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sm_order.so_id
     *
     * @return the value of sm_order.so_id
     *
     * @mbg.generated
     */
    public Integer getSoId() {
        return soId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sm_order.so_id
     *
     * @param soId the value for sm_order.so_id
     *
     * @mbg.generated
     */
    public void setSoId(Integer soId) {
        this.soId = soId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sm_order.so_user_name
     *
     * @return the value of sm_order.so_user_name
     *
     * @mbg.generated
     */
    public String getSoUserName() {
        return soUserName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sm_order.so_user_name
     *
     * @param soUserName the value for sm_order.so_user_name
     *
     * @mbg.generated
     */
    public void setSoUserName(String soUserName) {
        this.soUserName = soUserName == null ? null : soUserName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sm_order.so_user_address
     *
     * @return the value of sm_order.so_user_address
     *
     * @mbg.generated
     */
    public String getSoUserAddress() {
        return soUserAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sm_order.so_user_address
     *
     * @param soUserAddress the value for sm_order.so_user_address
     *
     * @mbg.generated
     */
    public void setSoUserAddress(String soUserAddress) {
        this.soUserAddress = soUserAddress == null ? null : soUserAddress.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sm_order.so_name
     *
     * @return the value of sm_order.so_name
     *
     * @mbg.generated
     */
    public String getSoName() {
        return soName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sm_order.so_name
     *
     * @param soName the value for sm_order.so_name
     *
     * @mbg.generated
     */
    public void setSoName(String soName) {
        this.soName = soName == null ? null : soName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sm_order.so_create_time
     *
     * @return the value of sm_order.so_create_time
     *
     * @mbg.generated
     */
    public Date getSoCreateTime() {
        return soCreateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sm_order.so_create_time
     *
     * @param soCreateTime the value for sm_order.so_create_time
     *
     * @mbg.generated
     */
    public void setSoCreateTime(Date soCreateTime) {
        this.soCreateTime = soCreateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sm_order.sod_quantity
     *
     * @return the value of sm_order.sod_quantity
     *
     * @mbg.generated
     */
    public Integer getSodQuantity() {
        return sodQuantity;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sm_order.sod_quantity
     *
     * @param sodQuantity the value for sm_order.sod_quantity
     *
     * @mbg.generated
     */
    public void setSodQuantity(Integer sodQuantity) {
        this.sodQuantity = sodQuantity;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sm_order.so_cost
     *
     * @return the value of sm_order.so_cost
     *
     * @mbg.generated
     */
    public BigDecimal getSoCost() {
        return soCost;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sm_order.so_cost
     *
     * @param soCost the value for sm_order.so_cost
     *
     * @mbg.generated
     */
    public void setSoCost(BigDecimal soCost) {
        this.soCost = soCost;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sm_order.so_status
     *
     * @return the value of sm_order.so_status
     *
     * @mbg.generated
     */
    public Integer getSoStatus() {
        return soStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sm_order.so_status
     *
     * @param soStatus the value for sm_order.so_status
     *
     * @mbg.generated
     */
    public void setSoStatus(Integer soStatus) {
        this.soStatus = soStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sm_order
     *
     * @mbg.generated
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", soId=").append(soId);
        sb.append(", soUserName=").append(soUserName);
        sb.append(", soUserAddress=").append(soUserAddress);
        sb.append(", soName=").append(soName);
        sb.append(", soCreateTime=").append(soCreateTime);
        sb.append(", sodQuantity=").append(sodQuantity);
        sb.append(", soCost=").append(soCost);
        sb.append(", soStatus=").append(soStatus);
        sb.append("]");
        return sb.toString();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sm_order
     *
     * @mbg.generated
     */
    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        SmOrder other = (SmOrder) that;
        return (this.getSoId() == null ? other.getSoId() == null : this.getSoId().equals(other.getSoId()))
            && (this.getSoUserName() == null ? other.getSoUserName() == null : this.getSoUserName().equals(other.getSoUserName()))
            && (this.getSoUserAddress() == null ? other.getSoUserAddress() == null : this.getSoUserAddress().equals(other.getSoUserAddress()))
            && (this.getSoName() == null ? other.getSoName() == null : this.getSoName().equals(other.getSoName()))
            && (this.getSoCreateTime() == null ? other.getSoCreateTime() == null : this.getSoCreateTime().equals(other.getSoCreateTime()))
            && (this.getSodQuantity() == null ? other.getSodQuantity() == null : this.getSodQuantity().equals(other.getSodQuantity()))
            && (this.getSoCost() == null ? other.getSoCost() == null : this.getSoCost().equals(other.getSoCost()))
            && (this.getSoStatus() == null ? other.getSoStatus() == null : this.getSoStatus().equals(other.getSoStatus()));
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sm_order
     *
     * @mbg.generated
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getSoId() == null) ? 0 : getSoId().hashCode());
        result = prime * result + ((getSoUserName() == null) ? 0 : getSoUserName().hashCode());
        result = prime * result + ((getSoUserAddress() == null) ? 0 : getSoUserAddress().hashCode());
        result = prime * result + ((getSoName() == null) ? 0 : getSoName().hashCode());
        result = prime * result + ((getSoCreateTime() == null) ? 0 : getSoCreateTime().hashCode());
        result = prime * result + ((getSodQuantity() == null) ? 0 : getSodQuantity().hashCode());
        result = prime * result + ((getSoCost() == null) ? 0 : getSoCost().hashCode());
        result = prime * result + ((getSoStatus() == null) ? 0 : getSoStatus().hashCode());
        return result;
    }
}