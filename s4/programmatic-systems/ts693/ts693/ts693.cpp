// ts693.cpp : Defines the entry point for the application.
//

#include "framework.h"
#include <commctrl.h>
#include <string>
#include "ts693.h"
#define TIMER1 500


#define MAX_LOADSTRING 100

// Global Variables:
HINSTANCE hInst;                                // current instance
WCHAR szTitle[MAX_LOADSTRING];                  // The title bar text
WCHAR szWindowClass[MAX_LOADSTRING];            // the main window class name

// Forward declarations of functions included in this code module:
ATOM                MyRegisterClass(HINSTANCE hInstance);
BOOL                InitInstance(HINSTANCE, int);
LRESULT CALLBACK    WndProc(HWND, UINT, WPARAM, LPARAM);
INT_PTR CALLBACK    About(HWND, UINT, WPARAM, LPARAM);
INT_PTR CALLBACK    Task(HWND, UINT, WPARAM, LPARAM);


int APIENTRY wWinMain(_In_ HINSTANCE hInstance,
                     _In_opt_ HINSTANCE hPrevInstance,
                     _In_ LPWSTR    lpCmdLine,
                     _In_ int       nCmdShow)
{
    UNREFERENCED_PARAMETER(hPrevInstance);
    UNREFERENCED_PARAMETER(lpCmdLine);

    // TODO: Place code here.

    // Initialize global strings
    LoadStringW(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
    LoadStringW(hInstance, IDC_TS693, szWindowClass, MAX_LOADSTRING);
    MyRegisterClass(hInstance);

    // Perform application initialization:
    if (!InitInstance (hInstance, nCmdShow))
    {
        return FALSE;
    }

    HACCEL hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_TS693));

    MSG msg;

    // Main message loop:
    while (GetMessage(&msg, nullptr, 0, 0))
    {
        if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg))
        {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }
    }

    return (int) msg.wParam;
}



//
//  FUNCTION: MyRegisterClass()
//
//  PURPOSE: Registers the window class.
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
    WNDCLASSEXW wcex;

    wcex.cbSize = sizeof(WNDCLASSEX);

    wcex.style          = CS_HREDRAW | CS_VREDRAW;
    wcex.lpfnWndProc    = WndProc;
    wcex.cbClsExtra     = 0;
    wcex.cbWndExtra     = 0;
    wcex.hInstance      = hInstance;
    wcex.hIcon          = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_TS693));
    wcex.hCursor        = LoadCursor(nullptr, IDC_ARROW);
    wcex.hbrBackground  = (HBRUSH)(COLOR_WINDOW+1);
    wcex.lpszMenuName   = MAKEINTRESOURCEW(IDC_TS693);
    wcex.lpszClassName  = szWindowClass;
    wcex.hIconSm        = LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL));

    return RegisterClassExW(&wcex);
}

//
//   FUNCTION: InitInstance(HINSTANCE, int)
//
//   PURPOSE: Saves instance handle and creates main window
//
//   COMMENTS:
//
//        In this function, we save the instance handle in a global variable and
//        create and display the main program window.
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
   hInst = hInstance; // Store instance handle in our global variable

   HWND hWnd = CreateWindowW(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,
      CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, nullptr, nullptr, hInstance, nullptr);

   if (!hWnd)
   {
      return FALSE;
   }

   ShowWindow(hWnd, nCmdShow);
   UpdateWindow(hWnd);

   return TRUE;
}

