#include <stdio.h>
#include <Windows.h>
#include <tchar.h>
#define BUFFERSIZE 30

int main()
{
	HANDLE hdst = NULL;
	LPCWSTR filepath = L"abc.txt";
	char readbuffer[BUFFERSIZE] = { 0, };
	DWORD dwBytesRead = 0;
	bool flag = FALSE;

	hdst = CreateFile(filepath,
		GENERIC_READ,
		0,
		NULL,
		OPEN_EXISTING,
		FILE_ATTRIBUTE_NORMAL,
		NULL);

	if (hdst == INVALID_HANDLE_VALUE) {
		printf("[-] CreateFile is failed. Errorcode %X\n", GetLastError());
		return -1;
	}

	flag = ReadFile(hdst, readbuffer, BUFFERSIZE - 1, &dwBytesRead, NULL);

	if (flag == FALSE) {
		printf("[-] ReadFile is failed. Errorcode %X\n", GetLastError());
		return -1;
	}
	
	printf("%s\n", readbuffer);

	return 0;
}