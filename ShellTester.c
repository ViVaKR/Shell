#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    /*
    *** awk ***
    $ awk [options] 'pattern { action }' [file|command]
    - pattern: 패턴이 일치하는 줄에 대해 수행할 동작을 지정
    - action: 패턴이 일치하는 줄에 대해 수행할 동작을 지정
    - file: awk 명령어를 적용할 파일
    - command: awk 명령어를 적용할 명령어
    - options: -F: 필드 구분자 지정, -f: awk 스크립트 파일 지정

    ## awk 내장변수 ##
    - FILENAME: 현재 처리중인 파일명
    - FS: 필드 구분자
    - NR: 현재 처리중인 레코드 번호
    - NF: 현재 처리중인 레코드의 필드 개수
    - $0: 현재 처리중인 레코드 전체
    - $n: 현재 처리중인 레코드의 n 번째 필드
    - ENVIRON["변수명"]: 환경변수 값
    - ARGC: 명령행 인수 개수
    - ARGV: 명령행 인수 배열
    - FNR : 현재 파일의 레코드 번호
    - OFMT : 출력 형식 지정
    - OFS : 출력 필드 구분자
    - ORS : 출력 레코드 구분자
    - RS : 입력 레코드 구분자
    - RSTART : 매칭된 문자열의 시작 위치

    -awk -F -> 단일로 사용시 ':' 를 구분자로 사용
    -awk -F'[:\t]' -> 다중 필드 구분자, ':' 또는 '\t'를 구분자로 사용
    - `-f` 옵션을 사용하여 awk 스크립트 파일을 지정할 수 있음

    (ex)
    awk -F":" '/pattern' {print $1}' /etc/passwd
    -F : field seperator
    - /pattern/ : (pattern) 패턴 일치하는 줄에 대해 수행할 동작을 지정
    - {print $1} : (action) 패턴 일치하는 줄에 대해 수행할 동작을 지정

    # 커맨드에서 입력을 받아서 파이프와 조합하여 사용
    $ command | awk 'pattern { action }'
    --> awk '$3 < 50 {print $1, $2, $3, $4}' tb1.txt
    $ awk 'pattern { action }' < file
    $ command | awk '{ action }'
    --> awk '/^[A-Za-z]+/' tb2.txt

    - 패턴 매칭 연산자
    - ~ : 패턴이 일치하는지 확인
    - !~ : 패턴이 일치하지 않는지 확인, `$ awk '$1 !~ /g$/' tb2.txt` -> 첫 번째 필드가 'g'로 끝나지 않는 줄 출력
    - == : 값이 같은지 확인
    - != : 값이 다른지 확인
    - > : 큰지 확인
    - >= : 크거나 같은지 확인
    - < : 작은지 확인
    - <= : 작거나 같은지 확인
    - && : 논리곱
    - || : 논리합
    - ! : 논리부정
    - BEGIN: 시작 전에 한 번만 실행, 패턴을 식별하면 입력 데이터로 부터 레코드를 읽기 전에 실행
    --> $ awk 'BEGIN { print "Title : Field value 1, 2" } { print $1, $2} END { print "Finished"}' tb3.txt
    - END: 끝날 때 한 번만 실행, 모든 레코드를 읽은 후에 실행

    --> awk '
        > BEGIN {
        > sum = 0
        > cnt = -1
        > }
        > {
        > sum += $4
        > cnt++
        > }
        > END {
        > avg = sum/cnt
        > print ("sum:" sum ", average : "avg)
        > }' ex.txt
    sum:240, average : 120

    - if statement : if ( condition ) { action } else { action }
    --> $ awk '{ if ($2 > 7) print $1, $2 " -> High"; else print $1, $2 " -> Low" }' tb3.txt
    --> $ awk '{ print $0; exit}' ex.txt

    --> awk '{
        if($1~/pota/) {next}
        else {print}
        }' ex.txt

    // result
    // soft    60 70 80
    // prog    90 100 110

    --> ```
    awk '{
        total=$2+$3+$4
        avg=total/3

        if (avg >= 90)
        grade="A\n";
        else if (avg >=80)
        grade="B\n";
        else if (avg >=70)
        grade="C\n";
        else
        grade="D\n";
        print $0, " -> ", grade;
    }' score.txt
    --> ```
    - for statement : for (variable = start; variable <= end; variable++) { action }
    --> $ awk '{ for (i = 1; i < NF; i++) print NF, $1, $2}' tb4.txt

    - 삼항연산자 : condition ? true : false
    --> $ awk '{max=($1 > $2) ? $1 : $2; print $1,"\t",$2, " Max Value = " max}' tb4.txt

    -- while statement : while (condition) { action }
    --> $ awk '{i=1; while(i<=NF) {print NF, $1; i++}}' serial.txt

    --> $ awk 'NR == 2 { print $0; exit }' ex.txt # 2번째 줄 출력

    --> $ awk -F: '$4 >= 60000 { print $1, $2 > "new_file"}' awkfile # 4번째 필드가 60000 이상인 줄을 new_file에 출력

    *** awk 스크립트 파일 ***
    - awk 스크립트 파일을 작성하여 사용할 수 있음

    ## awk1.awk ##
    ```
        #! /opt/homebrew/bin/awk -f
        BEGIN { print "- Start -"}
        { print $1, "\t", $5}
        END { print "- DONE -"}

    ```
    --> $ awk -f awk1.awk awkfile # 실행
     */

    // char *args[3];
    // args[0] = "/opt/homebrew/bin/eza";
    // args[1] = "-l";
    // args[2] = (char *)NULL;
    // execv(args[0], args);

    // printf("%s: execl returned unexpectedly: %d", argv[0],
    //        execl("/opt/homebrew/bin/zsh", "zsh", "-c",
    //              "ps aux | awk 'NR >0 { cpu += $3; ram+=$4}; END {print cpu, ram}'",
    //              NULL));
    sleep(1);
    char *query[] = {
        "ps aux | awk 'NR > 0 { cpu += $3; ram+=$4}; END {print cpu, ram}'", // CPU, RAM 사용량 출력
        "awk '{sum += $2} END {print sum}' tb1.txt",                         // 2번째 필드의 합 출력
        "awk '$2 == 40 {print $0}' tb1.txt",                                 // 2번째 필드가 40인 줄 출력
        "awk '{print $2 * $3 * $4}' tb1.txt",                                // 2번째, 3번째, 4번째 필드를 곱해서 출력
        "awk '{print}' tb1.txt",                                             // 파일 전체 출력
        "awk '/A/' tb1.txt"                                                  // 문자열 A를 포함하는 줄만 출력
    };
    int size = sizeof(query) / sizeof(query[0]);
    printf("AWK Command Size: %d\n", size);
    int rs = execl("/opt/homebrew/bin/zsh", "zsh", "-c", query[2], NULL);
    if (rs == -1) {
        printf("Error: %d\n", rs);
        return 1;
    }

    return 45;
}

//--> clang -std=c17 -g -Wall -o ./build/ShellTester ./ShellTester.c && ./build/ShellTester
