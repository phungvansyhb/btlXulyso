function varargout = operlinear(varargin)
% OPERLINEAR MATLAB code for operlinear.fig
%      OPERLINEAR, by itself, creates a new OPERLINEAR or raises the existing
%      singleton*.
%
%      H = OPERLINEAR returns the handle to a new OPERLINEAR or the handle to
%      the existing singleton*.
%
%      OPERLINEAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPERLINEAR.M with the given input arguments.
%
%      OPERLINEAR('Property','Value',...) creates a new OPERLINEAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before operlinear_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to operlinear_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help operlinear

% Last Modified by GUIDE v2.5 24-May-2020 11:30:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @operlinear_OpeningFcn, ...
                   'gui_OutputFcn',  @operlinear_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before operlinear is made visible.
function operlinear_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to operlinear (see VARARGIN)

% Choose default command line output for operlinear
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes operlinear wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = operlinear_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function input1_Callback(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input1 as text
%        str2double(get(hObject,'String')) returns contents of input1 as a double
sign1  = get(handles.input1 , "string");
sign1 = str2num(sign1);
sign1len  = length(sign1);
%set(handles.root1 , "Enable" , "on");
set(handles.showroot1 , "Enable" , "on");

%set(handles.root1 , "Max" , sign1len);

% --- Executes during object creation, after setting all properties.
function input1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in operator.
function operator_Callback(hObject, eventdata, handles)
% hObject    handle to operator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns operator contents as cell array
%        contents{get(hObject,'Value')} returns selected item from operator


% --- Executes during object creation, after setting all properties.
function operator_CreateFcn(hObject, eventdata, handles)
% hObject    handle to operator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(handles.input1 , "string");
a = str2num(a);
len1 = length(a);
root1 = get(handles.showroot1 ,"string");
root1 = str2num(root1);

b = get(handles.input2 , "string");
b  = str2num(b);
len2 = length(b);
root2 = get(handles.showroot2 , "string");
root2 = str2num(root2);

choice = get(handles.operator , 'value');
left1 = root1-1;
right1 = len1-root1;

left2 = root2-1;
right2 = len2-root2;

leftmax = max(left1 , left2);
rightmax = max(right1 , right2);

sign1 = [ zeros(1,leftmax-left1) , a , zeros(1 , rightmax-right1)];

sign2 = [ zeros(1,leftmax-left2) , b , zeros(1 , rightmax-right2)];
switch choice
    case 1
       kq = sign1 + sign2;
       set(handles.result , "enable",'on');
       kq = num2str(kq);
       set(handles.result , "string",kq);
       set(handles.showrootrs , "enable" , "on");
       set(handles.showrootrs , "string",leftmax+1);
       
        
    case 2
         kq = sign1 - sign2;
       set(handles.result , "enable",'on');
       kq = num2str(kq);
       set(handles.result , "string",kq);
       set(handles.showrootrs , "enable" , "on");
       set(handles.showrootrs , "string",leftmax+1);
    case 3
          kq = sign1 .* sign2;
       set(handles.result , "enable",'on');
       kq = num2str(kq);
       set(handles.result , "string",kq);
       set(handles.showrootrs , "enable" , "on");
       set(handles.showrootrs , "string",leftmax+1);
        
    case 4
        set(handles.result, 'enable','on');
        c =conv(a ,b);
        c = num2str(c);
        set(handles.result , "string" , c)
        set(handles.showrootrs , "enable" , "on");
        rootrs = root1+root2-1;
        rootrs = num2str(rootrs);
       set(handles.showrootrs , "string", rootrs );
end



function input2_Callback(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input2 as text
%        str2double(get(hObject,'String')) returns contents of input2 as a double
sign2  = get(handles.input2 , "string");
sign2 = str2num(sign2);
sign2len  = length(sign2);
%set(handles.root2 , "Enable" , "on");
set(handles.showroot2 , "Enable" , "on");
%set(handles.root2 , "Max" , sign2len);

% --- Executes during object creation, after setting all properties.
function input2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result as text
%        str2double(get(hObject,'String')) returns contents of result as a double


% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.input1 , "string" , "");
set(handles.input2 , "string" , "");
set(handles.result,"string","");
set(handles.showroot1,"enable","off");
set(handles.showroot1 ,"string","0");
set(handles.showroot2,"enable","off");
set(handles.showroot2 ,"string","0");
set(handles.showrootrs,"enable","off");
set(handles.showrootrs ,"string","0");
set(handles.result,"enable" ,"off");

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
run homemenu.m

% --- Executes on slider movement.
function root1_Callback(hObject, eventdata, handles)
% hObject    handle to root1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
stt  = get(handles.root1 , 'value');
set(handles.showroot1,"string",stt);


% --- Executes during object creation, after setting all properties.
function root1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to root1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function root2_Callback(hObject, eventdata, handles)
% hObject    handle to root2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


root2 = get(handles.root2 , "value");
set(handles.showroot2 , "string",root2)


% --- Executes during object creation, after setting all properties.
function root2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to root2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to root1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to root1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to root2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to root2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function showroot1_Callback(hObject, eventdata, handles)
% hObject    handle to showroot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of showroot1 as text
%        str2double(get(hObject,'String')) returns contents of showroot1 as a double
n = get(handles.showroot1 , "string");
n = str2num(n);
max = get(handles.input1 , "string");
max = str2num(max);
max  = length(max);
if (n > max) || (n < 0)
    msgbox('Sai vi tri xung goc');
    set(handles.showroot1 ,"string", 0);
end

% --- Executes during object creation, after setting all properties.
function showroot1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to showroot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function showroot2_Callback(hObject, eventdata, handles)
% hObject    handle to showroot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of showroot2 as text
%        str2double(get(hObject,'String')) returns contents of showroot2 as a double
n = get(handles.showroot2 , "string");
n = str2num(n);
max = get(handles.input2 , "string");
max = str2num(max);
max  = length(max);
if (n > max) || (n < 0)
    msgbox('Sai vi tri xung goc');
    set(handles.showroot2 ,"string", 0);
end

% --- Executes during object creation, after setting all properties.
function showroot2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to showroot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function showrootrs_Callback(hObject, eventdata, handles)
% hObject    handle to showrootrs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of showrootrs as text
%        str2double(get(hObject,'String')) returns contents of showrootrs as a double


% --- Executes during object creation, after setting all properties.
function showrootrs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to showrootrs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
