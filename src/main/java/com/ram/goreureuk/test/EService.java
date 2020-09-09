package com.ram.goreureuk.test;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class EService {
	@Inject
	private EDAO ed;
	
	public ArrayList<EDTO> getEmployeeList(){
		return ed.getEmployeeList();
	}
}
