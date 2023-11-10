/**
 * 
 */
$.boardList = function(){
	$.ajax({

		//요청
		url : "${request.getContextPath}/BoardList.do",
		method : 'post',
		
		//응답
		success: function (boardList) {
            var code = '<tr><th width="10%">번호</th>' + 
                '<th width="45%">제목</th>' +
                '<th width="15%">작성자</th>' +
                '<th width="20%">작성일</th>' +
                '<th width="10%">조회수</th></tr>';

            if (res.boardList == null || res.boardList.length === 0) {
                code += '<tr><td colspan="5">조회하실 게시글이 존재하지 않습니다.</td></tr>';
            } else {
                for (var i = 0; i < res.boardList.length; i++) {
                    var board = res.boardList[i];
                    code += '<tr><td>' + board.bo_no + '</td>' +
                        '<td><a href="' + res.contextPath + 'boardDetail.do?boardNo=' + board.getBo_no() + '">' + board.getBo_title() + '</a></td>' +
                        '<td>' + board.writer + '</td>' +
                        '<td>' + board.regDate + '</td>' +
                        '<td>' + board.hit + '</td></tr>';
                }
            }

            code += '<tr><td colspan="5"><input type="button" value="글쓰기" onclick="BoardInsert.do"></td></tr>';

            $('#boardListTable').html(code);

        }, //success 끝
			error : function(xhr){
			alert("상태:" + xhr.status);
		},
			dataType : 'json'
				
	});
			
};
			