//
//  FUNCTION: WndProc(HWND, UINT, WPARAM, LPARAM)
//
//  PURPOSE: Processes messages for the main window.
//
//  WM_COMMAND  - process the application menu
//  WM_PAINT    - Paint the main window
//  WM_DESTROY  - post a quit message and return
//
//
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    switch (message)
    {
    case WM_COMMAND:
        {
            int wmId = LOWORD(wParam);
            // Parse the menu selections:
            switch (wmId)
            {
            case IDM_ABOUT:
                DialogBox(hInst, MAKEINTRESOURCE(IDD_ABOUTBOX), hWnd, About);
                break;
            case IDM_EXIT:
                DestroyWindow(hWnd);
                break;
            case ID_TASK_TASK1:
            {
                DialogBox(hInst, MAKEINTRESOURCE(IDD_DIALOG1), hWnd, Task);
                break;
            }
            default:
                return DefWindowProc(hWnd, message, wParam, lParam);
            }
        }
        break;
    case WM_PAINT:
        {
        PAINTSTRUCT ps;
        HDC hdc = BeginPaint(hWnd, &ps);
        // TODO: Add any drawing code that uses hdc here...

        HPEN hPen3 = CreatePen(PS_DOT, 2, RGB(0x1f, 0x1f, 0x1f));
        SelectObject(hdc, hPen3);

        MoveToEx(hdc, 225, 250, NULL);

        HBRUSH hBrushConusoid = CreateSolidBrush(RGB(0xFF, 0xFF, 0xFF));
        SelectObject(hdc, hBrushConusoid);
        Ellipse(hdc, 200, 300, 400, 500);
        Ellipse(hdc, 220, 250, 380, 470);

        HPEN hPen6 = CreatePen(PS_DOT, 2, RGB(0xFF, 0xFF, 0xFF));
        SelectObject(hdc, hPen6);
        Rectangle(hdc, 200, 10, 500, 370);

        SelectObject(hdc, hPen3);
        int y = 375;

        MoveToEx(hdc, 200, y, NULL);
        LineTo(hdc, 290, 250);
        MoveToEx(hdc, 220, y, NULL);
        LineTo(hdc, 290, 250);
        MoveToEx(hdc, 200, y, NULL);
        LineTo(hdc, 220, y);
        MoveToEx(hdc, 400, y, NULL);
        LineTo(hdc, 290, 250);
        MoveToEx(hdc, 380, y, NULL);
        LineTo(hdc, 290, 250);
        MoveToEx(hdc, 380, y, NULL);
        LineTo(hdc, 400, y);

        EndPaint(hWnd, &ps); 
        }
        break;
    case WM_DESTROY:
        PostQuitMessage(0);
        break;
    default:
        return DefWindowProc(hWnd, message, wParam, lParam);
    }
    return 0;
}

// Message handler for about box.
INT_PTR CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
    UNREFERENCED_PARAMETER(lParam);
    switch (message)
    {
    case WM_INITDIALOG:
        return (INT_PTR)TRUE;

    case WM_COMMAND:
        if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)
        {
            EndDialog(hDlg, LOWORD(wParam));
            return (INT_PTR)TRUE;
        }
        break;
    }
    return (INT_PTR)FALSE;
}

