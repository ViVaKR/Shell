#! /usr/bin/env zsh

Hello() {
    echo "Hello, World!"
}

World() {
    echo "Fine, thank you. And you? ${@}"
}

Hello

World 1 2 3 4 5

# 특정 명령어의 결과에 따라 분기를 해야하는 경우 이전 명령어가 정상적으로 수행되었는 지 파악하는 것이 필수적임.

# [ 주요 종료 코드 ]
# 0 : 정상 종료
# 1 : 일반적인 오류 : $ date -@
# 2 : 쉘 내장 명령어 오류
# 126 : 파일이 실행 가능하지 않음
# 127 : 명령어를 찾을 수 없음
# 128 : 잘못된 종료 시그널
# 130 : 사용자가 프로그램을 강제 종료

echo $?

if [ $? -eq 0 ]; then
    echo "The previous command was successful."
else
    echo "The previous command was unsuccessful."
fi

# sub·sti·tu·tion | sʌ̀bstətjúːʃən┃-tjúː- |
# 명사
# 1.[불]대리, 대용; 대체; 〔화학〕 치환
# ▸ the substitution of a professional army for the draft
# 징병을 직업적 군대로 대체하기.
# 2.대리(인), 대용품.
# 3.[불][가]〔문법〕 대용(어), 대입.

#--> $() : 명령어를 실행하고 결과를 반환, 괄호 안에 쓰여진 문자를 명령어로 인식하고 실행 후 결과를 반환
echo date
echo $(date)

#--> ${} : 변수를 반환
#--> $@ : 모든 인자를 반환
#--> $? : 이전 명령어의 종료 코드를 반환
#--> $0 : 현재 스크립트의 이름을 반환
#--> $1 : 첫 번째 인자를 반환
echo "I'm in $(pwd)\n"
exit 16 # 강제종료
echo "This line will not be printed."
