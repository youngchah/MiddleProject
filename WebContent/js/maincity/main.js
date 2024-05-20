function showContent(contentId) {
    // contentId에 해당하는 내용을 가져와서 표시하는 로직
    var contentArea = document.getElementById("contentArea");
    var content = document.getElementById(contentId + "-content");

    // 모든 내용을 숨기고 선택한 내용만 표시
    var allContents = document.querySelectorAll('.content');
    allContents.forEach(function (item) {
        item.style.display = 'none';
    });

    content.style.display = 'block';
}


        function changeButtonStyle(link) {
            // 모든 버튼 스타일 초기화
            var buttons = document.querySelectorAll('.button-wrapper button');
            buttons.forEach(function (button) {
                button.style.backgroundColor = 'white';
                button.style.color = 'black';
            });

            // 현재 클릭한 버튼의 스타일 변경
            var button = link.querySelector('button');
            button.style.backgroundColor = 'black';
            button.style.color = 'white';
        }


function showContent(contentType) {
    // 모든 콘텐츠 영역을 숨김
    document.querySelectorAll('.content > div').forEach(function(content) {
        content.style.display = 'none';
    });

    // 클릭한 버튼에 해당하는 콘텐츠 영역을 보이게 함
    var contentArea = document.getElementById('contentArea');
    var targetContent = document.querySelector('.' + contentType);
    if (targetContent) {
        targetContent.style.display = 'block';
    }
}


function loadContent(contentType) {
    // Ajax 요청 보내기
    $.ajax({
        url: '<%=request.getContextPath()%>/views/maincity/' + contentType + '.jsp', // 해당 페이지의 경로로 수정
        type: 'GET',
        dataType: 'html',
        success: function(data) {
            // 성공적으로 데이터를 받아왔을 때
            $('#contentArea').html(data);
        },
        error: function() {
            // 에러 발생 시 처리
            alert('데이터를 불러오는데 실패했습니다.');
        }
    });
}



   
