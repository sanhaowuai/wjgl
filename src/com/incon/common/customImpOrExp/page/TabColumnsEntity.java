package com.incon.common.customImpOrExp.page;

public class TabColumnsEntity {
	
	private String table_name;
	
	private String column_name;
	
	private String data_type;
	
	private String data_length;
	
	private String nullable;

	public String getTable_name() {
		return table_name;
	}

	public void setTable_name(String tableName) {
		table_name = tableName;
	}

	public String getColumn_name() {
		return column_name;
	}

	public void setColumn_name(String columnName) {
		column_name = columnName;
	}

	public String getData_type() {
		return data_type;
	}

	public void setData_type(String dataType) {
		data_type = dataType;
	}

	public String getData_length() {
		return data_length;
	}

	public void setData_length(String dataLength) {
		data_length = dataLength;
	}

	public String getNullable() {
		return nullable;
	}

	public void setNullable(String nullable) {
		this.nullable = nullable;
	}
}
