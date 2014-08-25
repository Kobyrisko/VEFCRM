package com.aleykoteretpro.packages;

public class Date {
	private int day;
	private int month;
	private int year;
	
	public Date(int dd, int mm, int yy) throws Exception
	{
		if(dd<31||mm<12)
		{
			this.day= dd;
			this.month= mm;
			this.year= yy;
		}
		
	}

	public static void main(String[] args)
	{
		try{
		Date d= new Date(12,15,2000);
		System.out.println(d.toString());
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
