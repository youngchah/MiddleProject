var activeButtonId = 'noticeButton';

function showContent(contentId) {
    // 모든 컨텐츠 비활성화
    var contents = document.querySelectorAll('.content');
    contents.forEach(function(content) {
        content.classList.remove('active');
    });

    // 모든 버튼 스타일 초기화
    var buttons = document.querySelectorAll('.button-container button');
    buttons.forEach(function(button) {
        button.style.backgroundColor = 'white';
        button.style.color = 'black';
    });

    // 선택한 컨텐츠 활성화
    var selectedContent = document.getElementById(contentId + 'Content');
    if (selectedContent) {
        selectedContent.classList.add('active');
    }

    // 선택한 버튼 스타일 변경
    var selectedButton = document.getElementById(contentId + 'Button');
    if (selectedButton) {
        selectedButton.style.backgroundColor = 'black';
        selectedButton.style.color = 'white';
        // 현재 클릭한 버튼의 ID를 저장
        activeButtonId = contentId + 'Button';
    }
}

// 초기 로딩 시 공지사항 버튼 스타일 변경
document.addEventListener('DOMContentLoaded', function() {
    var noticeButton = document.getElementById('noticeButton');
    if (noticeButton) {
        noticeButton.style.backgroundColor = 'black';
        noticeButton.style.color = 'white';
    }
});

// 버튼에 대한 마우스 이벤트 및 클릭 이벤트 처리
var buttons = document.querySelectorAll('.button-container button');
buttons.forEach(function(button) {
    button.addEventListener('mouseover', function() {
        if (button.id !== activeButtonId) {
            button.style.backgroundColor = 'black';
            button.style.color = 'white';
        }
    });

    button.addEventListener('mouseout', function() {
        if (button.id !== activeButtonId) {
            button.style.backgroundColor = 'white';
            button.style.color = 'black';
        }
    });

    button.addEventListener('click', function() {
        // 모든 버튼 스타일 초기화
        buttons.forEach(function(btn) {
            btn.style.backgroundColor = 'white';
            btn.style.color = 'black';
        });

        // 현재 클릭한 버튼 스타일 변경
        button.style.backgroundColor = 'black';
        button.style.color = 'white';

        activeButtonId = button.id;
    });
});







    
    
    
    
    
    // 자주묻는질문 토글이벤트 
    function toggleContent(toggleId, contentId) {
    var toggleIcon = document.getElementById(toggleId);
    var toggleContent = document.getElementById(contentId);

    if (toggleContent.style.display === 'block') {
        toggleContent.style.display = 'none';
        toggleIcon.textContent = '▼';
    } else {
        toggleContent.style.display = 'block';
        toggleIcon.textContent = '▲';
    }
}