package kr.or.ddit.index;

import java.util.ArrayList;
import java.util.List;

public class IndexRepository {
	
	private List<IndexVO> indexList = new ArrayList<IndexVO>();
	
	private static IndexRepository instance = null;
	public static IndexRepository getInstance() {
		if(instance == null) {
			instance = new IndexRepository();
		}
		return instance;
	}
	
	private IndexRepository() {
		//챕터 정보를
		//각 챕터의 제목들
		//각 챕터의 이동 URL
		//각 챕터의 소스 파일명들
		
		//최종 indexList에 추가
		
	}
	
}
