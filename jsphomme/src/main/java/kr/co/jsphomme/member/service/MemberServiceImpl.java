package kr.co.jsphomme.member.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jsphomme.basket.service.BasketService;
import kr.co.jsphomme.member.dao.MemberDao;
import kr.co.jsphomme.member.vo.MemberVo;
import kr.co.jsphomme.purchaselist.service.PurchaseListService;


@Service
public class MemberServiceImpl implements MemberService{
	
	
	private final Logger log = 
			LoggerFactory.getLogger(MemberServiceImpl.class);
		
	@Autowired
	public MemberDao memberDao;
	
	@Autowired
	public PurchaseListService purchaseListService;
	
	@Autowired
	public BasketService basketService;
	
	@Override
	public void memberInsertOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		
		memberDao.memberInsertOne(memberVo);
		
		log.debug("MemberServiceImpl memberInsertOne enter!! {}");
	}

	@Override
	public List<MemberVo> memberListView(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return memberDao.memberListView(map);
	}

	@Override
	public Map<String, Object> memberOneDeteilView(int memberNo) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();

		MemberVo memberVo = memberDao.memberOneDeteilView(memberNo);
		resultMap.put("memberVo", memberVo);
		
		return resultMap;

			}

	@Override
	public MemberVo memberExist(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return memberDao.memberExist(paramMap);
	}

	

	@Override
	public int memberUpdateOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return memberDao.memberUpdateOne(memberVo);
	}

	@Transactional
	@Override
	public int memberDelete(int memberNo)  {
		// TODO Auto-generated method stub
		
		basketService.basketDeleteAll(memberNo);
		purchaseListService.purchaseListDelete(memberNo);
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

	@Override
	public int memberIdOverlapCheck(String overlapIdCheck) {
		// TODO Auto-generated method stub
		return memberDao.memberIdOverlapCheck(overlapIdCheck);
	}

	@Override
	public MemberVo memberCertification(String password, int memberNo) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("password", password);
		map.put("memberNo", memberNo);
		
		return memberDao.memberCertification(map);
	}

	@Override
	public int memberleave(int memberNo) {
		// TODO Auto-generated method stub
		return memberDao.memberleave(memberNo);
	}

	

	
	
	
}
