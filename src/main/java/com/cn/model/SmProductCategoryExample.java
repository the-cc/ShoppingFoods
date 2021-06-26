package com.cn.model;

import java.util.ArrayList;
import java.util.List;

public class SmProductCategoryExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    public SmProductCategoryExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andSpcIdIsNull() {
            addCriterion("SPC_ID is null");
            return (Criteria) this;
        }

        public Criteria andSpcIdIsNotNull() {
            addCriterion("SPC_ID is not null");
            return (Criteria) this;
        }

        public Criteria andSpcIdEqualTo(Integer value) {
            addCriterion("SPC_ID =", value, "spcId");
            return (Criteria) this;
        }

        public Criteria andSpcIdNotEqualTo(Integer value) {
            addCriterion("SPC_ID <>", value, "spcId");
            return (Criteria) this;
        }

        public Criteria andSpcIdGreaterThan(Integer value) {
            addCriterion("SPC_ID >", value, "spcId");
            return (Criteria) this;
        }

        public Criteria andSpcIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("SPC_ID >=", value, "spcId");
            return (Criteria) this;
        }

        public Criteria andSpcIdLessThan(Integer value) {
            addCriterion("SPC_ID <", value, "spcId");
            return (Criteria) this;
        }

        public Criteria andSpcIdLessThanOrEqualTo(Integer value) {
            addCriterion("SPC_ID <=", value, "spcId");
            return (Criteria) this;
        }

        public Criteria andSpcIdIn(List<Integer> values) {
            addCriterion("SPC_ID in", values, "spcId");
            return (Criteria) this;
        }

        public Criteria andSpcIdNotIn(List<Integer> values) {
            addCriterion("SPC_ID not in", values, "spcId");
            return (Criteria) this;
        }

        public Criteria andSpcIdBetween(Integer value1, Integer value2) {
            addCriterion("SPC_ID between", value1, value2, "spcId");
            return (Criteria) this;
        }

        public Criteria andSpcIdNotBetween(Integer value1, Integer value2) {
            addCriterion("SPC_ID not between", value1, value2, "spcId");
            return (Criteria) this;
        }

        public Criteria andSpcNameIsNull() {
            addCriterion("SPC_NAME is null");
            return (Criteria) this;
        }

        public Criteria andSpcNameIsNotNull() {
            addCriterion("SPC_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andSpcNameEqualTo(String value) {
            addCriterion("SPC_NAME =", value, "spcName");
            return (Criteria) this;
        }

        public Criteria andSpcNameNotEqualTo(String value) {
            addCriterion("SPC_NAME <>", value, "spcName");
            return (Criteria) this;
        }

        public Criteria andSpcNameGreaterThan(String value) {
            addCriterion("SPC_NAME >", value, "spcName");
            return (Criteria) this;
        }

        public Criteria andSpcNameGreaterThanOrEqualTo(String value) {
            addCriterion("SPC_NAME >=", value, "spcName");
            return (Criteria) this;
        }

        public Criteria andSpcNameLessThan(String value) {
            addCriterion("SPC_NAME <", value, "spcName");
            return (Criteria) this;
        }

        public Criteria andSpcNameLessThanOrEqualTo(String value) {
            addCriterion("SPC_NAME <=", value, "spcName");
            return (Criteria) this;
        }

        public Criteria andSpcNameLike(String value) {
            addCriterion("SPC_NAME like", value, "spcName");
            return (Criteria) this;
        }

        public Criteria andSpcNameNotLike(String value) {
            addCriterion("SPC_NAME not like", value, "spcName");
            return (Criteria) this;
        }

        public Criteria andSpcNameIn(List<String> values) {
            addCriterion("SPC_NAME in", values, "spcName");
            return (Criteria) this;
        }

        public Criteria andSpcNameNotIn(List<String> values) {
            addCriterion("SPC_NAME not in", values, "spcName");
            return (Criteria) this;
        }

        public Criteria andSpcNameBetween(String value1, String value2) {
            addCriterion("SPC_NAME between", value1, value2, "spcName");
            return (Criteria) this;
        }

        public Criteria andSpcNameNotBetween(String value1, String value2) {
            addCriterion("SPC_NAME not between", value1, value2, "spcName");
            return (Criteria) this;
        }

        public Criteria andSpcParentIdIsNull() {
            addCriterion("SPC_PARENT_ID is null");
            return (Criteria) this;
        }

        public Criteria andSpcParentIdIsNotNull() {
            addCriterion("SPC_PARENT_ID is not null");
            return (Criteria) this;
        }

        public Criteria andSpcParentIdEqualTo(Integer value) {
            addCriterion("SPC_PARENT_ID =", value, "spcParentId");
            return (Criteria) this;
        }

        public Criteria andSpcParentIdNotEqualTo(Integer value) {
            addCriterion("SPC_PARENT_ID <>", value, "spcParentId");
            return (Criteria) this;
        }

        public Criteria andSpcParentIdGreaterThan(Integer value) {
            addCriterion("SPC_PARENT_ID >", value, "spcParentId");
            return (Criteria) this;
        }

        public Criteria andSpcParentIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("SPC_PARENT_ID >=", value, "spcParentId");
            return (Criteria) this;
        }

        public Criteria andSpcParentIdLessThan(Integer value) {
            addCriterion("SPC_PARENT_ID <", value, "spcParentId");
            return (Criteria) this;
        }

        public Criteria andSpcParentIdLessThanOrEqualTo(Integer value) {
            addCriterion("SPC_PARENT_ID <=", value, "spcParentId");
            return (Criteria) this;
        }

        public Criteria andSpcParentIdIn(List<Integer> values) {
            addCriterion("SPC_PARENT_ID in", values, "spcParentId");
            return (Criteria) this;
        }

        public Criteria andSpcParentIdNotIn(List<Integer> values) {
            addCriterion("SPC_PARENT_ID not in", values, "spcParentId");
            return (Criteria) this;
        }

        public Criteria andSpcParentIdBetween(Integer value1, Integer value2) {
            addCriterion("SPC_PARENT_ID between", value1, value2, "spcParentId");
            return (Criteria) this;
        }

        public Criteria andSpcParentIdNotBetween(Integer value1, Integer value2) {
            addCriterion("SPC_PARENT_ID not between", value1, value2, "spcParentId");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table sm_product_category
     *
     * @mbg.generated do_not_delete_during_merge
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table sm_product_category
     *
     * @mbg.generated
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}