INT_PTR CALLBACK Task(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
    char data[20];
    static int step = (-20);

    char t1[10], t11[10], t2[10], t22[10], t3[10], * stopstring;
    int cbIndex;
    int lbIndex;
    int comboEl, listEl, c_index, l_index;
    double A, B, C, RES;
    UNREFERENCED_PARAMETER(lParam);
    switch (message)
    {
    case WM_INITDIALOG:
        CheckDlgButton(hDlg, IDC_RADIO1, MFS_CHECKED);

        comboEl = SendDlgItemMessage(hDlg, IDC_COMBO1, CB_ADDSTRING, 0, (LPARAM)"0.5");
        comboEl = SendDlgItemMessage(hDlg, IDC_COMBO1, CB_ADDSTRING, 0, (LPARAM)"3.3");
        comboEl = SendDlgItemMessage(hDlg, IDC_COMBO1, CB_ADDSTRING, 0, (LPARAM)"0");
        SendDlgItemMessage(hDlg, IDC_COMBO1, CB_SETCURSEL, 0, 0);

        SendDlgItemMessage(hDlg, IDC_PROGRESS1, PBM_SETRANGE, 0, MAKELPARAM(0, 1000));
        SendDlgItemMessage(hDlg, IDC_PROGRESS2, PBM_SETRANGE, 0, MAKELPARAM(0, 1000));
        SendDlgItemMessage(hDlg, IDC_PROGRESS1, PBM_SETPOS, 1000, 1000);
        SendDlgItemMessage(hDlg, IDC_PROGRESS2, PBM_SETPOS, 1000,1000);

        return (INT_PTR)TRUE;

    case WM_COMMAND:
        if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)
        {
            EndDialog(hDlg, LOWORD(wParam));
            return (INT_PTR)TRUE;
        }

        else if (LOWORD(wParam) == IDC_BUTTON1)
        {
            GetDlgItemText(hDlg, IDC_EDIT1, data, sizeof(data));

            if (strcmp(data, "") != 0) {
                if (!(SendDlgItemMessage(hDlg, IDC_LIST1, LB_FINDSTRING, 0, (LPARAM)data) > -1)) {
                    l_index = SendDlgItemMessage(hDlg, IDC_LIST1, LB_ADDSTRING, 0, (LPARAM)data);
                    SendDlgItemMessage(hDlg, IDC_LIST1, LB_SETCURSEL, l_index, 0);
                }

            }
            else MessageBox(hDlg, "EmptyString", "Error", MB_OK | MB_ICONERROR);
        }

        else if (LOWORD(wParam) == IDC_BUTTON2)

        {
            cbIndex = SendDlgItemMessage(hDlg, IDC_COMBO1, CB_GETCURSEL, 0, 0);
            A = 0, B = 0;
            if (cbIndex > -1) {
                SendDlgItemMessage(hDlg, IDC_COMBO1, CB_GETLBTEXT, cbIndex, (LPARAM)t1);
                C = strtod(t1, &stopstring);
            }

            GetDlgItemText(hDlg, IDC_EDIT2, t3, 10);
            A = strtod(t3, &stopstring);

            GetDlgItemText(hDlg, IDC_EDIT4, t3, 10);
            B = strtod(t3, &stopstring);

            if (IsDlgButtonChecked(hDlg, IDC_RADIO1)) {
                if ((A + B) == 0) {
                    MessageBox(hDlg, "Cant divide by 0", "ERROR!", MB_ICONERROR);
                }
                else {
                    RES = C / (A + B);
                    sprintf_s(t22, "%8.2f", RES);
                    SetDlgItemText(hDlg, IDC_EDIT4, t22);
                }

            }
            if (IsDlgButtonChecked(hDlg, IDC_RADIO2)) {
                if (C == 0) {
                    MessageBox(hDlg, "Cant divide by 0", "ERROR!", MB_ICONERROR);
                }
                else {
                    RES = (C + B) / C;
                    sprintf_s(t22, "%8.2f", RES);
                    SetDlgItemText(hDlg, IDC_EDIT5, t22);
                }

            }
        }

        else if (LOWORD(wParam) == IDC_BUTTON4) {
            SetTimer(hDlg, TIMER1, 20, NULL);
            break;
        }
        if (SendDlgItemMessage(hDlg, IDC_PROGRESS1, PBM_GETPOS, 0, 0) == 0) {
            KillTimer(hDlg, TIMER1);

            break;
        }
        break;

    case WM_TIMER:

            if (SendDlgItemMessage(hDlg, IDC_PROGRESS2, PBM_GETPOS, 0, 0) >0)
            {
                SendDlgItemMessage(hDlg, IDC_PROGRESS2, PBM_SETSTEP, step, 0);
                SendDlgItemMessage(hDlg, IDC_PROGRESS2, PBM_STEPIT, 0, 0);
            }
            else if (SendDlgItemMessage(hDlg, IDC_PROGRESS1, PBM_GETPOS, 0, 0) >0)
            {
                SendDlgItemMessage(hDlg, IDC_PROGRESS1, PBM_SETSTEP, step, 0);
                SendDlgItemMessage(hDlg, IDC_PROGRESS1, PBM_STEPIT, 0, 0);
            }

    }
    return (INT_PTR)FALSE;
}






    