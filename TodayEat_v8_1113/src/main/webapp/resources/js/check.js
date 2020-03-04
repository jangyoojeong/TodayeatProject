// 체크 박스 전체 선택, 전체 해제 

var checkFlag = 'false'; // false면 전체선택, true이면 전체해제

function check(field) {
    if(checkFlag == 'false') {
        for(i = 0; i < field.length; i++) {
            field[i].checked = true; // 모든 체크박스를 체크한다.
        }
        checkFlag = "true";
        return "전체 해제"; // 버튼객체의 value속성으로 반환(this.value.list로 넘겨져왔기 때문에)
    } else {
        for(i = 0; i < field.length; i++) {
            field[i].checked = false; // 모든 체크박스를 해제한다.
        }
        checkFlag = "false";
        return "전체 선택"; // 버튼객체의 vaule 속성으로 반환
    }
}