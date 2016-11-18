function varargout = MLAIGUI(varargin)
% MLAIGUI MATLAB code for MLAIGUI.fig
%      MLAIGUI, by itself, creates a new MLAIGUI or raises the existing
%      singleton*.
%
%      H = MLAIGUI returns the handle to a new MLAIGUI or the handle to
%      the existing singleton*.
%
%      MLAIGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MLAIGUI.M with the given input arguments.
%
%      MLAIGUI('Property','Value',...) creates a new MLAIGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MLAIGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MLAIGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MLAIGUI

% Last Modified by GUIDE v2.5 17-Nov-2016 11:41:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MLAIGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MLAIGUI_OutputFcn, ...
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


% --- Executes just before MLAIGUI is made visible.
function MLAIGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MLAIGUI (see VARARGIN)
handles.grid_mat = [];

% Choose default command line output for MLAIGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MLAIGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MLAIGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grid_size = [0 0];
grid_size(1,1) = str2num(get(handles.edit1,'string'));
grid_size(1,2) = str2num(get(handles.edit2,'string'));

handles.grid_mat = zeros(grid_size);

x = linspace(0,grid_size(1,1),grid_size(1,1)+1);
y = linspace(0,grid_size(1,2),grid_size(1,2)+1);

% Horizontal grid
for k = 1:length(y)
    line([x(1) x(end)], [y(k) y(k)])
end

% Vertical grid
for k = 1:length(x)
    line([x(k) x(k)], [y(1) y(end)])
end
axis square
guidata(hObject, handles)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.grid_mat


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% pos=get(hObject,'CurrentPoint');
% disp(['You clicked X:',num2str(pos(1)),', Y:',num2str(pos(2))]);


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%getting the grid size
grid_size = [0 0];
grid_size(1,1) = str2num(get(handles.edit1,'string'));
grid_size(1,2) = str2num(get(handles.edit2,'string'));

% handles.value

pos=get(hObject,'CurrentPoint');
click_x=floor((pos(1)-10)/(100/grid_size(1,1)));
click_y=floor((pos(2)-4)/(40/grid_size(1,2)));
disp(['You clicked X:',num2str(click_x),', Y:',num2str(click_y)]);
click_type=get(gcbf,'SelectionType')

% Mark squares on mouse click
if click_x>=0 && click_x<20 && click_y>=0 && click_y<20
    if isequal(click_type,'normal')
        rectangle('Position',[click_x click_y 1 1],'FaceColor',[1 0 0],'EdgeColor',[0.3010 0.7450 0.9330])
        handles.grid_mat(grid_size(1,2)-click_y,click_x+1)=1;
    else
        rectangle('Position',[click_x click_y 1 1],'FaceColor',[1 1 1],'EdgeColor',[0.3010 0.7450 0.9330])
        handles.grid_mat(grid_size(1,2)-click_y,click_x+1)=0;
    end
end
guidata(hObject, handles)
