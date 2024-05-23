void func2(int sum) {
	int* px = nullptr;
	*px = sum;
}

void func1(int sum) {
	func2(sum);
}

int main() {
	int a = 10;
	int b = 20;
	func1(a + b);
	return 0;
}

// clang++ -g -std=c++17 viv.cpp -o prog
// ./prog
// -> output
// zsh: segmentation fault  ./prog
// lldb ./prog
// run
// -> re launch 
// (lldb) target create prog
//-> break point
// (lldb) b main
// run
// -> Get Position
// (lldb) list 10
// -> commands
// `c` -> Continue execution of all threads in the current process. 
// `n` -> Source level single step, stepping over calls.
// `ni` -> Instruction level single step, stepping over calls.
// `s` -> Source level single step, stepping into calls.
// `si` -> Instruction level single step, stepping into calls.
//
// -> view variable
// (lldb) print a
// 충돌지점에서 -> `n` (step over)
// -> back trace (역추적, 어떻게 현재 위치에 도달했는지 보기, call stack)
// (lldb) bt
// (lldb) n 
// crash -> end
// -
// (lldb) target create prog
// (lldb) b main
// run
// (lldb) gui
// tab - Select next view
// h - Show help dialog
// , - Page up
// . - Page down
// up - Select previous
// down - Select next
// left - Unexpand or select parent
// right - Expand
//
//
