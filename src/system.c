/* "system.c" - Implementation for platform-specific functions. */
#include <windows.h>
/* Simulate keypress and immediate release. */
void press_key(unsigned char key)
{
	INPUT ip;
	ip.type = INPUT_KEYBOARD;
	ip.ki.wVk = key;
	ip.ki.wScan = 0;
	ip.ki.dwFlags = 0;
	ip.ki.time = 0;
	ip.ki.dwExtraInfo = 0;
	SendInput(1, &ip, sizeof(INPUT));
	ip.ki.dwFlags = KEYEVENTF_KEYUP;
	SendInput(1, &ip, sizeof(INPUT));
}
