/**
 * 
 */
$.boardList = function(){
    $.ajax({
        //요청
        url: `${mypath}/BoardList.do`,
        method: 'post',

        //응답
        success: function (res) {
			 console.log(res);
            // 테이블 헤더 부분을 생성합니다.
            var code = '<tr><th width="10%">번호</th>' + 
                '<th width="45%">제목</th>' +
                '<th width="15%">작성자</th>' +
                '<th width="20%">작성일</th>' +
                '<th width="10%">조회수</th></tr>';

            // 만약 res가 null이거나 길이가 0이라면 메시지를 표시하고, 아니면 테이블을 생성합니다.
            if (res == null || res.length === 0) {
                code += '<tr><td colspan="5">조회하실 게시글이 존재하지 않습니다.</td></tr>';
            } else {
                // 각 게시물에 대해 반복하며 테이블의 행을 추가합니다.
                $.each(res, function (i, v) {
                    code += '<tr><td>' + v.bo_no + '</td>' +
                        '<td><a href="' + mypath + 'boardDetail.do?boardNo=' + v.bo_no + '">' + v.bo_title + '</a></td>' +
                        '<td>' + v.bo_writer + '</td>' +
                        '<td>' + v.bo_date + '</td>' +
                        '<td>' + v.bo_hit + '</td></tr>';
                });
            }

            // 글쓰기 버튼을 추가합니다.
            code += '<tr><td colspan="5"><input type="button" value="글쓰기" onclick="BoardInsert.do"></td></tr>';

            // 수정된 부분: '.boardListTable' 클래스를 가진 요소에 동적으로 생성된 코드를 추가합니다.
            $('.boardListTable').html(code);
        }, //success 끝
        error: function(xhr){
            alert("상태:" + xhr.status);
        },
        dataType: 'json'
    });
};
			


