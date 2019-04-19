package kr.co.jsphomme.member.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.jsphomme.member.dao.MemberDao;
import kr.co.jsphomme.member.vo.MemberVo;


@Service
public class MemberServiceImpl implements MemberService{
	
	
	@Autowired
	public MemberDao memberDao;
	
	@Override
	public void memberInsert(MemberVo memberVo, MultipartHttpServletRequest multipartHttpServletRequest)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MemberVo> memberListView(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return memberDao.memberListView(map);
	}

	@Override
	public MemberVo memberOneDeteilView(int memberNo) {
		// TODO Auto-generated method stub
		
		
		MemberVo memberVo = (MemberVo)memberDao.memberOneDeteilView(memberNo);
		
		
		return memberVo;
	}

	@Override
	public MemberVo memberExist(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return memberDao.memberExist(paramMap);
	}

	

	@Override
	public int memberUpdateOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public int memberDelete(int memberNo)  {
		// TODO Auto-generated method stub
				
		return memberDao.memberDelete(memberNo);
	}


	
	@Override
	public int memberSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return memberDao.memberSelectTotalCount(map);
	}

	

	
	
	
}
