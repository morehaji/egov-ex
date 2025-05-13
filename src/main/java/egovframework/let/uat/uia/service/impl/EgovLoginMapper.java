package egovframework.let.uat.uia.service.impl;


import egovframework.let.uat.uia.service.GnrMberVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper("egovLoginMapper")
public interface EgovLoginMapper {

	void insertGnrMber(GnrMberVO gnrMberVO);
	
}